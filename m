Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2DA82590F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C861E10E655;
	Fri,  5 Jan 2024 17:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F0A10E64A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:30:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405CuMxf020451; Fri, 5 Jan 2024 17:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=JTaF+WD2lR8YXN9nBSJJEd+p7dAHcUvlx62WEwQC3Vw=; b=Im
 J7eGwnEhfwKr/2geoHorZmzpFsj3IdvvtGfd7bY+4JPH1Ud8Ful/hF3rXscvxS1i
 bfiRXzVjqVGDYaYiNbcGy1cmscfM0hiIfZSmXRwYVyZNTtWWYrucr5d2Kt3jFdGI
 nw/FJrs03cMhGJpA0oVN1GE4CiNBJVlN6RzCiITxBzti6lj+sosKiX6zhmvYVsvj
 EkyKjdcTL/uaXJHaDDXfAIdHB6THkcmUF+5f3CrMtNe/p9wdCOYFjSJlZ8ou7G1s
 RUKoAjWFkdZvGmCQdCH5SuTRAoxA95GkGWazw+s6a8Vcu99l+o6E4TtSpme2POJc
 nM+HvOfVFVeU2e825Y6A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve9a3ss8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 17:29:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405HTMge003753
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 17:29:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 09:29:22 -0800
Message-ID: <d95363cc-4dbd-7f72-7acb-c1f94caa0a7e@quicinc.com>
Date: Fri, 5 Jan 2024 10:29:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/10] accel/ivpu: Remove deprecated
 DRM_IVPU_PARAM_CONTEXT_PRIORITY
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-11-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-11-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uw53sqscSIMXyJIyOFeOhQGf-SAY4lwW
X-Proofpoint-ORIG-GUID: uw53sqscSIMXyJIyOFeOhQGf-SAY4lwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401050144
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
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> DRM_IVPU_PARAM_CONTEXT_PRIORITY has been deprecated because it
> has been replaced with DRM_IVPU_JOB_PRIORITY levels set with
> submit IOCTL and was unused anyway.
> 
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 11 -----------
>   drivers/accel/ivpu/ivpu_drv.h |  1 -
>   drivers/accel/ivpu/ivpu_job.c |  3 +++
>   include/uapi/drm/ivpu_accel.h | 21 ++++++++++++++++++++-
>   4 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index ec66c2c39877..546c0899bb9e 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -177,9 +177,6 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>   	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>   		args->value = vdev->hw->ranges.user.start;
>   		break;
> -	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
> -		args->value = file_priv->priority;
> -		break;
>   	case DRM_IVPU_PARAM_CONTEXT_ID:
>   		args->value = file_priv->ctx.id;
>   		break;
> @@ -219,17 +216,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>   
>   static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   {
> -	struct ivpu_file_priv *file_priv = file->driver_priv;
>   	struct drm_ivpu_param *args = data;
>   	int ret = 0;
>   
>   	switch (args->param) {
> -	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
> -		if (args->value <= DRM_IVPU_CONTEXT_PRIORITY_REALTIME)
> -			file_priv->priority = args->value;
> -		else
> -			ret = -EINVAL;
> -		break;
>   	default:
>   		ret = -EINVAL;
>   	}
> @@ -258,7 +248,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>   	}
>   
>   	file_priv->vdev = vdev;
> -	file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>   	kref_init(&file_priv->ref);
>   	mutex_init(&file_priv->lock);
>   
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 9b6e336626e3..7a6bc1918780 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -146,7 +146,6 @@ struct ivpu_file_priv {
>   	struct mutex lock; /* Protects cmdq */
>   	struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
>   	struct ivpu_mmu_context ctx;
> -	u32 priority;
>   	bool has_mmu_faults;
>   };
>   
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 7206cf9cdb4a..82e40bb4803c 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -488,6 +488,9 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (params->engine > DRM_IVPU_ENGINE_COPY)
>   		return -EINVAL;
>   
> +	if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
> +		return -EINVAL;
> +
>   	if (params->buffer_count == 0 || params->buffer_count > JOB_MAX_BUFFER_COUNT)
>   		return -EINVAL;
>   
> diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> index de1944e42c65..cc9a0504ee2f 100644
> --- a/include/uapi/drm/ivpu_accel.h
> +++ b/include/uapi/drm/ivpu_accel.h
> @@ -13,7 +13,7 @@ extern "C" {
>   #endif
>   
>   #define DRM_IVPU_DRIVER_MAJOR 1
> -#define DRM_IVPU_DRIVER_MINOR 0
> +#define DRM_IVPU_DRIVER_MINOR 1

I remember when this driver was going through initial review before 
acceptance, Oded mentioned that the DRM driver version mechanism was 
deprecated and to not use it.  Based on that, it seems like you should 
not be incrementing the minor number.

>   
>   #define DRM_IVPU_GET_PARAM		  0x00
>   #define DRM_IVPU_SET_PARAM		  0x01
> @@ -64,11 +64,18 @@ extern "C" {
>   
>   #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
>   
> +/* Deprecated - to be removed */
>   #define DRM_IVPU_CONTEXT_PRIORITY_IDLE	    0
>   #define DRM_IVPU_CONTEXT_PRIORITY_NORMAL    1
>   #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
>   #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3

$SUBJECT suggests these are being removed, not just deprecated.  Also, 
shouldn't DRM_IVPU_PARAM_CONTEXT_PRIORITY which is a few lines above 
this be deprecated/removed/something?

>   
> +#define DRM_IVPU_JOB_PRIORITY_DEFAULT  0
> +#define DRM_IVPU_JOB_PRIORITY_IDLE     1
> +#define DRM_IVPU_JOB_PRIORITY_NORMAL   2
> +#define DRM_IVPU_JOB_PRIORITY_FOCUS    3
> +#define DRM_IVPU_JOB_PRIORITY_REALTIME 4
> +
>   /**
>    * DRM_IVPU_CAP_METRIC_STREAMER
>    *
> @@ -286,6 +293,18 @@ struct drm_ivpu_submit {
>   	 * to be executed. The offset has to be 8-byte aligned.
>   	 */
>   	__u32 commands_offset;
> +
> +	/**
> +	 * @priority:
> +	 *
> +	 * Priority to be set for related job command queue, can be one of the following:
> +	 * %DRM_IVPU_JOB_PRIORITY_DEFAULT
> +	 * %DRM_IVPU_JOB_PRIORITY_IDLE
> +	 * %DRM_IVPU_JOB_PRIORITY_NORMAL
> +	 * %DRM_IVPU_JOB_PRIORITY_FOCUS
> +	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
> +	 */
> +	__u32 priority;

I think this breaks the uapi (which makes me think you are using the 
driver minor version above to detect).  This struct is passed to DRM_IOW 
which uses the struct size to calculate the ioctl number.  By changing 
the size of this struct, you change the ioctl number, and make it so 
that old userspace (with the old number) cannot work with newer kernels.

I beleive last time I brought up a uapi breakage, I was told that your 
userspace han't been offically released yet.  Is that still the case?

Seems odd though, because you are incrementing the driver minor number 
above which makes me think you need to communicate this change to 
userspace, which seems to suggest you might have old userspace out in 
the wild...

