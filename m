Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20866AA555A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9110E054;
	Wed, 30 Apr 2025 20:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QCNZ7mHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8D10E054;
 Wed, 30 Apr 2025 20:09:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGfgNC032392;
 Wed, 30 Apr 2025 20:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PHWRyztN4HVgp8yG/iB39vMileOEcPynhAEAVEVCXhQ=; b=QCNZ7mHp7XW71SY2
 lFkR+hXFGr4+BIhG+7KUMjOwlitKSSuY9KrHOUJP4TjEFvzCqcNiDdjuYs7PguvD
 fWuyrgF+mfxgIukcxZVILajpqAXyAJ/8tTAdOpohHpTUE6Y5k/f8rtj7HwBGI47d
 9FqJpVJ3k5rJcPys7nxdV1vfDf8dSdWYS6aJNwNFF/UuDpTYnJZjebak7dRc4EHP
 DKcE2oHlkerF+IOwe/nru2FtavWoX6TS2lsYQ9YYq6Z97ii+OO/o+9qm6GmhOCgo
 iz8etUDk/pONXnqbRfg8x/cLcB1LR3DLHfe/mr429SZTb6zxae3h55yI2RVKIVmo
 cyyqLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2bhay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 20:09:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UK9XM8010183
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 20:09:33 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 13:09:32 -0700
Message-ID: <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
Date: Wed, 30 Apr 2025 13:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/msm: make it possible to disable KMS-related code.
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OTMzONAXA_11YC1ZSoATYcgSDJzghavs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE0NyBTYWx0ZWRfXz6XL9BNcP6en
 /PKo8hcypFVr9BJkzDraler6QWDJ1G5UHK7/Vqc2vEA06BVyCX2wKOfzR76zOvTLhu9+I+F6N0F
 EfbyV2TvDsWBohPzn8p3jThFS8vxZehMKqkHGQMGC2mD2sYpyv3rF1bCFNhqFIFGpZYNt1oBEF2
 pVO6rxCahOZbE1OYDiKQeuFVXyF3749L3A08sQ/SGhMToeSvkXNrun9E/Lyo6eWlICeiNXPIrew
 d2rpEYjhKGdSJbIvghZBLONpcb686ddX0+ksxRzAT8U0BAiIJ+3WLb3shTs385iVDIEgHFuF3oj
 SdNuacNLGXEobnMpITLsyAypz62XHvBjcEa8fbMQidYHJiSZ94N3LyNIcr6fzm4LCeCBud/AdWb
 6zvEZIVWjnFlNllgSA2DY9erNnL0ar6GzKam7ntUiX8Ddz8lbDDt9YrddrOh6YYIVkD+QlEZ
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6812837e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=ZnBz01trJ1QaHCt7Pq8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: OTMzONAXA_11YC1ZSoATYcgSDJzghavs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300147
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



On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> If the Adreno device is used in a headless mode, there is no need to
> build all KMS components. Build corresponding parts conditionally, only
> selecting them if modeset support is actually required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/Kconfig       | 14 ++++++
>   drivers/gpu/drm/msm/Makefile      | 16 +++----
>   drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
>   drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
>   drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
>   drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
>   6 files changed, 108 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 974bc7c0ea761147d3326bdce9039d6f26f290d0..0be31c5acdd1b7ef80f0e820ff430692616122e0 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -66,6 +66,14 @@ config DRM_MSM_VALIDATE_XML
>   	  Validate XML files with register definitions against rules-fd schema.
>   	  This option is mostly targeting DRM MSM developers. If unsure, say N.
>   
> +config DRM_MSM_KMS
> +	def_bool n
> +	depends on DRM_MSM
> +
> +config DRM_MSM_KMS_FBDEV
> +	def_bool DRM_FBDEV_EMULATION
> +	depends on DRM_MSM_KMS
> +
>   config DRM_MSM_MDSS
>   	bool
>   	depends on DRM_MSM
> @@ -74,6 +82,7 @@ config DRM_MSM_MDSS
>   config DRM_MSM_MDP4
>   	bool "Enable MDP4 support in MSM DRM driver"
>   	depends on DRM_MSM
> +	select DRM_MSM_KMS
>   	default y
>   	help
>   	  Compile in support for the Mobile Display Processor v4 (MDP4) in
> @@ -84,6 +93,7 @@ config DRM_MSM_MDP5
>   	bool "Enable MDP5 support in MSM DRM driver"
>   	depends on DRM_MSM
>   	select DRM_MSM_MDSS
> +	select DRM_MSM_KMS
>   	default y
>   	help
>   	  Compile in support for the Mobile Display Processor v5 (MDP5) in
> @@ -94,6 +104,7 @@ config DRM_MSM_DPU
>   	bool "Enable DPU support in MSM DRM driver"
>   	depends on DRM_MSM
>   	select DRM_MSM_MDSS
> +	select DRM_MSM_KMS
>   	select DRM_DISPLAY_DSC_HELPER
>   	default y
>   	help
> @@ -104,6 +115,7 @@ config DRM_MSM_DPU
>   config DRM_MSM_DP
>   	bool "Enable DisplayPort support in MSM DRM driver"
>   	depends on DRM_MSM
> +	depends on DRM_MSM_KMS
>   	select RATIONAL
>   	default y
>   	help
> @@ -114,6 +126,7 @@ config DRM_MSM_DP
>   config DRM_MSM_DSI
>   	bool "Enable DSI support in MSM DRM driver"
>   	depends on DRM_MSM
> +	depends on DRM_MSM_KMS
>   	select DRM_PANEL
>   	select DRM_MIPI_DSI
>   	select DRM_DISPLAY_DSC_HELPER
> @@ -169,6 +182,7 @@ config DRM_MSM_DSI_7NM_PHY
>   config DRM_MSM_HDMI
>   	bool "Enable HDMI support in MSM DRM driver"
>   	depends on DRM_MSM
> +	depends on DRM_MSM_KMS
>   	default y
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HDMI_STATE_HELPER
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..3749b0af779e73a93d7c219d3fbd3865b9296b50 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -101,18 +101,15 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
>   msm-display-$(CONFIG_DRM_MSM_MDSS) += \
>   	msm_mdss.o \
>   
> -msm-display-y += \
> +msm-display-$(CONFIG_DRM_MSM_KMS) += \
>   	disp/mdp_format.o \
>   	disp/mdp_kms.o \
>   	disp/msm_disp_snapshot.o \
>   	disp/msm_disp_snapshot_util.o \
>   
>   msm-y += \
> -	msm_atomic.o \
> -	msm_atomic_tracepoints.o \
>   	msm_debugfs.o \
>   	msm_drv.o \
> -	msm_fb.o \
>   	msm_fence.o \
>   	msm_gem.o \
>   	msm_gem_prime.o \
> @@ -123,21 +120,24 @@ msm-y += \
>   	msm_gpu_devfreq.o \
>   	msm_io_utils.o \
>   	msm_iommu.o \
> -	msm_kms.o \
>   	msm_perf.o \
>   	msm_rd.o \
>   	msm_ringbuffer.o \
>   	msm_submitqueue.o \
>   	msm_gpu_tracepoints.o \
>   
> -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> +msm-$(CONFIG_DRM_MSM_KMS) += \
> +	msm_atomic.o \
> +	msm_atomic_tracepoints.o \
> +	msm_fb.o \
> +	msm_kms.o \
>   
> -msm-display-$(CONFIG_DEBUG_FS) += \
> -	dp/dp_debug.o
> +msm-$(CONFIG_DRM_MSM_KMS_FBDEV) += msm_fbdev.o
>   
>   msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_catalog.o \
>   	dp/dp_ctrl.o \
> +	dp/dp_debug.o \
>   	dp/dp_display.o \
>   	dp/dp_drm.o \
>   	dp/dp_link.o \
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 22fd946ee201397b72b43c8499714139deb7ba82..7835d93015b31a69aac824ca04dc65b374546e5c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -5,6 +5,8 @@
>   
>   #define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
>   
> +#ifdef CONFIG_DEBUG_FS
> +
>   #include <linux/debugfs.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_file.h>
> @@ -235,3 +237,5 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>   
>   	return 0;
>   }
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 7ab607252d183f78b99c3a8b878c949ed5f99fec..2b12f2851fadbc3c924827e11570352736869614 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -117,6 +117,36 @@ static const struct file_operations msm_gpu_fops = {
>   	.release = msm_gpu_release,
>   };
>   
> +#ifdef CONFIG_DRM_MSM_KMS
> +static int msm_fb_show(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct drm_device *dev = node->minor->dev;
> +	struct drm_framebuffer *fb, *fbdev_fb = NULL;
> +
> +	if (dev->fb_helper && dev->fb_helper->fb) {
> +		seq_puts(m, "fbcon ");
> +		fbdev_fb = dev->fb_helper->fb;
> +		msm_framebuffer_describe(fbdev_fb, m);
> +	}
> +
> +	mutex_lock(&dev->mode_config.fb_lock);
> +	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
> +		if (fb == fbdev_fb)
> +			continue;
> +
> +		seq_puts(m, "user ");
> +		msm_framebuffer_describe(fb, m);
> +	}
> +	mutex_unlock(&dev->mode_config.fb_lock);
> +
> +	return 0;
> +}
> +
> +static struct drm_info_list msm_kms_debugfs_list[] = {
> +		{ "fb", msm_fb_show },
> +};
> +
>   /*
>    * Display Snapshot:
>    */
> @@ -180,6 +210,27 @@ static const struct file_operations msm_kms_fops = {
>   	.release = msm_kms_release,
>   };
>   
> +static void msm_debugfs_kms_init(struct drm_minor *minor)
> +{
> +	struct drm_device *dev = minor->dev;
> +	struct msm_drm_private *priv = dev->dev_private;
> +
> +	drm_debugfs_create_files(msm_kms_debugfs_list,
> +				 ARRAY_SIZE(msm_kms_debugfs_list),
> +				 minor->debugfs_root, minor);
> +	debugfs_create_file("kms", 0400, minor->debugfs_root,
> +			    dev, &msm_kms_fops);
> +
> +	if (priv->kms->funcs->debugfs_init)
> +		priv->kms->funcs->debugfs_init(priv->kms, minor);
> +
> +}
> +#else /* ! CONFIG_DRM_MSM_KMS */
> +static void msm_debugfs_kms_init(struct drm_minor *minor)
> +{
> +}
> +#endif
> +
>   /*
>    * Other debugfs:
>    */
> @@ -238,40 +289,11 @@ static int msm_mm_show(struct seq_file *m, void *arg)
>   	return 0;
>   }
>   
> -static int msm_fb_show(struct seq_file *m, void *arg)
> -{
> -	struct drm_info_node *node = m->private;
> -	struct drm_device *dev = node->minor->dev;
> -	struct drm_framebuffer *fb, *fbdev_fb = NULL;
> -
> -	if (dev->fb_helper && dev->fb_helper->fb) {
> -		seq_printf(m, "fbcon ");
> -		fbdev_fb = dev->fb_helper->fb;
> -		msm_framebuffer_describe(fbdev_fb, m);
> -	}
> -
> -	mutex_lock(&dev->mode_config.fb_lock);
> -	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
> -		if (fb == fbdev_fb)
> -			continue;
> -
> -		seq_printf(m, "user ");
> -		msm_framebuffer_describe(fb, m);
> -	}
> -	mutex_unlock(&dev->mode_config.fb_lock);
> -
> -	return 0;
> -}
> -
>   static struct drm_info_list msm_debugfs_list[] = {
>   		{"gem", msm_gem_show},
>   		{ "mm", msm_mm_show },
>   };
>   
> -static struct drm_info_list msm_kms_debugfs_list[] = {
> -		{ "fb", msm_fb_show },
> -};
> -
>   static int late_init_minor(struct drm_minor *minor)
>   {
>   	int ret;
> @@ -343,20 +365,12 @@ void msm_debugfs_init(struct drm_minor *minor)
>   	if (priv->gpu_pdev)
>   		msm_debugfs_gpu_init(minor);
>   
> -	if (priv->kms) {
> -		drm_debugfs_create_files(msm_kms_debugfs_list,
> -					 ARRAY_SIZE(msm_kms_debugfs_list),
> -					 minor->debugfs_root, minor);
> -		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
> -				    dev, &msm_kms_fops);
> -	}
> +	if (priv->kms)
> +		msm_debugfs_kms_init(minor);
>   
>   	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
>   		dev, &shrink_fops);
>   
> -	if (priv->kms && priv->kms->funcs->debugfs_init)
> -		priv->kms->funcs->debugfs_init(priv->kms, minor);
> -
>   	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
>   				  &fail_gem_alloc);
>   	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -88,6 +88,7 @@ struct msm_drm_private {
>   	/* subordinate devices, if present: */
>   	struct platform_device *gpu_pdev;
>   
> +#ifdef CONFIG_DRM_MSM_KMS
>   	/* possibly this should be in the kms component, but it is
>   	 * shared by both mdp4 and mdp5..
>   	 */

As the comment says, I am also thinking that this should be part of 
msm_kms struct, to avoid ifdefs. I didnt follow the second half of the 
comment that this is shared by both mdp4/mdp5. Why does that prevent it 
from being in the kms component?


> @@ -97,6 +98,7 @@ struct msm_drm_private {
>   	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
>   
>   	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
> +#endif
>   
>   	/* when we have more than one 'msm_gpu' these need to be an array: */
>   	struct msm_gpu *gpu;
> @@ -177,11 +179,13 @@ struct msm_drm_private {
>   		struct mutex lock;
>   	} lru;
>   
> +#ifdef CONFIG_DRM_MSM_KMS
>   	struct workqueue_struct *wq;
>   
>   	unsigned int num_crtcs;
>   
>   	struct msm_drm_thread event_thread[MAX_CRTCS];
> +#endif
>   
>   	/* VRAM carveout, used when no IOMMU: */
>   	struct {
> @@ -275,7 +279,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
>   struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
>   		int w, int h, int p, uint32_t format);
>   
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> +#ifdef CONFIG_DRM_MSM_KMS_FBDEV
>   int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>   				 struct drm_fb_helper_surface_size *sizes);
>   #define MSM_FBDEV_DRIVER_OPS \
> @@ -360,6 +364,7 @@ static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
>   }
>   #endif
>   
> +struct msm_dp;
>   #ifdef CONFIG_DRM_MSM_DP
>   int __init msm_dp_register(void);
>   void __exit msm_dp_unregister(void);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 057b20367724a4ca60f2d60c038077dbcc1c7abc..aabbe851f0d533cca4a2ca00b79fbf8603870be3 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -13,6 +13,8 @@
>   
>   #include "msm_drv.h"
>   
> +#ifdef CONFIG_DRM_MSM_KMS
> +
>   #define MAX_PLANE	4
>   
>   /* As there are different display controller blocks depending on the
> @@ -196,4 +198,25 @@ void msm_drm_kms_post_init(struct device *dev);
>   void msm_drm_kms_unregister(struct device *dev);
>   void msm_drm_kms_uninit(struct device *dev);
>   
> +#else /* ! CONFIG_DRM_MSM_KMS */
> +
> +static inline int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void msm_drm_kms_post_init(struct device *dev)
> +{
> +}
> +
> +static inline void msm_drm_kms_unregister(struct device *dev)
> +{
> +}
> +
> +static inline void msm_drm_kms_uninit(struct device *dev)
> +{
> +}
> +
> +#endif
> +
>   #endif /* __MSM_KMS_H__ */
> 

