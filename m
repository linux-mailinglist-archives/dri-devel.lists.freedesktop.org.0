Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D776A539601
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 20:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8541310F1AD;
	Tue, 31 May 2022 18:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C83110F104;
 Tue, 31 May 2022 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654020896; x=1685556896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NoFkx5lMbc6Etp61cemnFmxpuTtNZtTnaA3KQmlBh6I=;
 b=qLuGWn07otosh0nEaAFhXeQ+fkbXnLRTZh0AzXipLMMUWCOTOG/jXmLC
 4BpFH+9dmUbrB2RrVKJo3+p+lEXKZKGabuh/DDcbHFTPAaGFOlOyELBYc
 ZkOnhQ/Cv6OzsBU3mouvSKKvSY1juN2/rRyct3KOVQNVWmdVOLn3mqQZH I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 May 2022 11:14:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 11:14:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 11:14:54 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 11:14:51 -0700
Message-ID: <4b78c34e-c7ce-effd-b116-026c498b6a28@quicinc.com>
Date: Tue, 31 May 2022 11:14:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Remove unused code
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <robdclark@gmail.com>
References: <20220524081413.37895-1-jiapeng.chong@linux.alibaba.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220524081413.37895-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Abaci
 Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2022 1:14 AM, Jiapeng Chong wrote:
> Eliminate the follow clang warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:544:33: warning: variable
> ‘mode’ set but not used [-Wunused-but-set-variable].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fixes: 3177589c6e93("drm/msm/dpu: encoder: drop unused mode_fixup callback")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..658171799b9a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -541,7 +541,6 @@ static int dpu_encoder_virt_atomic_check(
>   	struct dpu_encoder_virt *dpu_enc;
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
> -	const struct drm_display_mode *mode;
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> @@ -559,7 +558,6 @@ static int dpu_encoder_virt_atomic_check(
>   
>   	priv = drm_enc->dev->dev_private;
>   	dpu_kms = to_dpu_kms(priv->kms);
> -	mode = &crtc_state->mode;
>   	adj_mode = &crtc_state->adjusted_mode;
>   	global_state = dpu_kms_get_global_state(crtc_state->state);
>   	if (IS_ERR(global_state))
