Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8116B03EAC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CE010E484;
	Mon, 14 Jul 2025 12:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxSewUSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12DD10E484
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:28:51 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-32b5226e6beso36775201fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752496130; x=1753100930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbUxRDt1V115BL2AgQxJUishMrxXTwdY/Gt4NlJymo0=;
 b=mxSewUSKtkGNVvP+ywq1Cw0H830M5vl8B5ncJaoKRaeADiS5LL7r4YWN2sppCDNRDU
 h4WtYB5i4yCeNKxdSfBtLfvXnsQ8FqEk/yKWiW6ZajO+gADV9kqoBytDBBlPtwBlMz3H
 F0yPqgvNPW19f6E/auh6RctnMnAtILaSyydMTX6B10/AuMJ2I1OoJpYbPs8qz7lAlxDW
 IpaixKjUjcqzvX4Ih17bCwjy++Eonk7bctUYn8aI3v1dDFuBu41vBZe0MlBJoYNp6xVf
 GVKz8fe6t6PiFYsMuem52CPhUggEkaXZVJt0YfKfWuRzq4q/w2sl/PZOetEwtuOg0MHV
 UlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496130; x=1753100930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbUxRDt1V115BL2AgQxJUishMrxXTwdY/Gt4NlJymo0=;
 b=Agn+guTv9MFzJ9SIVcVcRz9AD8pO14xrF8+wG0h9xO897Dv8RfiL8mH8DlUD99KXhB
 uNx0MwDufqe9vAYlyjCCx/9/TzmCzqKxb/ZAO0qAhWtoVU+6LH6PiCQXwZUmLx/6qSKx
 snHAHdWSbjcZ9nn70r7jG10D9fRwwA3/V74v8RLpKLDmJ9cdddkGVh/n6neZkoxod+O4
 hZtEOxOfoPoM3mygqudaQgmBw+qzx5HzdufdyelVZ9LJoOvHxGAkF7RSS+iV/38cDpha
 yOU+nbyffrXs2I4HhEOD6CAi8tC9q7iOlu0u47Kj1Ja/E2a4jWsR5g0UPwzwtWs8AOwx
 ToRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhZVAO1/V2ssuuMR5iMIsgnFfgAv7ihogIWjGmLdKa1QnuIZIMKClDJD2k6Itvt2ZVWkEMb04ku4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYYzWSPpY4H+veH53IohEGcvUMqqF2aMYjo5sl4ZdQqaDN3aNc
 1zbFNDlpK8wpuU3KGnLxocGk+PVNEoDzaDuxn9YHZOba465L6bVudyCiIKZdhagpJxRzIXW3feJ
 IaIAi+v8IzEGDcJwLuK1xy4Lpm0pxFlI=
X-Gm-Gg: ASbGncsZ3iVqK5S8n+GnK5RIg3bMcDGdukgZLU06/9Dzp2QNlYbJqLWijvYjmW+lOZo
 XXr2qj53wrTxFZRwmBR+JDJrPI4l81+2ki5MjkaII/zxk6avRY9LVGESkdmEl29c9VGxf0+wdq2
 9tdz2iGw2M3OMnWCMij1n94nulPjOswV49hOB2MHRL9l2FdGKVz05+UEBEQqN48B6EZwBRprA92
 nHZsQx61EGHBsfwZSyeZQF5MteYXGA8BlNG07DsHx5plu+tnajp
X-Google-Smtp-Source: AGHT+IHrSBkjEoqU/I5DY/nGtzSq30SG70sPRuWAgDJvgCsJU9oDbgAOubBSXw4/LD+Vz0YhYyXX8s9x0cDKBQKVndA=
X-Received: by 2002:a2e:b5da:0:b0:32b:7111:95a7 with SMTP id
 38308e7fff4ca-330535da03dmr27580171fa.41.1752496129946; Mon, 14 Jul 2025
 05:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-5-fd793b3e58a2@gmail.com>
 <DBBQCHNN1N7F.3O470V9YDXE70@kernel.org>
In-Reply-To: <DBBQCHNN1N7F.3O470V9YDXE70@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Jul 2025 08:28:13 -0400
X-Gm-Features: Ac12FXxlpQphBeoscQniP1NYfXjAeRGBqEAxGkTlGCPTLLtOzVyVDIQfLGYMkU0
Message-ID: <CAJ-ks9k2jyVpc6g9bGK4fUHbqUBUnH-aHawi5YKvhtpAEcqr2A@mail.gmail.com>
Subject: Re: [PATCH 05/10] rust: drm: use `core::ffi::CStr` method names
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
 devicetree@vger.kernel.org
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

On Mon, Jul 14, 2025 at 7:09=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
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
> >  rust/kernel/drm/device.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> > index b7ee3c464a12..998b942b6dd8 100644
> > --- a/rust/kernel/drm/device.rs
> > +++ b/rust/kernel/drm/device.rs
> > @@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
> >          major: T::INFO.major,
> >          minor: T::INFO.minor,
> >          patchlevel: T::INFO.patchlevel,
> > -        name: T::INFO.name.as_char_ptr().cast_mut(),
> > -        desc: T::INFO.desc.as_char_ptr().cast_mut(),
> > +        name: crate::str::as_char_ptr_in_const_context(T::INFO.name).c=
ast_mut(),
> > +        desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).c=
ast_mut(),
>
> Maybe looks slightly cleaner to import this function, not a blocker thoug=
h.

I don't feel strongly. I think I chose not to import it because of the
potential for conflicts.

See also https://github.com/rust-lang/rfcs/pull/3490 which would
obviate the need for this method.
