Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133DA4B9DF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D410E062;
	Mon,  3 Mar 2025 08:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bEUJcGnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881C10E062
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:52:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-390d98ae34dso3391784f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991955; x=1741596755;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZedBe7vxwSHNQekhyj5949NlNVonJ7luZ+4oJCMZq0=;
 b=bEUJcGntSwKu+NZNMCUeReOHp447zuC6dO3tpnwfnUZiv1v3lbWnpE07ozy2h7Z4z1
 p+B7UZBD65M8j1393dGKUF3Z4mVfYE/XKOgS+hYNVo74MYmOVOfGlpYnlFxLnc6jGK+R
 /Gva6t1MlkFI1JdYey/SzAM88bHGpmACch3huRc9u+UD8i4XM3kcdzCYjCYAbTcIMgWu
 mT1nnN3fzkqjIB5V1eDwF9FRegSf0jwcU014C46o4nWabjIO1II14GhOsQGkNaVv+oin
 /72QWsDcqmFWwSPKe0StV3SCgkF7J+foL2Ac9Lh7T3+N0xNfo7wPCfghRHqvn6hT8yK5
 Jltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991955; x=1741596755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZedBe7vxwSHNQekhyj5949NlNVonJ7luZ+4oJCMZq0=;
 b=Fji1mOivceassrBArSg0Xr/lmxmR8RlyHm7eLwFfd6HQtSdhz5Xpyt5TyASPX6DjHx
 K6/DwvcKuCYWZIkZM9zxrVdr6XclneNaikJYiJkAaI7CA1zn5yvI5+CsMaImWDI9PaDw
 cfrqlb6iVgQqf9ScRPpF4Ih9ZMM1IbroRs9SwQltl+SPpGJaEP1RaXcfpcUgaJVpnkL/
 3RO86nvSm1O5fWItj/B3ZWMwXEhxs3OMZ2gIgvzvTM1V+0GNqajVU1XPjYhr7dMxzJni
 0A1njfi2akJ0uB6Av8GhyDeiO4UJD28dBol9TSeMBuHknzEzJWp/59DiYUQmX0M5YizJ
 5O8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVggXPfNXO0g0jVI0GLo1Gd8xDnx5UgoWMzS05xDrPNFrTu8VYYD00iQm+oAapKI47lc7aGtQcehy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCczZ3IbSr6JR0HKI9Im5snYS7tQT5hcCoLE5nvt2dAuBT+7U6
 oj2XSDV8d3JZ3/7yoPV4TdhTR+sOKSe8+xhTop/P1EJ49cldpcqWPjzgW86TLgGfvEQvhDCT40R
 9DJ3W5ROL260qDJQann66+deKlWEsUqmgDsfx
X-Gm-Gg: ASbGncuWwAKr23HhdD3j07Jw83ZAcE7EojkCAOEbRms2XWIBotNVfqQuRorr3Vt/GGW
 3YGVsvu78Ln4IyUJ847PXb+VpYaz/YPrBaWIlXxy8aGRaMB05nrLTV8q1ADaWFT0dNDx6/XCl0m
 JUxkMRbkLEuaolY0+SJuDdwx0Ss65m5pQifCmmJCb9l17B0y3Kne1GLSu1
X-Google-Smtp-Source: AGHT+IGPWx+m6XG7095T3v0ZVlAXzNJwhfctSVi2QHnsOIWVW4GZ3S/6Td355pTg0Z+ilOrY+qMqRFrKA4AKwqV4ahA=
X-Received: by 2002:a05:6000:188b:b0:391:ba6:c069 with SMTP id
 ffacd0b85a97d-3910ba6c26amr2138123f8f.44.1740991954661; Mon, 03 Mar 2025
 00:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
 <CAJ-ks9k4rZdpL5dDfwMHuiKFdyYdY00YioYxdtsqszpcbhzjHQ@mail.gmail.com>
 <CAH5fLggDgYYk-0HzCjDmmHjV6JkR7WJhmQU-Nhbo4iBGBw1AJw@mail.gmail.com>
 <CAJ-ks9k2HaeTyGfFSfeJUFWkwc2F2hvTg2m4yEQ+8-AvLS6UZg@mail.gmail.com>
In-Reply-To: <CAJ-ks9k2HaeTyGfFSfeJUFWkwc2F2hvTg2m4yEQ+8-AvLS6UZg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:52:22 +0100
X-Gm-Features: AQ5f1JqSjZAAlx6Wf7jKinnV6m6qfDAlCxxS5CZwf1LezmrZAHRqRlmJeyImFx8
Message-ID: <CAH5fLggVOKrWZhR8rEH1ZFbJ4naoAP8Dp=pKpuj0MmsThBuK4g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Tamir Duberstein <tamird@gmail.com>
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

On Fri, Feb 28, 2025 at 6:15=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 12:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > On Fri, Feb 28, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.=
com> wrote:
> > >
> > > On Fri, Feb 28, 2025 at 7:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Ite=
m =3D u8>) {
> > > >  /// * If `url_len` > 0, remove the 2 segments header/length and al=
so count the
> > > >  ///   conversion to numeric segments.
> > > >  /// * If `url_len` =3D 0, only removes 3 bytes for 1 binary segmen=
t.
> > > > -#[no_mangle]
> > > > -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len:=
 usize) -> usize {
> > > > +///
> > > > +/// # Safety
> > > > +///
> > > > +/// Always safe to call.
> > >
> > > This should explain why it's marked unsafe, since it's always safe to=
 call.
> >
> > Safety comments generally do not explain rationale for why they are
> > the way they are. Where would you like me to put it?
>
> Safety comments also generally do not say that the function isn't
> really unsafe (with a notable exception in
> `samples/rust/rust_print_main.rs` which is similar to this case).
>
> Perhaps "This function is marked unsafe because ... but since a safety
> comment is still required:" would flow nicely into the safety section.

I added a comment, but I disagree with this claim. The phrase "Always
safe to call." is actually quite common for a "# Safety" section, even
if we have rarely needed it in the kernel specifically.

> > > > @@ -36,6 +36,10 @@
> > > >  #include <linux/workqueue.h>
> > > >  #include <trace/events/rust_sample.h>
> > > >
> > > > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > > > +#include <drm/drm_panic.h>
> > > > +#endif
> > >
> > > Why the guard here?
> > >
> > > It'd be nice to have a comment here explaining the atypical need for
> > > this include.
> >
> > It's not necessary. I can drop it.
>
> Ok. A comment on the include would still be helpful.

Added.

Alice
