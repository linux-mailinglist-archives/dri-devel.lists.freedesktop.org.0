Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563374BD76C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECEB112178;
	Mon, 21 Feb 2022 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D82112176
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 08:11:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id w13so8524629wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JB6dXNwwZJkB6iGRj3HKx/fo7Dqgtazj5+XksdVG3L4=;
 b=wm0ykQg94yejPkgcXMlGZLMmDGpfVJnKXhVTMcZIg9GMaHhhfPYuIWsL9sjzqIn6Xj
 4Ig7oPq7JJDZ3itGc2fPv9qS4n+4zTl/82MSDKKWl4Bip6yZMC7jVE8hUSzFWcbaLVy5
 v5hMjPdP2lz03vKsivVWLPVsp9yOFUzydZmIJfmfNrCUcmXRTqtsNQkIoltvPWmRXxZM
 8h4/N8U1OEWb8TuumP3WwbOAKgXjJn2iAzmtwsplK9NfJSLBFBHY3piLiUmYMB67K1rX
 dR9Ua+McrxMlcCYejatMjiXqmjyBhaMwW5X9LKlCVPxN8wBipMpzmlR7IBXmAU5rpVcT
 xQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JB6dXNwwZJkB6iGRj3HKx/fo7Dqgtazj5+XksdVG3L4=;
 b=bV3WeSS/Awb4VTnmWvPnEXgy9Lk/Y3FLfzNATMQES6D5QHPUzinnDbW1lSon+JnFFP
 nmEyAsGWmqaxN+hLIPoeFv7eOX7QdW4Q1raeRsyYzL0OGYuQD/W4oWvUniw99/CLTtXU
 IO6K0iSDunjJSzboi/XvSSYUMDhnbF4pq5VlZTNOhOKYK0x8oUfJzLHlz35Cz7wURbLx
 iqPqVmavMQcEYE0Ml1mxw7KSVVUktbAqs2OxswseDfliaHiJuFIlcdjbpIfQYdXF0NQQ
 tJ9dzcA6FyNsGq8X2LZuAGU3LyQYkl6IWHXYRIDSc6PQD98iSfUJvmT/lZI14pWv/V/t
 W48w==
X-Gm-Message-State: AOAM5327lgIZtguvo7uBRaWMC2DMdRllhmySKencBV0aRkeYIYO3SaOt
 6bAa9losUnVwYtG3LixPlQYwQQ==
X-Google-Smtp-Source: ABdhPJwUo68BmHkh+ctGRaDR2gGH/uYCSPEVA9Ebr8pVUJTgy+yFEQa4bIQ8YqSliGK+k63ogBRbMg==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr20298453wmj.48.1645431064300; 
 Mon, 21 Feb 2022 00:11:04 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:77b7:547a:df0c:28d8?
 ([2001:861:44c0:66c0:77b7:547a:df0c:28d8])
 by smtp.gmail.com with ESMTPSA id q76sm7295000wme.1.2022.02.21.00.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 00:11:03 -0800 (PST)
Message-ID: <9c6f5c0b-5879-736f-344f-dfa12a0d7937@baylibre.com>
Date: Mon, 21 Feb 2022 09:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 4/7] drm/bridge: dw-hdmi: repair interworking with
 hdmi-connector for jz4780
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>, Harry Wentland <harry.wentland@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <d4d08582c49ec089095dd0ede4cdf2752f9d1eb8.1644681054.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <d4d08582c49ec089095dd0ede4cdf2752f9d1eb8.1644681054.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, letux-kernel@openphoenux.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/02/2022 16:50, H. Nikolaus Schaller wrote:
> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> 
> introduced a new mechanism to negotiate bus formats between hdmi connector
> and the synopsys hdmi driver inside the jz4780.
> 
> By this, the dw-hdmi is no longer the only bridge and sets up a list
> of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780 but only
> produces a black screen.
> 
> This fix is based on the observation that max_bpc = 0 when running this
> function while info->bpc = 8. Since the formats checks before this always test
> for max_bpc >= info->pbc indirectly my assumption is that we must check it
> here as well.
> 
> Adding the proposed patch makes the CI20/jz4780 panel work again in
> MEDIA_BUS_FMT_RGB888_1X24 mode.
> 
> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b0d8110dd412c..826a055a7a273 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2620,10 +2620,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>   	}
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>   		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>   		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>   
>   	/* Default 8bit RGB fallback */

Please do the same for all other cases and change the patch subject to something more accurate like:
"drm/bridge: dw-hdmi: take display info bpc in account for bus formats negociation"

Neil
