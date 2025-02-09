Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F064AA2DB74
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 08:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029C10E282;
	Sun,  9 Feb 2025 07:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gqoU+NHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E39510E282
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 07:13:43 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5450408455dso1368784e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 23:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739085222; x=1739690022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rtoBvvBXq+A0pmEk8CYvl82BZLR4W0Y0AGuR33DODy0=;
 b=gqoU+NHO1QoJp37trnb4Vls4Fo85sjaMG0/GSPFxKTzVrjZaJNTklazH9t05v1Vkm6
 QB957/x/lNayVmR7gcGkkKaxSyKag3sjyvGqUNBa6x404pnk0ExVq7tTE0Dy65rU1zwl
 wqvmcQtCvUIwYcmBmydM+Pwnba054ekucey9q5swsrFBXXkapIF/Ygy4HDMbAy82AiUp
 zG9olIIcjw0wDMybWOszSf4/416Gq0cYzlwDfcFRCNIw2U4xG6T9NbOHhkOqFwSyFXrE
 w8x64SH58q3yxS+DfsD1MtHRvdblLeeaYD2A89mSpxhz9w+XRdKznRaJjbHqZYxymRCW
 VpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739085222; x=1739690022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtoBvvBXq+A0pmEk8CYvl82BZLR4W0Y0AGuR33DODy0=;
 b=vXMrijBMtnpvtNuB+fpckekjRSVEcSqogDQ5qnuMiE7OtU21Xt3uYWb7vwUL2P6YZd
 4tLv23IK2hqerH43qn0JKTZU2Y17zE+EXxWpPIYjDUuEiOmB+HbvxSZUkCdpuFnk28Ws
 0DwSUCORGEB4M7LoIR7uEm4SiYGbQ89AAQuDl+7WmxfpSTTxoT3pwfm0ZH34tMgy93pK
 Ane3AoceLQt/QTrGUI3paf0PSe1BFHbxMuB1JNd/i/og5fGhZlvW3Rmwz+nj/YiTXNvc
 ZwihLLfYPqBOcJrB2QiGlY9B9gIE/n+qaVala7NFQq+OrqoGT0BL2E+GQTu+4MDcOHta
 Lb0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu9mhiSakyZH1KoIt91PfceGe/XK9NuPs4AUt44AeZgTHNOROG5I96lmEEXYEzM7fRdejlnqjD8Bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHnmHYgxxpYcikbwNn0tKAmVews69e8rkg5escwYMZpt3Zt2Ip
 K7hQ96Cm1Im90M5+xlWDdgbVecWOf87mzTTImnnDcHUv2Da/Km/6ZtsboXuC/5A=
X-Gm-Gg: ASbGncsWnhcorDy8byC8/FYwGuNTRdrpmjTXGxngiq/aw+k4nZJqliO5myZAfzdQ4Xt
 N/HF6UekrwatSekX9zxl4mHOwBOnCVzAe/AIOgYHG23vHVnSO2tPT6SQ7BD0jUeLN/9ljwqLWJN
 n/PQEspHoM0e1btPhD++GiidnuBmsTLikqmsOEDod/YyEN7gFxCOCDfRNkcP7tvtwav/y9+eo+y
 GsaPb08mWT6LJLfERbWFCWjNPcbysO70ZMmOaSRLH8Pt1yrmuVjyQ2CotJGVwo3jBA6Drm1vthY
 /xu0VCWF24spcgp8TPIVP8PhF4xkJxbfCub85SvK9jQB+V7H3v04sUdD815pTPQJ0+7mBiA=
X-Google-Smtp-Source: AGHT+IF7hBwAZTOtRcKe0RFZ1UYJi/AMkXIy2pYb2WFwL5WWDW5zDesgsgND7laE6YwFlpNuTstNbQ==
X-Received: by 2002:a05:6512:3a84:b0:545:76e:31a with SMTP id
 2adb3069b0e04-545076e0d5emr783312e87.11.1739085221671; 
 Sat, 08 Feb 2025 23:13:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ed1bsm905288e87.50.2025.02.08.23.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 23:13:40 -0800 (PST)
Date: Sun, 9 Feb 2025 09:13:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 04, 2025 at 03:58:02PM +0100, Maxime Ripard wrote:
> The tc358768 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b4fec83c5230512d96 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
>  	ret = tc358768_clear_error(priv);
>  	if (ret)
>  		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
>  }
>  
> +static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_atomic_state *state)
> +{
> +	tc358768_bridge_disable(bridge);
> +}
> +

Please change corresponding functions into atomic_disable() and
atomic_post_disable(). Calling sites have access to the atomic state, so
there is no need to have yet another wrapper.

>  static void tc358768_bridge_post_disable(struct drm_bridge *bridge)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
>  
>  	tc358768_hw_disable(priv);
>  }
>  
> +static void tc358768_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_atomic_state *state)
> +{
> +	tc358768_bridge_post_disable(bridge);
> +}
> +

-- 
With best wishes
Dmitry
