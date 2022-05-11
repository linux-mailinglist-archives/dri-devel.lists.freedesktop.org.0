Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B544524067
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 00:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1EC10E45A;
	Wed, 11 May 2022 22:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4910E45A;
 Wed, 11 May 2022 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652309426; x=1683845426;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8AEEoAsw1SD0JtHJIYIu5AVp23VW26QWE6Er5U/JyUs=;
 b=sy/dzgJJ7OI9BjkiVsbDLNi4kLm/ZtwrUDbpAbJ5bkml4CvGuA/5cmVG
 EuXXXt777NMycKn0mzriVGBA+rCD0JMwaVtu8vuxkZOSQ/+kUHyu/v/EI
 uv3Z6vNF304bRi/4F5lABijc5LHByRDZzOfnI0hURw2EQjJ7S586eIuFe 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 May 2022 15:50:26 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 15:50:26 -0700
Received: from [10.71.108.57] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 11 May
 2022 15:50:25 -0700
Message-ID: <9a87aa7f-a106-333f-22e8-ccb9e23f9ee6@quicinc.com>
Date: Wed, 11 May 2022 15:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported
 rotations
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/11/2022 3:27 PM, Abhinav Kumar wrote:
> DRM_MODE_ROTATE_180 was previously marked as supported even
> for devices not supporting inline rotation.
> 
> This is true because the SSPPs can always flip the image.
> 
> After inline rotation support changes, this bit was removed
> and kms_rotation_crc IGT test starts skipping now whereas
> it was previously passing.
> 
> Restore DRM_MODE_ROTATE_180 bit to the supported rotations
> list.
> 
> Fixes: dabfdd89eaa92 ("add inline rotation support for sc7280")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (SC8170)

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9d2f0364d2c7..5b5aef249390 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1577,7 +1577,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   			BIT(DRM_MODE_BLEND_PREMULTI) |
>   			BIT(DRM_MODE_BLEND_COVERAGE));
>   
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>   
>   	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>   		supported_rotations |= DRM_MODE_ROTATE_MASK;
> -- 
> 2.35.1
> 
