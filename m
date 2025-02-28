Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B070AA493D4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D6B10E246;
	Fri, 28 Feb 2025 08:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="psg+7QqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A1710E246
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:44:36 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38f504f087eso1306407f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 00:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740732274; x=1741337074;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOxiVL/4Is0kUFnkic7+UTCC19Fblnv5O4EMApXB9Gc=;
 b=psg+7QqE3ccmEzvfIyeeBNLAFY8WbG7qky5FTXSb9NDDhP9ONJkK1D49BmmmD80Pw0
 o9suLfYFVO+9JC4bNWN7UDMhQ4KEFBLHYQXZgI5P4NkwMDW2tv4LMqzwn8uZbm7uW77S
 zld+/upPVqTKhAQRB0+HXnIdUkY+Dn37vR5U/O+jSZVlJrvdhOVt4F6yyqgCW4/E6sa/
 oSMtA0+7y1JOl1RjoQC5eB8rIxJEf0Z6p+tqAObu1mLYBCsJIsdxxmYCpcChkNMRhtjO
 /itFCy42pSojWNIxLbZAT4i+GSEkyznfGr17EqgIxyyjEzW8WtE0KMXxq47M7+9ZqFm+
 pgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740732274; x=1741337074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOxiVL/4Is0kUFnkic7+UTCC19Fblnv5O4EMApXB9Gc=;
 b=tKkaB2nClkBGgkwg36BRI+S8KUf2V/B9dKTr24lWYpLMDbQLYeCWfts+HbDRLi4ozC
 xv14v0HkSvIwVFNtkP+eHxq1PyzLJb1EM4IorkuhJ0uHNosYGRcfI+JjQWJaaxIu/Z6M
 wk/uph/CEKd2Hvqisswfim3Zb0R0usCHYCC7exXqk7ac4NT8bOIA50/zuFZfYapAtq90
 aKewTte4j6cHXbdiPqSiF3JuFkVkaoDAUczh1I5WK/q40TYdZGD1qsObwQ9wMP9vxgl2
 Hq4mNd40AAJf9NkhBF0UEalAL9TsdOPGp/GcvIBjsfyhfAHlAGDrQcYxsr3hzLZUdbD/
 a/TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVncadgcU5kqU2IPHke7x26n9OLsDpZrH7Vuy51nynyRjCuopdYFvAFjqcRpGd0N4TyxCQUkbAYKYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoUOFYO6gs4t1Gohkcv0fT3kBzf7QB4SzWJ/veNmpxQUWT9Hn5
 Su7Ax1L4qJEKejPKpU7c+3sRan6Rp++ekQE7fBeCa6q5iXmd7tkdihDbbi2T2Fq/EOmaa6FECJY
 Qkb7mXeOJ//oh986X46UZtt0wsb8R8ZX/ZDWX
X-Gm-Gg: ASbGnctQ2mQ3mil3ivOXiMP+/0LsxrYfv3aYJjU2UYXPiLiMvJHcC4AZ/zVHwp4Iryd
 bk24LBgzA8acSRUgLhtSR8JTP9I0x/wtl9dLbOrfcZn0vGbuBUb2tbGHTbRGs+3JIqe520CjdeG
 wjp2HvaiAGUg0sb1iVtYXoTxMHDCaqQTyX/TDF
X-Google-Smtp-Source: AGHT+IHDCpdDmfH+NBkGICBqBloSnUKkAJpf/2fdReBq9ra852m/4DtL/k3NCUS+ytHHNljzKRaE7KY5cj/F7p1b24c=
X-Received: by 2002:a5d:5983:0:b0:390:e822:46de with SMTP id
 ffacd0b85a97d-390ec9dad21mr2091104f8f.33.1740732274407; Fri, 28 Feb 2025
 00:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <qxbD5y-rJZMJDMN1wtODJBCAdNtNdQFsYIDhZUex7KcbPiUvABElh5V8c9EFoAPZ7xQe_L8JS6MzAIqciAb12w==@protonmail.internalid>
 <20250227-export-macro-v1-1-948775fc37aa@google.com>
 <87v7suo5ay.fsf@kernel.org>
In-Reply-To: <87v7suo5ay.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 09:44:21 +0100
X-Gm-Features: AQ5f1JrXknBQCJv4d6JEhXtJTXzizHml9Tfu42Up3Etyslc_lFl3VblDtZu0QMs
Message-ID: <CAH5fLgjKoHpGS9ugxawwJJbb68trHEVvBCCNWFcNSbScGKpuDA@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: fix signature of rust_fmt_argument
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, Feb 28, 2025 at 9:20=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > Without this change, the rest of this series will emit the following
> > error message:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >   --> <linux>/rust/kernel/print.rs:22:22
> >    |
> > 21 | #[export]
> >    | --------- expected because of this
> > 22 | unsafe extern "C" fn rust_fmt_argument(
> >    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
> >    |
> >    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *=
mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
> >               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *co=
nst c_void) -> *mut i8 {print::rust_fmt_argument}`
> >
> > The error may be different depending on the architecture.
> >
> > Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  lib/vsprintf.c       | 2 +-
> >  rust/kernel/print.rs | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 56fe96319292..a8ac4c4fffcf 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
> >  early_param("no_hash_pointers", no_hash_pointers_enable);
> >
> >  /* Used for Rust formatting ('%pA'). */
> > -char *rust_fmt_argument(char *buf, char *end, void *ptr);
> > +char *rust_fmt_argument(char *buf, char *end, const void *ptr);
> >
> >  /*
> >   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
> > diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> > index b19ee490be58..8551631dedf1 100644
> > --- a/rust/kernel/print.rs
> > +++ b/rust/kernel/print.rs
> > @@ -6,13 +6,13 @@
> >  //!
> >  //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
> >
> > -use core::{
> > +use core::fmt;
> > +
> > +use crate::{
> >      ffi::{c_char, c_void},
> > -    fmt,
> > +    str::RawFormatter,
> >  };
> >
> > -use crate::str::RawFormatter;
> > -
> >  // Called from `vsprintf` with format specifier `%pA`.
> >  #[expect(clippy::missing_safety_doc)]
> >  #[no_mangle]
>
> The changes in this last hunk is not mentioned in the commit message.

The diff is rendered pretty poorly, but this is just importing
integers from crate::ffi instead of core::ffi, and I do believe that
the commit message makes it clear that this is needed.

Alice
