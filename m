Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E68AE32E4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 00:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C010E0E0;
	Sun, 22 Jun 2025 22:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RGqpv40Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0131110E0E0;
 Sun, 22 Jun 2025 22:50:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313756c602fso357274a91.3; 
 Sun, 22 Jun 2025 15:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750632645; x=1751237445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XyaOPS+SVDJS2nuVakOU+h3pEZcqv0KxHASicqOHR0=;
 b=RGqpv40YSldTbQXr2/VYzPUzgV1Wkt8LRCBAjgByrxQgxPSqsMHG8fceWxsK4OxzkJ
 y5jv6GpglVqTasAGuvnvqv8ne0bSnVixtjgIJcRSdPkTEv9+PkQFYN365bTyqWyUo/Go
 dIcxUm9QKVteP/QAKu9OvsuZI8DLWgrZcStkM0/2e54pcGSnRIhGpCnEoOGAAvaR7Mrq
 YC7RFg/gDvSyAbx2C85jciIfnkPL+90i+Nuok7o1Of4b45pxi8za7G+822uFbYnr5q1t
 t369geC7sAIX/WTGLzK61VKl95U5JF1Qx5JlNvPAidp3lOyPwfMp3YmtOKyqIN5WKx0M
 zPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750632645; x=1751237445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XyaOPS+SVDJS2nuVakOU+h3pEZcqv0KxHASicqOHR0=;
 b=G8ahcmQd99MihZw6xm91fME+W4LqeI5WGOa+ij2HFUWyFse3G7I/XmRtKoQHwCC92G
 jCCIn5m9krbjW8BNRgdb5z9HhdUgYLZrPeOWT0OycxuEFiXCjj3wNQUsqAfoAA34j1iZ
 PKH5K2qZLUNb4BFL/prr5+Ks/3bfWD79svF7IFgPgO1hWJQQpwzEY81hn5GIHlfVX+Bk
 Oe1XQaCme30A0hfkOfFqZMUgyz/5mPGm0cuJzocJn0yYeBngbjeMOoy+8mgaUOgOZ0At
 gp7CcsTTgoLA7DNVBzyM1AD04+OGQGTChl2Ua/Pfvyj538Qc6cTXhCO8LMMm7njOk16T
 MoVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl/c2tiYmLKjFxCw7XbPJJ09MFGPYk5+Udy7vHujAXHgGuTlr/LlqWlhXDUAjxPqhClTKrLzU82iU=@lists.freedesktop.org,
 AJvYcCXCT+PkxerXa+ZIiCd6rqSwf4qF547UwRNr3d29Zitx3+MXhDEx7zz4ykYeZVWWXQRFnRLjBWhgeg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoiucLPgNfmHjNJ0eAexrd7+jTw29JyCkEMhlpwaByMlWA9rer
 YcP9EkI449Vrh0va2VXd3/DNCHKNYcj/t2ZqOjIiu1oFZR+ddsVmxLHPoAb7OnUar0LLmtm9VTy
 d7TsLBCux+re+XEDaUsDZ02TSoU6WL7k=
X-Gm-Gg: ASbGnctNQASii5WwtdA3qIgnORSCZL+ua/MqYnv+LrERNZ3sWeoFQmWCX1nbw/wc0RR
 yku5wp6bHiUuS+65/4V1t7HtnRAZxNyB875p/Q7bYoiCRVOA7bB5LvKxkCH74MLgT+KqL8pOWdI
 Od/AyZC/IJvfrJX/4vrhhnYXwpTV9uTpgtFAV5DLwH6dinQvOQxDxNfg==
X-Google-Smtp-Source: AGHT+IHkK5VxbDTzDH+78CGWNybiQ0lflBEpMpSVRH6uwkYDUKXtQuR/kJbEABJn7CeEMEkyXPjXtmArCfcPAjxsRNU=
X-Received: by 2002:a17:90b:3a43:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3159d8e2be9mr5684021a91.6.1750632645432; Sun, 22 Jun 2025
 15:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 00:50:31 +0200
X-Gm-Features: Ac12FXzAp4qUKl_aNT741tylL3I37tb5s--GlJccgcY1EV1oeXS1Teju6Ztan0w
Message-ID: <CANiq72=xmyHuBYEGbCMi=Um_NvNbf5TfMmJB5YPpVp41FcPdJA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] rust: reduce `as` casts, enable related lints
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Christian Brauner <brauner@kernel.org>
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

On Sun, Jun 15, 2025 at 10:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> This started with a patch that enabled `clippy::ptr_as_ptr`. Benno
> Lossin suggested I also look into `clippy::ptr_cast_constness` and I
> discovered `clippy::as_ptr_cast_mut`. This series now enables all 3
> lints. It also enables `clippy::as_underscore` which ensures other
> pointer casts weren't missed.
>
> As a later addition, `clippy::cast_lossless` and `clippy::ref_as_ptr`
> are also enabled.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Added `.cast()` for `opp`. - Miguel ]

    [ Changed `isize` to `c_long`. - Miguel ]

It would still be nice to get the couple remaining Acked-bys (happy to
rebase to apply them), but I feel we are in good shape, and it is a
good time to put it into linux-next so that people see the lint before
they start applying new code into their branches.

Cheers,
Miguel
