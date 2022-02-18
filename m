Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E04BC217
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BA810E77F;
	Fri, 18 Feb 2022 21:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE7410E77F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 21:31:05 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id bx31so6240926ljb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 13:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jMrlrPPu5JrnxUwtAm4jm+Rx+SKLzI9mI5078eEOKyI=;
 b=clzAsMzZ+XasH91nyzp+lVc8ppcv5OGyAEoEtesJnL2MpHA0b0JY6kK5uLqsIPyWIN
 AXt8vwr4wLq8rHwHpBlUNPduDhezN6sbgGPQ/mA0knmxAJTWUneFqFyH8KFd0Cab880k
 rltyLulFz7nSFpt2EjU3xI/5U4ri53AutdYBVCmos1wJVXdUPqO5qFjiRATC4tOp9XBH
 SHhqjOj9VqN5x5S6mnto4ciVANmQ0+iKglShih0ZGEvZUALggObVK3vwdDEuZfgdDErh
 X0RiUMGm1O/VLFdyb8BZa3YiT08VucQILNViZlMCYapmImPH+zjJWxMdZ05VUulGwGKz
 MlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jMrlrPPu5JrnxUwtAm4jm+Rx+SKLzI9mI5078eEOKyI=;
 b=gGbaeZ/wKy01r98TFAxdJWHtilTsygdW4vRosNgu4P5VBxrxQX8fBFyMwDqMoQ16kU
 slESI1DW89hwJZ7din3Iu2yCjYj4cVv4WkpKwCbWW9ClUhaVmybRVmDqqo8kqdzHQGsw
 oMdNVwdzeI3VS24MskavbDC/jFCq5b3/jkJ96zDQ/dfZWm+V7XNB3omzuCqFhj8s4tD5
 dy1CghuOdvJa14cvgpYvc94nTogmifaPly3VHIDYpjq828MhbdI5xY9Xv806VShaspy2
 SYLt0xYE5nRoqZZGzVY1ZLJ6wqJUDq8WIIdvgcrl5TeL3Bm6BFvaaQ7x709Ao1pL15AK
 T06Q==
X-Gm-Message-State: AOAM530SLqqNR1NdJLZ9DaIgCG2andxe7DFRhkbIcyJvYVJpPKMIADJd
 UXoFMPP4YKb5pAXbJWSVY+sSlw==
X-Google-Smtp-Source: ABdhPJyN/Hp5jK6jCZgYMEkSTVwZRIvAV5Eqq9BxGzkQYgtotAf4AGlaWKNSAlIOhHZZUDW5aY6SiA==
X-Received: by 2002:a2e:bd82:0:b0:241:130d:90b3 with SMTP id
 o2-20020a2ebd82000000b00241130d90b3mr6870855ljq.383.1645219863661; 
 Fri, 18 Feb 2022 13:31:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z26sm442648lja.139.2022.02.18.13.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 13:31:03 -0800 (PST)
Message-ID: <067554a1-4def-674d-137f-b13bed6ac810@linaro.org>
Date: Sat, 19 Feb 2022 00:31:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 2/5] drm/msm/dp: support attaching bridges to the
 DP encoder
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
 <013284ad-11c7-e21c-3ca4-0e8b7b804b98@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <013284ad-11c7-e21c-3ca4-0e8b7b804b98@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2022 00:28, Kuogee Hsieh wrote:
> 
> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
>> Currently DP driver will allocate panel bridge for eDP panels. This
>> supports only the following topology:
>>
>> - eDP encoder ⇒ eDP panel (wrapped using panel-bridge)
>>
>> Simplify this code to just check if there is any next bridge in the
>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
>> field to next_bridge accordingly.
>>
>> This allows one to use e.g. one of the following display topologies:
>>
>> - eDP encoder ⇒ ptn3460 ⇒ fixed LVDS panel
>> - eDP encoder ⇒ ptn3460 ⇒ LVDS connector with EDID lines for panel 
>> autodetect
>> - eDP encoder ⇒ ptn3460 ⇒ THC63LVD1024 ⇒ DPI panel.
>> - eDP encoder ⇒ LT8912 ⇒ DSI panel
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

The Tested-by got hidden by the quotation symbols. Could you please send 
another one?

> 
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 31 +++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>>   5 files changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 44d42c76c2a3..45f9a912ecc5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -266,7 +266,7 @@ static int dp_display_bind(struct device *dev, 
>> struct device *master,
>>           goto end;
>>       }
>> -    dp->dp_display.panel_bridge = dp->parser->panel_bridge;
>> +    dp->dp_display.next_bridge = dp->parser->next_bridge;
>>       dp->aux->drm_dev = drm;
>>       rc = dp_aux_register(dp->aux);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>> b/drivers/gpu/drm/msm/dp/dp_display.h
>> index e3adcd578a90..7af2b186d2d9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -16,7 +16,7 @@ struct msm_dp {
>>       struct drm_bridge *bridge;
>>       struct drm_connector *connector;
>>       struct drm_encoder *encoder;
>> -    struct drm_bridge *panel_bridge;
>> +    struct drm_bridge *next_bridge;
>>       bool is_connected;
>>       bool audio_enabled;
>>       bool power_on;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index 26ef41a4c1b6..80f59cf99089 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -236,9 +236,9 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>> msm_dp *dp_display, struct drm_devi
>>           return ERR_PTR(rc);
>>       }
>> -    if (dp_display->panel_bridge) {
>> +    if (dp_display->next_bridge) {
>>           rc = drm_bridge_attach(dp_display->encoder,
>> -                    dp_display->panel_bridge, bridge,
>> +                    dp_display->next_bridge, bridge,
>>                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>           if (rc < 0) {
>>               DRM_ERROR("failed to attach panel bridge: %d\n", rc);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c 
>> b/drivers/gpu/drm/msm/dp/dp_parser.c
>> index a7acc23f742b..901d7967370f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> @@ -265,23 +265,16 @@ static int dp_parser_clock(struct dp_parser 
>> *parser)
>>       return 0;
>>   }
>> -static int dp_parser_find_panel(struct dp_parser *parser)
>> +static int dp_parser_find_next_bridge(struct dp_parser *parser)
>>   {
>>       struct device *dev = &parser->pdev->dev;
>> -    struct drm_panel *panel;
>> -    int rc;
>> +    struct drm_bridge *bridge;
>> -    rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> -    if (rc) {
>> -        DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
>> -        return rc;
>> -    }
>> +    bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +    if (IS_ERR(bridge))
>> +        return PTR_ERR(bridge);
>> -    parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>> -    if (IS_ERR(parser->panel_bridge)) {
>> -        DRM_ERROR("failed to create panel bridge\n");
>> -        return PTR_ERR(parser->panel_bridge);
>> -    }
>> +    parser->next_bridge = bridge;
>>       return 0;
>>   }
>> @@ -307,10 +300,18 @@ static int dp_parser_parse(struct dp_parser 
>> *parser, int connector_type)
>>       if (rc)
>>           return rc;
>> +    /*
>> +     * Currently we support external bridges only for eDP connectors.
>> +     *
>> +     * No external bridges are expected for the DisplayPort connector,
>> +     * it is physically present in a form of a DP or USB-C connector.
>> +     */
>>       if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>> -        rc = dp_parser_find_panel(parser);
>> -        if (rc)
>> +        rc = dp_parser_find_next_bridge(parser);
>> +        if (rc) {
>> +            DRM_ERROR("DP: failed to find next bridge\n");
>>               return rc;
>> +        }
>>       }
>>       /* Map the corresponding regulator information according to
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h 
>> b/drivers/gpu/drm/msm/dp/dp_parser.h
>> index 3172da089421..4cec851e38d9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>> @@ -123,7 +123,7 @@ struct dp_parser {
>>       struct dp_display_data disp_data;
>>       const struct dp_regulator_cfg *regulator_cfg;
>>       u32 max_dp_lanes;
>> -    struct drm_bridge *panel_bridge;
>> +    struct drm_bridge *next_bridge;
>>       int (*parse)(struct dp_parser *parser, int connector_type);
>>   };


-- 
With best wishes
Dmitry
