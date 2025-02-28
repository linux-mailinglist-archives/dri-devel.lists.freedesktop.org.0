Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2DA49FC3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A08910E055;
	Fri, 28 Feb 2025 17:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P1oC80zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BF910E055
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:06:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-390eebcc371so565718f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740762385; x=1741367185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8J7XRbUO8s3OMSTjgDPwmLEa55ajEPIZbcN5bhy+Zm8=;
 b=P1oC80zVfuDEp/k/H+z1dhL4gM5+SPMoZjr9nJuUI9zTUQEpkG80A/4GBK4V4V9j56
 aRNbQxRw+UfsRNc3cGo5/wsBiUF9Je/FMb9EbUSwqpFtNtN7YmqJzF7Qa26aw6QKyNt6
 vNNNmfhgNk+m7m2ddglqEQPRoUGg7kYJGbn9eu8qpRPVr7T8r1Nwu0JTmta+Cn30Zbi9
 EeV4M6QJQcGpfAkg68ZnZjEj9mYV9k4iC53hJHX9+7yjEqJL4gTrx/6tO1Dg8dLD0L30
 NQBHhAnutHtY9LhvcZZ/A6SC0i71UU+WJkmLbsbcFOoYLokx7e5OrYVm5Tegqh2Ofdzq
 09GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740762385; x=1741367185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8J7XRbUO8s3OMSTjgDPwmLEa55ajEPIZbcN5bhy+Zm8=;
 b=sBLgnZpHYz+nfY+sM+37Xu7XcMXbHYStR9tUM6JRhXKwggN2hOIei/MpQThKcadFzR
 JBBxpP41/9OnCHvzsE8BVjArruXmTIkQuNE4oo2+z0g4l6YxuNioiM53X7f1j247+vTG
 fSiGkhOKFh1NLxDuXQqXYlUdPwCSbzQ+VqTPewW1QmK36BArnpCHgbJtDG+VHWXyzZsd
 kwKi+SK+wUTxCNpONhKJiwP1OOwEsDo30HKqpNsok9I0P24oHmq1XV4ClEnPTXz59pho
 QMvmTwdtEoVaB+tUPO/dR8Zge/H+1rSGu2OUo2d0+BeqgCnoveXTMpfx2keG/vbXeBCc
 cURQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ7sQr7ClVLR1IrvTxbJRXIrwxwOseUIpc4lBHi/j7xtEfAsqpMTrqefOmLAgPH++dIfBkT4MzUho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys5Uyyg6WMtTPYkuEMkd3cgM/rbIMHzM4og/MHFzO0KiRNCZ2/
 0q8NeUPL1PpDwpd0UQtnxIn6HcXQBO9e/Wqma5JGMYY1pPVWZQ9TTNcjxpzv4QclPWQqsUqW7nJ
 Qky+BG9QruxqCl2LFhAlGLdAeA5vZyYwhPm5Y
X-Gm-Gg: ASbGncvmkc2Uv5p3MXkGyUelokF+hhgJNxDGR1j0QtTFS3BLOPFvhFxTHqeJymQEfwu
 3lLm/jk6Ns5wr4RpTOdApA7OxqLba16eU9Wiv/4KpH0duPxK9tQaKzJm5WkcS8LGs7cp0mVlFij
 DBAkXfladQRYf74lakbJHveRq1Uk6SwohwfqRtJA==
X-Google-Smtp-Source: AGHT+IGlaOMRAb3FBENNcM1UpxAeatCxuxY4R0HU08j6zwUOfzVpBddZU5SLuHwSVik/ichM9YhZ8FQYMw2m3XlZA44=
X-Received: by 2002:a05:6000:156d:b0:390:ea19:d182 with SMTP id
 ffacd0b85a97d-390ec7c9728mr3305637f8f.6.1740762384884; Fri, 28 Feb 2025
 09:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
 <Z8HXkmtrMMD1dATZ@smile.fi.intel.com>
In-Reply-To: <Z8HXkmtrMMD1dATZ@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 18:06:10 +0100
X-Gm-Features: AQ5f1JrjAqJMHRTMCmPZewHqljlFejgu-x6ogb8CTEif1RrVq7g5QcIIk07OtMo
Message-ID: <CAH5fLghO2BhDqs50_ke1ci7kR0ze66qAWQUxzX5-M4403Yc-8w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
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

On Fri, Feb 28, 2025 at 4:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 28, 2025 at 12:39:34PM +0000, Alice Ryhl wrote:
> > This validates at compile time that the signatures match what is in the
> > header file. It highlights one annoyance with the compile-time check,
> > which is that it can only be used with functions marked unsafe.
> >
> > If the function is not unsafe, then this error is emitted:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
> >     |
> > 986 | #[export]
> >     | --------- expected because of this
> > 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len=
: usize) -> usize {
> >     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, =
found safe fn
> >     |
> >     =3D note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel=
::bindings::drm_panic_qr_max_data_size}`
> >                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_ma=
x_data_size}`
>
> ...
>
> > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> > +
> > +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data=
_len, size_t data_size,
> > +                             u8 *tmp, size_t tmp_size);
>
> Is extern needed?

I doubt it. I just copied the declaration without changing it.

Alice
