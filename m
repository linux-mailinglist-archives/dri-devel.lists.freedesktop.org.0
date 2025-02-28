Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631AA4A729
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E4D10ED6A;
	Sat,  1 Mar 2025 00:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QT1BLdhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874810ECDC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:48:53 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso22014361fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740757732; x=1741362532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ4fegw5GEt8O8KL4/rvOxBAV+1hbqKfbwK90U7ORtA=;
 b=QT1BLdhJPOEw5xH7HGB0ESUBcda1wzKoeCZaYZ93AsvQg4Fi94obB3l/keLUlT9G9U
 EjzXk0DpYRVltgiQD34l/J30NBWHZIg9RoedgOOZw5GolbNXajgT8AiF6KGjTCfby2tW
 hrPOYMOprfjjfTrd6LL1M8T2AtREKo8QFfcJflmG49W6nXETOphZkLEoioGGqew+WiDA
 4zwI/rvmd+et8p0bxjEzjpAR1oelY+LYm8SR6Z2smObnbsrPAXJ6kVPRlT+vIVQi5VyX
 SU7icyztvHDZnMLu7fAZygdr+0GWTnIx8ddoBozt/rSG5VShsvRBxx9XQTYMWB4v5re3
 MLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740757732; x=1741362532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ4fegw5GEt8O8KL4/rvOxBAV+1hbqKfbwK90U7ORtA=;
 b=T6Aaeeajdaf3mMsugzEzwRxkDN179q/X0wxbfUtu/Y+SZ1jjlHVJSH0JBAJKge+6Kg
 9eRdXaAZeC4cBkbfo3jgakk9g7v0gxnX1QVQRy/A5sAwRQXr4Yl25XEpHQ8CnW2EmEfw
 XsiL/kLmTHJKaYobz86tmWOz2jGiGa7ee/PQC8I7KtzLh38BYp3qPSXRwtm7NvQo2f78
 XZC7yqfZZazwXzKFmP8MWRa2C+krj50wUmmjndp6hXMrEQitCUiMkTxsZyr6SP8oUgls
 PE+53kkky7oRp/bIOZKPxfNtr6uac7du5Rg5KBqYb8fk09H+aCd+CAtJVxFtKz0LQcdz
 9vIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGD2BfkB0in8+njW4fyy/UT4Mh6/EqxxD17t9m3z15So7K9hss0KKu4+eR6ABKyp8AqYRmLUtqA5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwcdnHTBT2u8KdqODwp7AW2Ah1n7+EJ3hPEO+2ZQWsGSA+b28Y
 xBRCqihFnRST/981GmrxBHW93D6x01LjnmB8Uogn8q3EDL27OtGT6pi7h8nE+e2fSBCUrcfSlF4
 uQFNstyXQbvUtf3N93pD/atoMap8=
X-Gm-Gg: ASbGncvUuw+ipiGGe7zI79yzIO1qm1H6Ggxz2k61+u70GUaUTC15NiOlgNvRllbsUPV
 /EN0hskWaD03fjzvVKyp7bpjUBWopsZndxyxF6pgYNrzBNAB11ZfUNcGilz0vfqZPUyPbuL1j4u
 OEdVDmAiV5YlqcyBkxOSKsLFwP6SPi4QsdDeBHDVaz
X-Google-Smtp-Source: AGHT+IH2mhDeR5Hvpiui7B9KmAUAyh41BNAkMj//f9oIevNwFxBXsUZSbVEKS0GLWxYFKbJGvd4IMaFIKRaVnZp82CY=
X-Received: by 2002:a2e:9252:0:b0:309:2653:5dc9 with SMTP id
 38308e7fff4ca-30b9331a3f3mr12205581fa.37.1740757731517; Fri, 28 Feb 2025
 07:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-4-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-4-569cc7e8926c@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:48:14 -0500
X-Gm-Features: AQ5f1JpzhY8OhWnuglzKNAfIJM2SCJNThQnH062kfucBfcLsGRF11ll6ypb922c
Message-ID: <CAJ-ks9mUXf2XNRaeftmfGPUvu9Lv3t_Ye+DoVuRhiTxQ5-C7Qw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] print: use new #[export] macro for
 rust_fmt_argument
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
> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> I'm not sure which header file to put this in. Any advice?
> ---
>  include/linux/sprintf.h | 3 +++
>  lib/vsprintf.c          | 3 ---
>  rust/kernel/print.rs    | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
> index 33dcbec71925..029ad83efd74 100644
> --- a/include/linux/sprintf.h
> +++ b/include/linux/sprintf.h
> @@ -24,4 +24,7 @@ __scanf(2, 0) int vsscanf(const char *, const char *, v=
a_list);
>  extern bool no_hash_pointers;
>  int no_hash_pointers_enable(char *str);
>
> +/* Used for Rust formatting ('%pA'). */
> +char *rust_fmt_argument(char *buf, char *end, const void *ptr);
> +
>  #endif /* _LINUX_KERNEL_SPRINTF_H */
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index a8ac4c4fffcf..1da61c3e011f 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2284,9 +2284,6 @@ int __init no_hash_pointers_enable(char *str)
>  }
>  early_param("no_hash_pointers", no_hash_pointers_enable);
>
> -/* Used for Rust formatting ('%pA'). */
> -char *rust_fmt_argument(char *buf, char *end, const void *ptr);
> -
>  /*
>   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
>   * by an extra set of alphanumeric characters that are extended format
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 61ee36c5e5f5..cf4714242e14 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -8,13 +8,14 @@
>
>  use crate::{
>      ffi::{c_char, c_void},
> +    prelude::*,
>      str::RawFormatter,
>  };
>  use core::fmt;
>
>  // Called from `vsprintf` with format specifier `%pA`.
>  #[expect(clippy::missing_safety_doc)]
> -#[no_mangle]
> +#[export]
>  unsafe extern "C" fn rust_fmt_argument(
>      buf: *mut c_char,
>      end: *mut c_char,
>
> --
> 2.48.1.711.g2feabab25a-goog

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
