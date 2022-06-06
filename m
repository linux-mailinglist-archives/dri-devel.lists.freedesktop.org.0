Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE353ED17
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D5311BA7E;
	Mon,  6 Jun 2022 17:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7711BA7E;
 Mon,  6 Jun 2022 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654537240; x=1686073240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zESBcsC3q66fDUCxK78kqEowxXd5sdCuRRFUeC5plGY=;
 b=bUc1GhThZGPl/F+SCbyk7cHMV5yFtlOioAcOAniB7OH9oiQcCx/RZ5L2
 gOXpCOEC/ixexnU4oDY+cFgTAY6Kp8YNusgUMIiKD42XpJ44z5uxZ6wFF
 P3FVUfHhp6m/0frQZYg30x1lBwufqVxQ+rjQrfeF4ASqTpamePk44jmEP c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Jun 2022 10:40:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 10:40:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 6 Jun 2022 10:40:38 -0700
Received: from [10.110.88.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 6 Jun 2022
 10:40:37 -0700
Message-ID: <68c6f375-5b11-98f2-83f5-1b481ea09ebd@quicinc.com>
Date: Mon, 6 Jun 2022 10:40:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/2] drm/msm: enable msm irq after all initializations
 are done successfully at msm_drm_init()
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
References: <1654291716-6603-1-git-send-email-quic_khsieh@quicinc.com>
 <1654291716-6603-2-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1654291716-6603-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I will drop this patch since the problem had been fixed by Dmitry 
Baryshkov patch.

https://gitlab.freedesktop.org/drm/msm/-/commit/577e2a9dfc8fba7938aaf75db63fae7e328cc3cb



On 6/3/2022 2:28 PM, Kuogee Hsieh wrote:
> At msm initialize phase, msm_drm_init() is called to initialize modules
> sequentially. It will call msm_drm_uninit() to clean up initialized phase
> if any module initialization return failed. This patch move msm_irq_install()
> to the last step of msm_drm_init() after all modules are initialized successfully
> so that no msm_irq_unistall() required at msm_drm_uninit() if any module
> initialization failed happen at msm_drm_init().
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 29 ++++++-----------------------
>   1 file changed, 6 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 6665c5a..ab42e9a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -132,15 +132,6 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
>   	return 0;
>   }
>   
> -static void msm_irq_uninstall(struct drm_device *dev)
> -{
> -	struct msm_drm_private *priv = dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -
> -	kms->funcs->irq_uninstall(kms);
> -	free_irq(kms->irq, dev);
> -}
> -
>   struct msm_vblank_work {
>   	struct work_struct work;
>   	int crtc_id;
> @@ -232,10 +223,6 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	drm_mode_config_cleanup(ddev);
>   
> -	pm_runtime_get_sync(dev);
> -	msm_irq_uninstall(ddev);
> -	pm_runtime_put_sync(dev);
> -
>   	if (kms && kms->funcs)
>   		kms->funcs->destroy(kms);
>   
> @@ -437,16 +424,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   		goto err_msm_uninit;
>   	}
>   
> -	if (kms) {
> -		pm_runtime_get_sync(dev);
> -		ret = msm_irq_install(ddev, kms->irq);
> -		pm_runtime_put_sync(dev);
> -		if (ret < 0) {
> -			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
> -			goto err_msm_uninit;
> -		}
> -	}
> -
>   	ret = drm_dev_register(ddev, 0);
>   	if (ret)
>   		goto err_msm_uninit;
> @@ -467,6 +444,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_msm_uninit;
>   
> +	if (kms) {
> +		pm_runtime_get_sync(dev);
> +		msm_irq_install(ddev, kms->irq);
> +		pm_runtime_put_sync(dev);
> +	}
> +
>   	drm_kms_helper_poll_init(ddev);
>   
>   	return 0;
