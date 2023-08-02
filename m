Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE376D72F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E30B10E56E;
	Wed,  2 Aug 2023 18:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7C10E56F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:51:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so72303a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691002277; x=1691607077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RCZLkToae8HL/gFbPITWXu017CVf8yll8/Ph2yV1gks=;
 b=LLaJKHTScW1OzORT7eJ90XsCAveSMO3hgLq4BhDjo5rFyd+zY48YP54sl+LgglI2T2
 DIPcYmbsIsfIPktFOeJWDTXhpVMK8leXyQa1JOuxC+SAZkcLoUb35Vi4qGa0MRY13iBb
 KMBUOznC5Lr9+iRZsSy/Ur41pIlA2nXd7Q5978Z9TVMKq6+Fb5bQf9iThsS19Oe9b1y3
 NCzFUPKDd+2v/YzTuleIsCczy/Px2mIV0I0fIYRhjPVPGrSBInasEbtjT339c8zq6619
 WCBupX6moTa54Odj9Qu6H1ucnExqf4bYgtBbpeqpgL5xuiIl2qQANNVbx2W1Ug52sIKa
 OIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691002277; x=1691607077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RCZLkToae8HL/gFbPITWXu017CVf8yll8/Ph2yV1gks=;
 b=cVF+7+WzHPkNrsJY9+Ye6YnHJXF9KbzLxg4H9a+7JPJk8p4DEivoEVDQHNX7dD+EEf
 LpzqnPGb+kfzpyd+nS9pd3T/7KrEPMI30Ezxi3uypSlpnjDUrlZUiBiRq2f3ehathCFJ
 TnwT/CRLelvZEfBONBQKYamUm3RmZC76z8N6KYFVO+p3dHhIJ48aFDhTIAvapPN69rNn
 WXK4QkIt+dK2f9G8m5nbJoDJQvWj1diSZ+PKkj2C+gSYkj0l2oVBOP0U7ZCbzAFT3qKO
 yzWrM1wKNBanMyVQeLHzRcgDPswcITlYgEwTwlz9w1Z2uiCsv1o1eJzcm0aEI6HsvBj0
 kDHw==
X-Gm-Message-State: ABy/qLa+ljyvG9SjJCLTVg0/1jNyrrA5Cldbks1m+dsEJIrqtpjTISYJ
 vc3Pc+1cs3kDtn2xEUdZ8+qV7w==
X-Google-Smtp-Source: APBJJlFjCx8kfwFZvnJkNHp2O2anUpJ/yeTbP3psosO7PM0zLVpeLW1pMmnOeSIkXwO7X4DYFdRRfQ==
X-Received: by 2002:aa7:dad2:0:b0:522:1fd1:1035 with SMTP id
 x18-20020aa7dad2000000b005221fd11035mr5209756eds.6.1691002277001; 
 Wed, 02 Aug 2023 11:51:17 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052284228e3bsm9004448edb.8.2023.08.02.11.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 11:51:16 -0700 (PDT)
Message-ID: <5464f068-d157-36b3-a1f1-a92ca993511a@linaro.org>
Date: Wed, 2 Aug 2023 21:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] drm/bridge-connector: handle subconnector types
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
 <0cc04d99-d7aa-68ff-b304-7d42ae7f0dde@linaro.org>
 <CAA8EJpoMC-YbWvyfCsdAHOL9aw3nfQ=g8BgLp2mb9iozeRgBpg@mail.gmail.com>
 <20230802184622.GA32500@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802184622.GA32500@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 21:46, Laurent Pinchart wrote:
> On Wed, Aug 02, 2023 at 12:05:50PM +0300, Dmitry Baryshkov wrote:
>> On Wed, 2 Aug 2023 at 11:35, Neil Armstrong wrote:
>>> On 29/07/2023 02:49, Dmitry Baryshkov wrote:
>>>> If the created connector type supports subconnector type property,
>>>> create and attach corresponding it. The default subtype value is 0,
>>>> which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/drm_bridge_connector.c | 33 +++++++++++++++++++++++++-
>>>>    include/drm/drm_bridge.h               |  4 ++++
>>>>    2 files changed, 36 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>>>> index 07b5930b1282..a7b92f0d2430 100644
>>>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>>>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>>>> @@ -329,7 +329,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>>>        struct drm_connector *connector;
>>>>        struct i2c_adapter *ddc = NULL;
>>>>        struct drm_bridge *bridge, *panel_bridge = NULL;
>>>> +     enum drm_mode_subconnector subconnector;
>>>>        int connector_type;
>>>> +     int ret;
>>>>
>>>>        bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>>>>        if (!bridge_connector)
>>>> @@ -365,8 +367,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>>>                if (bridge->ops & DRM_BRIDGE_OP_MODES)
>>>>                        bridge_connector->bridge_modes = bridge;
>>>>
>>>> -             if (!drm_bridge_get_next_bridge(bridge))
>>>> +             if (!drm_bridge_get_next_bridge(bridge)) {
>>>>                        connector_type = bridge->type;
>>>> +                     subconnector = bridge->subtype;
>>>> +             }
>>>>
>>>>    #ifdef CONFIG_OF
>>>>                if (!drm_bridge_get_next_bridge(bridge) &&
>>>> @@ -399,6 +403,33 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>>>        if (panel_bridge)
>>>>                drm_panel_bridge_set_orientation(connector, panel_bridge);
>>>>
>>>> +     if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
>>>> +             drm_connector_attach_dp_subconnector_property(connector, subconnector);
>>>> +     } else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
>>>> +             ret = drm_mode_create_dvi_i_properties(drm);
>>>> +             if (ret)
>>>> +                     return ERR_PTR(ret);
>>>> +
>>>> +             drm_object_attach_property(&connector->base,
>>>> +                                        drm->mode_config.dvi_i_subconnector_property,
>>>> +                                        subconnector);
>>>> +     } else if (connector_type == DRM_MODE_CONNECTOR_TV) {
>>>> +             ret = drm_mode_create_tv_properties(drm,
>>>> +                                                 BIT(DRM_MODE_TV_MODE_NTSC) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_NTSC_443) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_NTSC_J) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_PAL) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_PAL_M) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_PAL_N) |
>>>> +                                                 BIT(DRM_MODE_TV_MODE_SECAM));
>>>> +             if (ret)
>>>> +                     return ERR_PTR(ret);
>>>
>>> I don't think this is right, this should be called from the appropriate encoder
>>> device depending on the analog tv mode capabilities.
>>
>> Good question. My logic was the following: the DRM device can have
>> different TV out ports with different capabilities (yeah, pure
>> theoretical construct). In this case it might be impossible to create
>> a single subset of values. Thus it is more correct to create the
>> property listing all possible values. The property is immutable anyway
>> (and so the user doesn't have control over the value).
> 
> Those ports would correspond to different connectors, so I agree with
> Neil, I don't think it's right to create a single property with all
> modes and attach it to all analog output connectors.

I agree that this case is mishandled currently (as current design 
assumes a single property that fits for the complete device).

> 
> If you want to support multiple analog outputs that have different
> capabilities, this will need changes to drm_mode_create_tv_properties()
> to allow creating multiple properties. If you don't want to do so now,
> and prefer limiting support to devices where all ports support the same
> modes (which includes devices with a single analog output), then the
> modes should reflect what the device supports.

Ack, I'll drop the create call and check for the property existence 
before attaching it.

> 
>>>> +
>>>> +             drm_object_attach_property(&connector->base,
>>>> +                                        drm->mode_config.tv_subconnector_property,
>>>> +                                        subconnector);
>>>
>>> Here, only add the property if drm->mode_config.tv_subconnector_property exists,
>>> and perhaps add a warning if not.
>>
>> This property is created in the previous call,
>> drm_mode_create_tv_properties() ->
>> drm_mode_create_tv_properties_legacy().
>>
>>> AFAIK same for DRM_MODE_CONNECTOR_DVII.
>>>
>>>> +     }
>>>> +
>>>>        return connector;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
>>>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>>>> index bf964cdfb330..68b14ac5ac0d 100644
>>>> --- a/include/drm/drm_bridge.h
>>>> +++ b/include/drm/drm_bridge.h
>>>> @@ -739,6 +739,10 @@ struct drm_bridge {
>>>>         * identifies the type of connected display.
>>>>         */
>>>>        int type;
>>>> +     /**
>>>> +      * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
>>>> +      */
>>>> +     enum drm_mode_subconnector subtype;
>>>>        /**
>>>>         * @interlace_allowed: Indicate that the bridge can handle interlaced
>>>>         * modes.
> 

-- 
With best wishes
Dmitry

