Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A01704678
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C8C10E30D;
	Tue, 16 May 2023 07:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A86510E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:33:15 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f475366514so48227985e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684222393; x=1686814393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mao4j/0ZCMW7T/kUJ5mjsbzIqHaRtAisiBsgp9ClLXU=;
 b=Nnv34hTbWzGHic/xsbF25lS553fyVAyCbLDvp2E9zBGt/yKzMtbWbCUOub7nFSpB6X
 5hS+KyOOxLEkmepiCwexzPkmhoI2t3RnBthqcYWj4DGOUy9iIbd0yhcuEOlLgeLLl2yu
 b6NdyeqbL1EQyDp4xrZSFm7GdWlz/d32QuS/MILSUH+kaThbxUbRyjSDVkLrO9oGmGvC
 Rg/cTtArwOALjZEYBB/mCbgr8yfSmMguvVe+Kqo52Aq0VthlImj0PkhqbEmK4q/l5KtO
 IgBIYubPI06WobncN9V8LbTzZGU3quYt+QjqMGMi2QL97fH5DZkNH8GdkN6facyelcFN
 KHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684222393; x=1686814393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mao4j/0ZCMW7T/kUJ5mjsbzIqHaRtAisiBsgp9ClLXU=;
 b=TEeApFn1OzfV/aCzsdWue/wYlqzbDXagCihgL14SIh1E/b1wKiiNKmGO4YuJqawUzr
 ymSKu698rQ3/KTSLdx+xkrJuOIjtkvJ3GaqP+VZ91zN+oag8ih3n1G2j4+lb3ghLsmVm
 0RG7rdDF+3OCkUYcDZkNAWjmhzS0+vtHoPKEyoUjKdi90eSL660S/wWIdAPy/IZkmIRK
 8MAeoGa09/eXS1mmN3iC6NQ29m1AbqTYJG0MIVVY0C1syRw33cycRvh2OVW1luyXMtt2
 YYkbegl2ksVB0UwPpjLc+toRoae0WV2i7AmOBU2Oc5ZieI8/ZxKixtq1kQD8z+DqDA1R
 qiEg==
X-Gm-Message-State: AC+VfDy0mOdQL+6IRsVs4t7SE/otlu6WJpiA/vq7lWJN8qUTPwPX8eyR
 CPQ0jgkG+UfBKce1qPZvxN4jOw==
X-Google-Smtp-Source: ACHHUZ6ZpQqk8wnJG+CGbxFidubS35bf6NyMGMjOA6EoAurDGkJAXAjIc5d0WZ4S7ng3mfjQw/fRKg==
X-Received: by 2002:a7b:c85a:0:b0:3f4:ecf0:8c93 with SMTP id
 c26-20020a7bc85a000000b003f4ecf08c93mr10949351wml.20.1684222393232; 
 Tue, 16 May 2023 00:33:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a7bc3c2000000b003f4268f51f5sm1396861wmj.0.2023.05.16.00.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:33:12 -0700 (PDT)
Message-ID: <5d44fe3f-95b2-94ed-4b16-51c79d88f862@linaro.org>
Date: Tue, 16 May 2023 09:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Content-Language: en-US
To: Frieder Schrempf <frieder@fris.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robert Foss <rfoss@kernel.org>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
Organization: Linaro Developer Services
In-Reply-To: <20230503163313.2640898-2-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 18:33, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> According to the documentation [1] the proper enable flow is:
> 
> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
> 2. Disable stop state to bring data lanes into HS mode
> 
> Currently we do this all at once within enable(), which doesn't
> allow to meet the requirements of some downstream bridges.
> 
> To fix this we now enable the DSI in pre_enable() and force it
> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
> register until enable() is called where we reset the bit.
> 
> We currently do this only for i.MX8M as Exynos uses a different
> init flow where samsung_dsim_init() is called from
> samsung_dsim_host_transfer().
> 
> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
> * Drop RFC
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index e0a402a85787..9775779721d9 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>   	reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>   	reg &= ~DSIM_STOP_STATE_CNT_MASK;
>   	reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
> +
> +	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> +		reg |= DSIM_FORCE_STOP_STATE;
> +
>   	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>   
>   	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   		ret = samsung_dsim_init(dsi);
>   		if (ret)
>   			return;
> +
> +		samsung_dsim_set_display_mode(dsi);
> +		samsung_dsim_set_display_enable(dsi, true);
>   	}
>   }
>   
> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>   				       struct drm_bridge_state *old_bridge_state)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	u32 reg;
>   
> -	samsung_dsim_set_display_mode(dsi);
> -	samsung_dsim_set_display_enable(dsi, true);
> +	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +		samsung_dsim_set_display_mode(dsi);
> +		samsung_dsim_set_display_enable(dsi, true);
> +	} else {
> +		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +		reg &= ~DSIM_FORCE_STOP_STATE;
> +		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +	}
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>   }
> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>   					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	u32 reg;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
> +	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +		reg |= DSIM_FORCE_STOP_STATE;
> +		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +	}
> +
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
