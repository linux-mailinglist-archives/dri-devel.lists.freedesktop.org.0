Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF25539CD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947B710E0EB;
	Tue, 21 Jun 2022 18:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3993210E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:54:54 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id w9so7504886lji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UPq0R9Y1HNG52LGq/y85p1KY2NxrAA2AyZswGvI2BOA=;
 b=rhvNDxPL/9oBNe5aEmITDUe+it6rqMHgnQ/NT/l8uxwFxawXbAgfJx2JKCNotbQOGB
 TqxS3ImJ86/3kFMrQb2D4lBXJ14uYy/r1+RABPpJYRnglrzP+WjVKmKkCI4/jhrjH8mG
 bienJZQu1I3WK0s6wFVEI2UlWqI9BiIT1QFP76xXDyB/rvqSC8S95lMc9L+ebzXRYIB3
 7KyOXmC2B4u2aBW7TENAQAp+mKG1w+NPpdAGT4cy62QK2FXpffIkAB+zX4Xvz4f89SzQ
 h9eA+h0X4pLqMITjO+gRnerm1Jq2+iLXIQVIe94BrtXuCgzHoXYHp/fIlDO49t88mRYR
 Gd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UPq0R9Y1HNG52LGq/y85p1KY2NxrAA2AyZswGvI2BOA=;
 b=i8S8MELl/rvH/qQtrNs5MwFoBtgokF//7XmTD7biYZFqwVP6tPk9vV/76jKMt3T2Ia
 47k/tdnqRiXub5yrtlLqRCQXkmNyAPKf9cZUhkCmpvwdM5y0kxa7ptw/KvEQVW3AcYnQ
 vWJqr/0x9nHzz4tdUf9REcxhVgsu8hVb8JYK3b+mk+s2QiaRh8eZKm9DUjAQ/xYyZ38s
 Z+g4/Lwdcygukt0sbPEsseYibinLu9p+D/S5qW9DTP+CzZzOo6eFN4LtVIQxVle9FygY
 yG5lpFBEmM5WjAMshrf/tanB++v703bqZ17P2EBJ82hH8oo7bqfZrZe7W8+LDfTgeW39
 UHlg==
X-Gm-Message-State: AJIora9xb/4u4a4oJmrDbl1ktvpQku/QzsxXHRRMhtQl9rI3iVXpE6gA
 jNb/KMEpba1PaV0a8ZQnlKpxIQ==
X-Google-Smtp-Source: AGRyM1t4y8KtQjV7BwtnBXZ+1ZOE7EfimYN3J/FVp3DBNFI4fKKV3T2DOg2Tb3s2fWp7wG2RLjetrQ==
X-Received: by 2002:a05:651c:4c7:b0:25a:755d:5f9f with SMTP id
 e7-20020a05651c04c700b0025a755d5f9fmr3105973lji.109.1655837692525; 
 Tue, 21 Jun 2022 11:54:52 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a19f245000000b004793b9c2c12sm2257613lfk.124.2022.06.21.11.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:54:52 -0700 (PDT)
Message-ID: <ec989295-faf6-0288-cc5f-54821c654845@linaro.org>
Date: Tue, 21 Jun 2022 21:54:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [v3 2/5] drm/bridge: use atomic enable/disable callbacks for
 panel bridge functions
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-3-git-send-email-quic_vpolimer@quicinc.com>
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
> Use atomic variants for panel bridge callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/bridge/panel.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0ee563e..59a3496 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -108,28 +108,28 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>   		drm_connector_cleanup(connector);
>   }
>   
> -static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_prepare(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_enable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_enable(struct drm_bridge *bridge)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_enable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_disable(struct drm_bridge *bridge)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
>   	drm_panel_disable(panel_bridge->panel);
>   }
>   
> -static void panel_bridge_post_disable(struct drm_bridge *bridge)
> +static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge)
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   
> @@ -158,10 +158,10 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
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
