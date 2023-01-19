Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1506732E4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CC910E8C8;
	Thu, 19 Jan 2023 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967D010E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:49:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id j17so843033wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4lG7hwDCCVlpDfwAckt7W75jaE/7MMu/FO0fVirLwU=;
 b=uxLoSkB1aSixITOozGl3EMBg5Jb8Hy/Pv6nE/xooaTuHITotad29w4ShB2o4xpOB6B
 T2v1tGQwbMyOCMSY1DNfoqN6vT5LKfx2W6KIEmoIsbuEPdt4YoAXE8SjClclmrSwahOR
 xz6PRem/yoiHEqZHYeND23ZLgNy5YmQW/ZtJcqI0MyNO+ULXBKhmPnliYIdeyt3hg+3L
 q3WPL58kHFiZ0NyZFz/gHf5MSxLHiDzNkWR+cN47hRPM0QBG5R473yReJ1rMo2XRi42+
 yHxVmst2+MyHvk5KJp+9XxnJ/JHv9S3u2T/juYUiXiSLiBoCmn8OlgvC+6Iju/QAS/HA
 0ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4lG7hwDCCVlpDfwAckt7W75jaE/7MMu/FO0fVirLwU=;
 b=SIDr0Om66XA9LQTAOgiC64RxTQKDRRCIL16zhPvqoa6bgWTg9O+/TpcSfgfWz0xz8K
 ln/YCkApykxXzDtX6/+KPsAGd9MYtPSLvmM2q4CarWsVq+nv9VN1DBUSDoXNsVG83lrV
 SHwAG40Tp11NqkQbVxlebIFe/JunrJ/9gDLinnocDkmFLW3UaCzby8oqHhW4ZjLIcIbb
 dkrvC9i42FYv8i+qMjo27e7d6i7cjS5C1Rw5UfbtDZb1lTu1xW94h+mvwS1MH0UpOAsq
 IS+0QRiTsiZiLRnql+dcZAeQBenOmqqC3wI8qhxU7gJFFZ+P1+TspaKssB8G1m+4opL2
 0CSA==
X-Gm-Message-State: AFqh2kqF62wJZt3wSPJ+Z3YoMxlALngz6LSSqr0tQWVvXnI6YAAbORyp
 LhPEEsbKt9s+X0m2MLVGW6eoPg==
X-Google-Smtp-Source: AMrXdXvC9XwvQcRmNqlr6jzHctoBqmAZeHIOqIgv5sWT8T5b/30r3qDu0RXVY/njhvf/ic+O6G+SBQ==
X-Received: by 2002:a05:600c:3d10:b0:3d9:ee3d:2f54 with SMTP id
 bh16-20020a05600c3d1000b003d9ee3d2f54mr17928003wmb.13.1674114556094; 
 Wed, 18 Jan 2023 23:49:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e?
 ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1c7c17000000b003d974076f13sm3944933wmc.3.2023.01.18.23.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:49:15 -0800 (PST)
Message-ID: <db0b2baa-054a-4bc9-d75d-c0091c15b8b0@linaro.org>
Date: Thu, 19 Jan 2023 08:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/1] drm: bridge: ldb: Warn if LDB clock does not match
 requested link frequency
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
Organization: Linaro Developer Services
In-Reply-To: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 07:55, Alexander Stein wrote:
> The LDB clock needs to be exactly 7-times the pixel clock used by the
> display.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> i.MX8MP has a dedicated LDB clock which defines the actual LVDS link frequency.
> This has to be (exactly) the 7-time of the pixel clock.
> Although the clock min/max range is available, panel-simple does not (yet) use
> the range to find a (perfect) frequency which can be used down the chain, which
> is also in range.
> Depending on the pixel clock the exact multiple might not be configured.
> Raise a warning if there is a mismatch, which might cause an invalid display
> image.
> 
>   drivers/gpu/drm/bridge/fsl-ldb.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index f9e0f8d992680..9bcba8fc57e74 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -66,6 +66,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
>   	return container_of(bridge, struct fsl_ldb, bridge);
>   }
>   
> +static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> +{
> +	if (fsl_ldb->lvds_dual_link)
> +		return clock * 3500;
> +	else
> +		return clock * 7000;
> +}
> +
>   static int fsl_ldb_attach(struct drm_bridge *bridge,
>   			  enum drm_bridge_attach_flags flags)
>   {
> @@ -85,6 +93,8 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>   	const struct drm_display_mode *mode;
>   	struct drm_connector *connector;
>   	struct drm_crtc *crtc;
> +	unsigned long configured_link_freq;
> +	unsigned long requested_link_freq;
>   	bool lvds_format_24bpp;
>   	bool lvds_format_jeida;
>   	u32 reg;
> @@ -128,10 +138,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>   	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>   	mode = &crtc_state->adjusted_mode;
>   
> -	if (fsl_ldb->lvds_dual_link)
> -		clk_set_rate(fsl_ldb->clk, mode->clock * 3500);
> -	else
> -		clk_set_rate(fsl_ldb->clk, mode->clock * 7000);
> +	requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +	clk_set_rate(fsl_ldb->clk, requested_link_freq);
> +
> +	configured_link_freq = clk_get_rate(fsl_ldb->clk);
> +	if (configured_link_freq != requested_link_freq)
> +		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz",
> +			 configured_link_freq,
> +			 requested_link_freq);
> +
>   	clk_prepare_enable(fsl_ldb->clk);
>   
>   	/* Program LDB_CTRL */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
