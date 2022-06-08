Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B1542E95
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC24910E60B;
	Wed,  8 Jun 2022 11:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E5210E60B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 11:01:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a2so26512428lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=laPKWOw7TNOXx+WUl1jHJXuacSL5JFNrBtIvvv235/M=;
 b=ApbfGMyN8oecfDMkycth4f0tYvWwed8MaOoPtSGOrCSrYFUyJ2KmB5b4JvOowE+m+m
 Gf37G1QWLvUuWHwiCXyMf596STriTuCB5HerY5fk7GFIXdcT1OqrN1KyvCOAAJycBtkm
 D2BuBylWAbIk4QFvv1G0V8AEkJeOdmzWxagqe/w2Mm+EwnDXeN8izjpmiRVE0mvJVgTD
 LuWUSBV7YAR4sU2PdDOkRosRiyehFM3pFT0r/a2KyUY/F/1zZCKN3Pa8O0ruzjL6wyof
 C2GlvnvXRjwZ3RcQ1lvJFINAaKH5vgFCqvwfyPb40V9LMeN2omdfT6nXRXfzOn6fosnN
 GAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=laPKWOw7TNOXx+WUl1jHJXuacSL5JFNrBtIvvv235/M=;
 b=RgTMutkv1U2nofeRCVyx860oyL+2XTXlmVrNkFURJs5ytUxY+BtonfwdctnUK1R2iN
 R6vk7BkPvGvUgC+qtY02S+Sf5tn6IQHuVZRPDN/8pgA/QoTyRJwLZr5+egi2k1zffpug
 E9fP81VB9QmWd1WkHDJHspJYcZ/rOVK9NqjiNfeGU9j4HGkSUysBV9npPmqGPL81J7DN
 KsC3mcUoSAVr6ABFlJXLXdTlESOwvBpwGPiIJti3DzoxImSPbmpZg0vqjeuVh0t4gbGG
 U7YaKXU40e/5ioFjty2TMsPKUQwVQbftXLInStvtZPiw/dnFu8M+X7StEXiDgziaVRHg
 jQJg==
X-Gm-Message-State: AOAM530WhjdKXAW+fVpbI2g7e0cRlUaFN1KTceYb9X81SJ+SCYC5/3eJ
 y0JJwJ9mUxtBRD+drhbzluKcDA==
X-Google-Smtp-Source: ABdhPJx4EMO3tN7XghUDIMbsRbby47B/gxc8mfhKh38jrUxjK9zRoOgvp7E5chts09wVJ/XEYzxmLw==
X-Received: by 2002:a05:6512:b1b:b0:44a:9ae9:b9bf with SMTP id
 w27-20020a0565120b1b00b0044a9ae9b9bfmr67486138lfu.365.1654686058728; 
 Wed, 08 Jun 2022 04:00:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a0565120b1500b00478f5d133cfsm3664661lfu.99.2022.06.08.04.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:00:58 -0700 (PDT)
Message-ID: <7735a545-a89f-c17e-b5f4-8639ceacf304@linaro.org>
Date: Wed, 8 Jun 2022 14:00:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V2 1/4] drm/bridge: Remove duplication from drm_bridge and
 drm_atomic_bridge chains
Content-Language: en-GB
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <67888b7a05a896c8b9b0f15bd81ef614d082dc9f.1646406653.git.dave.stevenson@raspberrypi.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <67888b7a05a896c8b9b0f15bd81ef614d082dc9f.1646406653.git.dave.stevenson@raspberrypi.com>
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
> drm_bridge_chain_pre_enable is a subset of
> drm_atomic_bridge_chain_pre_enable, and drm_bridge_chain_post_disable
> is a subset of drm_atomic_bridge_chain_post_disable.
> 
> Change drm_bridge_chain_pre_enable and drm_bridge_chain_post_disable to
> call the atomic versions with a NULL state, and ensure that atomic
> calls are not made if there is no state.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I think we should update parade-ps8640 to use drm_atomic_bridge_chain_() 
and drop drm_bridge_chain_* API completely.

> ---
>   drivers/gpu/drm/drm_bridge.c | 30 ++++--------------------------
>   1 file changed, 4 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..198fd471a488 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -527,16 +527,7 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
>    */
>   void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>   {
> -	struct drm_encoder *encoder;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->post_disable)
> -			bridge->funcs->post_disable(bridge);
> -	}
> +	drm_atomic_bridge_chain_post_disable(bridge, NULL);
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>   
> @@ -582,20 +573,7 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>    */
>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>   {
> -	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
> -
> -	if (!bridge)
> -		return;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->pre_enable)
> -			iter->funcs->pre_enable(iter);
> -
> -		if (iter == bridge)
> -			break;
> -	}
> +	drm_atomic_bridge_chain_pre_enable(bridge, NULL);
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>   
> @@ -690,7 +668,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>   
>   	encoder = bridge->encoder;
>   	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->atomic_post_disable) {
> +		if (old_state && bridge->funcs->atomic_post_disable) {
>   			struct drm_bridge_state *old_bridge_state;
>   
>   			old_bridge_state =
> @@ -732,7 +710,7 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>   
>   	encoder = bridge->encoder;
>   	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->atomic_pre_enable) {
> +		if (old_state && iter->funcs->atomic_pre_enable) {
>   			struct drm_bridge_state *old_bridge_state;
>   
>   			old_bridge_state =


-- 
With best wishes
Dmitry
