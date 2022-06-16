Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17754EA50
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395A510E60F;
	Thu, 16 Jun 2022 19:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3D10E431;
 Thu, 16 Jun 2022 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655408782; x=1686944782;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q+zfdU8CHrLB6fcOwNpYub9QfP/SQqDPjkb0NAMPTC0=;
 b=eB1LbX4yB25KyfiY/tq6Fa0cLIdoMCzoE8qQHP9ptXIBw70pvmkCS7gJ
 Tmivq4KVvIbqy5fJVCs6FSpyreMZGkiUwDE2+7UnPSlU4XEwmAeYwh6ES
 YVC2obpgddQf7Y+QM4Mwjd2CqWRHLvSOBlP8K2LCnI6ZKnegdXGrkXyDw c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 12:46:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:46:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:46:21 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 12:46:19 -0700
Message-ID: <84f5e432-ee63-68c2-8072-e5ae2024b4ae@quicinc.com>
Date: Thu, 16 Jun 2022 12:46:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/2022 10:09 AM, Dmitry Baryshkov wrote:
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> index 4d49f3ba6a96..ddcdd5e87853 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> @@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
>   	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
>   	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
>   	struct drm_device *dev = mdp4_kms->dev;
> -	struct msm_drm_private *priv = dev->dev_private;
> -	unsigned int id;
> +	struct drm_crtc *crtc;
>   	uint32_t status, enable;
>   
>   	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
> @@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
>   
>   	mdp_dispatch_irqs(mdp_kms, status);
>   
> -	for (id = 0; id < priv->num_crtcs; id++)
> -		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
> -			drm_handle_vblank(dev, id);
> +	drm_for_each_crtc(crtc, dev)
> +		if (status & mdp4_crtc_vblank(crtc))
> +			drm_crtc_handle_vblank(crtc);
>   
>   	return IRQ_HANDLED;
>   }
