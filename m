Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6ED65ECA2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239410E710;
	Thu,  5 Jan 2023 13:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D92F10E710
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:16:14 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f34so54901474lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JxxqW2U4VV6Fh7w9J7Z3fimLOgBH/JK80j7RpKFTc0s=;
 b=PTD+Rt+3JSezzXjzDA6SPux9bO6VcdDD8B2UgufvaMXU3gdVRYcPaslvOzToI9taoV
 WAzYP6ZU2BVVl6y0U6c/lxb7XMIp3KC9LOyYTzs7WFpTu2XSyJKULd04UAMcecEvZGPc
 8WMunjDLIltqmrGC+q2GTZ8ZvlrrBfyd4aYv5D728gGh4DTTZ6InRTDX1N16v2LjkJFO
 SYeTQp73rcmExGawY3JyaASMUhtjV6KmGmx8eO5wGfMRO7cX1KJ1gThqY76yARojMNa2
 sZL918uFGQcoBmSeWxfluV9RNSLALNZ1iriTGu1mE5oCjv6gPw6qfidt4XlfeDrduZ/S
 PaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JxxqW2U4VV6Fh7w9J7Z3fimLOgBH/JK80j7RpKFTc0s=;
 b=Ba5wH080kzJZHIVi0Cp5tkmXHqikJu7i8Rs6cmOBS9ioyWr51n+rmGEoiNVtMNmYlU
 lGfP+ybRd5Gh7k6qwKsJkhrCjT0WylZVP8J1onGENfs+Gt1SAT7w+8FhPHLIV7bU5mg4
 Z4L3KQibtnkaB+fV9cjNqTX+st9QWEVUzo4SexhJN4RfajQbDr6Xk7FzVR6PLgff6mNf
 fQX88VdvsvjZWG9MIBLNTnHLKs5eLun2lVJlRXVg2LIjN9fyxXrGADzLXDqBo1Kc03o7
 KT9TOCkpHneP5tNCDpuxZ8yH9iAxaszOxJ2Nc08/3y18Npd9JEshbi1wvByeF7BjkgnK
 nF2w==
X-Gm-Message-State: AFqh2kp7Kb4VZ2SJ4hr8tDxIRAgNOl1RLVw14OvRwopiDlb18mHCcBpn
 4n0Nuh+rnb4kIHdisRMj4go1FA==
X-Google-Smtp-Source: AMrXdXvbg2vxFXLTao4kRQnA/Il84ArFmU6NTMdpRsur7+pI2j1P8LoLMHueA5P1bWzcYWx6nOx5tw==
X-Received: by 2002:ac2:4c8e:0:b0:4b6:ee97:36d2 with SMTP id
 d14-20020ac24c8e000000b004b6ee9736d2mr14003242lfl.40.1672924572561; 
 Thu, 05 Jan 2023 05:16:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o5-20020ac24e85000000b004c2e1d7d9a3sm5469102lfr.146.2023.01.05.05.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 05:16:12 -0800 (PST)
Message-ID: <47cd5078-f994-e05a-624c-4e221dc74294@linaro.org>
Date: Thu, 5 Jan 2023 15:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 08/15] drm/bridge: add psr support for panel bridge
 callbacks
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
 <1671012352-1825-9-git-send-email-quic_vpolimer@quicinc.com>
 <Y7bMcLHr79uhfJv2@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y7bMcLHr79uhfJv2@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 15:11, Daniel Vetter wrote:
> On Wed, Dec 14, 2022 at 03:35:45PM +0530, Vinod Polimera wrote:
>> This change will handle the psr entry exit cases in the panel
>> bridge atomic callback functions. For example, the panel power
>> should not turn off if the panel is entering psr.
>>
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> I think this is all a nice integration of the sr helpers and bridge stuff
> and makes sense to me. For the 2 bridge patches and the drm core atomic
> patch:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thank you! I was looking at the patchset and wondering if anybody from 
drm core can actually review the core bits.

Could you please send all r-b letters, so that we don't loose them when 
applying the patches from patchwork?

> 
>> ---
>>   drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
>> index 3558cbf..5e77e38 100644
>> --- a/drivers/gpu/drm/bridge/panel.c
>> +++ b/drivers/gpu/drm/bridge/panel.c
>> @@ -113,6 +113,18 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>   				struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
>> +	struct drm_encoder *encoder = bridge->encoder;
>> +	struct drm_crtc *crtc;
>> +	struct drm_crtc_state *old_crtc_state;
>> +
>> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
>> +	if (!crtc)
>> +		return;
>> +
>> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
>> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
>> +		return;
>>   
>>   	drm_panel_prepare(panel_bridge->panel);
>>   }
>> @@ -121,6 +133,18 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
>>   				struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
>> +	struct drm_encoder *encoder = bridge->encoder;
>> +	struct drm_crtc *crtc;
>> +	struct drm_crtc_state *old_crtc_state;
>> +
>> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
>> +	if (!crtc)
>> +		return;
>> +
>> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
>> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
>> +		return;
>>   
>>   	drm_panel_enable(panel_bridge->panel);
>>   }
>> @@ -129,6 +153,18 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
>>   				struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
>> +	struct drm_encoder *encoder = bridge->encoder;
>> +	struct drm_crtc *crtc;
>> +	struct drm_crtc_state *new_crtc_state;
>> +
>> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
>> +	if (!crtc)
>> +		return;
>> +
>> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
>> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
>> +		return;
>>   
>>   	drm_panel_disable(panel_bridge->panel);
>>   }
>> @@ -137,6 +173,18 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>   				struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
>> +	struct drm_encoder *encoder = bridge->encoder;
>> +	struct drm_crtc *crtc;
>> +	struct drm_crtc_state *new_crtc_state;
>> +
>> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
>> +	if (!crtc)
>> +		return;
>> +
>> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
>> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
>> +		return;
>>   
>>   	drm_panel_unprepare(panel_bridge->panel);
>>   }
>> -- 
>> 2.7.4
>>
> 

-- 
With best wishes
Dmitry

