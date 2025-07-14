Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74754B0491E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C810E359;
	Mon, 14 Jul 2025 21:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P/5Fcks7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473F10E359;
 Mon, 14 Jul 2025 21:09:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32b5226e6beso41368701fa.2; 
 Mon, 14 Jul 2025 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752527359; x=1753132159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2NGUJZIs6JXP/sAdJptIUUuAIdinFtA6zHN1UcDf48=;
 b=P/5Fcks7L96CqzSp2rS5Y9BTbGSJl24Qse2eRPPfgsT/rVmvjTlJBeBLa+OQ+2kkek
 xC06ICcctJw0M0hVjIaat4+16O0zkeRR3OTxHDCXmVmIE2A7Ls4VWABrAFWAuye30kVX
 FJC3t7ntbPBT+PWoUrc912nmcfIOZNm76JdjZ3SxX4FNx1FqAHNNTaSY/aE/N64dA4hn
 jFln2TnewJXPDOci8OU1ju5zNvYykETwdorvumeLtkhcfELzr8pVZ2D+NpqoI/KG7tT+
 na7RlZXa0X8pJtUjaTMId1Vlp4J+KQnqxyW4SeJf1EY4F3BfFi5w1Q/qlftjLwlgFqEH
 +Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752527359; x=1753132159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2NGUJZIs6JXP/sAdJptIUUuAIdinFtA6zHN1UcDf48=;
 b=WpBv+U5A31BwKicovqFLxd/BWw+RWioanU+568Oaa2C5aoKycYgNCOgDfuQkUY0oq4
 W2ooloKJ+KAsT+Au51GUF8UTddFFiwXUe/yovmhU1uAD71vxxf4tGS+ttiV7qw1WlMt3
 6UBxjXa9zKgFBU+GuAH0Q+gZPDJVUBdB7I6ebK0kE0ska4APFziFRqG58iZg+6UyeTg1
 xH2wPpueUtpQlvxOwNWZsJWz88XZTXVOQr7uQhJ2Hg2Qp3XTw8aDeVYAmiSOh9lHI7Nl
 aEvgdlLDgPBdnXrqONw76iCpaXARnwC+EX44KUpw10kE4C9P1aUDs54IC53JS8DxpVMa
 ejOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8vh/Eb7RobkVJNQhLUoFQLc1jIyF4vKLYVMz+CAxj+slbK/W+ffkmDTeYDGfRDUq09b5/yH2hcEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI9+CIZipyleRFYtDcejxuD8v5sjf3kWVmq27VFN7cDnAo/TnG
 TuuZNleNTdXY+ZIKiQDXZbgPM6kKK3siDZjE7Yk5RAwiViqgWwkU3mjWe4OvApMGGqteiStvrwZ
 mmtKUyDeo7lISFYztwyMqKP8ow5cHIsI=
X-Gm-Gg: ASbGncva5s24nyfPqW98YjBn7Ks6o50qgTHs6PoKIZBz/Jp219kadHdaLMBKc/HrwdP
 GHoZ4+Om/3c8Nt8Qym0eo3b+y+n6kd+nWMbrSpVzR+2wi0qKZN9t7GyfG7Ryk3s8K+6A2SKN/xY
 ymeTe0IOBxbzBQaAB7s/DlJSIW8tYnBYJB85NgRM7X5DUXVJ5HSvwVvQwqnRAA9KRxuQBWb+qgr
 uL8zuTySqXcFaTZ77tuu+8rEYVgWUmf9fRjFx/u/A==
X-Google-Smtp-Source: AGHT+IFIVDCB7L/eB3uWUEMPtrD+l6c9ix8jySxxyANfqPuxUfbMymVsdKjgYjWTiEHRsDI7xj3AbxpdXdL0khzdR6c=
X-Received: by 2002:a2e:a594:0:b0:32b:7284:7b with SMTP id
 38308e7fff4ca-3305329b33emr52619951fa.6.1752527358610; 
 Mon, 14 Jul 2025 14:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
 <20250709-core-cstr-fanout-1-v1-8-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-8-64308e7203fc@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Jul 2025 17:08:42 -0400
X-Gm-Features: Ac12FXyyrImsukAEONZO1t5G1kFxNsU4eIQFIToYW9Gkgy7rbvMrpAOfWyMPO9c
Message-ID: <CAJ-ks9=ux6BuPYmRVSjhfn7kuagxPWicBZbumDFKAqmHKd8+PQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Christian Brauner <brauner@kernel.org>
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

On Wed, Jul 9, 2025 at 4:00=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Oops, forgot to include Christian Brauner. Christian, could you please
take a look?

MAINTAINERS entry being added in
https://lore.kernel.org/all/20250714124637.1905722-1-aliceryhl@google.com/.
(Thanks Alice!)

> ---
>  rust/kernel/seq_file.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
> index 8f199b1a3bb1..59fbfc2473f8 100644
> --- a/rust/kernel/seq_file.rs
> +++ b/rust/kernel/seq_file.rs
> @@ -4,7 +4,7 @@
>  //!
>  //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_fil=
e.h)
>
> -use crate::{bindings, c_str, types::NotThreadSafe, types::Opaque};
> +use crate::{bindings, c_str, fmt, types::NotThreadSafe, types::Opaque};
>
>  /// A utility for generating the contents of a seq file.
>  #[repr(transparent)]
> @@ -31,7 +31,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file=
) -> &'a SeqFile {
>
>      /// Used by the [`seq_print`] macro.
>      #[inline]
> -    pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
> +    pub fn call_printf(&self, args: fmt::Arguments<'_>) {
>          // SAFETY: Passing a void pointer to `Arguments` is valid for `%=
pA`.
>          unsafe {
>              bindings::seq_printf(
> @@ -47,7 +47,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_=
>) {
>  #[macro_export]
>  macro_rules! seq_print {
>      ($m:expr, $($arg:tt)+) =3D> (
> -        $m.call_printf(format_args!($($arg)+))
> +        $m.call_printf($crate::prelude::fmt!($($arg)+))
>      );
>  }
>  pub use seq_print;
>
> --
> 2.50.0
>
