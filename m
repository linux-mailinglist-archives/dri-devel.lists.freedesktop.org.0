Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A79FC196
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 20:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13310E499;
	Tue, 24 Dec 2024 19:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yDj40uiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3BB10E499
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 19:08:33 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso73857801fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735067311; x=1735672111; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rR7Kz7Vbzw9TQq7kPep5fP+swPJWe6efBfYt5PdPR2w=;
 b=yDj40uizRIfgHe3NwUQpIHhrZDBwb2Pow3X90GvK10oWFvRuPLxV8XlV58eT2tJSpU
 qDPrpOSe2o8gNv9NRSdjhcE8yokLwjELiRw6xw0QiEzNRjzn6Axduh+MPZ0gg+Q5azA7
 UgPWp7se3GtQfUmb2Z30KC4518tdjI7eXndPlSSIOxp6Zomz7t1xYYfPhSXCDPXXRseF
 oAxzPoSGvdHz9PQ6uWhqqvoSymOaCXlIK/G1bjtxSfEV30UFCyOXSWq1SiYlUvDWmoFx
 5/3u8SP4dgPSkGLtWyFjRO6tIukmmvjoP6Ux7XIuI3QAfnYjzOM+ZRHmRNhRpEBvEGJg
 jlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735067311; x=1735672111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rR7Kz7Vbzw9TQq7kPep5fP+swPJWe6efBfYt5PdPR2w=;
 b=kar+V6W7XVBWF6uRY2ZA98fx/LqMvB3RrlCB7/EPrcZQxP+P/hEM6MdhxMGHr5Cl9M
 hxShmK36OanDB+IxqR/6YaeY32KXox7wC0GL0pVYNWm2eBwq0pkhz+0uOiPckGuBbT9u
 nSBAwh6JfHK7KVke6AlD0mruPIq6ObWJ59CVEL9fiEj+CJTClCIomtTVsdxJK9YyZH5y
 47YWz92lyEvHjapMLw0z1F8Col9CfYuws/i18PUuJw273eDFeq2KEc7kothb/HWqJRPt
 r1CY/rbpIUNn+ZhKFjvKAbKpuTYtVk9ckBafIgr6P6RqPk2NzkuXb5TvrvPR0PVwcrpR
 dQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmKCS7P7S1SnfgJmzWzs7DnViLLwIloN0D3x7uE0OInpzMelcWDdegOiiFFcU2H4M2z4E3ko5gHyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNlOjAs2EfU7NA5lLEcyytg4azbjw/juMx/ipU4P9koXTfdNOD
 ATktnSNPWpQFfxnY00ntgYKi+q3uSkXiblfVSuaQ13rGiyfDjFsfrggGcx7etsc=
X-Gm-Gg: ASbGncvmPfw5pnn6jfsd5QltH9DQoyTc1baz6zeTAm3pkqSvbkn3PYNS6PBDmd60mtq
 eKR9viqOu2VsSJSZKGrWiji752CQCKDKyj5tjjUIAO7GDg7/1pRLWTC0el17oBAMvoy46MuyZOR
 2JA/usC1HkA2cWFvZqSjbDWitatZdvLo+Dt4gylv5DrYZFADyrs9G0/1QaUiixmj9mO/s0JUKsV
 fYB6BEOcayNZ/mSLwLDGimg4w0eom0gfzVi/iM9nt3zwheoRTMmn4HfBKKKjZDK5TuKO09+WwwY
 yUJzKoACB/KJcb1OGj0CkUzCA8575nTjeoCT
X-Google-Smtp-Source: AGHT+IG6usKGUFZocYkglwb9B3Vx/jZyl5rTBylugZ9jzz+Qp0KNrMnHBD7J8yffn9lc6mrEBIWp9g==
X-Received: by 2002:a05:651c:1503:b0:302:2620:ec89 with SMTP id
 38308e7fff4ca-304685904cdmr54787451fa.19.1735067311468; 
 Tue, 24 Dec 2024 11:08:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cb74sm18234071fa.7.2024.12.24.11.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 11:08:30 -0800 (PST)
Date: Tue, 24 Dec 2024 21:08:27 +0200
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
Subject: Re: [PATCH v4 1/4] drm/bridge: Prioritize supported_formats over
 ycbcr_420_allowed
Message-ID: <fxejrxzouuwioyfu5hcrpsy5mabmjknxvtozefrkx4fnb2phog@ncc2wrli7uks>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
 <20241224-bridge-conn-fmt-prio-v4-1-a9ceb5671379@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-1-a9ceb5671379@collabora.com>
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

On Tue, Dec 24, 2024 at 08:22:41PM +0200, Cristian Ciocaltea wrote:
> Bridges having DRM_BRIDGE_OP_HDMI set in their ->ops are supposed to
> rely on the ->supported_formats bitmask to advertise the permitted
> colorspaces, including HDMI_COLORSPACE_YUV420.
> 
> However, a new flag ->ycbcr_420_allowed has been recently introduced,
> which brings the necessity to require redundant and potentially
> inconsistent information to be provided on HDMI bridges initialization.
> 
> Adjust ->ycbcr_420_allowed for HDMI bridges according to
> ->supported_formats, right before adding them to the global bridge list.
> This keeps the initialization process straightforward and unambiguous,
> thereby preventing any further confusion.
> 
> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 4 ++++
>  1 file changed, 4 insertions(+)

I'm still slightly torn between this patch and a simple
drm_WARN_ON(bridge->dev, bridge->ycbcr_420_allowed !=
(bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420)))

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..241a384ebce39b4a3db58c208af27960904fc662 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -207,6 +207,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  {
>  	mutex_init(&bridge->hpd_mutex);
>  
> +	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
> +					       BIT(HDMI_COLORSPACE_YUV420));
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
