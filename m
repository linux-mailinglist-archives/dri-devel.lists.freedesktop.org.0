Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE99FC194
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 20:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1710E24D;
	Tue, 24 Dec 2024 19:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z2l6UVuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0710E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 19:05:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso6400473e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735067044; x=1735671844; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UBIwJqw/Clb8+C1f9+95Sz1laX2Xl/a58GSILkxkeTU=;
 b=z2l6UVuSkZq64ZQrcvVQLzP2fvxwGTV74RpWquvjbTXgc2JppnOwTgqzkdesBbrxo3
 DgNbayk7FkxgZljTpC5doMuE1dDx9246CgABvgqWJdJ9NUljZt7ISIjIDcGBaOzFzftU
 waLwqGMcoqRMLLwTwl6fGVB31nsGkZw+hXc9inyuYEAFlcrdhbna2OwUgEtoK/Ue4Ryj
 HdGH+3LFRW2BEprMfJ8U+5I8YlxhUtlZujDOWfc0kuNRMfpFBuZSpCwBSEi5J2DhXxTJ
 kWRHc8bXmvRSrukbtU5Bkf1nCNrdj0sky6+G6mJ968vnIo+yxR2V25D4PnEuzID3lqhO
 4pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735067044; x=1735671844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBIwJqw/Clb8+C1f9+95Sz1laX2Xl/a58GSILkxkeTU=;
 b=bvWJvfSqplvwVjevyX1UGo2ql24Gf/ZdhL0RIUBCcBcQm4SxuzR/pDJhXWiLkFKD8k
 Ogo+uKf7FAF+74Uo/2mJ5HtSUEamBkFpTvR/lEfS/r6WvSUXifiLuOEK2zP5SJZ1GM9J
 UweijoaQ3E5E8fF0jEUGb7NlSkgP5QBPbgnlvHuMmRjHq0/IK0isZOzXrqsCCDVjzXwh
 J6CkKL/CgHufpubwZ+40b+UnMZZcE12Ao3zIAG5LFTuEjixLh4aY78oVAJGa+jve8j1J
 ioc/dwX1I1ZjwvcO1Bg4M6FXXx9Goifz+ieoIul/08xau8v8FpE6TPuGKxojQTLp/7Oi
 RwQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxZiv7g6tWOmNtzcRM5Me3NwfZ4kYWQ4lRpTyoTWoLh83oa3NPwFFaVzMhAZs8xBVlylA/505vlHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+fyLOmFR+1R2ilYRI2TxpVkqeUU3KiifQ7amCMuXhcS9l5GK0
 wkADPMOWljQ7vUI/l/OBPi64BbgZNlWxoFhi/PsEHv4wC6I2On+191gay43Y318=
X-Gm-Gg: ASbGncvZ+CtSJprmJ+1F8Ty2SuVifTOYAIuII60YDN5KgrWnNnamlDRmWwVFSie8nMY
 ucpdqmklfKzQrFeSdkCRrBM0DZK4lE5jINTwIDz090fsOAJUvhb3QYTRaJTmmA0YhMQENd9kW2S
 8xqyJy1mV6hDmpH1JGM82p/pmAjTPL2BM4hWr7qj32TP4lyewjSFazDZcv242vdv3CtanJsyfRp
 groOzCtEPy34X1LWK72HdjHpZ1mR/uxvfHOx38gwpwkcANhKmLsyS19S67W7I/hWgIYnsGDlWmE
 SkCuCsnIM8Ut6k0wE6/cpf53OV5Pv/96zMav
X-Google-Smtp-Source: AGHT+IGvybY644CV9Sj0MpsupvdxJCSrHMjMgkqLXpUgmWSKnVeWFeespI27d7CK+pRUmDxE06aRtQ==
X-Received: by 2002:a05:6512:3351:b0:542:29a6:8ebb with SMTP id
 2adb3069b0e04-54229a68efemr4004867e87.2.1735067043705; 
 Tue, 24 Dec 2024 11:04:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214b5sm1674321e87.187.2024.12.24.11.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 11:04:02 -0800 (PST)
Date: Tue, 24 Dec 2024 21:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/bridge-connector: Sync supported_formats with
 computed ycbcr_420_allowed
Message-ID: <pxyazkzdgbuc5txgcjh4rhjtveynm3pvjyhwqwbwj76nkehyg2@uxd4hq3pd52l>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
 <20241224-bridge-conn-fmt-prio-v4-2-a9ceb5671379@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-2-a9ceb5671379@collabora.com>
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

On Tue, Dec 24, 2024 at 08:22:42PM +0200, Cristian Ciocaltea wrote:
> The case of having an HDMI bridge in the pipeline which advertises
> YUV420 capability via its ->supported_formats and a non-HDMI one that
> didn't enable ->ycbcr_420_allowed, is incorrectly handled because
> supported_formats is passed as is to the helper initializing the HDMI
> connector.
> 
> Ensure HDMI_COLORSPACE_YUV420 is removed from the bitmask passed to
> drmm_connector_hdmi_init() when connector's ->ycbcr_420_allowed flag
> ends up not being set.
> 
> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
