Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C60A5883D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 21:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A703D10E096;
	Sun,  9 Mar 2025 20:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X052AHAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB610E096
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 20:47:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f74e6c6cbcso992036a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741553267; x=1742158067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K44Z7DuR2sJPBt/x+nc+HSqeieqPDVCAVsmBItqywyE=;
 b=X052AHAypv7Et2yyQ876KdGHe+1FYbM9VTQiifsNk3bdE5nNxbbFAQrNLMFN/GVYIO
 Bs0yxNwL0erfy3uFdLJzw3zGcPWdJDafP/ffH0wKKyNsh+Ym4DZFt1E7QfJsB1CWyeuY
 mLoYtaGyN6PiUdPzFGlMzSiSROK3EcNimBzpx9VHXnhXmIzFLCjlwClhVqyyEB2TEu3d
 iLsJEokESNjhFyhKkG58UDFT/qPMneCIxDOCwRpU9OOPpKxgKgGvxkd/KukK788pucMi
 /dKAJbSxYqxVNe+9ih+0Sw/+8HLq+q/AS4vgrOe4ZhowZlDrwguTBH1HDgPzWgmQG5nI
 fI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741553267; x=1742158067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K44Z7DuR2sJPBt/x+nc+HSqeieqPDVCAVsmBItqywyE=;
 b=BUcaaVoZqs0wtlWs498xgrySxEAbAyLGe5J/EfGu6zbzjBwSEC3cX488gJyn/48pUp
 jZTxfHA6YL4iMj3dpRdPf42biMY5tQV+lP8xt+YoQdGG51HesxSErHJQFDxaoB2lOCpq
 nKg/2tGVQx+VmKNZ+9ab11o9gsS/GkCnvENMIc9SUEQO0LCUL2rMSOUMkiwJIeeBQEuU
 2QE5PZO0YTAF2Huz5qQJAAaNCDykMEyoOzm+lIFEaYpY32yxgxV9zT+UQDV2XfJ903CY
 d5qAYi0jCyy/Zmpb1Uj83ytVJaWuOdKBi5lSSH3z0MVLf0xA59TiBcs/c77M8aPJhdpM
 SLbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQiUszWDt4Joao+3lXaqrDPYFxx3JH/7l2Mxk/nYXdHw8LAywwUztcNWSSWCtPiFUV6IMZXW8KE4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYg7+Bl9PHA+FmJvVB+QHr3VGMeIid2gB+eejwyZleKcgxXzgU
 zLh6TCaLEQ6ZuREMu7JmHQqs+nrxqmjBG/xFdARPvS68rfgmzj4VIXS9rmQ5Q7TyzghRyAaKwSq
 iMWt067QeYsEcL2+NySGOYZTQACU=
X-Gm-Gg: ASbGncuZ3EpQGrSUzq//h9tb6AnopuPNF+r30OXgNLMealGq0reSg+uAWqfrBfUwhxN
 vS0GAY5iotgkZVJ9J3ancd5lwpM8GWMWoMKOBl1zWAVF1JcutjxBS+7gZsVC88AYd1Ym82DRex+
 /3asT3P3P5mo03occwEQmJxLZOJg==
X-Google-Smtp-Source: AGHT+IE9m6d05Vs3kBPf9WYfP6L9f9fGtqqjKeiTF3mJO+jV/KfWSyEpQ19ctMp3X/RZ+Dum29WiMpFS6K4cpfS2gjk=
X-Received: by 2002:a17:90b:4c42:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-300a57877a8mr3929049a91.5.1741553267456; Sun, 09 Mar 2025
 13:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Mar 2025 21:47:35 +0100
X-Gm-Features: AQ5f1Jr2HZqZdaFpyMuYK5NFXHysFVDHD5Dul0EsJZjAk3dtFTlU_uTpx7nkwUI
Message-ID: <CANiq72kY+h9jsFbVBq2_Z4YDUyPCSWuFX0Q5hUyfxsraNV-C4Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Check Rust signatures at compile time
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
 Tamir Duberstein <tamird@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
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

On Mon, Mar 3, 2025 at 9:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Rust has two different tools for generating function declarations to
> call across the FFI boundary:
>
> * bindgen. Generates Rust declarations from a C header.
> * cbindgen. Generates C headers from Rust declarations.
>
> However, we only use bindgen in the kernel. This means that when C code
> calls a Rust function by name, its signature must be duplicated in both
> Rust code and a C header, and the signature needs to be kept in sync
> manually.
>
> Introducing cbindgen as a mandatory dependency to build the kernel would
> be a rather complex and large change, so we do not consider that at this
> time. Instead, to eliminate this manual checking, introduce a new macro
> that verifies at compile time that the two function declarations use the
> same signature. The idea is to run the C declaration through bindgen,
> and then have rustc verify that the function pointers have the same
> type.
>
> The signature must still be written twice, but at least you can no
> longer get it wrong. If the signatures don't match, you will get errors
> that look like this:
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
> It is unfortunate that the error message starts out by saying "`if` and
> `else` have incompatible types", but I believe the rest of the error
> message is reasonably clear and not too confusing.
>
> The main commit of this series is "rust: add #[export] macro".
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Removed period as requested by Andy. - Miguel ]

    [ Fixed `rustfmt`. Moved on top the unsafe requirement comment to follo=
w
      the usual style, and slightly reworded it for clarity. Formatted
      bindings helper comment. - Miguel ]

Cheers,
Miguel
