Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8D70CD6F
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29C010E174;
	Mon, 22 May 2023 22:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5610E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:03:29 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ab3e8f4efeso49765381fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684793007; x=1687385007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0U4Dct+KSj23BT1k7f2zFRKfGQUYVt8EbRMMwJrJugA=;
 b=q/Mkd9fHa/WWa9tCtv4ZW0ulNU569z+kPT49GWzVS4pS2BGtBTIjTSLCahYulrwpGQ
 KGccaRbvDqub1n9xdFWJjPt5QaqBEhlPnxYxN+o46haoHtUedmdAF9dcPn+RsRTvJfm5
 RpR/1WDkvRGNmi8IznLRT6yoz06wwvJx6Q6gGMY0HYW/T8PK93DSxEDVfVCCT0lSgkC0
 HSRP4VuQ8zrvvWUKjWcFrv/mm0m0j1OQ6tjhpdx+jLKKJIJkUQmdXtUBAdI9ett9xHHC
 Hg5KhKdvnbCNKeXYDWNHXr9COm2vFBcrKkmp1ZNs9yfr66+WHIGRXE+nIItfn4aKK11k
 Dy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684793007; x=1687385007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0U4Dct+KSj23BT1k7f2zFRKfGQUYVt8EbRMMwJrJugA=;
 b=jGIkZvHqnHnOTGqU4sFXtKmi6lIxQ/SbmzTtU22H1kSDReWQ2wmugOlhuOV+1ZCEIG
 qZ1MHPhSJEr1BC73RiHJOMMUWMAsiJWTstXPscMUWfCq7B6ccjeZVQGB3fO2xXL0Szdl
 7LDmKvhIvQ9tWTdxQbpqQFHbeXJ7tRLB5epC6iu05NQNdRY9C3wO3VlWCq6+UzFLW3eh
 gAcHjdrnaEvR/stsyDYoxss7O+5Efbgt/GZZtwjGWWY1LBsUD+ISLYUi1yaqTCxGTopa
 dFE7Xzh9IIp9Vwcyr8PooEamH5gmSXMkaitJtc17rabtbxf4i4LzUMtyjlaWW9gInlDU
 0O4A==
X-Gm-Message-State: AC+VfDzQ77HdYQpE4c9uYbzK9gr5MkCAACA6KokW2p5MpOma2JY4r63l
 PvtuqCX7OgI4w2uKlxXFtNSOow==
X-Google-Smtp-Source: ACHHUZ5HjOTaiuYq6HeXYZmVyhwDkcc9oyIl3Ov1FSfqHJR0urcq+o8GGLKN/sCRUqyWZa0dM48Y4w==
X-Received: by 2002:a2e:9cce:0:b0:2ad:999b:3bd6 with SMTP id
 g14-20020a2e9cce000000b002ad999b3bd6mr3840820ljj.23.1684793007151; 
 Mon, 22 May 2023 15:03:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a2e8497000000b002aa458a7a46sm1312275ljh.123.2023.05.22.15.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 15:03:26 -0700 (PDT)
Message-ID: <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
Date: Tue, 23 May 2023 01:03:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
 <20230522220555.7ood44kavjzzg3lv@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230522220555.7ood44kavjzzg3lv@ripper>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 01:05, Bjorn Andersson wrote:
> On Mon, May 22, 2023 at 02:31:32PM -0700, Kuogee Hsieh wrote:
>> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
>> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
>> case. HDP related interrupts can not be enabled until internal_hpd is set
>> to true. At current implementation dp_display_config_hpd() will initialize
>> DP host controller first followed by enabling HDP related interrupts if
>> internal_hpd was true at that time. Enable HDP related interrupts depends on
>> internal_hpd status may leave system with DP driver host is in running state
>> but without HDP related interrupts being enabled. This will prevent external
>> display from being detected. Eliminated this dependency by moving HDP related
>> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
>> regardless of internal_hpd status.
>>
> 
> Thanks Kuogee, this looks quite good to me. But...
> 
>> Changes in V3:
>> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
>> -- rewording ocmmit text
>>
>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++-
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 70 +++++++++++--------------------------
>>   3 files changed, 37 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 7a8cf1c..5142aeb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -620,7 +620,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>>   				config & DP_DP_HPD_INT_MASK);
>>   }
>>   
>> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
>>   {
>>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>>   				struct dp_catalog_private, dp_catalog);
>> @@ -635,6 +635,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>>   	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>>   }
>>   
>> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
>> +{
>> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
>> +				struct dp_catalog_private, dp_catalog);
>> +
>> +	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>> +
>> +	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
>> +	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
>> +
>> +	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
>> +}
>> +
>>   static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
>>   {
>>   	/* trigger sdp */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 82376a2..38786e8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -104,7 +104,8 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
>>   void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>>   			u32 intr_mask, bool en);
>> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
>> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
>> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>>   u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3e13acdf..69bbc5f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -615,12 +615,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>   		dp->hpd_state = ST_MAINLINK_READY;
>>   	}
>>   
>> -	/* enable HDP irq_hpd/replug interrupt */
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog,
>> -					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>> -					   true);
>> -
>>   	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>>   			dp->dp_display.connector_type, state);
>>   	mutex_unlock(&dp->event_mutex);
>> @@ -658,12 +652,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>   			dp->dp_display.connector_type, state);
>>   
>> -	/* disable irq_hpd/replug interrupts */
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog,
>> -					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>> -					   false);
>> -
>>   	/* unplugged, no more irq_hpd handle */
>>   	dp_del_event(dp, EV_IRQ_HPD_INT);
>>   
>> @@ -687,10 +675,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>   		return 0;
>>   	}
>>   
>> -	/* disable HPD plug interrupts */
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>> -
>>   	/*
>>   	 * We don't need separate work for disconnect as
>>   	 * connect/attention interrupts are disabled
>> @@ -706,10 +690,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>   	/* signal the disconnect event early to ensure proper teardown */
>>   	dp_display_handle_plugged_change(&dp->dp_display, false);
>>   
>> -	/* enable HDP plug interrupt to prepare for next plugin */
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
>> -
>>   	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>>   			dp->dp_display.connector_type, state);
>>   
>> @@ -1082,26 +1062,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   	mutex_unlock(&dp_display->event_mutex);
>>   }
>>   
>> -static void dp_display_config_hpd(struct dp_display_private *dp)
>> -{
>> -
>> -	dp_display_host_init(dp);
>> -	dp_catalog_ctrl_hpd_config(dp->catalog);
>> -
>> -	/* Enable plug and unplug interrupts only if requested */
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog,
>> -				DP_DP_HPD_PLUG_INT_MASK |
>> -				DP_DP_HPD_UNPLUG_INT_MASK,
>> -				true);
>> -
>> -	/* Enable interrupt first time
>> -	 * we are leaving dp clocks on during disconnect
>> -	 * and never disable interrupt
>> -	 */
>> -	enable_irq(dp->irq);
> 
> ...we need dp->irq enabled for handling the other interrupts, otherwise
> e.g. AUX transfers will time out.
> 
> I added enable_irq(dp_priv->irq) to the EV_HPD_INIT_SETUP case below,
> just for testing, and with that the patch seems to be working fine.
> 
> 
> Is there any reason why we need to delay its enablement to after we
> unmask the HPD interrupts?

As I wrote, I'd probably prefer to see enable_irq() and disable_irq() 
calls gone.

> 
> Regards,
> Bjorn
> 
>> -}
>> -
>>   void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
>>   {
>>   	struct dp_display_private *dp;
>> @@ -1176,7 +1136,7 @@ static int hpd_event_thread(void *data)
>>   
>>   		switch (todo->event_id) {
>>   		case EV_HPD_INIT_SETUP:
>> -			dp_display_config_hpd(dp_priv);
>> +			dp_display_host_init(dp_priv);
>>   			break;
>>   		case EV_HPD_PLUG_INT:
>>   			dp_hpd_plug_handle(dp_priv, todo->data);
>> @@ -1394,13 +1354,8 @@ static int dp_pm_resume(struct device *dev)
>>   	/* turn on dp ctrl/phy */
>>   	dp_display_host_init(dp);
>>   
>> -	dp_catalog_ctrl_hpd_config(dp->catalog);
>> -
>> -	if (dp->dp_display.internal_hpd)
>> -		dp_catalog_hpd_config_intr(dp->catalog,
>> -				DP_DP_HPD_PLUG_INT_MASK |
>> -				DP_DP_HPD_UNPLUG_INT_MASK,
>> -				true);
>> +	if (dp_display->is_edp)
>> +		dp_catalog_ctrl_hpd_enable(dp->catalog);
>>   
>>   	if (dp_catalog_link_is_connected(dp->catalog)) {
>>   		/*
>> @@ -1568,7 +1523,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>   
>>   	if (aux_bus && dp->is_edp) {
>>   		dp_display_host_init(dp_priv);
>> -		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
>> +		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>>   		dp_display_host_phy_init(dp_priv);
>>   		enable_irq(dp_priv->irq);
>>   
>> @@ -1801,16 +1756,33 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>   {
>>   	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>   	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>> +
>> +	mutex_lock(&dp->event_mutex);
>> +	dp_catalog_ctrl_hpd_enable(dp->catalog);
>> +
>> +	/* enable HDP interrupts */
>> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
>> +
>> +	enable_irq(dp->irq);
>>   
>>   	dp_display->internal_hpd = true;
>> +	mutex_unlock(&dp->event_mutex);
>>   }
>>   
>>   void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>   {
>>   	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>   	struct msm_dp *dp_display = dp_bridge->dp_display;
>> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>> +
>> +	mutex_lock(&dp->event_mutex);
>> +	/* disable HDP interrupts */
>> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
>> +	dp_catalog_ctrl_hpd_disable(dp->catalog);
>>   
>>   	dp_display->internal_hpd = false;
>> +	mutex_unlock(&dp->event_mutex);
>>   }
>>   
>>   void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>> -- 
>> 2.7.4
>>

-- 
With best wishes
Dmitry

