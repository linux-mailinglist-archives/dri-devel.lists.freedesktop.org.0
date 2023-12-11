Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E580C7DA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886AF10E0B5;
	Mon, 11 Dec 2023 11:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F410E0B5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293789; x=1733829789;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6B23b13Y2naFQnL4nXi2aj9gePWrkFGCD/7Yim37W8w=;
 b=TY+pfo+cDBhAIFLhMW7oaHBMO76DewdYXPpuBBabG6xEz+6BWQFN6iXj
 weNie8FffYVlsLXG/nOjyZYhCGvf5gZwAC6dqMh8uXYE3UjK8FMTRtcRP
 7BiJ1oHWM89d3cx5vQafAiw9TUgxCTMyliSqdLZae2lxuYP7o8Bz7blqZ
 cuHQwu9KBufcoZc0kXGdwHCMe6BNRCcURBUcvlez5TmVAMGHIgLbFxFaV
 7mM3+S7wjBQnXh/Iz1aKl2tQM0xFhqYAiF2NCzMqCYnAHQiwHGi5FgFUR
 mMCJpbXHsSHObSRx47E5jiIm3dSCtizSsWLoKic0FmtaiMbKmiX7neS9E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379626828"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379626828"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891091225"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891091225"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:23:08 -0800
Message-ID: <760bbfc4-fd70-4e81-adac-aceef425649c@linux.intel.com>
Date: Mon, 11 Dec 2023 12:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] accel/qaic: Deprecate ->size field from attach slice
 IOCTL structure
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-2-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-2-quic_jhugo@quicinc.com>
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
> ->size in struct qaic_attach_slice_hdr is redundant since we have BO handle
> and its size can be retrieved from base BO structure.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 17 ++++-------------
>  include/uapi/drm/qaic_accel.h  | 13 +------------
>  2 files changed, 5 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index cf2898eda7ae..0c6f1328df68 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -830,9 +830,6 @@ static int qaic_prepare_import_bo(struct qaic_bo *bo, struct qaic_attach_slice_h
>  	struct sg_table *sgt;
>  	int ret;
>  
> -	if (obj->import_attach->dmabuf->size < hdr->size)
> -		return -EINVAL;
> -
>  	sgt = dma_buf_map_attachment(obj->import_attach, hdr->dir);
>  	if (IS_ERR(sgt)) {
>  		ret = PTR_ERR(sgt);
> @@ -849,9 +846,6 @@ static int qaic_prepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo,
>  {
>  	int ret;
>  
> -	if (bo->base.size < hdr->size)
> -		return -EINVAL;
> -
>  	ret = dma_map_sgtable(&qdev->pdev->dev, bo->sgt, hdr->dir, 0);
>  	if (ret)
>  		return -EFAULT;
> @@ -952,9 +946,6 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>  	if (arg_size / args->hdr.count != sizeof(*slice_ent))
>  		return -EINVAL;
>  
> -	if (args->hdr.size == 0)
> -		return -EINVAL;
> -
>  	if (!(args->hdr.dir == DMA_TO_DEVICE || args->hdr.dir == DMA_FROM_DEVICE))
>  		return -EINVAL;
>  
> @@ -994,16 +985,16 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>  		goto free_slice_ent;
>  	}
>  
> -	ret = qaic_validate_req(qdev, slice_ent, args->hdr.count, args->hdr.size);
> -	if (ret)
> -		goto free_slice_ent;
> -
>  	obj = drm_gem_object_lookup(file_priv, args->hdr.handle);
>  	if (!obj) {
>  		ret = -ENOENT;
>  		goto free_slice_ent;
>  	}
>  
> +	ret = qaic_validate_req(qdev, slice_ent, args->hdr.count, obj->size);
> +	if (ret)
> +		goto put_bo;
> +
>  	bo = to_qaic_bo(obj);
>  	ret = mutex_lock_interruptible(&bo->lock);
>  	if (ret)
> diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
> index 9dab32316aee..d3ca876a08e9 100644
> --- a/include/uapi/drm/qaic_accel.h
> +++ b/include/uapi/drm/qaic_accel.h
> @@ -242,18 +242,7 @@ struct qaic_attach_slice_entry {
>   * @dbc_id: In. Associate the sliced BO with this DBC.
>   * @handle: In. GEM handle of the BO to slice.
>   * @dir: In. Direction of data flow. 1 = DMA_TO_DEVICE, 2 = DMA_FROM_DEVICE
> - * @size: In. Total length of BO being used. This should not exceed base
> - *	  size of BO (struct drm_gem_object.base)
> - *	  For BOs being allocated using DRM_IOCTL_QAIC_CREATE_BO, size of
> - *	  BO requested is PAGE_SIZE aligned then allocated hence allocated
> - *	  BO size maybe bigger. This size should not exceed the new
> - *	  PAGE_SIZE aligned BO size.
> - * @dev_addr: In. Device address this slice pushes to or pulls from.
> - * @db_addr: In. Address of the doorbell to ring.
> - * @db_data: In. Data to write to the doorbell.
> - * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is for
> - *	    inactive doorbells.
> - * @offset: In. Start of this slice as an offset from the start of the BO.
> + * @size: Deprecated. This value is ignored and size of @handle is used instead.
>   */
>  struct qaic_attach_slice_hdr {
>  	__u32 count;
