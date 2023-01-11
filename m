Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26066598B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF010E6FF;
	Wed, 11 Jan 2023 10:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F87010E6FF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:56:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso14035505wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b5rIbeE/vAf3GDKuf7UqIpCoPfBYXzoxfcnleSadSbw=;
 b=jSM/tEBfhLX0w2W809XbJjzc6uSUT7SfQnk8DiNmtAzr+XVZsOusfWL0sB2+8yTV9V
 3SXdlQLOUx95VKyU8pw7t2IE4b9oCWAe+F0BFxpNgFTdo9xGPLe+ljSpeZfizXQvO19t
 KaBZiboDWjzY4SiX3KV1uTgi7IWcC9XRBWkUmGOmee00tmCLJKjl8J+aCW0Cg4Aqw1e/
 8EVXpyfXA0xUiVNtsbQvoSrC9h3AOFWzJPPUZule4hwIQNqO1PZJfg+aKmvN73b1nuFr
 3PCJxpyiM6TUDmO7nI8JW9XgfLsjglTGz/53G/VzPIQqGvqNmCKh8kTX/HYR0q8MJabc
 7a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5rIbeE/vAf3GDKuf7UqIpCoPfBYXzoxfcnleSadSbw=;
 b=Ez25KmIPP5S7ANqrmr0IPWOfGBTe9ErYVLBlC/eiuC1WGU08iHnt6bAg8eNAFWeoR/
 4l3qrEsNUMfDtBh7mWb9CTrIKEMG3w1FZVnn8Qn/0noNFoEpUNbZK423O3Aq+eGv/ZVO
 LZdPstZSJQ393jfuXyXVkOQDgJ59M0TYb9q+YgDHZjnlsBtNQMhQYT8SpZxafAuAbQEY
 XF2yx5H7bXNoc91jIdFPIOSuGvH0x5me4bCqIhbuhZ+PEJSdd+5xhE5Zc2mUHQzl64ZQ
 sAgN33NAyEbB8f1ttSOuYw4hKiD/qO0tIwX+ddjhoIS5yyZJuDJ2GDgEQ8Pdh1qIKQVN
 9TBQ==
X-Gm-Message-State: AFqh2kox/hQdvfoRokwg0+3liflP1ZRZ+aOgI4lA77aWJI2LEoPVaNZy
 sRDfqO9UYCmeSmg/jjS7BYTpfw==
X-Google-Smtp-Source: AMrXdXvdyUV9aCKW6YBikN5TZ7z9CKf6SwIfporWIxWRM8KO9SnyGPvvwdv1wpUx/DvloWSzAL9YJA==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr50934979wmj.12.1673434587691; 
 Wed, 11 Jan 2023 02:56:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5?
 ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003cf894dbc4fsm19361065wmq.25.2023.01.11.02.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:56:27 -0800 (PST)
Message-ID: <4f36d584-d1de-e697-7db7-57066bc14cec@linaro.org>
Date: Wed, 11 Jan 2023 11:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 08/13] drm/bridge: lt9611: attach to the next bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-9-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-9-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> The bindings require that there is a next bridge after the lt9611. If
> nothing else it can be the hdmi-connector (as used on the RB3 platform,
> see sdm845-db845c.dts).
> 
> Bring in the next bridge into the drm bridges chain and attach to it.
> 
> Since lt9611 is not anymore the last bridge in the chain, this also
> allows us to drop all the !DRM_BRIDGE_ATTACH_NO_CONNECTOR functionality.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 99 ++-----------------------
>   1 file changed, 7 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1b65a573be27..773d7a56f86f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -33,7 +34,7 @@
>   struct lt9611 {
>   	struct device *dev;
>   	struct drm_bridge bridge;
> -	struct drm_connector connector;
> +	struct drm_bridge *next_bridge;
>   
>   	struct regmap *regmap;
>   
> @@ -107,11 +108,6 @@ static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>   	return container_of(bridge, struct lt9611, bridge);
>   }
>   
> -static struct lt9611 *connector_to_lt9611(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct lt9611, connector);
> -}
> -
>   static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
>   {
>   	const struct reg_sequence reg_cfg[] = {
> @@ -581,9 +577,9 @@ static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
>   	return NULL;
>   }
>   
> -/* connector funcs */
> -static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
> +static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	unsigned int reg_val = 0;
>   	int connected = 0;
>   
> @@ -596,12 +592,6 @@ static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
>   	return lt9611->status;
>   }
>   
> -static enum drm_connector_status
> -lt9611_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	return __lt9611_detect(connector_to_lt9611(connector));
> -}
> -
>   static int lt9611_read_edid(struct lt9611 *lt9611)
>   {
>   	unsigned int temp;
> @@ -683,30 +673,6 @@ lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>   	return 0;
>   }
>   
> -static int lt9611_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct lt9611 *lt9611 = connector_to_lt9611(connector);
> -	unsigned int count;
> -	struct edid *edid;
> -
> -	lt9611_power_on(lt9611);
> -	edid = drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> -
> -	return count;
> -}
> -
> -static enum drm_mode_status
> -lt9611_connector_mode_valid(struct drm_connector *connector,
> -			    struct drm_display_mode *mode)
> -{
> -	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> -
> -	return lt9611_mode ? MODE_OK : MODE_BAD;
> -}
> -
>   /* bridge funcs */
>   static void
>   lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -784,21 +750,6 @@ lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
>   	}
>   }
>   
> -static struct
> -drm_connector_helper_funcs lt9611_bridge_connector_helper_funcs = {
> -	.get_modes = lt9611_connector_get_modes,
> -	.mode_valid = lt9611_connector_mode_valid,
> -};
> -
> -static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = lt9611_connector_detect,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>   static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   						 struct device_node *dsi_node)
>   {
> @@ -834,44 +785,13 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   	return dsi;
>   }
>   
> -static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
> -{
> -	int ret;
> -
> -	ret = drm_connector_init(bridge->dev, &lt9611->connector,
> -				 &lt9611_bridge_connector_funcs,
> -				 DRM_MODE_CONNECTOR_HDMIA);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(&lt9611->connector,
> -				 &lt9611_bridge_connector_helper_funcs);
> -
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
> -	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
> -
> -	return 0;
> -}
> -
>   static int lt9611_bridge_attach(struct drm_bridge *bridge,
>   				enum drm_bridge_attach_flags flags)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> -	int ret;
> -
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -		ret = lt9611_connector_init(bridge, lt9611);
> -		if (ret < 0)
> -			return ret;
> -	}
>   
> -	return 0;
> +	return drm_bridge_attach(bridge->encoder, lt9611->next_bridge,
> +				 bridge, flags);
>   }
>   
>   static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
> @@ -918,11 +838,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	lt9611_sleep_setup(lt9611);
>   }
>   
> -static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
> -{
> -	return __lt9611_detect(bridge_to_lt9611(bridge));
> -}
> -
>   static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
>   					   struct drm_connector *connector)
>   {
> @@ -995,7 +910,7 @@ static int lt9611_parse_dt(struct device *dev,
>   
>   	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>   
> -	return 0;
> +	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
>   }
>   
>   static int lt9611_gpio_init(struct lt9611 *lt9611)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
