Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA35539EA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1F310E9F9;
	Tue, 21 Jun 2022 18:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B9710EA3A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:59:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c2so23964212lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2n5ZvTZM5Xy4jLPVi8VTwgVRgrWwKM+mMuF3SLS55Uk=;
 b=ccGuwd2alxEWAXxi99fJ6T3ivm6lM/mkYmg2h51BRJCV7CHOIltxP9fsKs2CgPot3l
 Bvo8X9z9OVybj/ux43v58MZUPvl6U6zsQmG9tDwGJ8F3e1/nOBF2OhHBY/nsW7pIn5fg
 0JLOyG0zpv+IoyR2n6HzLqTl9EtkEKYV68r7uZbQAjRWiC04I6oLHHVRRXLDkZALrJDT
 AqhbNqrhEDvtUUz0xTWHG0N7SvaN9XzHvjUmCfR8GtLkFgnv4rAz/osnRu5mzlqRQkXo
 cI9z7hClr+U+/j4uXpT+CAU5A2mpDtzR8LmDC6cWxt2tYt/mws75IB/j2HEYqm8A4XFw
 lesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2n5ZvTZM5Xy4jLPVi8VTwgVRgrWwKM+mMuF3SLS55Uk=;
 b=FzENAqbnbTxzut+GXuRlsYSMlW4uOQ+ZbwIpLeccwhFw1cr08JgVcXhEmLev1PGvgP
 mHszKPmLJu7YMMn3srAf2rG8XFjo7wcslyg7AY71h/PWlLadvLvte3yWe7iJrcMABaUq
 V7vOVElP3TWHhMTZ5uowiZnDXeDnNdDSgGfFvmfCDoLORr395ij+PfIDHKg3rMdDrj2l
 fnR1W4bYBAypz4tesPH9yiz5h+8hg/MYceShfg6kzmg1nYEsbED3up0umEpz6Z1RvGOS
 7jgTo7ggEzi4ATKjObE9pWO0DLl47sWkawYsU0dgv6d6RieIPs3BV3GBW5b9SWqtasUr
 VJlA==
X-Gm-Message-State: AJIora/Uqb/p513Jn5jvwcwePIkSi9+wIQI4cqrrFG3MBj7mP8mq88YZ
 pm/ims6K2qUvbUmeEiCndFsTYA==
X-Google-Smtp-Source: AGRyM1uIfStI8bKV/5e05aUv9lOS8QCb68T6xzj1TgXejatNoF0hbBGyJXAe5sx5neZu8sbwBKFuOw==
X-Received: by 2002:a05:6512:1281:b0:47f:7066:6fb2 with SMTP id
 u1-20020a056512128100b0047f70666fb2mr6672169lfs.247.1655837946901; 
 Tue, 21 Jun 2022 11:59:06 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a2e7210000000b0025a6f7000c0sm846916ljc.11.2022.06.21.11.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:59:06 -0700 (PDT)
Message-ID: <47324fb3-c0d1-4839-8db1-c819c7389de7@linaro.org>
Date: Tue, 21 Jun 2022 21:59:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [v3 3/5] drm/bridge: add psr support during panel bridge enable &
 disable sequence
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-4-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2022 13:53, Vinod Polimera wrote:
> This change avoids panel prepare/unprepare based on self-refresh
> state.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/bridge/panel.c | 102 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 98 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 59a3496..6b09ae0 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -41,6 +41,40 @@ static int panel_bridge_connector_get_modes(struct drm_connector *connector)
>   	return drm_panel_get_modes(panel_bridge->panel, connector);
>   }
>   
> +static struct drm_crtc *bridge_drm_get_old_connector_crtc(struct drm_encoder *encoder,
> +							struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +
> +	connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
> +	if (!connector)
> +		return NULL;
> +
> +	conn_state = drm_atomic_get_old_connector_state(state, connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	return conn_state->crtc;
> +}
> +
> +static struct drm_crtc *bridge_drm_get_new_connector_crtc(struct drm_encoder *encoder,
> +							struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +	if (!connector)
> +		return NULL;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	return conn_state->crtc;
> +}

As I wrote earlier, this should become generic drm helpers.

> +
>   static const struct drm_connector_helper_funcs
>   panel_bridge_connector_helper_funcs = {
>   	.get_modes = panel_bridge_connector_get_modes,
> @@ -108,30 +142,90 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>   		drm_connector_cleanup(connector);
>   }
>   
> -static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)

This must be a part of the previous patch?

>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
> +	if (!crtc)
> +		return;

Why? And why do you ask for the new crtc from the old state?

> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +
> +	/* Don't touch the panel if we're coming back from self refresh state */
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>   
>   	drm_panel_prepare(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_atomic_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +
> +	/* Don't touch the panel if we're coming back from self refresh state */
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>   
>   	drm_panel_enable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_atomic_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);

This doesn't sound right too.

> +
> +	/* Don't do a full disable on PSR transitions if new state is self refresh state */
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>   
>   	drm_panel_disable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
> +
> +	/* Don't do unprepare on PSR transitions if new state is self refresh state */
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>   
>   	drm_panel_unprepare(panel_bridge->panel);
>   }


-- 
With best wishes
Dmitry
