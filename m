Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6208A4A726
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FB710ED66;
	Sat,  1 Mar 2025 00:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjEkKYVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD910ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:14:23 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30615661f98so22206161fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740755661; x=1741360461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=grkPIIqnkl1tYy4u7pVLzybcjKkdicYzst48mzoDrY4=;
 b=GjEkKYVRXHvWglsbcQSFQ1yDLaQDCi2WaGYp+MYnuE7wCUJRHOh64ExD2q9wOnYfyg
 2gb4U0fzwtbmrqIHccsW/01QheGKmuOGSP+DE+WjRXmKEDnEmowjmS3MEAv/ArDrqRxl
 FhEMhqws5RGf3tbasfc8EECnjd1shJ/6i5V9rR0XsMw5UuCqyU714BICt1CAGSR0QNDy
 4/qdDbgdYvJ4S+5OrPqjpPMe7oKEQq78GyoCWHltBE3tPu+uyLxIVXF1j4jnRO0skTGF
 o88FnVsPQ8IiaMqwZy5U/APzRU0o1NcJxYSHjCWu2qZvoST4inERScpHUaD2U5SctD4u
 nxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740755661; x=1741360461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grkPIIqnkl1tYy4u7pVLzybcjKkdicYzst48mzoDrY4=;
 b=ZggoZw8HtxpSv4cAlz1PR2xN7n3B8GiMaXgjXA9BY3xl3UXHD99hFun3iKQffbApId
 qugINdolgqaHPlTehI5ysrOkICWx4moEGoFYHGLelXpRSLKSm0mvkUZoErVXwctwlTYE
 d//ZwIEvY8dMG/xnl050FPo/qQEleXtgkqqtD3io0eT37tJphTDbAdPKjchbVdQJ9qfI
 v7/jvO4kJhiGpneopgmCCxML1PMZnTG6yd5LYNNzf4wOy+8/h/IhLlZJaUC4PaG5TLqd
 GfeE/nCGk04coRi/eDegVMdQDykznbnHMpiOuhd4oy1PbDlKrE94DCaTvmXW21GXy556
 ArMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw5t7g4+EUkooaCgLyZEmy2AognVhXEIPy9S2e+YpqVah8ZNWRmO0jJCuRgZs7UlVGfGnR1WlschU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0TGo5yPxiDU3hNUMpVzThgXWk/IvlhR/jz57ZrbQJEcet54in
 NoayZB7ZDUfmXQJuuRlUCacxV3Y1Zwq+FSgZg/o3TfKFwROsKy6YfeZhsj8Ww+Oyc9++2uGy6/a
 jD+W9jpKmx5vKgkT1zCJDTx9yTlw=
X-Gm-Gg: ASbGncuFS4rAODfYJY51wdwFpnal43ddCD/8XZLKi32sMqBXcPL1JlvnbQ1ANPck3n1
 MllCnwdRZ4vsbPQckk35SuWFVykaooumRV1rlBRjsIzO5z2jkjq/AbPHXdAxUxO49f4/R5TLO5t
 mbwp2Ux4zQFIMoVVs2+lWA1ESyfnAOakTbq+Eu6yvE
X-Google-Smtp-Source: AGHT+IG3PHPW7yEWyg9Nw7TQmjbaY2VbuXr0nAloJvWb506WO/YmCO9PC2FjjLDMuvJBNhfArD3zPEOrkBENci+r6jE=
X-Received: by 2002:a2e:b60b:0:b0:306:1524:4a65 with SMTP id
 38308e7fff4ca-30b932435c7mr11345361fa.20.1740755660982; Fri, 28 Feb 2025
 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-1-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-1-569cc7e8926c@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:13:44 -0500
X-Gm-Features: AQ5f1Jqj0UjIh923vMoZYOcwXSYHASRuQN-dYsI28FEvaRmHFLu_NCNyw0Ju9ZI
Message-ID: <CAJ-ks9nmFDqsBrmxC0nCPQB=OTeKKUucs4AqJSRN4hsGkSPwEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: fix signature of rust_fmt_argument
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

On Fri, Feb 28, 2025 at 7:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Without this change, the rest of this series will emit the following
> error message:
>
> error[E0308]: `if` and `else` have incompatible types
>   --> <linux>/rust/kernel/print.rs:22:22
>    |
> 21 | #[export]
>    | --------- expected because of this
> 22 | unsafe extern "C" fn rust_fmt_argument(
>    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>    |
>    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mu=
t c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *cons=
t c_void) -> *mut i8 {print::rust_fmt_argument}`
>
> The error may be different depending on the architecture.
>
> To fix this, change the void pointer argument to use a const pointer,
> and change the imports to use crate::ffi instead of core::ffi for
> integer types.
>
> Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  lib/vsprintf.c       | 2 +-
>  rust/kernel/print.rs | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 56fe96319292..a8ac4c4fffcf 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
>  early_param("no_hash_pointers", no_hash_pointers_enable);
>
>  /* Used for Rust formatting ('%pA'). */
> -char *rust_fmt_argument(char *buf, char *end, void *ptr);
> +char *rust_fmt_argument(char *buf, char *end, const void *ptr);
>
>  /*
>   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index b19ee490be58..61ee36c5e5f5 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -6,12 +6,11 @@
>  //!
>  //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
>
> -use core::{
> +use crate::{
>      ffi::{c_char, c_void},
> -    fmt,
> +    str::RawFormatter,
>  };
> -
> -use crate::str::RawFormatter;
> +use core::fmt;
>
>  // Called from `vsprintf` with format specifier `%pA`.
>  #[expect(clippy::missing_safety_doc)]
>
> --
> 2.48.1.711.g2feabab25a-goog

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
