Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5E1D7B87
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AC89E3E;
	Mon, 18 May 2020 14:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0109689B8E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:42:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589812967; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=BOJG45sKpRoyYeCu2iPA0P0NjKwkRXyqePBzMDunQaI=;
 b=P9UtLn9/lbQeARFepl60gHzNP09vAZFHQKU+C2KGm+VFK44b1ywelDcdSJAVyFicPprWJkze
 02RD7eyAkRn/vNzDeGnBZrD59j3SlEvc2MvlH+JEnHZd74ALPsafYltpX+U1HJNPE+uVzsQf
 j5GxIKhRn87XzQ/LGHnF1Ivngrc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29ee7.7f5eb9996ea0-smtp-out-n04;
 Mon, 18 May 2020 14:42:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EB2C5C433D2; Mon, 18 May 2020 14:42:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2509DC432C2;
 Mon, 18 May 2020 14:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2509DC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 18 May 2020 08:42:43 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH v3 1/9] drm/msm: add
 msm_gem_get_and_pin_iova_range
Message-ID: <20200518144243.GC3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
References: <20200423210946.28867-1-jonathan@marek.ca>
 <20200423210946.28867-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423210946.28867-2-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 05:09:13PM -0400, Jonathan Marek wrote:
> This function allows pinning iova to a specific page range (for a6xx GMU).

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_drv.h     |  6 +++++-
>  drivers/gpu/drm/msm/msm_gem.c     | 28 +++++++++++++++++++++-------
>  drivers/gpu/drm/msm/msm_gem_vma.c |  6 ++++--
>  3 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 194d900a460e..966fd9068c94 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -236,7 +236,8 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc);
>  void msm_crtc_disable_vblank(struct drm_crtc *crtc);
>  
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> -		struct msm_gem_vma *vma, int npages);
> +		struct msm_gem_vma *vma, int npages,
> +		u64 range_start, u64 range_end);
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>  		struct msm_gem_vma *vma);
>  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> @@ -276,6 +277,9 @@ vm_fault_t msm_gem_fault(struct vm_fault *vmf);
>  uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>  int msm_gem_get_iova(struct drm_gem_object *obj,
>  		struct msm_gem_address_space *aspace, uint64_t *iova);
> +int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
> +		struct msm_gem_address_space *aspace, uint64_t *iova,
> +		u64 range_start, u64 range_end);
>  int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
>  		struct msm_gem_address_space *aspace, uint64_t *iova);
>  uint64_t msm_gem_iova(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..d8f56a34c117 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -389,7 +389,8 @@ put_iova(struct drm_gem_object *obj)
>  }
>  
>  static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
> -		struct msm_gem_address_space *aspace, uint64_t *iova)
> +		struct msm_gem_address_space *aspace, uint64_t *iova,
> +		u64 range_start, u64 range_end)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	struct msm_gem_vma *vma;
> @@ -404,7 +405,8 @@ static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
>  		if (IS_ERR(vma))
>  			return PTR_ERR(vma);
>  
> -		ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT);
> +		ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT,
> +			range_start, range_end);
>  		if (ret) {
>  			del_vma(vma);
>  			return ret;
> @@ -443,9 +445,13 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
>  			msm_obj->sgt, obj->size >> PAGE_SHIFT);
>  }
>  
> -/* get iova and pin it. Should have a matching put */
> -int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
> -		struct msm_gem_address_space *aspace, uint64_t *iova)
> +/*
> + * get iova and pin it. Should have a matching put
> + * limits iova to specified range (in pages)
> + */
> +int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
> +		struct msm_gem_address_space *aspace, uint64_t *iova,
> +		u64 range_start, u64 range_end)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	u64 local;
> @@ -453,7 +459,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
>  
>  	mutex_lock(&msm_obj->lock);
>  
> -	ret = msm_gem_get_iova_locked(obj, aspace, &local);
> +	ret = msm_gem_get_iova_locked(obj, aspace, &local,
> +		range_start, range_end);
>  
>  	if (!ret)
>  		ret = msm_gem_pin_iova(obj, aspace);
> @@ -465,6 +472,13 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
>  	return ret;
>  }
>  
> +/* get iova and pin it. Should have a matching put */
> +int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
> +		struct msm_gem_address_space *aspace, uint64_t *iova)
> +{
> +	return msm_gem_get_and_pin_iova_range(obj, aspace, iova, 0, U64_MAX);
> +}
> +
>  /*
>   * Get an iova but don't pin it. Doesn't need a put because iovas are currently
>   * valid for the life of the object
> @@ -476,7 +490,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
>  	int ret;
>  
>  	mutex_lock(&msm_obj->lock);
> -	ret = msm_gem_get_iova_locked(obj, aspace, iova);
> +	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
>  	mutex_unlock(&msm_obj->lock);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 1af5354bcd46..407b7ab82818 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -103,7 +103,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>  
>  /* Initialize a new vma and allocate an iova for it */
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> -		struct msm_gem_vma *vma, int npages)
> +		struct msm_gem_vma *vma, int npages,
> +		u64 range_start, u64 range_end)
>  {
>  	int ret;
>  
> @@ -111,7 +112,8 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>  		return -EBUSY;
>  
>  	spin_lock(&aspace->lock);
> -	ret = drm_mm_insert_node(&aspace->mm, &vma->node, npages);
> +	ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node, npages, 0,
> +		0, range_start, range_end, 0);
>  	spin_unlock(&aspace->lock);
>  
>  	if (ret)
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
