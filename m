Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D25257A5
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 00:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AEB10E409;
	Thu, 12 May 2022 22:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8AB10E409
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 22:17:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d19so11475477lfj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n/bIpPSR+nG3hRb0LIrVjIvOFsTNueiSrIsjJcX2Yyg=;
 b=qzTc5GL6EkDGWNoKMTNGUgSX5FlQsYQ4ns/GeNhLe1KCAXAuUSoAOMAcIXAzZJeFuX
 nOFvoHNawnO5UlL4FKLNPmhgS27D8xxNDjAcv64jf/FxL4UleEGKef01zMT0zgYKlsK5
 H1eqEDuy2HkGNovSwuJCBlxZZTbQXbUDDucMa4/YAxjKvH8HNfHwTE8CQxjy9XUstTUg
 BmWM2ljqel/SHpMPoc8cxX19pET2WJquRHS+n3hlaiIbwDDKjsjrBVGfsFFmPCrELmNu
 zOi+PJq2je8BBYgwZzcUmMEiItSHB43cmVjN6Vd1NSoW1dPdzLhrrWkMV2MCFJldlXnl
 unWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n/bIpPSR+nG3hRb0LIrVjIvOFsTNueiSrIsjJcX2Yyg=;
 b=5NhZm+y+utHHBfolYw2djaelYXQAsku6PMlkuPR4iHPbRywTJKaUX0+QuvjFjk/KZs
 nnOo+AmUTJutmJIujHzKdtu5JdZqHtbFW0RcxWcTl/hqkH2hZrHb9qxmNTHjFzFUOiBk
 PGBAR8wN6kFHsGTaj5l4OBL5JoP4//xiJI7IBdyWxUSXrVBPIHE/hSePLxH7XVeNCBeu
 bBs9HKXDQPmMtNkH1eVYROZOKJ2J7FmWMQRYzVhdb2SiV4Pkg5xYDLER+G5bWLT9gGBO
 jXmzkd5aaBJx2sAGRCk7enHPwvRYPWDXbUg/4A6UgXifXwlVWHyZcP5ESFFvKLrGv8jg
 L51A==
X-Gm-Message-State: AOAM531v/LFr334FPYgTxRo0amH9918psvQ0k8hWiyi7U+W3coTf8zhS
 KvJAEK49jXH4PdlSZv+k5Z49hCNW0aPx0A==
X-Google-Smtp-Source: ABdhPJxX4B9K3oB+pDmhOUPFgene4MlzAGjW8gHNnQfn1dn3+5mmbqFEiHGjOoaoLLZpnb7zIXh4PA==
X-Received: by 2002:a05:6512:1398:b0:448:bda0:99f2 with SMTP id
 p24-20020a056512139800b00448bda099f2mr1255101lfa.681.1652393819601; 
 Thu, 12 May 2022 15:16:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056512040700b0047255d211d2sm106631lfk.257.2022.05.12.15.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:16:59 -0700 (PDT)
Message-ID: <dd62b8a7-43b9-364a-a427-94d621648012@linaro.org>
Date: Fri, 13 May 2022 01:16:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] drm/msm/dsi: don't powerup at modeset time for
 parade-ps8640
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/05/2022 01:00, Douglas Anderson wrote:
> Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
> 
> Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> handle the new power sequence. The Linux driver has almost nothing in
> it and most of the logic for this bridge chip is in black-box firmware
> that the bridge chip uses.
> 
> Also unfortunately, reverting the patch will break "tc358762".
> 
> The long term solution here is probably Dave Stevenson's series [1]
> that would give more flexibility. However, that is likely not a quick
> fix.
> 
> For the short term, we'll look at the compatible of the next bridge in
> the chain and go back to the old way for the Parade PS8640 bridge
> chip. If it's found that other bridge chips also need this workaround
> then we can add them to the list or consider inverting the condition.
> 
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> 
> Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Note that, unlike `struct device`, `struct drm_bridge` still has a
> `#ifdef` around the `of_node`. The extra stub function in this patch
> is to make sure that we can pass COMPILE_TEST, not because I expect
> that we'll actually run into real users who are running this driver
> without device tree.
> 
> Changes in v4:
> - Use the compatible string of the next bridge as per Rob.
> 
> Changes in v3:
> - No longer a revert; now a module parameter.
> 
> Changes in v2:
> - Remove the mud from my face.
> 
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 50b987658b1f..2cabba65a8f1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -34,6 +34,26 @@ static struct msm_dsi_manager msm_dsim_glb;
>   #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>   #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
>   
> +#ifdef CONFIG_OF
> +static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
> +
> +	/*
> +	 * If the next bridge in the chain is the Parade ps8640 bridge chip
> +	 * then don't power on early since it seems to violate the expectations
> +	 * of the firmware that the bridge chip is running.
> +	 */
> +	return !(next_bridge && next_bridge->of_node &&
> +		 of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
> +}
> +#else
> +static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> +{
> +	return true;
> +}
> +#endif
> +
>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>   {
>   	return msm_dsim_glb.dsi[id];
> @@ -389,6 +409,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>   		return;
>   
> +	if (!dsi_mgr_power_on_early(bridge))
> +		dsi_mgr_bridge_power_on(bridge);
> +
>   	/* Always call panel functions once, because even for dual panels,
>   	 * there is only one drm_panel instance.
>   	 */
> @@ -570,7 +593,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   	if (is_bonded_dsi && other_dsi)
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>   
> -	dsi_mgr_bridge_power_on(bridge);
> +	if (dsi_mgr_power_on_early(bridge))
> +		dsi_mgr_bridge_power_on(bridge);
>   }
>   
>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,


-- 
With best wishes
Dmitry
