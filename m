Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C536BFFA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 09:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E586E901;
	Tue, 27 Apr 2021 07:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF04D6E901
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 07:17:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so49290704wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rjUUBU9azeBmUqt9FTCUe9KTsCd2j5HTfrKosK0Jdz0=;
 b=HtKdCYFol3rZCVP2abKMy3nqiGNGdsAP5aGu9V1tC5EnY47xuuHfx0BLug1/VduIwD
 MXanYhAoe9wrJltR1MgT/B5FHcMm0NpNsUd9o0gd2zCKXT5uswGF6M+rhxkHGRzRo1CL
 WmI5KbXJJLFzyL+jWrxMtB5WoY1sK66z2qJWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rjUUBU9azeBmUqt9FTCUe9KTsCd2j5HTfrKosK0Jdz0=;
 b=Y1QL23FeBHkoWIdyo0AGWIv+1cnaiuy5be9S/Qr6FZXGbfLXVcvG4N8LG14I+EbR0t
 /F3NV6C4BehsHWCp/mbyBH8dHHjo3M0n6a1+MYgvWUuWJzs+wrs3N2U08nymVW2+HTkc
 DecxGpxY80AJxZsDm5ViHBrj9rgHCiSrZzLjS8nqE9iS3h8FttblqrgghrU/e0FTLQDi
 5dTkFIg4MbXGIf23I9lGVXT88LyV5VcYTFH0n9au3Rj6ug9EcGrSlqnxw5Z6LycyEE8r
 oZgbs/maLowAGlD5w489Nxh4b2N6L24epdUSCXwZNAMMXIwD52upRU7WqigfzYI3YPRX
 Jsbg==
X-Gm-Message-State: AOAM531V23Ei4Zi9hFDrlp1OR1q8Xg/GHAnLgpX6HbW7v6ufCtfv2e+N
 OI5pmLRXt9hxu4+QnbhGhFs/LQ==
X-Google-Smtp-Source: ABdhPJzso7RpwB2noNmPVEKp40bdQGe73zAhgpDLAPSQupdzs/xRL24B+abq43DxRfXT6KAxkx4VKg==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr4027635wrw.355.1619507878532; 
 Tue, 27 Apr 2021 00:17:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t2sm1608394wmg.38.2021.04.27.00.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:17:58 -0700 (PDT)
Date: Tue, 27 Apr 2021 09:17:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Joseph Kogut <joseph.kogut@gmail.com>
Subject: Re: [PATCH 1/2] drm: remove usage of drm_pci_alloc/free
Message-ID: <YIe6pKUULMutAkG3@phenom.ffwll.local>
Mail-Followup-To: Joseph Kogut <joseph.kogut@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
References: <20210423020248.3427369-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423020248.3427369-1-joseph.kogut@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 07:02:43PM -0700, Joseph Kogut wrote:
> Remove usage of legacy dma-api abstraction in preparation for removal
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
> Checkpatch warns here that r128 is marked obsolete, and asks for no
> unnecessary modifications.
> 
> This series aims to address the FIXME in drivers/gpu/drm/drm_pci.c
> explaining that drm_pci_alloc/free is a needless abstraction of the
> dma-api, and it should be removed. Unfortunately, doing this requires
> removing the usage from an obsolete driver as well.
> 
> If this patch is rejected for modifying an obsolete driver, would it be
> appropriate to follow up removing the FIXME from drm_pci?

Feels like a good enough reason, both patches queued up in drm-misc-next
for 5.14. Thanks a lot for doing them.
-Daniel

> 
>  drivers/gpu/drm/drm_bufs.c         | 19 ++++++++++++++++---
>  drivers/gpu/drm/drm_dma.c          |  8 +++++++-
>  drivers/gpu/drm/r128/ati_pcigart.c | 22 ++++++++++++++++++----
>  3 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index e3d77dfefb0a..94bc1f6049c9 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -674,12 +674,17 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
>  static void drm_cleanup_buf_error(struct drm_device *dev,
>  				  struct drm_buf_entry *entry)
>  {
> +	drm_dma_handle_t *dmah;
>  	int i;
>  
>  	if (entry->seg_count) {
>  		for (i = 0; i < entry->seg_count; i++) {
>  			if (entry->seglist[i]) {
> -				drm_pci_free(dev, entry->seglist[i]);
> +				dmah = entry->seglist[i];
> +				dma_free_coherent(dev->dev,
> +						  dmah->size,
> +						  dmah->vaddr,
> +						  dmah->busaddr);
>  			}
>  		}
>  		kfree(entry->seglist);
> @@ -978,10 +983,18 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  	page_count = 0;
>  
>  	while (entry->buf_count < count) {
> +		dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
> +		if (!dmah)
> +			return -ENOMEM;
>  
> -		dmah = drm_pci_alloc(dev, PAGE_SIZE << page_order, 0x1000);
> +		dmah->size = total;
> +		dmah->vaddr = dma_alloc_coherent(dev->dev,
> +						 dmah->size,
> +						 &dmah->busaddr,
> +						 GFP_KERNEL);
> +		if (!dmah->vaddr) {
> +			kfree(dmah);
>  
> -		if (!dmah) {
>  			/* Set count correctly so we free the proper amount. */
>  			entry->buf_count = count;
>  			entry->seg_count = count;
> diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> index d07ba54ec945..eb6b741a6f99 100644
> --- a/drivers/gpu/drm/drm_dma.c
> +++ b/drivers/gpu/drm/drm_dma.c
> @@ -81,6 +81,7 @@ int drm_legacy_dma_setup(struct drm_device *dev)
>  void drm_legacy_dma_takedown(struct drm_device *dev)
>  {
>  	struct drm_device_dma *dma = dev->dma;
> +	drm_dma_handle_t *dmah;
>  	int i, j;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
> @@ -100,7 +101,12 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
>  				  dma->bufs[i].seg_count);
>  			for (j = 0; j < dma->bufs[i].seg_count; j++) {
>  				if (dma->bufs[i].seglist[j]) {
> -					drm_pci_free(dev, dma->bufs[i].seglist[j]);
> +					dmah = dma->bufs[i].seglist[j];
> +					dma_free_coherent(dev->dev,
> +							  dmah->size,
> +							  dmah->vaddr,
> +							  dmah->busaddr);
> +					kfree(dmah);
>  				}
>  			}
>  			kfree(dma->bufs[i].seglist);
> diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
> index 1234ec60c0af..fbb0cfd79758 100644
> --- a/drivers/gpu/drm/r128/ati_pcigart.c
> +++ b/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -45,18 +45,32 @@
>  static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
>  				       struct drm_ati_pcigart_info *gart_info)
>  {
> -	gart_info->table_handle = drm_pci_alloc(dev, gart_info->table_size,
> -						PAGE_SIZE);
> -	if (gart_info->table_handle == NULL)
> +	drm_dma_handle_t *dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
> +
> +	if (!dmah)
> +		return -ENOMEM;
> +
> +	dmah->size = gart_info->table_size;
> +	dmah->vaddr = dma_alloc_coherent(dev->dev,
> +					 dmah->size,
> +					 &dmah->busaddr,
> +					 GFP_KERNEL);
> +
> +	if (!dmah->vaddr) {
> +		kfree(dmah);
>  		return -ENOMEM;
> +	}
>  
> +	gart_info->table_handle = dmah;
>  	return 0;
>  }
>  
>  static void drm_ati_free_pcigart_table(struct drm_device *dev,
>  				       struct drm_ati_pcigart_info *gart_info)
>  {
> -	drm_pci_free(dev, gart_info->table_handle);
> +	drm_dma_handle_t *dmah = gart_info->table_handle;
> +
> +	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr, dmah->busaddr);
>  	gart_info->table_handle = NULL;
>  }
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
