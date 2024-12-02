Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE489E0277
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80110E723;
	Mon,  2 Dec 2024 12:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y+hGFBwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611C010E723
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 12:50:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53df1e063d8so5247830e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733143833; x=1733748633; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gR00Y7aC6qABGWf6TSpdF1xwTEZztd/zYEK2dEs/vb4=;
 b=y+hGFBwAgh6Fq7Hdm2eT6X5qguvBdyamCIa0Gp0iYkCiN5p6Ik19ecOunF1iFfNhdU
 bgZDt2GQb9t6k9oBYCndX/ZWOkyQPPK5h/jSCxMRY9HzJEG4c41Y2jUjfbWbn4TIlTuV
 r8PFTzqflOBm84m8rALRZJORy1AXoB7tKABwfbsqPItkPEaKsNZXlMQ+RIhQE4408pAC
 OjXidYDrp1zLAa1MzgqwCfdMVquKFXr2O4fyYQ3a6Av546YPU/a3BsB9Amd8HYxlWpJ/
 WVirloD7dz2ad+LW0GzBU1NzgFSq2yoYfu95ubeFiTPtla2Flo1tQqp3BB44JgQOJb/d
 qhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733143833; x=1733748633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gR00Y7aC6qABGWf6TSpdF1xwTEZztd/zYEK2dEs/vb4=;
 b=OaknXbnIQkHbfuCQuYuOj7gzkwcMV2D49u9S0Bvie5l6I/prMGHRJ07OjhaLgEGAaW
 eXzE8twM1eAq4SVpFKyn0qk0o5RCC2emFTyM/IKo0kYvjJuIgaMyPCh1iR00SeW1vMMq
 BIda7WGP61xBx8PtfR09QdW6etVQveQINNjhVxRuMhLIeyJhAb7ZKrfMrCTguDAZE78B
 UDAWPcRUk4/gUGMU2j82y4rb0DlTdN1Cknt4eBHdfUO4/aXuECZ3pck14l+5gcppkN7i
 EBNcp3ZOu86G/p5DNb2ALHjqV4RDVJ6Y9h4qvx/aDGPUXKPUYUZPJsCoZeIZjpJZ3yI9
 2qGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtoMVbX/SrUhNyWrIiEJw3q7o9l4t6UgNr7K5aYvKr5/a37/AcnFir6h6QzW6IhTOJqsCeS0ZyqKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVNBKOYNiN340BPCXKoI9YmXyNkLCm+EUo5ahitCodgFQXRGSO
 hxq6ql6a+H9mSQKKQ1+YbZmZeJkCuqy7LYCIvcUlGVTEhaIFxIxdhJbtghVQNgM=
X-Gm-Gg: ASbGncv2x87q2tdtxJnLbQl37mF8xwHax2dMiASQoJdQEMHkO8kgEkxfeVVbQRPU66W
 x7WBLdftRV4l7yU8GZJ/RBVV5U4yQ+SIi2S21DDyC8ZNnwEr0i5YzOlgYqK6CNiy/kOV+eKhvNo
 y6ua9rJRddLusOZkEcUSVR+BqC2/aSm4QYUz8pxOEZQvgJD9++UtCA+ykWpQEKAzMMEuFL9CI5I
 uGeI7toViZ+nvogqawu0mAIxIjXdqBRI34MwzZjShy+ToIc8H090wGm2NvUnUr+zy0b5Bdd8Cdr
 RuUc69epu9idYSCW3a5pl7eIVQ7d/w==
X-Google-Smtp-Source: AGHT+IFOtbglEGI/q4pXr3wFhFC9dW1ANV1WehPk21HBJswjUAeAzRtsTqIj50RgnqdvfxR/wi+cIw==
X-Received: by 2002:a05:6512:220d:b0:539:e65a:8a71 with SMTP id
 2adb3069b0e04-53df00dd2cemr12320514e87.34.1733143833517; 
 Mon, 02 Dec 2024 04:50:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649f62dsm1472540e87.245.2024.12.02.04.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 04:50:32 -0800 (PST)
Date: Mon, 2 Dec 2024 14:50:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Remove redundant
 assignments of panel fields
Message-ID: <h4nkbvwohp2izu4mzyv6nih42nqb4yspyxxqwyhojcgxvn5mj2@frar3tof42ds>
References: <20241202062449.65593-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202062449.65593-1-wenst@chromium.org>
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

On Mon, Dec 02, 2024 at 02:24:48PM +0800, Chen-Yu Tsai wrote:
> drm_panel_init() was made to initialize the fields in |struct drm_panel|.
> There is no need to separately initialize them again.
> 
> Drop the separate assignments that are redundant.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 272490b9565b..1df5303eb57c 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -193,7 +193,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>  
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  
> -	ctx->panel.dev = dev;

No, this will break one of the following function calls. Please refactor
them too.

>  	ctx->dsi = dsi;
>  
>  	ctx->supplies[0].supply = "vdda";
> @@ -215,8 +214,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>  
>  	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> -	ctx->panel.dev = dev;
> -	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
>  	drm_panel_add(&ctx->panel);
>  
>  	dsi->lanes = 4;
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry
