Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83555901807
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 21:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AAB10E27B;
	Sun,  9 Jun 2024 19:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yZqWC1+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A5F10E27B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 19:38:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c8c0d73d3so111429e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717961922; x=1718566722; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFG9zs+TOxLu+QRcet0jDU4W7tv1prViIcV9q7WG5hg=;
 b=yZqWC1+90fd7t+feVo+f42+1JGtLVoFaDFNjJtW/VuCmJYFkVTGfFkmKUz4z71/BDp
 gt71FVgZ73covkZv+5Uxe0WfdNB1G2pc58yBbG1bw79snMgRylUNI8nRXfj9PzdkLIHi
 ydhRsjD5whx+9aAqY3+uoBT10MRKSNqjfa9YzbCvRdyE+V7oJrHXrjQg046MnfKHNhZz
 CI0mxn6d2UcPNZeQMbUz3gY5IDE7idogV0Suk47fY+p0rc2bhvutylD2xq0qLAt3QDcu
 EiQ23zJAQsPkQTgaZVPcQlyUCANQ3rnboVJbXFBFongFFh+ZocDpNDBKtNk+tWSSu/Lw
 UBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717961922; x=1718566722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFG9zs+TOxLu+QRcet0jDU4W7tv1prViIcV9q7WG5hg=;
 b=Zebc6Ok6JN00GlakCqZKJEJ2vo2VTTZsCP7t5kT4fyzKsOJmGX43v7VClKth5JX1UV
 UK2cW7h1h/UIz/S+cX8YnHZRoVYTzLO223AQu30zKHWVsOrrg0wVSbtxpkFS75xTRdC0
 FbeNphTSfcaEIuztPlzf2WL/4IPQnqPBsxoqnJc8DdmHgUJTftuqAeJn1G9gzB7m5bCt
 qlur1DoB5YZBZ97MJn75yzX8m/UfbCs8t/m10vXPkXRlB+BO8/1jm6Q3DDCls4O1GD3g
 Qt+r4UIuFDhlNUWphmalm9fpEq16FShzJIdMkHMxXiNfQMUXJeWTkveyHcce+U0UJt/X
 zUyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyMAJEtWJtsN8em6D8Sfen2CpOaR+6DHBrL+zSnJukM/UVOWaNY/WXvHmXqeJNzl4tlajXZgJwd8tWJSSQP88XeRUP1vDlMZWBQPQFW6cG
X-Gm-Message-State: AOJu0YzErs4I8L+jlc7SSgco7WgLZVjXXc9ion14pUXiWb1ly1hSd+FV
 /4IgQS41hYjIURaj/aaruB2hs0ro2kF+4Kow4KCcjKrgi3RE09YQAXPBFH5/rPY=
X-Google-Smtp-Source: AGHT+IHSueJBRFGzWu+izXA3ywWeAfW1MkJMtWq2Trm5auscntgaCkFjmL0QP5uI/dfmwuEq2P352g==
X-Received: by 2002:a05:6512:2211:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-52bbf8f01c6mr5065732e87.40.1717961921651; 
 Sun, 09 Jun 2024 12:38:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzbgq2gvv5-kpclzt-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a04:adb1:631c:fd0c:1269])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb41fa022sm1286759e87.118.2024.06.09.12.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 12:38:41 -0700 (PDT)
Date: Sun, 9 Jun 2024 22:38:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Allen Chen <allen.chen@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <vk76z5x3al6rrzb3n2misu6br4fbmc4kj3agyo4ry5fz7ajsm6@dfpq5yzuolvm>
References: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
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

On Sat, Jun 08, 2024 at 05:21:08PM +0300, Dan Carpenter wrote:
> Smatch complains correctly that the NULL checking isn't consistent:
> 
>     drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
>     error: we previously assumed 'pdata->pwr18' could be null
>     (see line 2569)
> 
> Add a NULL check to prevent a NULL dereference on the error path.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 3f68c82888c2..4f01fadaec0f 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2580,7 +2580,8 @@ static int it6505_poweron(struct it6505 *it6505)
>  		usleep_range(1000, 2000);
>  		err = regulator_enable(pdata->ovdd);
>  		if (err) {
> -			regulator_disable(pdata->pwr18);
> +			if (pdata->pwr18)
> +				regulator_disable(pdata->pwr18);

Wait... I wat too quick to R-B it. The driver uses devm_regulator_get(),
which always returns non-NULL result. So all `if (pdata->pwr18)` and
`if (pdata->ovdd)` checks in the driver are useless. Could you please
send a patch, removing them?

>  			return err;
>  		}
>  	}
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
