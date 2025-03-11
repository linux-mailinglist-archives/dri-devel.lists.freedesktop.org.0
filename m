Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9BA5BA7C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFB910E523;
	Tue, 11 Mar 2025 08:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JIQRQO6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8810E525
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741680543;
 bh=JDmQM8Dhze4FKjCBOIy9JrDUTaaxnVukGFxN9fy/cl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JIQRQO6GB0j4uGLUnX+WM6YlhluKEHd9N8JWH1xxbqlijd6kQ6rTEdZXIfktU8C06
 wTNBEj3qI8eRm4T5PDZ9/T2KBPS479Xfk+o4A9PJM8v0QIqsZikKzt4d4MiNwAArfp
 kv60m3OTgSF8ryOydyZyk+pdaSGfqNIWxNZu3jdK1vWzSSFiKHvm2yc12LjANU8JQL
 jf8+ZOVPuZehRaXOHLlKi2T+9/mm8uOaPeZmErvZ8Vpq32rxxNJ8g6tSjCEH4uDDqm
 3PAserwgJsV6JI5jM657UDI0NPbBBWuLMYiZy3DDyogOhxrpWC+SG3yq//HTQET2/e
 Z8nztYk2wWWjA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 06E8517E0237;
 Tue, 11 Mar 2025 09:09:02 +0100 (CET)
Date: Tue, 11 Mar 2025 09:08:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 6/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature
 flag on Bifrost models
Message-ID: <20250311090855.0211c114@collabora.com>
In-Reply-To: <20250310195921.157511-7-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-7-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 10 Mar 2025 16:59:21 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Set this feature flag on all Mali Bifrost platforms as the MMU supports
> AARCH64 4K page table format.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 7ed0cd3ea2d4c..52f9d69f6db9d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -54,6 +54,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g72 (\
> @@ -64,6 +65,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g51 hw_features_g72
> @@ -77,6 +79,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
>  	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g76 (\

