Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19693A49FC5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E17910ED07;
	Fri, 28 Feb 2025 17:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GXGDa599";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D3110ED07
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:06:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-390d98ae34dso1933303f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740762398; x=1741367198; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6qlfwUD5FmpL5nB2hYAi8mBfOK4uG+dWSAYbDiUuBI=;
 b=GXGDa599Z4qgNshQbTUO6KLZ/zwrpRlxfCvSU8yJvldLzb9ekI+PAnMVGNgmt6gvd4
 sC5WGKOFqp+pgKD2Ertm5URCrkwTYCo7IFT7QOAqkD5j1Ad9yu2QN6i2BLXx5JuXhefn
 w41g3f459glCFzr6Psffy5EUg4B4RnLDOQsTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740762398; x=1741367198;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6qlfwUD5FmpL5nB2hYAi8mBfOK4uG+dWSAYbDiUuBI=;
 b=CKsEDHZkJMN1lZ2Rtk2Zg1BaRxe8zK/YMGwBdi5f9OVnF4grOw4IQDRwFrhG4JmmQV
 HVLxBRCajpbfUifbSSrzwLBsmGEySt9ldTX8a24MM7YtSkvmN7hcPDtAGnXTHc8m1ZgB
 ZWOkfRJqmFyq1drxskH3UGoRPGQNn6jTgCNMKiaQfi53UWM1rmLTTojYIDbBbaOhOnTm
 PxWtJWX5lWvIgCK1Z6gWAkWiZTs3MaPrY3EMX+l4+comdHj5QZqsQgPEPfFICpbYQrah
 Uu8owLJcoT0LbPhzT2JsOipiMrZ+EtmhgczYQ1YTQj9w2VULtgZBQYYB6rZ1lrxaSJ61
 t6ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx3XcXXdGZsmVSfe+Cjc79x1EQWONV4cS/o4c+a5QzxvYukyXCsH63l+tGYm1HbebHFAga+yjRMo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyU2Eii9FUS+uBSDfR766iKTXep+YU1SaGlL/laXpc82aU/KrA
 v1zyyb8EkAaXQlkldAujm8XOcN39lI25UMjNMdExn3ms3LFOV+LO0uerzbVgrVY=
X-Gm-Gg: ASbGnctY1ftyTz2lEImbHNx+t6A8l7qL9Jn0ZD5VuLluWYoMLPYya51O9DBKECyB8a4
 5a/5dnnnXDjqiHpidyraI6FWIclIXV/YheKCI0tIKqvjuVUFD82SiJvhO1P4orvzc2fBF0EK6y9
 dY89/dfSLYIyf/eXpdx3f8aY7y9bEaqDSrdUHuChQON7rUy4+jctRnYIQpOoet/Z43zz3lNdtWV
 QBWbpGsNbltdZEyp8et7jeRnWmNb7hmq0AapZ0QGJJI1yISRJM6g5q3kPgBmrFq9xexlxNpvysk
 tH07JZPEGFtM/wTgL8jiDmtTf2ojnkhWqulLzg==
X-Google-Smtp-Source: AGHT+IEHSdLntqA4vJ+k4vNL6cpNL9OkNh+/n1fHS6Zb4QIdLy5PGjtmFk+o+TY+g7KnCy/4qXM9Cg==
X-Received: by 2002:a05:6000:4027:b0:38d:bccf:f342 with SMTP id
 ffacd0b85a97d-390eca5b1c2mr3470538f8f.43.1740762398130; 
 Fri, 28 Feb 2025 09:06:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6cd8sm5684867f8f.44.2025.02.28.09.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:06:37 -0800 (PST)
Date: Fri, 28 Feb 2025 18:06:35 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
Message-ID: <Z8HtG8fMSfdewkep@phenom.ffwll.local>
Mail-Followup-To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-export-macro-v2-5-569cc7e8926c@google.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Feb 28, 2025 at 12:39:34PM +0000, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>     |
> 986 | #[export]
>     | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>     |
>     = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I guess makes most sense to land this all through a rust tree, for that:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

The rust macro magic definitely flies above my head, so no revivew from
me.

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_panic.c     |  5 -----
>  drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>  include/drm/drm_panic.h         |  7 +++++++
>  rust/bindings/bindings_helper.h |  4 ++++
>  4 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>  	stream.workspace = NULL;
>  }
>  
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> -				u8 *tmp, size_t tmp_size);
> -
>  static int drm_panic_get_qr_code_url(u8 **qr_image)
>  {
>  	struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..d055655aa0cd 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>  //! * <https://github.com/bjguillot/qr>
>  
>  use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>  
>  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>  struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>  /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>  ///
>  /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>  pub unsafe extern "C" fn drm_panic_qr_generate(
>      url: *const kernel::ffi::c_char,
>      data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>  /// * If `url_len` > 0, remove the 2 segments header/length and also count the
>  ///   conversion to numeric segments.
>  /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.
> +#[export]
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>      #[expect(clippy::manual_range_contains)]
>      if version < 1 || version > 40 {
>          return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..2a1536e0229a 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
>  
>  #endif
>  
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +				u8 *tmp, size_t tmp_size);
> +#endif
> +
>  #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..5345aa93fb8a 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,10 @@
>  #include <linux/workqueue.h>
>  #include <trace/events/rust_sample.h>
>  
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +#include <drm/drm_panic.h>
> +#endif
> +
>  /* `bindgen` gets confused at certain things. */
>  const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
>  const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
> 
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
