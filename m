Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D858258D1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9F610E64D;
	Fri,  5 Jan 2024 17:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3131510E653
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:03:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405FeCPd019681; Fri, 5 Jan 2024 17:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=iQCgCGRFyADXkJvXyahmD6/0efUf1Z4jOst+cGmz1Gg=; b=iC
 f6gtLFXY4SpmLazaSqTvNrylXvOMLBScK0nNT9wFvvWw5t8gi8V8DWGi3KusiB6e
 y5evSX3N5PeB3XHIFQmU+5tLHLo77kXZHV091ZFZ532qYmumiZK+vsL5u17j0LUG
 nB6Ul9rZeZ0sKIVWq2QlEql/UWTytgyt/lf0pyL3Kf3WbSNa0NFhTAqQ2n/klqhr
 u8pgTYhb21IaBjRw1z6Y/6wa0uB9xXiWfjgZwQw/dxX7GxrUWABLdHyZ+623ca77
 2flcUGjlePHnJyszx5n12cUvCCJrgf1Lc818xDTvrCqsbFa3TyewQ+ekQ0gtVpsO
 uK+Am+97ejElY7foxXgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve9a3sp08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 17:03:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405H3DI2025576
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 17:03:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 09:03:13 -0800
Message-ID: <4814bd7d-fc5f-1252-ffd8-b60197b4d3b6@quicinc.com>
Date: Fri, 5 Jan 2024 10:03:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 09/10] accel/ivpu: Improve buffer object debug logs
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-10-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-10-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4Qw5FaLpnxe5nigFCkVhmCMeyNlDgAiR
X-Proofpoint-ORIG-GUID: 4Qw5FaLpnxe5nigFCkVhmCMeyNlDgAiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=927 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050141
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

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> Make debug logs more readable and consistent:
>    - don't print handle as it is not always available for all buffers
>    - use hashed ivpu_bo ptr as main buffer identifier
>    - remove unused fields from ivpu_bo_print_info()
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 72 +++++++++++------------------------
>   drivers/accel/ivpu/ivpu_gem.h |  1 -
>   2 files changed, 23 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 8cb4d337552e..dd327d7eda0d 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -24,14 +24,11 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs;
>   
>   static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
>   {
> -	if (bo->ctx)
> -		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u ctx %d vpu_addr 0x%llx mmu_mapped %d\n",
> -			 action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
> -			 bo->handle, bo->ctx->id, bo->vpu_addr, bo->mmu_mapped);
> -	else
> -		ivpu_dbg(vdev, BO, "%6s: size %zu has_pages %d dma_mapped %d handle %u (not added to context)\n",
> -			 action, ivpu_bo_size(bo), (bool)bo->base.pages, (bool)bo->base.sgt,
> -			 bo->handle);
> +	ivpu_dbg(vdev, BO,
> +		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
> +		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
> +		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
> +		 (bool)bo->base.base.import_attach);
>   }
>   
>   /*
> @@ -49,12 +46,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>   	mutex_lock(&bo->lock);
>   
>   	ivpu_dbg_bo(vdev, bo, "pin");
> -
> -	if (!bo->ctx) {
> -		ivpu_err(vdev, "vpu_addr not allocated for BO %d\n", bo->handle);
> -		ret = -EINVAL;
> -		goto unlock;
> -	}
> +	drm_WARN_ON(&vdev->drm, !bo->ctx);
>   
>   	if (!bo->mmu_mapped) {
>   		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> @@ -108,9 +100,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>   {
>   	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>   
> -	lockdep_assert_held(&bo->lock);
> -
> -	ivpu_dbg_bo(vdev, bo, "unbind");
> +	lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
>   
>   	if (bo->mmu_mapped) {
>   		drm_WARN_ON(&vdev->drm, !bo->ctx);
> @@ -122,7 +112,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>   
>   	if (bo->ctx) {
>   		ivpu_mmu_context_remove_node(bo->ctx, &bo->mm_node);
> -		bo->vpu_addr = 0;
>   		bo->ctx = NULL;
>   	}
>   
> @@ -139,13 +128,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>   	dma_resv_unlock(bo->base.base.resv);
>   }
>   
> -static void ivpu_bo_unbind(struct ivpu_bo *bo)
> -{
> -	mutex_lock(&bo->lock);
> -	ivpu_bo_unbind_locked(bo);
> -	mutex_unlock(&bo->lock);
> -}

This does not seem to be related to $SUBJECT

> -
>   void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
>   {
>   	struct ivpu_bo *bo;
> @@ -156,8 +138,10 @@ void ivpu_bo_remove_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>   	mutex_lock(&vdev->bo_list_lock);
>   	list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
>   		mutex_lock(&bo->lock);
> -		if (bo->ctx == ctx)
> +		if (bo->ctx == ctx) {
> +			ivpu_dbg_bo(vdev, bo, "unbind");
>   			ivpu_bo_unbind_locked(bo);
> +		}
>   		mutex_unlock(&bo->lock);
>   	}
>   	mutex_unlock(&vdev->bo_list_lock);
> @@ -209,9 +193,6 @@ ivpu_bo_create(struct ivpu_device *vdev, u64 size, u32 flags)
>   	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>   	mutex_unlock(&vdev->bo_list_lock);
>   
> -	ivpu_dbg(vdev, BO, "create: vpu_addr 0x%llx size %zu flags 0x%x\n",
> -		 bo->vpu_addr, bo->base.base.size, flags);
> -
>   	return bo;
>   }
>   
> @@ -243,15 +224,15 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
>   	struct ivpu_device *vdev = to_ivpu_device(obj->dev);
>   	struct ivpu_bo *bo = to_ivpu_bo(obj);
>   
> +	ivpu_dbg_bo(vdev, bo, "free");
> +
>   	mutex_lock(&vdev->bo_list_lock);
>   	list_del(&bo->bo_list_node);
>   	mutex_unlock(&vdev->bo_list_lock);
>   
>   	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
>   
> -	ivpu_dbg_bo(vdev, bo, "free");
> -
> -	ivpu_bo_unbind(bo);
> +	ivpu_bo_unbind_locked(bo);

This does not seem to be related to $SUBJECT

