Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73E76C869
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ADD10E521;
	Wed,  2 Aug 2023 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3502D10E51E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:35:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so60965995e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690965335; x=1691570135;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nccZbYTMU4XTf23zmFShAvmIVZGTF6OsvwBuFhpeRho=;
 b=VceW1/4XR3qfn1OXNxtGph2jHwFibPUVVAizdg1jakOV5F5Q30U5eQoTvAn8iDzqhi
 cv0wWmGEPoz6r0wJNIMwCQUKxxt/kRbBO+1LzUPftOa9R7oAqb6JG/fp3Q4CcjUj4qRg
 rfqa5FokTBYph18P2HoJeGnVaVrhT6Qyk12nru6x56gl/49oYMrqATX0imvikoNh3YsN
 7q9kPjjgTjuVnj9iZHQre67sp9jGaxNCB7ndfU97DzWvxUj36Rvmk/n9MajCd8clQ1Ll
 XttH7oi4DHtPtOljJzyGguIGIhbuAZCJOZDulHwag8DNkPLbQ2IKIxsI/BLt/l4l9hvK
 76XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690965335; x=1691570135;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nccZbYTMU4XTf23zmFShAvmIVZGTF6OsvwBuFhpeRho=;
 b=BgwsNGP8aS3evIQwnNZI0pt1g6q0oWbCjJpFzuSFnJjc4SFO1mRkz77e0MElnWJD9U
 aD7WG2Epw1MKiQfOCgJ/C4Rrpf4OeXUNMkqo6DVftq6VptqsNecwkn07kFHtIBrVAtMy
 Jz+MpDEdIDTfkSBduNXn3mAwJj0gi3f963i0fCOKXEFdztlLSvCVpYW97fn2xOXDLcSQ
 HPk+NPdlKchUPR2rkB4lgJdA+D6z/JmYeAnVS2v5lBaRnqaNhyeL/8TAR4JlLMnX7iUB
 8e6dmuEg402iHfdXr5ksjy9HKF0R0YkhSEjNxmj8ga0p/vzTecQVYFvPIW5Rr6JbItWA
 iGiQ==
X-Gm-Message-State: ABy/qLanFamWXSRDqpPH9cm1qFrA5wbnO/G4+ZpTMh4owbSeUYuC7DoM
 fe2At43eElyzscf0R5Ss2V9MSw==
X-Google-Smtp-Source: APBJJlHKiU3bwvuZX7xt9EgDuBghAyqLtwE3u4kuH22Jpbiud0K34hpThBOwveiNjNYxwIVj9kt+8A==
X-Received: by 2002:a7b:c5c6:0:b0:3fa:9823:407 with SMTP id
 n6-20020a7bc5c6000000b003fa98230407mr4014627wmk.18.1690965335583; 
 Wed, 02 Aug 2023 01:35:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b003145559a691sm18257513wrs.41.2023.08.02.01.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:35:34 -0700 (PDT)
Message-ID: <0cc04d99-d7aa-68ff-b304-7d42ae7f0dde@linaro.org>
Date: Wed, 2 Aug 2023 10:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/bridge-connector: handle subconnector types
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Simon Ser <contact@emersion.fr>,
 Janne Grunau <j@jannau.net>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/07/2023 02:49, Dmitry Baryshkov wrote:
> If the created connector type supports subconnector type property,
> create and attach corresponding it. The default subtype value is 0,
> which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_bridge_connector.c | 33 +++++++++++++++++++++++++-
>   include/drm/drm_bridge.h               |  4 ++++
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 07b5930b1282..a7b92f0d2430 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -329,7 +329,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	struct drm_connector *connector;
>   	struct i2c_adapter *ddc = NULL;
>   	struct drm_bridge *bridge, *panel_bridge = NULL;
> +	enum drm_mode_subconnector subconnector;
>   	int connector_type;
> +	int ret;
>   
>   	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>   	if (!bridge_connector)
> @@ -365,8 +367,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>   			bridge_connector->bridge_modes = bridge;
>   
> -		if (!drm_bridge_get_next_bridge(bridge))
> +		if (!drm_bridge_get_next_bridge(bridge)) {
>   			connector_type = bridge->type;
> +			subconnector = bridge->subtype;
> +		}
>   
>   #ifdef CONFIG_OF
>   		if (!drm_bridge_get_next_bridge(bridge) &&
> @@ -399,6 +403,33 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (panel_bridge)
>   		drm_panel_bridge_set_orientation(connector, panel_bridge);
>   
> +	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		drm_connector_attach_dp_subconnector_property(connector, subconnector);
> +	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
> +		ret = drm_mode_create_dvi_i_properties(drm);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		drm_object_attach_property(&connector->base,
> +					   drm->mode_config.dvi_i_subconnector_property,
> +					   subconnector);
> +	} else if (connector_type == DRM_MODE_CONNECTOR_TV) {
> +		ret = drm_mode_create_tv_properties(drm,
> +						    BIT(DRM_MODE_TV_MODE_NTSC) |
> +						    BIT(DRM_MODE_TV_MODE_NTSC_443) |
> +						    BIT(DRM_MODE_TV_MODE_NTSC_J) |
> +						    BIT(DRM_MODE_TV_MODE_PAL) |
> +						    BIT(DRM_MODE_TV_MODE_PAL_M) |
> +						    BIT(DRM_MODE_TV_MODE_PAL_N) |
> +						    BIT(DRM_MODE_TV_MODE_SECAM));
> +		if (ret)
> +			return ERR_PTR(ret);

I don't think this is right, this should be called from the appropriate encoder
device depending on the analog tv mode capabilities.


> +
> +		drm_object_attach_property(&connector->base,
> +					   drm->mode_config.tv_subconnector_property,
> +					   subconnector);

Here, only add the property if drm->mode_config.tv_subconnector_property exists,
and perhaps add a warning if not.

AFAIK same for DRM_MODE_CONNECTOR_DVII.

> +	}
> +
>   	return connector;
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bf964cdfb330..68b14ac5ac0d 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -739,6 +739,10 @@ struct drm_bridge {
>   	 * identifies the type of connected display.
>   	 */
>   	int type;
> +	/**
> +	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
> +	 */
> +	enum drm_mode_subconnector subtype;
>   	/**
>   	 * @interlace_allowed: Indicate that the bridge can handle interlaced
>   	 * modes.

