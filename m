Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C3B03ECC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26A510E486;
	Mon, 14 Jul 2025 12:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M87ZSWEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13B10E486
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:35:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-60c79bedc19so7523341a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752496534; x=1753101334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JJkBY6StLlPiYYNcDOCRaSTmquHRBX1aQ9fP/9Yejg=;
 b=M87ZSWErU1AUIf0Xx64SCsagDVNL9HSEWMeUnV1cuqiSYnM5jiebnnbuaGxtDc+z61
 3j1J5NwCnhxDpZkhpGY3pXvWQjjJFcn759UgqIWV1bF35nghq+scuvJaxUTe1zCj1fHH
 L8yycgSb54rhpS3kafQPpW7ErNCRRhU/VyWzIEV6tg1fFRTdUXLGRwdmGmFZ31QRqSvI
 vrET7S6j7053TfkH0kKDCYYWZ0woY6iz/B99wq44yqqiA8Kgkg6qRkDJnCGPDezzYQDq
 50PQRjjZtn9wkrmEQ5wObFZ9cQKhWuvRh2eqWoH9PG1hfN7hA5gI6OGBBA0XCpFLoaGs
 Cr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496534; x=1753101334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JJkBY6StLlPiYYNcDOCRaSTmquHRBX1aQ9fP/9Yejg=;
 b=deowvF0qt3wl9jZ0155NASW7CV2IsNmSzHJy6DLh6N1DCRJw2OB12SfbX9K/bgOQUx
 +vjRExPKPJHwkc6Teg7f6FpaG/baGuvQfiLxZEbRoCIlol/2oZrfDhD96/zW365tgXpd
 U4jh2zpvQBGSgclLXe13lrIQXa/80hM8iuLxms7KnFVc6KEkTQis2DWjWIyqaXZT9Pf3
 TRMmwSF3JwamF9oZQ/i5X6waK/CDs5rnAy/b2ioN9sKFikEGYvfYPVLTkEy92VPTVH2W
 JNDt3mGG5dfQSQy8w/TxqRhhFYiANBCG67wEGlrFMCW3bctYgZuVmpr5QLIeAFzfZbmk
 eDmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9j+Z2Pv5wJNOhw5DtTiDEpivJSMe1CyTTNMX8rLR7Z6rlnRU8mfGEV9nyvF0RObnmCReAGRQLL5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMHmv9rB57yNgGKy9pgmKCgBjsUuqMeVOaMIGBdNT/A2DpTN+J
 ZmtVyXRvDEmEt0vROvwmunpUD0pLw2d3231kfckGirTjYCCKlUILYSYmKpFaXXvMFF7HoZLH5Yt
 Bd+KerS/S0fl2nsXBLcx79cJAB2Uhzcs=
X-Gm-Gg: ASbGnctOpzGuuz7436snMlowtYLTTPPazkLXz96GexDYSFTQpKSHHAe6McXicYfx6/u
 SHHkzdJdLIkYlVO0XjZRRgiZALozXMaooRj1Ei8b1Gr329mKT/65/Wq+lLyJWESC1ENM0Xrd3uJ
 DHvHjej5S7WMtTn7++68tV3lzT2D9zxOVEHHCpxOxAu8JVIn90I3n2jJGYhYjGcVcTP7yMkHWNr
 nNtHzk28Fi9oBtcHsaNktMDBapYcJYNNyQCR7woRYhdRfKP9g+H
X-Google-Smtp-Source: AGHT+IEHpxC5111y9Cj6JQaRaXgMXbAFzbh9lkbxM7Yb2ILuf+3IGoAWfMQm4cez9+Bj4NXuw+pe+X+/AUAJqf9Zudk=
X-Received: by 2002:a17:906:d7d5:b0:ae3:6744:3675 with SMTP id
 a640c23a62f3a-ae6fc0c3796mr1235555966b.48.1752496533691; Mon, 14 Jul 2025
 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-1-fd793b3e58a2@gmail.com>
 <DBBQE3GJ0CHT.5PEF7RLS6C33@kernel.org>
In-Reply-To: <DBBQE3GJ0CHT.5PEF7RLS6C33@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Jul 2025 08:34:56 -0400
X-Gm-Features: Ac12FXyt7LMvW07NA5KJthMOxTToFChah-hJr4NBCGuAbPJrhV6AWz6kEkIvvTw
Message-ID: <CAJ-ks9=ZHtzeyyFSZaVuA1t-3C8-hc40n6r8qFWxn628qT-OeA@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpu: nova-core: use `core::ffi::CStr` method names
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 14, 2025 at 7:11=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Jul 9, 2025 at 9:58 PM CEST, Tamir Duberstein wrote:
> > Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` b=
y
> > avoid methods that only exist on the latter.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1075
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This doesn't look like nova-core. :)

Oops :(

How should I respin this one? the subject should be drm/panic, I think.
