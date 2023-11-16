Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6007EE6B1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F124D10E658;
	Thu, 16 Nov 2023 18:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F2010E665
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:28:38 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc131e52f1so17448375ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700159318; x=1700764118;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7reBGJiccGvFEPh84DNhsMy+d8d0VEfZ803Vs8wYx6A=;
 b=C++qO4tx/HxtIn9XdRiJzvnjuROcf/PVIZNJKvyDMFXrtn+cqIjufFgu2TOVnhVdNq
 Gix/z6NRxnHt6jlap/rqbob9I66145RXiU9T3n7Tj1yWoqzZ2svaAqlGT/l0z2wq2V1M
 8U++XFsqywh6B7t2merVbNNUe6KcTxi1QVkGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700159318; x=1700764118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7reBGJiccGvFEPh84DNhsMy+d8d0VEfZ803Vs8wYx6A=;
 b=Mt8BX2HMvkUqCfUlMMGz69ayVGE7iO6kgwH/Ifm7o5F3BoVQE03EKCIOU8WQYcrL/J
 YWYMHmN+x7mB7mcd9eL6nceq0dVvr7VMJJ91ue3FnMWwx2iR8ASlGPm0KP18Du2tP3X2
 U6frtQKOvhSpEUL7nUloK+nRYhXEtNFmmB4g5+pAHGh+QFhoc5uPKUsm/LCgpGh1euU0
 smvqkUpMn4kVgBWlwx2muqanTYouga7DK5hIkR/ZEItUaPA/Xq6BUKu3acqUi/7kQH2U
 AjTdK8iHCwFavasOiS530eElCsH55OJAXXcUnl2Jl8qGf6kxFZTjqXNgNP7yMpS/t3YP
 Pugw==
X-Gm-Message-State: AOJu0YyM5iVH5uak9PYSLIsEj9clgbJpAn4gQA+sW4yFeqTVNzOhvyN1
 bTFe/+0Td1VIQ9GyZjjUU0Uvzg==
X-Google-Smtp-Source: AGHT+IGAIJ1flNjVNFt30991BeOzVwdm7nFOpSj7aipBLifSRgBzIDb+/MN7TcTVw7PDSnp4FgwR1Q==
X-Received: by 2002:a17:903:485:b0:1cc:38e6:f097 with SMTP id
 jj5-20020a170903048500b001cc38e6f097mr3076987plb.7.1700159318125; 
 Thu, 16 Nov 2023 10:28:38 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 t18-20020a1709028c9200b001bdeedd8579sm9514614plo.252.2023.11.16.10.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 10:28:37 -0800 (PST)
Date: Thu, 16 Nov 2023 10:28:37 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] nouveau/gsp: replace zero-length array with
 flex-array member and use __counted_by
Message-ID: <202311161028.E780FBB146@keescook>
References: <ZVZbX7C5suLMiBf+@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVZbX7C5suLMiBf+@work>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 12:11:43PM -0600, Gustavo A. R. Silva wrote:
> Fake flexible arrays (zero-length and one-element arrays) are deprecated,
> and should be replaced by flexible-array members. So, replace
> zero-length array with a flexible-array member in `struct
> PACKED_REGISTRY_TABLE`.
> 
> Also annotate array `entries` with `__counted_by()` to prepare for the
> coming implementation by GCC and Clang of the `__counted_by` attribute.
> Flexible array members annotated with `__counted_by` can have their
> accesses bounds-checked at run-time via `CONFIG_UBSAN_BOUNDS` (for array
> indexing) and `CONFIG_FORTIFY_SOURCE` (for strcpy/memcpy-family functions).
> 
> This fixes multiple -Warray-bounds warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1069:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1070:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1071:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1072:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
> 
> While there, also make use of the struct_size() helper, and address
> checkpatch.pl warning:
> WARNING: please, no spaces at the start of a line
> 
> This results in no differences in binary output.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks nice to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
