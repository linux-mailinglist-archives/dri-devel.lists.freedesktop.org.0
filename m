Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8976C7CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C46F10E055;
	Wed,  2 Aug 2023 08:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFBD10E055
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:02:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso3464446f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963350; x=1691568150;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UAFJ+rv+IE187x/FwcspFH0+iOTtGpFlE/cBuRXsXsw=;
 b=n6syPma2ESApR8RUDCbIcg+b5msMUdwamEE/iYQvwZFvFNIAVioaro4B/arOcpLdbO
 fDZdhx0ge1q6bbPSd+mjsXF2w8eUtp51X1K9Sk3dJYd7+JTSRclVoJpqW164kth6ukCx
 BloSMDZ8zglmm8Zy+mRoyU8Wfb25UummOTwsG/uD5GdlpGc2e7nB2Foou5UhYbaAu3cg
 8GsnHSZlaf41ibwFtovWYpantHy8tRsib/EvHRl1htSHnz+9jIBzjgfMSehQx2YsddA/
 LVXOamf2KlPp6t1IT/db7e2gMyXO5Rl7FOM3Ttzh2zMEx/wCNHCvyqmhX4YyCieN2DrV
 OAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963350; x=1691568150;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UAFJ+rv+IE187x/FwcspFH0+iOTtGpFlE/cBuRXsXsw=;
 b=QO72RvRG8AhDA+dlxaAvW73mWXuOrNmOud3pb+kQYb5OKfu7ieB44hdEabHFoh81uw
 AbKeTKDc3L9BGZyDCHTGQhJ6ree7fvqWXJ/ozJEM4+64ABpPzFP+k0oehet2FoYn21KX
 TLrWxqcE4JmAAjk4BeIcYAl0/CR3l+g/SKzfwc7i1lGQbQJlO9PtOSmIq+L4gJys8rrn
 L5NjLT7ZQTxUNjbRpuptaRZGVtBwLr1F8KxX2qrxW/jBVF1lkz38VXNKJKMgKvARabg7
 bZTbXUp7zFend7zz9gQRqhb+pAUOx/daT4GhKDl5Q3mrkM4u6JZyPqhnBpFDi6gCbfIn
 hknw==
X-Gm-Message-State: ABy/qLZULlLZlj8goN7tKcOgL9wLPrRXaLdyeGq+6P6z1xRybJbzJkfE
 52uMvjF3Xw2tYlblejzyCyeGVA==
X-Google-Smtp-Source: APBJJlGNEmI9TnXQHyKu4wFteuwTzcg/moZ+xGeiXcdvcDgox/jG6L0Ux5vxL4yzA89PisW1fAHrOw==
X-Received: by 2002:adf:ea4b:0:b0:317:5a71:9231 with SMTP id
 j11-20020adfea4b000000b003175a719231mr4169246wrn.51.1690963350340; 
 Wed, 02 Aug 2023 01:02:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe587000000b00314172ba213sm18244774wrm.108.2023.08.02.01.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:02:29 -0700 (PDT)
Message-ID: <33f4fbe0-5fd7-569d-dbee-f55520693373@linaro.org>
Date: Wed, 2 Aug 2023 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4] drm/bridge: Add debugfs print for bridge chains
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20230802-drm-bridge-chain-debugfs-v4-1-7e3ae3d137c0@ideasonboard.com>
Organization: Linaro Developer Services
In-Reply-To: <20230802-drm-bridge-chain-debugfs-v4-1-7e3ae3d137c0@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 09:04, Tomi Valkeinen wrote:
> DRM bridges are not visible to the userspace and it may not be
> immediately clear if the chain is somehow constructed incorrectly. I
> have had two separate instances of a bridge driver failing to do a
> drm_bridge_attach() call, resulting in the bridge connector not being
> part of the chain. In some situations this doesn't seem to cause issues,
> but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
> 
> Add a debugfs file to print the bridge chains. For me, on this TI AM62
> based platform, I get the following output:
> 
> encoder[39]
> 	bridge[0] type: 0, ops: 0x0
> 	bridge[1] type: 0, ops: 0x0, OF: /bus@f0000/i2c@20000000/dsi@e:toshiba,tc358778
> 	bridge[2] type: 0, ops: 0x3, OF: /bus@f0000/i2c@20010000/hdmi@48:lontium,lt8912b
> 	bridge[3] type: 11, ops: 0x7, OF: /hdmi-connector:hdmi-connector
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v4:
> - Move 'struct drm_minor' to be along the other declarations
> - Added Tested-by and Reviewed-by
> - Link to v3: https://lore.kernel.org/r/20230731-drm-bridge-chain-debugfs-v3-1-7d0739f3efa3@ideasonboard.com
> 
> Changes in v3:
> - Use drm_for_each_bridge_in_chain()
> - Drop extra comment
> - Fix whitespace issue
> - Call drm_bridge_debugfs_init() only if the driver uses modeset
> - Drop #ifdef for drm_bridge_debugfs_init() declaration
> - Link to v2: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com
> 
> Changes in v2:
> - Fixed compilation issue when !CONFIG_OF
> - Link to v1: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com
> ---
>   drivers/gpu/drm/drm_bridge.c  | 46 +++++++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_debugfs.c |  2 ++
>   include/drm/drm_bridge.h      |  3 +++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79..39e68e45bb12 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -27,8 +27,10 @@
>   #include <linux/mutex.h>
>   
>   #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_debugfs.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_encoder.h>
> +#include <drm/drm_file.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   
> @@ -1345,6 +1347,50 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>   EXPORT_SYMBOL(of_drm_find_bridge);
>   #endif
>   
> +#ifdef CONFIG_DEBUG_FS
> +static int drm_bridge_chains_info(struct seq_file *m, void *data)
> +{
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *dev = entry->dev;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_encoder *encoder;
> +	unsigned int bridge_idx = 0;
> +
> +	list_for_each_entry(encoder, &config->encoder_list, head) {
> +		struct drm_bridge *bridge;
> +
> +		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
> +
> +		drm_for_each_bridge_in_chain(encoder, bridge) {
> +			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
> +				   bridge_idx, bridge->type, bridge->ops);
> +
> +#ifdef CONFIG_OF
> +			if (bridge->of_node)
> +				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
> +#endif
> +
> +			drm_printf(&p, "\n");
> +
> +			bridge_idx++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
> +	{ "bridge_chains", drm_bridge_chains_info, 0 },
> +};
> +
> +void drm_bridge_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
> +			      ARRAY_SIZE(drm_bridge_debugfs_list));
> +}
> +#endif
> +
>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index a3a488205009..2de43ff3ce0a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -31,6 +31,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_auth.h>
> +#include <drm/drm_bridge.h>
>   #include <drm/drm_client.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_device.h>
> @@ -274,6 +275,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>   
>   	if (drm_drv_uses_atomic_modeset(dev)) {
>   		drm_atomic_debugfs_init(minor);
> +		drm_bridge_debugfs_init(minor);
>   	}
>   
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bf964cdfb330..c339fc85fd07 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -36,6 +36,7 @@ struct drm_bridge;
>   struct drm_bridge_timings;
>   struct drm_connector;
>   struct drm_display_info;
> +struct drm_minor;
>   struct drm_panel;
>   struct edid;
>   struct i2c_adapter;
> @@ -949,4 +950,6 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>   }
>   #endif
>   
> +void drm_bridge_debugfs_init(struct drm_minor *minor);
> +
>   #endif
> 
> ---
> base-commit: a0c64d153d687756c8719b8d10e609d62e1cb6fd
> change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a
> 
> Best regards,

LGTM, thanks tomi !

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
