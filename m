Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709805A12C5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9410E216;
	Thu, 25 Aug 2022 13:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271F10E216
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:54:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27PDsXT6040112;
 Thu, 25 Aug 2022 08:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661435673;
 bh=/YP6YuKd6YwRFw2NuBbJJRCWeBtUGndRoH/UKU3sYvI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=d1YibBRa3GuZuD/5aBqk/qKEYB/OVNN1EAplBWgZrFpHqUy//xNOw6wOWn5i9Hi27
 gSYlm2P4hdRaaKd1CvMckjAVKNZZ9ZaNvotH37QS0Ofvb2OygfAGBPzQAu8Hzey/Mo
 jqnDgtuD90LnnFO+rtA7GiZ8VshI5MRyYdDp6I5E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27PDsXTM110353
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Aug 2022 08:54:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 25
 Aug 2022 08:54:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 25 Aug 2022 08:54:33 -0500
Received: from [10.250.32.193] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27PDsXKB072045;
 Thu, 25 Aug 2022 08:54:33 -0500
Message-ID: <80651f8a-9b53-8de0-20cf-8eac9c58643d@ti.com>
Date: Thu, 25 Aug 2022 08:54:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: omapdrm: Improve check for contiguous buffers
Content-Language: en-US
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Tomi
 Valkeinen <tomba@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20220823000326.10056-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220823000326.10056-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

On 8/22/22 7:03 PM, Andrew Davis wrote:
> While a scatter-gather table having only 1 entry does imply it is
> contiguous, it is a logic error to assume the inverse. Tables can have
> more than 1 entry and still be contiguous. Use a proper check here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---


Looks like an old version of this patch got in my to-send queue,
please ignore this one, will send updated v2.

Thanks,
Andrew


>   drivers/gpu/drm/omapdrm/omap_gem.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index cf571796fd26..52c00b795459 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -48,7 +48,7 @@ struct omap_gem_object {
>   	 *   OMAP_BO_MEM_DMA_API flag set)
>   	 *
>   	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
> -	 *   if they are physically contiguous (when sgt->orig_nents == 1)
> +	 *   if they are physically contiguous
>   	 *
>   	 * - buffers mapped through the TILER when pin_cnt is not zero, in which
>   	 *   case the DMA address points to the TILER aperture
> @@ -148,12 +148,18 @@ u64 omap_gem_mmap_offset(struct drm_gem_object *obj)
>   	return drm_vma_node_offset_addr(&obj->vma_node);
>   }
>   
> +static bool omap_gem_sgt_is_contiguous(struct sg_table *sgt, size)
> +{
> +	return !(drm_prime_get_contiguous_size(sgt) < size);
> +}
> +
>   static bool omap_gem_is_contiguous(struct omap_gem_object *omap_obj)
>   {
>   	if (omap_obj->flags & OMAP_BO_MEM_DMA_API)
>   		return true;
>   
> -	if ((omap_obj->flags & OMAP_BO_MEM_DMABUF) && omap_obj->sgt->nents == 1)
> +	if ((omap_obj->flags & OMAP_BO_MEM_DMABUF) &&
> +	    omap_gem_sgt_is_contiguous(omap_obj->sgt, omap_obj->base->size))
>   		return true;
>   
>   	return false;
> @@ -1398,7 +1404,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
>   	union omap_gem_size gsize;
>   
>   	/* Without a DMM only physically contiguous buffers can be supported. */
> -	if (sgt->orig_nents != 1 && !priv->has_dmm)
> +	if (!omap_gem_sgt_is_contiguous(sgt, size) && !priv->has_dmm)
>   		return ERR_PTR(-EINVAL);
>   
>   	gsize.bytes = PAGE_ALIGN(size);
> @@ -1412,7 +1418,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
>   
>   	omap_obj->sgt = sgt;
>   
> -	if (sgt->orig_nents == 1) {
> +	if (omap_gem_sgt_is_contiguous(sgt, size)) {
>   		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
>   	} else {
>   		/* Create pages list from sgt */
