Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A49FFFCE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 21:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90BE10E32A;
	Thu,  2 Jan 2025 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cP7v0+bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B510E7AA;
 Thu,  2 Jan 2025 20:07:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1TP8006970;
 Thu, 2 Jan 2025 20:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QpbNeE+ee1S8YEWwSoVv+MnGIFiysHlMQYiVrZnmNMc=; b=cP7v0+bumFwS41W8
 sD9b2IWvuQ31Ccbm06lE/csp1QVwt5Ai8XoHJ69jnW6nSBWCxY9UBS+oUjEFq5Gr
 XGPaNsyDoBP7sR88n06xmXFw2SSkz3SsqPZ1bfgqguyog4wVoxlfAeiYAxkwaYiw
 j9R67y+37dqUPY51nEVLJCPQou+05APFHC/zh8vGD7AK7HFHZbjCf7OaIU6ZnrOO
 MK96zv7HUT0Fac0qMIhUoLH4CLVEgdlvDlB6Xfmcsrw4ZFlNM4MOIfbWaE+ZIl/r
 FEAXDMhMvTyWLZ5GZ20NImFchIdFvm+w5Js6a7+TqOQ9xZPk2tnLAbQTGtE/W/1G
 luhRdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ww1p0my3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jan 2025 20:07:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502K7TK7017087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Jan 2025 20:07:29 GMT
Received: from [10.216.23.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 12:07:24 -0800
Message-ID: <5fd49a1a-232f-4311-8cb7-845658f86d42@quicinc.com>
Date: Fri, 3 Jan 2025 01:37:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>, "Rob
 Clark" <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
References: <20241230160034.18671-1-robdclark@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241230160034.18671-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r1R_Cva3TbrS7RHylznnwgW2DaUe5_p_
X-Proofpoint-ORIG-GUID: r1R_Cva3TbrS7RHylznnwgW2DaUe5_p_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020175
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

On 12/30/2024 9:30 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> helper macro to make it easier to add debug logging which can be enabled
> at runtime via drm.debug.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++----
>  drivers/gpu/drm/msm/msm_drv.c           |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h           |  7 +++
>  drivers/gpu/drm/msm/msm_gem_submit.c    | 64 +++++++++++--------------
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  2 +-
>  5 files changed, 47 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 076be0473eb5..9649c0bd0a38 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -310,10 +310,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		     uint32_t param, uint64_t *value, uint32_t *len)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct drm_device *drm = gpu->dev;
>  
>  	/* No pointer params yet */
>  	if (*len != 0)
> -		return -EINVAL;
> +		return UERR(EINVAL, drm, "invalid len");
>  
>  	switch (param) {
>  	case MSM_PARAM_GPU_ID:
> @@ -365,12 +366,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		return 0;
>  	case MSM_PARAM_VA_START:
>  		if (ctx->aspace == gpu->aspace)
> -			return -EINVAL;
> +			return UERR(EINVAL, drm, "requires per-process pgtables");
>  		*value = ctx->aspace->va_start;
>  		return 0;
>  	case MSM_PARAM_VA_SIZE:
>  		if (ctx->aspace == gpu->aspace)
> -			return -EINVAL;
> +			return UERR(EINVAL, drm, "requires per-process pgtables");
>  		*value = ctx->aspace->va_size;
>  		return 0;
>  	case MSM_PARAM_HIGHEST_BANK_BIT:
> @@ -386,14 +387,15 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		*value = adreno_gpu->ubwc_config.macrotile_mode;
>  		return 0;
>  	default:
> -		DBG("%s: invalid param: %u", gpu->name, param);
> -		return -EINVAL;
> +		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
>  	}
>  }
>  
>  int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		     uint32_t param, uint64_t value, uint32_t len)
>  {
> +	struct drm_device *drm = gpu->dev;
> +
>  	switch (param) {
>  	case MSM_PARAM_COMM:
>  	case MSM_PARAM_CMDLINE:
> @@ -401,11 +403,11 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  		 * that should be a reasonable upper bound
>  		 */
>  		if (len > PAGE_SIZE)
> -			return -EINVAL;
> +			return UERR(EINVAL, drm, "invalid len");
>  		break;
>  	default:
>  		if (len != 0)
> -			return -EINVAL;
> +			return UERR(EINVAL, drm, "invalid len");
>  	}
>  
>  	switch (param) {
> @@ -434,11 +436,10 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  	}
>  	case MSM_PARAM_SYSPROF:
>  		if (!capable(CAP_SYS_ADMIN))
> -			return -EPERM;
> +			return UERR(EPERM, drm, "invalid permissions");
>  		return msm_file_private_set_sysprof(ctx, gpu, value);
>  	default:
> -		DBG("%s: invalid param: %u", gpu->name, param);
> -		return -EINVAL;
> +		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c2dd8ef6d6dc..2aefb8becda0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -538,7 +538,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
>  
>  	/* Only supported if per-process address space is supported: */
>  	if (priv->gpu->aspace == ctx->aspace)
> -		return -EOPNOTSUPP;
> +		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
>  
>  	if (should_fail(&fail_gem_iova, obj->size))
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d8c9a1b19263..fee31680a6d5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -28,6 +28,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_dsc.h>
>  #include <drm/msm_drm.h>
> @@ -506,6 +507,12 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>  			   clockid_t clock_id,
>  			   enum hrtimer_mode mode);
>  
> +/* Helper for returning a UABI error with optional logging which can make
> + * it easier for userspace to understand what it is doing wrong.
> + */
> +#define UERR(err, drm, fmt, ...) \
> +	({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
> +
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fba78193127d..be6e793f34bd 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -20,8 +20,8 @@
>  /* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
>   * error msgs for debugging, but we don't spam dmesg by default
>   */
> -#define SUBMIT_ERROR(submit, fmt, ...) \
> -	DRM_DEV_DEBUG_DRIVER((submit)->dev->dev, fmt, ##__VA_ARGS__)
> +#define SUBMIT_ERROR(err, submit, fmt, ...) \
> +	UERR(err, (submit)->dev, fmt, ##__VA_ARGS__)
>  
>  /*
>   * Cmdstream submission:
> @@ -142,8 +142,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
>  
>  		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
>  			!(submit_bo.flags & MANDATORY_FLAGS)) {
> -			SUBMIT_ERROR(submit, "invalid flags: %x\n", submit_bo.flags);
> -			ret = -EINVAL;
> +			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
>  			i = 0;
>  			goto out;
>  		}
> @@ -162,8 +161,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
>  		 */
>  		obj = idr_find(&file->object_idr, submit->bos[i].handle);
>  		if (!obj) {
> -			SUBMIT_ERROR(submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
> -			ret = -EINVAL;
> +			ret = SUBMIT_ERROR(EINVAL, submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
>  			goto out_unlock;
>  		}
>  
> @@ -206,14 +204,12 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>  		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>  			break;
>  		default:
> -			SUBMIT_ERROR(submit, "invalid type: %08x\n", submit_cmd.type);
> -			return -EINVAL;
> +			return SUBMIT_ERROR(EINVAL, submit, "invalid type: %08x\n", submit_cmd.type);
>  		}
>  
>  		if (submit_cmd.size % 4) {
> -			SUBMIT_ERROR(submit, "non-aligned cmdstream buffer size: %u\n",
> -				     submit_cmd.size);
> -			ret = -EINVAL;
> +			ret = SUBMIT_ERROR(EINVAL, submit, "non-aligned cmdstream buffer size: %u\n",
> +					   submit_cmd.size);
>  			goto out;
>  		}
>  
> @@ -371,9 +367,8 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
>  		struct drm_gem_object **obj, uint64_t *iova)
>  {
>  	if (idx >= submit->nr_bos) {
> -		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
> -			     idx, submit->nr_bos);
> -		return -EINVAL;
> +		return SUBMIT_ERROR(EINVAL, submit, "invalid buffer index: %u (out of %u)\n",
> +				    idx, submit->nr_bos);
>  	}
>  
>  	if (obj)
> @@ -392,10 +387,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
>  	uint32_t *ptr;
>  	int ret = 0;
>  
> -	if (offset % 4) {
> -		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
> -		return -EINVAL;
> -	}
> +	if (offset % 4)
> +		return SUBMIT_ERROR(EINVAL, submit, "non-aligned cmdstream buffer: %u\n", offset);
>  
>  	/* For now, just map the entire thing.  Eventually we probably
>  	 * to do it page-by-page, w/ kmap() if not vmap()d..
> @@ -414,9 +407,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
>  		uint64_t iova;
>  
>  		if (submit_reloc.submit_offset % 4) {
> -			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
> -				     submit_reloc.submit_offset);
> -			ret = -EINVAL;
> +			ret = SUBMIT_ERROR(EINVAL, submit, "non-aligned reloc offset: %u\n",
> +					   submit_reloc.submit_offset);
>  			goto out;
>  		}
>  
> @@ -425,8 +417,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
>  
>  		if ((off >= (obj->size / 4)) ||
>  				(off < last_offset)) {
> -			SUBMIT_ERROR(submit, "invalid offset %u at reloc %u\n", off, i);
> -			ret = -EINVAL;
> +			ret = SUBMIT_ERROR(EINVAL, submit, "invalid offset %u at reloc %u\n", off, i);
>  			goto out;
>  		}
>  
> @@ -513,12 +504,12 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>  
>  		if (syncobj_desc.point &&
>  		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
> -			ret = -EOPNOTSUPP;
> +			ret = SUBMIT_ERROR(EOPNOTSUPP, submit, "syncobj timeline unsupported");
>  			break;
>  		}
>  
>  		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
> -			ret = -EINVAL;
> +			ret = -SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags");
>  			break;
>  		}
>  
> @@ -531,7 +522,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>  			syncobjs[i] =
>  				drm_syncobj_find(file, syncobj_desc.handle);
>  			if (!syncobjs[i]) {
> -				ret = -EINVAL;
> +				ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj handle");

Just to be more useful, probably we can print the index or the handle
here. Anyway

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.


