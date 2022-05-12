Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229015257D6
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 00:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2201310E6EB;
	Thu, 12 May 2022 22:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2740710E6CB;
 Thu, 12 May 2022 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652394845; x=1683930845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wIyAMpReDoJksJb4UrovxYn5FThhQ/yxH84VowG15lg=;
 b=UiliY88qr6Pm2CueZpjhxDhMzQRaSg6WxrV2qz6g8gtdVeX36ux+V37H
 AnPDlGiTtFau6TxiTqzY8blIBcNXWARnzHJZU/f7q16yYdLSUq2UpGOj0
 1rRGI6bo3bGNOPxN7RUiYhe4U702GOVPgXG/yGNKr+Q38Bhx8P1CRa7ss s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 May 2022 15:34:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 15:34:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 15:34:03 -0700
Received: from [10.38.247.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 15:34:00 -0700
Message-ID: <a721e2e9-934e-3028-cb1a-047f6d5c5b1e@quicinc.com>
Date: Thu, 12 May 2022 15:33:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] drm/msm/dsi: don't powerup at modeset time for
 parade-ps8640
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson
 <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
 <dd62b8a7-43b9-364a-a427-94d621648012@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dd62b8a7-43b9-364a-a427-94d621648012@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sean Paul <sean@poorly.run>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Stephen
 Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/12/2022 3:16 PM, Dmitry Baryshkov wrote:
> On 13/05/2022 01:00, Douglas Anderson wrote:
>> Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>> time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
>> chip to fail to turn the display back on after it turns off.
>>
>> Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
>> handle the new power sequence. The Linux driver has almost nothing in
>> it and most of the logic for this bridge chip is in black-box firmware
>> that the bridge chip uses.
>>
>> Also unfortunately, reverting the patch will break "tc358762".
>>
>> The long term solution here is probably Dave Stevenson's series [1]
>> that would give more flexibility. However, that is likely not a quick
>> fix.
>>
>> For the short term, we'll look at the compatible of the next bridge in
>> the chain and go back to the old way for the Parade PS8640 bridge
>> chip. If it's found that other bridge chips also need this workaround
>> then we can add them to the list or consider inverting the condition.
>>
>> [1] 
>> https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com 
>>
>>
>> Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset 
>> time")
>> Suggested-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
Yes, I think this is a better solution than a full revert

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I am curious to know why this doesnt work for parade but will not hold 
this patch back for that. We are initializing and turning on DSI PHY now 
before turning on the bridge chip which is actually better as we are 
putting PHY in a good state.

So this should have been better, but somehow doesnt work.

>> ---
>> Note that, unlike `struct device`, `struct drm_bridge` still has a
>> `#ifdef` around the `of_node`. The extra stub function in this patch
>> is to make sure that we can pass COMPILE_TEST, not because I expect
>> that we'll actually run into real users who are running this driver
>> without device tree.
>>
>> Changes in v4:
>> - Use the compatible string of the next bridge as per Rob.
>>
>> Changes in v3:
>> - No longer a revert; now a module parameter.
>>
>> Changes in v2:
>> - Remove the mud from my face.
>>
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 50b987658b1f..2cabba65a8f1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -34,6 +34,26 @@ static struct msm_dsi_manager msm_dsim_glb;
>>   #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
>>   #define IS_MASTER_DSI_LINK(id)    (msm_dsim_glb.master_dsi_link_id 
>> == id)
>> +#ifdef CONFIG_OF
>> +static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>> +{
>> +    struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
>> +
>> +    /*
>> +     * If the next bridge in the chain is the Parade ps8640 bridge chip
>> +     * then don't power on early since it seems to violate the 
>> expectations
>> +     * of the firmware that the bridge chip is running.
>> +     */
>> +    return !(next_bridge && next_bridge->of_node &&
>> +         of_device_is_compatible(next_bridge->of_node, 
>> "parade,ps8640"));
>> +}
>> +#else
>> +static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>> +{
>> +    return true;
>> +}
>> +#endif
>> +
>>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>>   {
>>       return msm_dsim_glb.dsi[id];
>> @@ -389,6 +409,9 @@ static void dsi_mgr_bridge_pre_enable(struct 
>> drm_bridge *bridge)
>>       if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>           return;
>> +    if (!dsi_mgr_power_on_early(bridge))
>> +        dsi_mgr_bridge_power_on(bridge);
>> +
>>       /* Always call panel functions once, because even for dual panels,
>>        * there is only one drm_panel instance.
>>        */
>> @@ -570,7 +593,8 @@ static void dsi_mgr_bridge_mode_set(struct 
>> drm_bridge *bridge,
>>       if (is_bonded_dsi && other_dsi)
>>           msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>> -    dsi_mgr_bridge_power_on(bridge);
>> +    if (dsi_mgr_power_on_early(bridge))
>> +        dsi_mgr_bridge_power_on(bridge);
>>   }
>>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct 
>> drm_bridge *bridge,
> 
> 
