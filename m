Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD565241A3
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 02:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B83B10E254;
	Thu, 12 May 2022 00:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C688B10E254
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:41:53 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a30so4584761ljq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s6xBzyyzy4CLG/A11495/lVLW/Pt3DIgyaBNFomFbcU=;
 b=Jjo1vIWolP3/v79wDUhf0ARDNJmuOJ859vEp3FK5E7oNmapaiHEhuhmXRzC/9UX3kp
 ocNuYKGzhtT75fCk6X9Xy8CJP+OoGg1c4LWLUby1WwYbisAcVob7gu+UeURwJ2rA4rJA
 FaeSdkjPl21mjrWdZ/kCv87oh+Xe2hK5CAufBMMJ62uVYlX3vwwmHYHkcji41Wcj1p6X
 wP2Nr7u5UObPebtEbvTFNBqx+MPuNLO10BkzkzyWwy9UN0C5yF23nl/mFAajUJQ2iBMF
 3OYc971FQfWevnRcEH1VXAexp1Nh2Cyn9/lhr78zN9dkBHVS1vzBYpZj2NtDNowq2Er1
 flhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s6xBzyyzy4CLG/A11495/lVLW/Pt3DIgyaBNFomFbcU=;
 b=Spnxi8hAN5PIpAGan96ummtfOqWWa8amNfovl7T+Pf2QrDK+sCd+qsH7uz3nmLkabo
 rgaMasiOQyJ4/qD5MRxqhIB0M1YiekT4RBjJXjgflW+tMA8sOJeBZdBaoX8rRIbEtvLA
 ufipTpy2zKAoGmJFSBOor6TODjE5InxzMZ0x95NCWGjbhlycP7vLJCYPNoKJNDCo5s4r
 ysv+FqbEy3+5FZBSqysPwpIjZ55eTGpjtEghiflDLknXAAbcXk2YgLuzjWyWL/20gTg/
 BVjxjTEtGzWDo2R7DhjzVwJ5epqVlRK8HTGqY9iyjqCFCtAmuFa9twMc+3EUSHsYWdVb
 q+TQ==
X-Gm-Message-State: AOAM532/KyjEj1d64o6A2bh29j2DpcjrPcjsjDO5jHjn420p8DNPn99g
 SSS7emsPxzoX7XUgQWqKNt+RBA==
X-Google-Smtp-Source: ABdhPJzki7/cvUW+uPeF1mkKUSRNDYTmRsjx9wW/4RbiNUefiYSmUXFdW+Yidcns+60l/TdptMcu9A==
X-Received: by 2002:a2e:82cd:0:b0:24b:4a69:790b with SMTP id
 n13-20020a2e82cd000000b0024b4a69790bmr18943543ljh.326.1652316112119; 
 Wed, 11 May 2022 17:41:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a2e850e000000b0024f3d1dae8csm606556lji.20.2022.05.11.17.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 17:41:51 -0700 (PDT)
Message-ID: <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
Date: Thu, 12 May 2022 03:41:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 03:02, Kuogee Hsieh wrote:
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller.
> 
> At current implementation, dp_ctrl_reset_irq_ctrl() will software reset dp
> controller but did not call dp_catalog_ctrl_enable_irq(false) to clear hpd
> related interrupt mask bits to disable hpd related interrupts due to it
> mistakenly think hpd related interrupt mask bits will be cleared by software
> reset of dp controller automatically. This mistake may cause system to crash
> during suspending procedure due to unexpected irq fired and trigger event
> thread to access dp controller registers with controller clocks are disabled.
> 
> This patch fixes system crash during suspending problem by removing "enable"
> flag condition checking at dp_ctrl_reset_irq_ctrl() so that hpd related
> interrupt mask bits are cleared to prevent unexpected from happening.

ok. This is the main part of the description.

> In addition, this patch also add suspended flag to prevent new events be
> added into event Q to wake up event thread after system suspended.

And this describes the major part of the patch. First, it should go to a 
separate patch. Second, can you please describe, how can this happen 
once you disable the HPD interrupt?

> 
> Changes in v2:
> -- add more details commit text
> 
> Changes in v3:
> -- add synchrons_irq()
> -- add atomic_t suspended
> 
> Changes in v4:
> -- correct Fixes's commit ID
> -- remove synchrons_irq()
> 
> Changes in v5:
> -- revise commit text
> 
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++--
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..f3e333e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
> -	if (enable)
> -		dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> +	/*
> +	 * all dp controller programmable registers will not
> +	 * be reset to default value after DP_SW_RESET
> +	 * therefore interrupt mask bits have to be updated
> +	 * to enable/disable interrupts
> +	 */
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>   }
>   
>   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..79439b8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -98,6 +98,8 @@ struct dp_display_private {
>   	struct dp_ctrl    *ctrl;
>   	struct dp_debug   *debug;
>   
> +	atomic_t suspended;

I think it'd be better to protect it with event_lock rather than using 
atomics.

> +
>   	struct dp_usbpd_cb usbpd_cb;
>   	struct dp_display_mode dp_mode;
>   	struct msm_dp dp_display;
> @@ -187,6 +189,11 @@ static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>   	int pndx;
>   
>   	spin_lock_irqsave(&dp_priv->event_lock, flag);
> +	if (atomic_read(&dp_priv->suspended)) {
> +		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +		return -EPERM;
> +	}
> +
>   	pndx = dp_priv->event_pndx + 1;
>   	pndx %= DP_EVENT_Q_MAX;
>   	if (pndx == dp_priv->event_gndx) {
> @@ -1362,6 +1369,8 @@ static int dp_pm_resume(struct device *dev)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> +	atomic_set(&dp->suspended, 0);
> +
>   	/* start from disconnected state */
>   	dp->hpd_state = ST_DISCONNECTED;
>   
> @@ -1431,6 +1440,8 @@ static int dp_pm_suspend(struct device *dev)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> +	atomic_inc(&dp->suspended);
> +
>   	/* mainlink enabled */
>   	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>   		dp_ctrl_off_link_stream(dp->ctrl);


-- 
With best wishes
Dmitry
