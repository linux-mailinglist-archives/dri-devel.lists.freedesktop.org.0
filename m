Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33139AE4A4D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECA110E442;
	Mon, 23 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="opRMRUzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCB310E437
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:16:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso3847554f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750695370; x=1751300170; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yO1ealRuE4yEPMjJdBgcY0UE9jWW4gYbcYd/I6gI6bg=;
 b=opRMRUzmg7aEcR52tto8b7zfy5CeJw7W3rErnyt+hnPtfoT6Z+QL5HSK+sCedMSG/c
 V1/B4wpbSQr6ror7Z7Ndukx/YXcrcNOL5Xb4k6RzhW/QnH/Njw0PKQ+dAe/vcjoooPJs
 KgE5mNRiy7hH8duzM5TP6SN8WYJgKkOAh4ZuYHcAYu5o14mBV66nd/7VE743ouYP6WLe
 Zp1/RjAAeYkedGBwSMEI9taOcoZONNZxi4s0yOchRdnuN+wEKt088hQEChy00eJeY2XI
 LNOEDTVr+CRSDHI48oDESO7A5LyiBBzLtyRA+zMxYpleXbZf6wOSWJmTp7GsSx5m8nbN
 6BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750695370; x=1751300170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO1ealRuE4yEPMjJdBgcY0UE9jWW4gYbcYd/I6gI6bg=;
 b=YPHmzMW7B6GQozfhk4NfvCvI6AOwDtg9P1Je+bXB6a8FnSgL9zmcNlWIGpcplglB89
 nZ/X7ZVbsNFYKw9HxatRpcThxi1EiFlxhn/cMv3yjIjcgbqigtr30ccyGLn5KmEY6aBh
 gkw3ao3ADc/tXxjakjUEWd+sk6peLN7rhxSQu1laRCW4khlzFJV7umooYX4ooHbxi1qy
 0zhqLhnlivISKpmcDAUN3wpfNt7YaZteKlc5zBKv2WRfxj0cpCcA0ycaigBr1/Al+4lb
 MUL+tj1/sTH8a5xwQrrigTHG+h8ZRjcvZdxDeIgbYw4K2lfTGV55DjVSQlgF+DisI5Eu
 WoXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjsko+fAVFIAXQihoAF0lqw+s02sn4lfOIm5LZ438l4ao+Pb5I+Zr4Oezri4CexhMM91IafTvDGUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5UbNRWNw6BKnR6eGqCB6vlysa0+Zig6gKcNn2O7Qdzstj7kN0
 gZq7JWkkwRRaz4thGMHnKu0G4ptk1Z2yt6XjG6rv50kGFNLfpJknoUvaGErAgb5wy3c=
X-Gm-Gg: ASbGnct3S+GnyIdGQ0CQmycCQ4uWahfwYFARftvdNzx5pVqM7fdfLLo62n689qCwIH8
 VNZvKgGlrJQetPHGHJAiD2VtqOyd8gqN2Z9MWsWU+aF9Nd8LlZ1y2xpua3xJHq6GSIayrQnnXtn
 2FuZzj5QM0H3nk64BguzfYmsRpady4wa0gEF5jOrZu9pX9haPR7OZ/I/3Pnt9hgnmliaK+mKaQs
 KJ+FSCJwhWxkm/ayDcFb5jZQscqa9k8Q4nC/9TAJSMmgeUx9a43JTOUUI2GBfA+fMrS/HvlFlxi
 kKL+VNWVfPkc0CVmoGLT54JymWmn/vq9mo4Zlqw8455SjjOJCi/BwEh3dG1e9akd6KRxNUSUqg=
 =
X-Google-Smtp-Source: AGHT+IG1GltRs/clSARzmRQhvHut60zejlD1k+oWtIeF50l7rVK9RZ/LkGHmFxG9oef8hykFwyx0Kg==
X-Received: by 2002:a05:6000:2504:b0:3a4:f9e7:2796 with SMTP id
 ffacd0b85a97d-3a6d12fb64emr12830861f8f.35.1750695370340; 
 Mon, 23 Jun 2025 09:16:10 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8c16sm147423325e9.19.2025.06.23.09.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:16:09 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:16:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Chaoyi Chen <kernel@airkyi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
Message-ID: <aFl9xBBLwSHxCPMq@linaro.org>
References: <20250620011616.118-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>
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

On Fri, Jun 20, 2025 at 09:16:16AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Thanks, this patch fixes the following errors for me on a Qualcomm X1
Elite laptop with v6.16-rc3:

[   10.900256] hdmi-audio-codec hdmi-audio-codec.5.auto: hdmi_codec_probe: Invalid parameters
[   10.901376] hdmi-audio-codec hdmi-audio-codec.4.auto: hdmi_codec_probe: Invalid parameters
[   10.909627] hdmi-audio-codec hdmi-audio-codec.5.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.910813] hdmi-audio-codec hdmi-audio-codec.6.auto: hdmi_codec_probe: Invalid parameters
[   10.918145] hdmi-audio-codec hdmi-audio-codec.4.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.919296] hdmi-audio-codec hdmi-audio-codec.5.auto: hdmi_codec_probe: Invalid parameters
[   10.919298] hdmi-audio-codec hdmi-audio-codec.5.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.928482] hdmi-audio-codec hdmi-audio-codec.6.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.930742] hdmi-audio-codec hdmi-audio-codec.6.auto: hdmi_codec_probe: Invalid parameters
[   10.930744] hdmi-audio-codec hdmi-audio-codec.6.auto: probe with driver hdmi-audio-codec failed with error -22

By de-referencing the "bridge" from the outer scope I think the current
broken code basically de-references some random out-of-bounds memory.
This should be fixed ASAP.

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7d2e499ea5de..262e93e07a28 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -708,11 +708,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	if (bridge_connector->bridge_hdmi_audio ||
>  	    bridge_connector->bridge_dp_audio) {
>  		struct device *dev;
> +		struct drm_bridge *bridge;

This is technically redundant since "bridge" is already defined in the
top-level of this function and shadowing it (declaring it again) doesn't
really make it less confusing.

I would suggest either dropping this line and re-assigning the existing
bridge variable (as it was before commit 231adeda9f67
("drm/bridge-connector: hook DisplayPort audio support")), or perhaps
renaming this to

		struct drm_bridge *audio_bridge;

for less confusion.

>  
>  		if (bridge_connector->bridge_hdmi_audio)
> -			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
> +			bridge = bridge_connector->bridge_hdmi_audio;
>  		else
> -			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
> +			bridge = bridge_connector->bridge_dp_audio;
> +
> +		dev = bridge->hdmi_audio_dev;

The "dev" variable seems pointless now, just inline
bridge->hdmi_audio_dev in the call below?

>  
>  		ret = drm_connector_hdmi_audio_init(connector, dev,
>  						    &drm_bridge_connector_hdmi_audio_funcs,

Thanks,
Stephan
