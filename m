Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3256774A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FD011BB93;
	Tue,  5 Jul 2022 19:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954C811BB60
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:06:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu42so2309232lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xOhWnb540p1r36VjLLL8ynDSP8n2cvWSH5xUUPsNb0M=;
 b=lm2URx2gBPg+e7VroVtwkgkusQ2E2ZSJiom5CZjR4M8O5n6lVaAq+I61NSMrLINxtM
 cZfUeHCtDkFX+ch6acEweNswtrAYaAzNin4rTHPldBoZgJ6QsXvSbhKxEe1B1WF+2RCA
 NmAJtjqhzptVu6Jo94qpW9zfG4Tyt210jTOlx5NEyzy5morfUcCvi7UoubjtrYo4F/0m
 dY1P4lSCsbMNCgmeFI/VsmG0wnDx7qvsVhAJHaY5GHNrxbV98U8evB3bHT1qdogPSITI
 /yPw4VTopbvhVeZCpgD47v9tS84boS2IHUtruz+4c4wzHwzT6JvKCYR5cN6HlF8Kxrhm
 DaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOhWnb540p1r36VjLLL8ynDSP8n2cvWSH5xUUPsNb0M=;
 b=2+RKyEOL6QCJCS5eqlNuMj+cDDhQPYwEW0iIuaYuuXmWpctzvmNirghSlySTzyIuJL
 EN32fy4wlOIijWiqIbBsItTUFGTkCEUZIVfs7PzQF6nlgKrnIJXLMTw/aPG+yiQ0UkDu
 5eOa/Yr9S548fMI3Ay2eQc9K9FokdXt4P/jKWtWg2+QRq7OuMDC5oTGfxn3vMMNWfeUq
 TGXRGQBJlRQlPqW2YwIAXVUFPZpv9PhC8YUJa0RdBbpRJ8hPrHVOW3WkNlYpEBXPz75h
 k57SX/P8Vr42gzamtDxdqnF02yhJOJGrzHWf1EY8rzAMHPXXBNb8jfvlOoGatYxUPZqu
 +lng==
X-Gm-Message-State: AJIora/tCDiNTw4y7qpR7Q8zOctXnkDxB8q6oqIrh+3f2V9ooSnhUxoI
 p9lRt+zv0Rg98xH+CQePq5WIvw==
X-Google-Smtp-Source: AGRyM1uAV+E6puJrOXSAla6ccZGskpklniPb4N5wfYqqJeeFOoZDBigSJVJ8jjQIAMPwUcg8nbbJ3A==
X-Received: by 2002:a05:6512:70c:b0:47f:8e9f:ac2 with SMTP id
 b12-20020a056512070c00b0047f8e9f0ac2mr24437278lfs.156.1657047963895; 
 Tue, 05 Jul 2022 12:06:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u19-20020ac25193000000b0048326115186sm633670lfi.10.2022.07.05.12.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:06:03 -0700 (PDT)
Message-ID: <6562f44a-dfd8-f8c4-0271-2cda6afd7c2a@linaro.org>
Date: Tue, 5 Jul 2022 22:06:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/7] drm/bridge: use atomic enable/disable callbacks
 for panel bridge
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-5-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-5-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 20:00, Vinod Polimera wrote:
> Use atomic variants for panel bridge callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/bridge/panel.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0ee563e..eeb9546 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -108,28 +108,32 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>   		drm_connector_cleanup(connector);
>   }
>   
> -static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +				struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_prepare(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
> +				struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_enable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
> +				struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_disable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_post_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +				struct drm_bridge_state *old_bridge_state)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
> @@ -158,10 +162,10 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
>   static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>   	.attach = panel_bridge_attach,
>   	.detach = panel_bridge_detach,
> -	.pre_enable = panel_bridge_pre_enable,
> -	.enable = panel_bridge_enable,
> -	.disable = panel_bridge_disable,
> -	.post_disable = panel_bridge_post_disable,
> +	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
> +	.atomic_enable = panel_bridge_atomic_enable,
> +	.atomic_disable = panel_bridge_atomic_disable,
> +	.atomic_post_disable = panel_bridge_atomic_post_disable,
>   	.get_modes = panel_bridge_get_modes,
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,


-- 
With best wishes
Dmitry
