Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53407BB233
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979C10E23E;
	Fri,  6 Oct 2023 07:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A88110E23E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:35:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c296e6543fso22070841fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696577733; x=1697182533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :reply-to:references:cc:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1qth83Lx3XnUC3WxpmEp5nWZN0mL51vTQbaki9e5Uro=;
 b=dhwbcCCSdStCmGvi/qe8ttJp07lSbvLNlhTVMqiwx3e0yDe1BxJmipcqZlhHNq9G4x
 iuA047soKN3MgtMmzhnJKkTBG2eYpqON8ufw/jX5TIwHnqouirP60GTPvMBhWXfvaVSl
 cFIDTTJh/rh95yVlHKQe1J1cYw2sSpjIatweE1ytvph4O7t3EGDm6/0bqTRqOVJQx/9P
 0MDfpTRl5N9VOzVkHqtsyrsfG1GhZ+vsaxj1tMxBeWUORK3gBRBHO7DFntmbDRsxFjBo
 wwVczLwusTDGQsZqbsarOLTGFQxa4GfZeYlkO7tXHMIl2ihpBCXwiuGysfZBndOKfBZa
 OkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696577733; x=1697182533;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :reply-to:references:cc:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1qth83Lx3XnUC3WxpmEp5nWZN0mL51vTQbaki9e5Uro=;
 b=i1/tfJWtbH9N/cVKaUCiaukNOL2sW2ImSFzEXmW6kKyM2Mpc5Nbzz2m7sfNhMlDb7B
 J8BNIjh7xVqVU7hwZBoxXfiX0HEdkqVTMcF6M9e+6U5kNpEjWv8en5z8R3R283IYwjUb
 NOOwSG9IBXMA5/CWDdfrKRWp0qI5l5Fj5WdwG2esbjaE5/pla8XvR6uBRU3SMMBzIHC7
 fzPKx9561Chf2LdiEY8pX7XZvmiCLbClVonEGKl6IY9J95Ki+Cga51KfJsbBG7ZpyrZc
 ibiBczPxiWZL7pJ2uvNfi/z5yjFj3cDdEZ21tqxz9RSlqh74ggLLTeUAhGIx/t0GAIYR
 oPkA==
X-Gm-Message-State: AOJu0Yx/5LwcY+z1laM/3LFBPBg9m/g4H/2myi958iIMfkw2EMDiVOVw
 i66nlUCL6LHv8CDcVdzqOezJBw==
X-Google-Smtp-Source: AGHT+IEyCksFHWf0SteNmeR++/ya/QjHEetgCPrqfmLVHrFz9Yspwj9zDdfcSDBBR+Hu1VmFBuQN+A==
X-Received: by 2002:a05:6512:3da8:b0:4f8:714e:27a8 with SMTP id
 k40-20020a0565123da800b004f8714e27a8mr8248699lfv.0.1696577733236; 
 Fri, 06 Oct 2023 00:35:33 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00406847c988asm5306967wmb.12.2023.10.06.00.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 00:35:32 -0700 (PDT)
Message-ID: <11a07867-8799-479f-b5b6-e3fd9bb31dbc@linaro.org>
Date: Fri, 6 Oct 2023 09:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/bridge: migrate bridge_chains to per-encoder file
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
 <20230904015338.2941417-3-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230904015338.2941417-3-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/09/2023 03:53, Dmitry Baryshkov wrote:
> Instead of having a single file with all bridge chains, list bridges
> under a corresponding per-encoder debugfs directory.
> 
> Example of the listing:
> 
> $ cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dsi_mgr_bridge_funcs
> 	type: [0] Unknown
> 	ops: [0]
> bridge[1]: lt9611uxc_bridge_funcs
> 	type: [11] HDMI-A
> 	OF: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
> 	ops: [7] detect edid hpd
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
>   drivers/gpu/drm/drm_debugfs.c | 39 ++++++++++++++++++++++++++++---
>   include/drm/drm_bridge.h      |  2 --
>   3 files changed, 36 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 39e68e45bb12..cee3188adf3d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1347,50 +1347,6 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>   EXPORT_SYMBOL(of_drm_find_bridge);
>   #endif
>   
> -#ifdef CONFIG_DEBUG_FS
> -static int drm_bridge_chains_info(struct seq_file *m, void *data)
> -{
> -	struct drm_debugfs_entry *entry = m->private;
> -	struct drm_device *dev = entry->dev;
> -	struct drm_printer p = drm_seq_file_printer(m);
> -	struct drm_mode_config *config = &dev->mode_config;
> -	struct drm_encoder *encoder;
> -	unsigned int bridge_idx = 0;
> -
> -	list_for_each_entry(encoder, &config->encoder_list, head) {
> -		struct drm_bridge *bridge;
> -
> -		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
> -
> -		drm_for_each_bridge_in_chain(encoder, bridge) {
> -			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
> -				   bridge_idx, bridge->type, bridge->ops);
> -
> -#ifdef CONFIG_OF
> -			if (bridge->of_node)
> -				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
> -#endif
> -
> -			drm_printf(&p, "\n");
> -
> -			bridge_idx++;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
> -	{ "bridge_chains", drm_bridge_chains_info, 0 },
> -};
> -
> -void drm_bridge_debugfs_init(struct drm_minor *minor)
> -{
> -	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
> -			      ARRAY_SIZE(drm_bridge_debugfs_list));
> -}
> -#endif
> -
>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index cf7f33bdc963..70913067406d 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -273,10 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>   
>   	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
>   
> -	if (drm_drv_uses_atomic_modeset(dev)) {
> +	if (drm_drv_uses_atomic_modeset(dev))
>   		drm_atomic_debugfs_init(minor);
> -		drm_bridge_debugfs_init(minor);
> -	}
>   
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>   		drm_framebuffer_debugfs_init(minor);
> @@ -603,6 +601,37 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>   	crtc->debugfs_entry = NULL;
>   }
>   
> +static int bridges_show(struct seq_file *m, void *data)
> +{
> +	struct drm_encoder *encoder = m->private;
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		seq_printf(m, "bridge[%d]: %ps\n", idx++, bridge->funcs);
> +		seq_printf(m, "\ttype: [%d] %s\n",
> +			   bridge->type,
> +			   drm_get_connector_type_name(bridge->type));
> +#ifdef CONFIG_OF
> +		if (bridge->of_node)
> +			seq_printf(m, "\tOF: %pOFfc\n", bridge->of_node);
> +#endif
> +		seq_printf(m, "\tops: [0x%x]", bridge->ops);
> +		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +			seq_puts(m, " detect");
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +			seq_puts(m, " edid");
> +		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +			seq_puts(m, " hpd");
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +			seq_puts(m, " modes");
> +		seq_puts(m, "\n");
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(bridges);
> +
>   void drm_debugfs_encoder_add(struct drm_encoder *encoder)
>   {
>   	struct drm_minor *minor = encoder->dev->primary;
> @@ -618,6 +647,10 @@ void drm_debugfs_encoder_add(struct drm_encoder *encoder)
>   
>   	encoder->debugfs_entry = root;
>   
> +	/* bridges list */
> +	debugfs_create_file("bridges", 0444, root, encoder,
> +			    &bridges_fops);
> +
>   	if (encoder->funcs->debugfs_init)
>   		encoder->funcs->debugfs_init(encoder, root);
>   }
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c339fc85fd07..902bc3f99c2a 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -950,6 +950,4 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>   }
>   #endif
>   
> -void drm_bridge_debugfs_init(struct drm_minor *minor);
> -
>   #endif

It would be nice to have a review from Tomi since he pushed the bridge chains debugfs.

Apart that it looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

