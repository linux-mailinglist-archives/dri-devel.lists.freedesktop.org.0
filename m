Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E795D159
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A2A10EBE8;
	Fri, 23 Aug 2024 15:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dKkDwuaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C808E10EBE8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724426845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4/dyRUnY/iuiFMDxWTjvRFMkHQ1Z/QmRVEZS2BZPy0=;
 b=dKkDwuaH7OIZqTiDpcxWMTdIbjgmOUkEl5DtcShmo/01SjKF9qFsAUhCQ8xcTd0a5ytNdE
 jnx0xOrWEqooa6eqA1WeP/tBW9Qq4RQsvrVzXQnVW5NlFCF9PSBRGa4S0qt4lkn8O0HFMv
 TDvZR9xAktCldF87UW6WU9WAjgmlHOs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-rIerYJi9MxOpGdXXOpqjzQ-1; Fri, 23 Aug 2024 11:27:22 -0400
X-MC-Unique: rIerYJi9MxOpGdXXOpqjzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4281310bf7aso17170065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724426841; x=1725031641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4/dyRUnY/iuiFMDxWTjvRFMkHQ1Z/QmRVEZS2BZPy0=;
 b=UDOnBqGrv78VLiVPQqKdWATQq1j89pBEOxN7zKbPvO8kM5sgq5P87JF5/XYKO4efKW
 CypfW2MAPoCFOG2U6eIfsyvbqJ6cEt3gnGua66uda9N7jw1jFSU83LR/b1lVLEdYN2wY
 ayK27jvNwTDo8Mx3s8aK8vh44XXnHK+uNVMTO5rV9QUxL9otJkmXaGuQr2v8xLyTjVea
 jA/IgqjnIwjLT3NZtPffmClx03ElRtNchNaGDzJUget/QaAFc/J1j9qwrvs1C0jRc8YF
 E91bMOeAVavXx4M4/C+eLXjB+pBVrmPcCFhWkWYczqrTmhvmWjDaqDzOf7kKDLhkTo86
 cexA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmEgodDGNdiWlwDRBsJ0um5yGSGiSWCn6o5plDPYuULi0Wy/0VL1vqlg1cMlT47CCeYO80lcVk86o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwEPdBCW6beuhT3l2nJjvm7MO8cQ5Ikmq49vPQrd5IF0McHQwr
 5v9vhKiA4onl02aiFI0cphxMJckAXQ6T6Emb5KdLaYbh/XdW6/KylVleR2iF6KuHjzEzx/REKw0
 Er1Hl8u6w9t7DclDaIujeRIRCrcXE0jQ20yOfKJKDpstUQkFA7ZfaxljEoD45O/qeSw==
X-Received: by 2002:a05:6000:402a:b0:368:3717:10c7 with SMTP id
 ffacd0b85a97d-37311841b20mr2021669f8f.4.1724426841228; 
 Fri, 23 Aug 2024 08:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOBru7mHCqg9nue8AE7aYDW2PQBZruAIOea9WMnfc/MqA3Ee2rU2cYatt4ua+7FcM9Pbv9cQ==
X-Received: by 2002:a05:6000:402a:b0:368:3717:10c7 with SMTP id
 ffacd0b85a97d-37311841b20mr2021629f8f.4.1724426840658; 
 Fri, 23 Aug 2024 08:27:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730815c0f0sm4390019f8f.51.2024.08.23.08.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 08:27:19 -0700 (PDT)
Message-ID: <699b9d24-97bc-41c8-82c9-3bed34b18be8@redhat.com>
Date: Fri, 23 Aug 2024 17:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] drm/panic: Add a QR code panic screen
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240822073852.562286-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/08/2024 09:33, Jocelyn Falempe wrote:
> This series adds a new panic screen, with the kmsg data embedded in a QR code.
> 
> The main advantage of QR code, is that you can copy/paste the debug data to a bug report.
> 
> The QR code encoder is written in rust, and is very specific to drm panic.
> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
> The rust code uses a few rust core API, and provides only two C entry points.
> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
> 
> If you want to see what it looks like, I've put a few screenshots here:
> https://github.com/kdj0c/panic_report/issues/1

I just pushed it to drm-misc-next

Thank you all for your reviews.

Best regards,

-- 

Jocelyn

> 
> v2:
>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>   * Use CStr directly, and remove the call to as_str_unchecked()
>     (Alice Ryhl)
>   * Add a check for data_len <= data_size (Greg KH)
> 
> v3:
>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>   * Change the wording of safety comments (Alice Ryhl)
>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
> 
> v4:
>   * Fix the logic to find next line and skip the '\n' (Alic Ryhl)
>   * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
> 
> v5:
>   * Move drm_panic_[init|exit]() prototype to drm_crtc_internal.h
>     (Daniel Vetter)
> 
> v6:
>   * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add panic description")
>   * Fix qr_width should be a signed int, to handle error code.
> 
> v7:
>   * rename r1/r2 to a/b in drm_rect_overlap() (Jani Nikula)
> 
> Jocelyn Falempe (4):
>    drm/panic: Add integer scaling to blit()
>    drm/rect: Add drm_rect_overlap()
>    drm/panic: Simplify logo handling
>    drm/panic: Add a QR code panic screen
> 
>   drivers/gpu/drm/Kconfig             |   31 +
>   drivers/gpu/drm/Makefile            |    1 +
>   drivers/gpu/drm/drm_crtc_internal.h |    4 +
>   drivers/gpu/drm/drm_drv.c           |    3 +
>   drivers/gpu/drm/drm_panic.c         |  340 +++++++--
>   drivers/gpu/drm/drm_panic_qr.rs     | 1003 +++++++++++++++++++++++++++
>   include/drm/drm_rect.h              |   15 +
>   7 files changed, 1357 insertions(+), 40 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
> 
> 
> base-commit: 04b5b362bc2a36f1dfe5cad52c83b1ea9d25b87c

