Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C839FA4E9BB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417C910E65A;
	Tue,  4 Mar 2025 17:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bvG68r/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0663110E653
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:47:22 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id B13AC40CFB8E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:47:19 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bvG68r/p
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dWR1sSmzFwy5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:35:15 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 80FB842721; Tue,  4 Mar 2025 17:35:09 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=bvG68r/p
X-Envelope-From: <linux-kernel+bounces-541482-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=bvG68r/p
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 1FC7C427AC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:08:42 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id A9D5B2DCDE
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:08:41 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000743BE1D3
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A001F4604;
 Mon,  3 Mar 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bvG68r/p"
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C21D1F3D56
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740999683; cv=none;
 b=unsr315hx17USqgYBmbA4KL1/elXlBR69yQC1cxMYlGXLmM7iBovM4dLZk8GGKAvWvW7zIwLj2+CHhB3Zl1ug0fqcRKQNWy6IY/3+/7zkdhwaD8VxVVYifmYJu2hdPCCoLF/5zjMR9CjzjB9YvX7oQRgOJeVE9r+Qq8/FaELC6A=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740999683; c=relaxed/simple;
 bh=mmzLVm8v4VdXeOGo9WH7rraWiP4WmEJOkii2GPoEvw4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=eeI+HNPUaUhaCxmNviypi3KJCIUoVyGojtblQtuNVqjFvPkT3oIH0B1nM/BZR2SrGy+jMh835g5hI4Tm3b8+zo0KQq3dNWAcBoFrblj8a7JQZqCHICRR+J3wx3HS+u0pN5xoYVzyUpBUhI29nv81SUhfGGk9W5H7Qxdqk/Fm12I=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=bvG68r/p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740999680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
 b=bvG68r/pg3OOdKwLVaCv9dj6gAD3ggAAhq7YyGotdPqxAqv7iuF/wkYLf9ZDrbArrDRVaM
 rnHZ1aBOHJ1guSyJ8DepU+9Dm7lwwiUVl/oSFUgwcbzfYJA9+pJ3eSZPyzgcCoLS5o4OjY
 ttWHVS/UvEDKMRdAwrskJfyeGHYjY7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-DnMfpZv2PViPdILimYupFQ-1; Mon, 03 Mar 2025 06:01:18 -0500
X-MC-Unique: DnMfpZv2PViPdILimYupFQ-1
X-Mimecast-MFC-AGG-ID: DnMfpZv2PViPdILimYupFQ_1740999678
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43bbfc1681eso4667205e9.0
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 03:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740999678; x=1741604478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
 b=LZ6q0/Q6CxnImL/HjZQmh9WGVu8sudWqNwuljyBOP7nNwgfvAU8MXUP8EIypGs612d
 wKd/lrTxzKTmfi+Lnt0ev+faHef4Ju9clpfuQtWqCQiPSz+TkDJO33Tb5Vea++5PcVRm
 JLAJhwPX3Dbt8WuEMcoyhQvdk+Q+NhzmDG7YNbNlQ0a+2Fm3TLY7HAgZAzXvGgWr/Q9h
 ovXEiffQrStrq2QnbfXA8AHWdTLjTwP4VDsVmxuAQLxVS6S6QgCbzbjP03EzhKi6//fQ
 4CdCKNqMcQCgRIL9q9LhX6A6+pdmoOV5KsFoPWd7QF58D2dqXgYZF2RDMFxGA7QYxa4l
 8bdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl7gCZbn2iGG4U8B7wrrAz+SoJAjhiq1AsAzQklkSLYBGSuKRZ2w0fvfEfazvLZ6bdJJOz0AZQMjXRtKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+patmhmN/waoAm9teIBDmH5EE3hTz9sjKkEmodCawuhe3dKK
 +jp/0f22UEbja2UuonwI3F0fCiB5xS49xG/O1+cwnDAYHK1y1lyRckJr+AOXh7ihNDgJyELW22I
 s6qHikHRU4i0DRmNOHqCXIEEFfWnuAS6KKlvnHn/5CI1og5QVycop3LyD9iUqPg==
X-Gm-Gg: ASbGncuQChNVQiWtp6J1gUU2sa2MpTrTMhg/IofcGUH6VQ3nuo7yqWh0G30WGRXj4I+
 KtqvcNsLZAcLaP/zPMT+PrpFbJ0bmXMIue3UxhpDMxZY6oqcUBB1PTf3RJedab34N0RYejivS0E
 XJ3BopCGC4Fx9bbzI9dMpnGx/VnXMmjIIx7Amr1Edat4PeORYOPuATxNuNwIqnyq4Eu/o5PW7cN
 tBopI7IV+XuWqLnWkjXkbpTNlKSxjQKSaVA236mAg6zzwhwG/1qwXDDMv6zWjyKPSqo1SsQGALf
 RBTDHIkUU7+cGcWQotdUav9jxisVC2WYxhVD391GjbANXhe8z9KM2cE=
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id
 5b1f17b1804b1-43ba66e1e26mr99724965e9.9.1740999677521; 
 Mon, 03 Mar 2025 03:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6f+Z9mG7hrRn65eukLG1T0PhbqLEnUNclLy0PNQV7Wtv++uSsmKJt4PLYypBMANEATE/SJg==
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id
 5b1f17b1804b1-43ba66e1e26mr99724395e9.9.1740999676982; 
 Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc596eb90sm17756925e9.17.2025.03.03.03.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Message-ID: <cdefec43-c290-4460-a1f3-7eecf38aa77b@redhat.com>
Date: Mon, 3 Mar 2025 12:01:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] panic_qr: use new #[export] macro
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-5-41fbad85a27f@google.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303-export-macro-v3-5-41fbad85a27f@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6dWR1sSmzFwy5
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715122.76545@g9E3T4TlpH0Iohl4uoTA/g
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On 03/03/2025 09:45, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>     --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>      |
> 986 | #[export]
>      | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>      |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>      |
>      = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                 found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
> 
> The signature declarations are moved to a header file so it can be
> included in the Rust bindings helper, and the extern keyword is removed
> as it is unnecessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>   drivers/gpu/drm/drm_panic.c     |  5 -----
>   drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>   include/drm/drm_panic.h         |  7 +++++++
>   rust/bindings/bindings_helper.h |  5 +++++
>   4 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> -				u8 *tmp, size_t tmp_size);
> -
>   static int drm_panic_get_qr_code_url(u8 **qr_image)
>   {
>   	struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..906943b02beb 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>   //! * <https://github.com/bjguillot/qr>
>   
>   use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>   
>   #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>   struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>   ///
>   /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
>       url: *const kernel::ffi::c_char,
>       data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * If `url_len` > 0, remove the 2 segments header/length and also count the
>   ///   conversion to numeric segments.
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.
> +#[export] // required to be unsafe due to this annotation
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>       #[expect(clippy::manual_range_contains)]
>       if version < 1 || version > 40 {
>           return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..ff78d00c3da5 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
>   
>   #endif
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +			 u8 *tmp, size_t tmp_size);
> +#endif
> +
>   #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..607e90a682ca 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,11 @@
>   #include <linux/workqueue.h>
>   #include <trace/events/rust_sample.h>
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +// Used by #[export] in drivers/gpu/drm/drm_panic_qr.rs
> +#include <drm/drm_panic.h>
> +#endif
> +
>   /* `bindgen` gets confused at certain things. */
>   const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
>   const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
> 


