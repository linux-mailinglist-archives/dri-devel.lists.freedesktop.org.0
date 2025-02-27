Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C06A48A7C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ED010EB98;
	Thu, 27 Feb 2025 21:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnOiKEgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964310EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:29:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-47220d28138so20333181cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740691778; x=1741296578; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMYme35BZpGxUGeEP8cC12QstjvajEPEqF5JaQ/Y5a4=;
 b=MnOiKEgpLOwTdLwtPeAohsRHPd6QzeT3xy2P2M5HF1IYFVuQyHeOQj72BcuxeshbMK
 LR7yT5d24FaZcE/KEqsO9O7JByqsbD6sauno8iH3h514mRhvQwOYIwoRcdlOuuMLQ9kZ
 FmLr3U7SbWj3++XWwjWYnA2nnPD/4xm5RXUVi+XAn/3y45b9bz810i6Y0eIpqb4P110p
 wQaxAZ8EoeEZgdI8VAX2X5dq8wALtJKXr4PPqnnt9Q952keb6521RbR7scGJVXCF6MSv
 I6YVWUeI3tkKIaKLvguoBcE9l70b5ThB4VnUN2uAalxMDZNe0wE4x4elxmY5wtq4gvgp
 Oe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740691778; x=1741296578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMYme35BZpGxUGeEP8cC12QstjvajEPEqF5JaQ/Y5a4=;
 b=ivePDEZWXdjPOgYeHVmB1D6BBRbTjarKrJryHhNpwicbnJ42MxV1KF4/HJDV5MoDfr
 YUQ0TW2W4QuzV8wV27pyj5n75x/q4vmw+WjjlyIQZzMTBG5CHTJZjX5TTEGPjWkgAzOF
 IALD/mozC2hqZmEt317dJC6oUkbP9zJhjqhZG47GFYY+glgElf+0IKGdXqRtChbEvnLv
 TZbsrLArNFztVamKcgIaOaIHZVq7SE/15cC3os7BCXb5S7YYlL8MBaHN0qRdweYAjCGk
 Z2P62avZzJ6y4TfRjlNvaYAcYDZhTp16mQTkFvpcHJC1wCVWtNloM+KkbEekouTov+KN
 fp2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmrHNYwIFncISw9zdScgiTztwTxY5BRW1r7e3ac/FaTFax39SLHDrlAWCc6PC1+aLSsd9VhdL8Pog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK2287f0gRlkUEgxDTe2kDl1I8d2ct/Kc53DCBfwi/A4a7bHLl
 spL8+LMSIWkytPwvllGr7oPbpnVFpoqC4VThGPH7dPZgYjDnMq/B
X-Gm-Gg: ASbGncv56+DEOXBjiaCiucPwJc3GgKkOkOqP5zAyWdFeNLFkMRADikTJyZR0EC5u4UF
 wMOgVTtLFOMkAAzLsjCnw+rjaG8yVAZKFmX7Nbmwu1CG6fYiIOLLIIbjD0vgFJiuzhhAmQkQU0e
 eNttHX+w4YiNtHcNIG9VJ52pdI7ZEJvyvtGG1BmsVFn2WbNUykgJ9dmvZF9jVvSg3JP83z/UQpq
 gO19lBk49oTrRopKJiDH+gXEkIv+T8ckxW7nPItcZPKxI1mRCamBYbibzLxVboYLAgSAzJjXCJs
 EHNaZlxlVruX1v06YHoyPt04TTJyxBx15z2XPm5uMVzxzH9sapxk93HhgYgGJgoI9Mmtku4ax7A
 sSJrouCFPy8E+SQqm
X-Google-Smtp-Source: AGHT+IHfFJ7Ib1C6jomDvlIhsy3en4tcKkX8nxtsA8sgaw7b5HqMRqGLntupkHR5FMA88h7oDdN8Zg==
X-Received: by 2002:ac8:5f0e:0:b0:472:fcd:a61f with SMTP id
 d75a77b69052e-474bc08f1b8mr10092431cf.27.1740691778166; 
 Thu, 27 Feb 2025 13:29:38 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4746b5edf1asm15866181cf.28.2025.02.27.13.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 13:29:37 -0800 (PST)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfauth.phl.internal (Postfix) with ESMTP id A3A7C120006A;
 Thu, 27 Feb 2025 16:29:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-13.internal (MEProxy); Thu, 27 Feb 2025 16:29:36 -0500
X-ME-Sender: <xms:QNnAZ9VDMfSX4H9yzd9cmoZDiRmU64ESZHdDL1Qfhx--FGITIMDS2g>
 <xme:QNnAZ9lbPcKut3JmUE1SvGqQa3LsMblyhmBsVaVtX39LAmTrbuFaB8vU4FiN1L97h
 Zpfl8ClWaxBIGGfLA>
X-ME-Received: <xmr:QNnAZ5ZpEabJF8bE8kuuKU9AM05F6p15bAYfoph_8mFls2dTvjzag2zY3Wo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhepffdtiefhieegtddvueeuffeiteevtdegjeeu
 hffhgfdugfefgefgfedtieeghedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
 odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
 ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
 rghmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtth
 hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrhgvghhk
 hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehojhgvuggrse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopehpmhhlrgguvghksehsuhhsvgdrtghomhdp
 rhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtoheprg
 hnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgt
 phhtthhopehlihhnuhigsehrrghsmhhushhvihhllhgvmhhovghsrdgukhdprhgtphhtth
 hopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtthhopegr
 khhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:QNnAZwUlcgnShkha5Gj8VRv6NnfGnzJsrN1hlhSgk0DddvIskAEZ8A>
 <xmx:QNnAZ3kFvEV6WM63UIEYoK47MRQvaaRbnw0eT8cJallcFPumoLiWrw>
 <xmx:QNnAZ9emaxjGE1CQi1pGJ6_hkG4Xs7o-la0IiGi-Aq0UbdjOLpi37A>
 <xmx:QNnAZxHFjNDUL61VLcmBiNAUxuKlMcBrVubU8O7xqS0k-VPs0iJ1vA>
 <xmx:QNnAZxn7WbeJU7Vfl2HPa2PQmTaV-_k_kkvEEu_vW_Tlh9DhEU6pZoUi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 16:29:36 -0500 (EST)
Date: Thu, 27 Feb 2025 13:28:48 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] panic_qr: use new #[export] macro
Message-ID: <Z8DZEPoTJRwYj0p3@boqun-archlinux>
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <20250227-export-macro-v1-4-948775fc37aa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-export-macro-v1-4-948775fc37aa@google.com>
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

On Thu, Feb 27, 2025 at 05:02:02PM +0000, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types

Is there a way to improve this error message? I vaguely remember there
are ways to do customized error message.

Regards,
Boqun

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
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
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
> 2.48.1.658.g4767266eb4-goog
> 
