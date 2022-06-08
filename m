Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFD542E9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCFD10E5E0;
	Wed,  8 Jun 2022 11:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104BB10E6DF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 11:02:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w20so10995256lfa.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BvBZPVygyJcT2prfa390I5uoRjeo+woBfMyQZ+G7pKY=;
 b=S38yNYkYh4T3slCOP2DohGMEzxcV+VnFQ9g3t297fP9+TjC7WIBBbzMF+x0EbDIiZX
 r11O/YQ+QyHYLq7LIaCf5Cfz1S8DIrU7njSBnq1q3efwXOEMZJ7tREKvYmVMMHyIsD3D
 GMm8ZPCyhEv0vxnOGuQfpEcE5wqDDTOqj73CK4MTzLOkGGUpch0viVC7E+ldOkHz7UZQ
 2GEHcoFPa5uRXPeFWJv5DP1PkpuC4kHbomjZ7mesVJ57xQUesBFS1Xdyk7hTtDDhsUId
 v6sAOxHZdc8lK70hS8Xmhq5dyL91bhBGXZy5OW6gJ7mvzkS2Uc1io3tEbRymVQIp7nC5
 RdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BvBZPVygyJcT2prfa390I5uoRjeo+woBfMyQZ+G7pKY=;
 b=Vhe7/dsGRLwat3255HKW9xDuqxvz3t2S363fdJfp/gAI5yEY7N9Gp0SyW0onQaDbhL
 1fNqF6qK8ob2y0hiWHT81fNLmTjj7JNc++ypWHjmtFbSr1QQdZeRVsAgQvwV76ACfW2N
 V5qMQSXSZiDiyItK+E6SjQmDhG426ZN9suNK/1VuXurSI4Nq4KtL831pkxz47G/+/JxT
 6OiZlfm2oU2NDe21HCmASLz9Tl5SopWqPfRDVMboMN+zqUi8c6pZh+zDOiqzYfnHHor+
 2YXLMAwMAxV14CgSjoy+wOJZl5AK4TUBPU8+g6+IJmLrLIPyAYPOENoezMNJpHUDHkOi
 XzwQ==
X-Gm-Message-State: AOAM5315SOB1eGvRHAZpXNNFYMBm/pfsmwUcgZtwhQzXRuR+a35iwrja
 UXIIRE/DTaUie3e4MvN+3MCErA==
X-Google-Smtp-Source: ABdhPJxT6EySccY8IPXbnEyf/0zo0EwCXMBgScPXKOahE4jTsFCJEEpmDIlHWoE4lB3X6E9Mi//NGQ==
X-Received: by 2002:a05:6512:b85:b0:478:ff6e:a1af with SMTP id
 b5-20020a0565120b8500b00478ff6ea1afmr21733435lfv.248.1654686128330; 
 Wed, 08 Jun 2022 04:02:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a19645e000000b00478b5004fe9sm3600107lfj.250.2022.06.08.04.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:02:07 -0700 (PDT)
Message-ID: <bc24a3d5-8468-8fa3-c616-eb513fdccd73@linaro.org>
Date: Wed, 8 Jun 2022 14:02:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V2 3/4] drm/panel: Add prepare_upstream_first flag to
 drm_panel
Content-Language: en-GB
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, andrzej.hajda@gmail.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2022 18:17, Dave Stevenson wrote:
> Mapping to the drm_bridge flag pre_enable_upstream_first,
> add a new flag prepare_upstream_first to drm_panel to allow
> the panel driver to request that the upstream bridge should
> be pre_enabled before the panel prepare.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/bridge/panel.c |  3 +++
>   include/drm/drm_panel.h        | 10 ++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 5be057575183..2ea08b3ba326 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>   	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
>   	panel_bridge->bridge.type = connector_type;
>   
> +	panel_bridge->bridge.pre_enable_upstream_first =
> +						panel->prepare_upstream_first;
> +
>   	drm_bridge_add(&panel_bridge->bridge);
>   
>   	return &panel_bridge->bridge;
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 1ba2d424a53f..c0f39dfbd071 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -179,6 +179,16 @@ struct drm_panel {
>   	 * Panel entry in registry.
>   	 */
>   	struct list_head list;
> +
> +	/**
> +	 * @prepare_upstream_first:
> +	 *
> +	 * The upstream controller should be prepared first, before the prepare
> +	 * for the panel is called. This is largely required for DSI panels
> +	 * where the DSI host controller should be initialised to LP-11 before
> +	 * the panel is powered up.
> +	 */
> +	bool prepare_upstream_first;
>   };
>   
>   void drm_panel_init(struct drm_panel *panel, struct device *dev,


-- 
With best wishes
Dmitry
