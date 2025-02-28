Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F6A4A728
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C9810ED69;
	Sat,  1 Mar 2025 00:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHZVZ4gV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE97A10ED0E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:15:46 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30a2cdb2b98so23527971fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740762945; x=1741367745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5IViTe8RLsr/7gyIz1ubG0CWzAG2HTZaKxR7vnijfU=;
 b=lHZVZ4gVusPVsSzjeuSRQ5mCcs9IWl4Qo82sU/uzKEwWmJf023qYtGvUmaeUBYi5rq
 M6zNLTUxdQXOhzIRkXFcHPAW+MO3G8f5jFU+H2bIHxYnQ6BpeUSF7M+3mni8Mj/8/2u2
 ezZsZevR9Fd1g/vm1mIlL78yFwNs1mY3XXjGRfIcx2C5uNwbke1qK6d2AqRH9r2P8+SZ
 /+eGrJV+3NL4ACYczrTBozTA29E3S0nVSaagt/0ml+aO4XPQHGoyoOFOD+gM46xJY8/S
 WrOomtSo/4Sz8VCgGftZgfTaOOnSRgWiPUzvQieO/LXSK3JZIbCdifGae2BAY4Lbjv1C
 CK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740762945; x=1741367745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5IViTe8RLsr/7gyIz1ubG0CWzAG2HTZaKxR7vnijfU=;
 b=mUTcaNXAAm7sBWnpF4rbye0jabQzBtZajeaNPm2Vr71+0e81uF7uJKZP3J5KeO9vNd
 M+KiFlB/Maaxy/WXtPsCaX/LqdJCnLf9lbmd6DCCmX+0uFdLpBLH3yvZolEmxMCr0Rax
 3cKK0TfEm5MmHRoZazMLy56Us4K2H1sntez2fW9Ljt2oXHxD5jevIL3n2h4Sm5SY+F70
 rcPLKABjKdtR8pF3g0VCqzOpH+A0sHJcSx6FFm7prrBm0SYTETTgITwYfW2wI7FJsi52
 QM2L4XjDV/rRUGp8CeV1uuECplx9wGa5MyG6Fqvptbncx+oSwOKme0SZZPbBp6QiRdEl
 vYOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFJUVpmNNyTzTqfNB9Myena4WQ+urCVxP9mPR+G+fpkH9avfhBITCxVcFbHkQagubzxyYvTWlEhCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytgjqd1WF2TiZ+mSmUdvcOa2j4IkEPYJ+1HlYVLtOVbddvaAS+
 bfoTvraa9G1v17QlyJCHMVDRAtbMCeEdSCJFREpDaea3WW9EzAZqafWkP3e6JcPH3jFQO0xPf3H
 lyC0LRLTWv7+17bDY0pJnzxymhPo=
X-Gm-Gg: ASbGnctAWx04zW+wXKSdoIGcC+/fXaTxo2VV4maEnpYly9pJmKNtfKiOYcY7SYXCTmS
 7VwhFYMBj+xVgVz175Ez7N36MF+nxKc3gf7TUUrsEbCHReUetQIjFvZKyPL+29s1juhSRliWVqc
 gcWg8eHHT8Vf0UNLGVUX8kQBD2PVwmSyEqeDTZwHAl
X-Google-Smtp-Source: AGHT+IEbcsQtbp3O+ey+VrdIkA81JOdN79Hm7TR8R6EWpdhblI9jRvrXZbzmKG3aUjKFJdpaw+SmrW35RWe4VuPKUGM=
X-Received: by 2002:a05:651c:1503:b0:30b:a20b:6667 with SMTP id
 38308e7fff4ca-30ba20b669cmr2499401fa.9.1740762945018; Fri, 28 Feb 2025
 09:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
 <CAJ-ks9k4rZdpL5dDfwMHuiKFdyYdY00YioYxdtsqszpcbhzjHQ@mail.gmail.com>
 <CAH5fLggDgYYk-0HzCjDmmHjV6JkR7WJhmQU-Nhbo4iBGBw1AJw@mail.gmail.com>
In-Reply-To: <CAH5fLggDgYYk-0HzCjDmmHjV6JkR7WJhmQU-Nhbo4iBGBw1AJw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 12:15:07 -0500
X-Gm-Features: AQ5f1JrjOvuMmGe4WteqIrZ6qgU1Y7KkRrBQNzJg64Rc_W6A8qEHvWvwyzOVcTM
Message-ID: <CAJ-ks9k2HaeTyGfFSfeJUFWkwc2F2hvTg2m4yEQ+8-AvLS6UZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 01 Mar 2025 00:40:26 +0000
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

On Fri, Feb 28, 2025 at 12:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Fri, Feb 28, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > On Fri, Feb 28, 2025 at 7:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item =
=3D u8>) {
> > >  /// * If `url_len` > 0, remove the 2 segments header/length and also=
 count the
> > >  ///   conversion to numeric segments.
> > >  /// * If `url_len` =3D 0, only removes 3 bytes for 1 binary segment.
> > > -#[no_mangle]
> > > -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: u=
size) -> usize {
> > > +///
> > > +/// # Safety
> > > +///
> > > +/// Always safe to call.
> >
> > This should explain why it's marked unsafe, since it's always safe to c=
all.
>
> Safety comments generally do not explain rationale for why they are
> the way they are. Where would you like me to put it?

Safety comments also generally do not say that the function isn't
really unsafe (with a notable exception in
`samples/rust/rust_print_main.rs` which is similar to this case).

Perhaps "This function is marked unsafe because ... but since a safety
comment is still required:" would flow nicely into the safety section.

> > > @@ -36,6 +36,10 @@
> > >  #include <linux/workqueue.h>
> > >  #include <trace/events/rust_sample.h>
> > >
> > > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > > +#include <drm/drm_panic.h>
> > > +#endif
> >
> > Why the guard here?
> >
> > It'd be nice to have a comment here explaining the atypical need for
> > this include.
>
> It's not necessary. I can drop it.

Ok. A comment on the include would still be helpful.
