Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A31A6CBCF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 19:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1CF10E0F4;
	Sat, 22 Mar 2025 18:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VnU7vVG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32610E0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 18:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742668274; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NG1yQk9rEzgilleO/l9rGC5Fjw8Q18sBHiq5GuGnfDdXn3fWb5AMGvipLYXmUcmgiQKRb4wTWf4YBZAL0abLpP6Uu8kguDQ9uOwauqKbf69CYV5n4/6r5w2G+CKk7N0NSx1XfYRopQ8yL2vwJp+kakOLFGIYu/VXpwtfowt9sts=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742668274;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VplHcLOIy2d7XjXbeKaOE5oRAedseybBbUhrpgGYDxQ=; 
 b=PNQm6WHsVvSnL2lI/I56scUzsRjLWx+XoTh9/wFSBy1B3Tf2cWgi78rER4JGHoVjG+ZZ77t5BKgG78yjXnmgWHRK64xyiy5EGDX3w6aFhGRQ2RlhdlV3o9wVabtbOwv7hkJzEO5ab5iiNwwWj4L5uiNIQ02mSSWGP3e6HxWwdgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742668274; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=VplHcLOIy2d7XjXbeKaOE5oRAedseybBbUhrpgGYDxQ=;
 b=VnU7vVG8kMkdNNg/C7pSVIwlCGi9OWMGP1xrSKv/4eU1bC0sEaa3/93LhsS6o3Xm
 SD+IOCfkxcI3dBK9Iy+YFATYb2Gexvbe6MPYZOS0d0OlHy8BY21f4w/rLM2ty1i+p0x
 w3qII0xrhcpPIaUkTKFV/EzD6khTLvgbW7dSBM14=
Received: by mx.zohomail.com with SMTPS id 1742668273032573.7649825558158;
 Sat, 22 Mar 2025 11:31:13 -0700 (PDT)
Date: Sat, 22 Mar 2025 18:31:03 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 2/6] drm/panfrost: Use
 GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
Message-ID: <ebm6kwkhyiql2kh3ekyfpyvchs3mbnbq26ssvpkttxjuw5meo2@gqggqnosvou6>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317145245.910566-3-ariel.dalessandro@collabora.com>
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

On 17.03.2025 11:52, Ariel D'Alessandro wrote:
> As done in panthor, define and use these GPU_MMU_FEATURES_* macros,
> which makes code easier to read and reuse.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c  | 6 ++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 9e6f198ef5c1b..294f86b3c25e7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -615,6 +615,8 @@ static void panfrost_drm_mm_color_adjust(const struct drm_mm_node *node,
>
>  struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>  {
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
> +	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
>  	struct panfrost_mmu *mmu;
>
>  	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
> @@ -633,8 +635,8 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>
>  	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= SZ_4K | SZ_2M,
> -		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
> -		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
> +		.ias		= va_bits,
> +		.oas		= pa_bits,
>  		.coherent_walk	= pfdev->coherent,
>  		.tlb		= &mmu_tlb_ops,
>  		.iommu_dev	= pfdev->dev,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index c7bba476ab3f3..b5f279a19a084 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -16,6 +16,8 @@
>  #define   GROUPS_L2_COHERENT		BIT(0)	/* Cores groups are l2 coherent */
>
>  #define GPU_MMU_FEATURES		0x014	/* (RO) MMU features */
> +#define  GPU_MMU_FEATURES_VA_BITS(x)	((x) & GENMASK(7, 0))
> +#define  GPU_MMU_FEATURES_PA_BITS(x)	(((x) >> 8) & GENMASK(7, 0))
>  #define GPU_AS_PRESENT			0x018	/* (RO) Address space slots present */
>  #define GPU_JS_PRESENT			0x01C	/* (RO) Job slots present */
>
> --
> 2.47.2


Adrian Larumbe
