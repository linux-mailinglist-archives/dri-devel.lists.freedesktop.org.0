Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1E80C7E3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C994410E3B2;
	Mon, 11 Dec 2023 11:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565210E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293866; x=1733829866;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Xd9/D1ryGxblwe+IX3jpQHeKU5Rcf86ecz02CB9dJPw=;
 b=SI4BF2E/Z0dadRsYpIDHKLCxRr5YxfvikxavRnWZtDtYqRdWDFE8LfnM
 NAdV++AmlmM2lJZKpGe2iTenYjep4BeTqekCPqasZ8nS3EB4K+UXqn1KV
 VJUIfAMktCzX6YP6KaZprKG9XYBKbKbL33CmGPncfNlF/FW3+f8zRncp5
 0U3gVj4YKOLpvgcMAyllz1iNPQKGvZ73Tbyb2IsiqlJURdMsDKoB0CPoT
 sCJplYcnpPG+ft1Bru0dI7b/WS/N4lgiPr4zye6ZAPOBNyNI9qPzGyAgF
 l74eFDABK53RcxfG6KwDQDGb6JxKyyROQMsRQvgXpP52kMlHR9Mi7+OKM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379626966"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379626966"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891091577"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891091577"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:24:25 -0800
Message-ID: <fd54df44-4b25-466d-9172-f32a137669f7@linux.intel.com>
Date: Mon, 11 Dec 2023 12:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] accel/qaic: Remove bo->queued field
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-3-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-3-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 08.12.2023 17:34, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> ->queued field is used to track whether the BO is submitted to hardware for
> DMA or not. Since same information can be retrieved using ->xfer_list field
> of same structure remove ->queued as it is redundant.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic.h      |  2 --
>  drivers/accel/qaic/qaic_data.c | 23 +++++++++++------------
>  2 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 582836f9538f..2b3ef588b717 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -191,8 +191,6 @@ struct qaic_bo {
>  	u32			nr_slice;
>  	/* Number of slice that have been transferred by DMA engine */
>  	u32			nr_slice_xfer_done;
> -	/* true = BO is queued for execution, true = BO is not queued */
> -	bool			queued;
>  	/*
>  	 * If true then user has attached slicing information to this BO by
>  	 * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 0c6f1328df68..89ab8fa19315 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -141,6 +141,11 @@ struct dbc_rsp {
>  	__le16	status;
>  } __packed;
>  
> +static inline bool bo_queued(struct qaic_bo *bo)
> +{
> +	return !list_empty(&bo->xfer_list);
> +}
> +
>  inline int get_dbc_req_elem_size(void)
>  {
>  	return sizeof(struct dbc_req);
> @@ -648,6 +653,7 @@ static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
>  	}
>  	complete_all(&bo->xfer_done);
>  	INIT_LIST_HEAD(&bo->slices);
> +	INIT_LIST_HEAD(&bo->xfer_list);
>  }
>  
>  static struct qaic_bo *qaic_alloc_init_bo(void)
> @@ -1166,7 +1172,6 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
>  	struct bo_slice *slice;
>  	unsigned long flags;
>  	struct qaic_bo *bo;
> -	bool queued;
>  	int i, j;
>  	int ret;
>  
> @@ -1198,9 +1203,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
>  		}
>  
>  		spin_lock_irqsave(&dbc->xfer_lock, flags);
> -		queued = bo->queued;
> -		bo->queued = true;
> -		if (queued) {
> +		if (bo_queued(bo)) {
>  			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>  			ret = -EINVAL;
>  			goto unlock_bo;
> @@ -1223,7 +1226,6 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
>  			else
>  				ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
>  			if (ret) {
> -				bo->queued = false;
>  				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>  				goto unlock_bo;
>  			}
> @@ -1246,8 +1248,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
>  		spin_lock_irqsave(&dbc->xfer_lock, flags);
>  		bo = list_last_entry(&dbc->xfer_list, struct qaic_bo, xfer_list);
>  		obj = &bo->base;
> -		bo->queued = false;
> -		list_del(&bo->xfer_list);
> +		list_del_init(&bo->xfer_list);
>  		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>  		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
>  		drm_gem_object_put(obj);
> @@ -1608,8 +1609,7 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
>  			 */
>  			dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
>  			bo->nr_slice_xfer_done = 0;
> -			bo->queued = false;
> -			list_del(&bo->xfer_list);
> +			list_del_init(&bo->xfer_list);
>  			bo->perf_stats.req_processed_ts = ktime_get_ns();
>  			complete_all(&bo->xfer_done);
>  			drm_gem_object_put(&bo->base);
> @@ -1868,7 +1868,7 @@ int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>  
>  	/* Check if BO is committed to H/W for DMA */
>  	spin_lock_irqsave(&dbc->xfer_lock, flags);
> -	if (bo->queued) {
> +	if (bo_queued(bo)) {
>  		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>  		ret = -EBUSY;
>  		goto unlock_ch_srcu;
> @@ -1898,8 +1898,7 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
>  	spin_lock_irqsave(&dbc->xfer_lock, flags);
>  	while (!list_empty(&dbc->xfer_list)) {
>  		bo = list_first_entry(&dbc->xfer_list, typeof(*bo), xfer_list);
> -		bo->queued = false;
> -		list_del(&bo->xfer_list);
> +		list_del_init(&bo->xfer_list);
>  		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>  		bo->nr_slice_xfer_done = 0;
>  		bo->req_id = 0;
