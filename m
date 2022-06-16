Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351154EAEF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 22:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659C10E106;
	Thu, 16 Jun 2022 20:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FE910E106;
 Thu, 16 Jun 2022 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655410896; x=1686946896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yd2cnisqiYWov1tsh+3r2dTaafhNR8Jrij0gzXXaf24=;
 b=w4LC4foX07MaGp8E9VaRWqDM9/6Y4ayoJomIY0eyjx9v73XAxdjn+0zS
 8t3K5mOe5sLwcK/RbGv0WTvbdipcSBtBhX+EISCvEOwoom2To6ZuR2axs
 QC/ySEDUHuQz67s3Z0sKA9V5ppe/8H6BPQgRCJsFsgeTgaSRoPH67Jm/N w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Jun 2022 13:21:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:21:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 13:21:34 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 13:21:32 -0700
Message-ID: <9241487f-fedc-e00d-beae-57622bea97ef@quicinc.com>
Date: Thu, 16 Jun 2022 13:21:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
 <20220507170922.1723712-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507170922.1723712-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> index 9b4c8d92ff32..43443a435d59 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> @@ -82,8 +82,7 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
>   	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
>   	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
>   	struct drm_device *dev = mdp5_kms->dev;
> -	struct msm_drm_private *priv = dev->dev_private;
> -	unsigned int id;
> +	struct drm_crtc *crtc;
>   	uint32_t status, enable;
>   
>   	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
> @@ -94,9 +93,9 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
>   
>   	mdp_dispatch_irqs(mdp_kms, status);
>   
> -	for (id = 0; id < priv->num_crtcs; id++)
> -		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
> -			drm_handle_vblank(dev, id);
> +	drm_for_each_crtc(crtc, dev)
> +		if (status & mdp5_crtc_vblank(crtc))
> +			drm_crtc_handle_vblank(crtc);
>   
>   	return IRQ_HANDLED;
>   }
