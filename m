Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D6A05976
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 12:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384310E294;
	Wed,  8 Jan 2025 11:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H4lQcl80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E335810E294
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 11:15:50 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso718025366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 03:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736334889; x=1736939689; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u+HPF6exIaTIEGy8wY6llOti6vLJ9hWG/JOyR/IS/24=;
 b=H4lQcl80T6CqNoWA07I31ohnpc3vnYZF3Dny8b5cNdxr7IRvNqpCuHEFPBC9uOY/kS
 GR+ct+qa7xPN8Ci+EBkQByMvb6E3NrlHYltXJafkGPqPsk+k+2IPNAhr0IFLe+9/ybum
 S/G2srzOvKUuIsY+d6p3Sv0hh1UopaSv3a/ukZsnLGkg/dGFSekIkDmDxoKMKt9UtXwx
 UPp1VHV0/oNN1HOfHYDkL9uU7lGhJ3reFDEbyRHsfqPM8cRWCr7sCFC3R6mm0Kv6W+w/
 8xweFltps5oIGyLEtAwH1WSYVkHcaPhN/yxQL5WsHtffU4sKS+oL6A6lji3ldNcxN05W
 Cetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736334889; x=1736939689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+HPF6exIaTIEGy8wY6llOti6vLJ9hWG/JOyR/IS/24=;
 b=wR/ZUakBvoPK2pXduRjsUlRSJ88rTDeQNSExXctYK4fDhQYrtSfiyq8q1JMNXYRUqU
 c3PftJvBVXeCT31Xr8aYN05WdoOteuqnrXij72LdxNGngT6pwNBCxB6KW2sjSVT1f2gJ
 VdYh82nlSXv62PNAQ1b+LVzrJSfVC70g0WDJhF/VGrUICs3c/xbHBZGruufkOOTUKDQL
 nfhzRhx+bnNylbhzcGQ8BTPJ8v9C9pzHdZZYl9PIj2PoLdk92mqynroKld3GQTwrBwoh
 JuE8VhAJrUucmP5kxN4nFaMIgy4AhUeLUiGAsw7faIL3ShTX7TXO9V4h5FkO7C+wFQZ/
 hivA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlruUPQLfL3GSdS+QSFn2drzOSU7otkgKQD41kkLayIfiiM+nYyXVW8kwTIKlhgalUCpV17UZRYto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYrwJFtKMu7YogVQF0YYlZUnff2GKMiCkLp/UVS+p4lRI4Rt+M
 xRB6M/kGcDrSMTX7l3+rJx966d095jve85K4Ch8BJG00ai6aLbweewzp4mperPy/nPAL3C4xMfM
 I
X-Gm-Gg: ASbGnctLPIBU2g5dtZuThO4MsOzPNkKI5o+FXVPN/Vif+XiOsj/mwbo3SFLv9ONGwfe
 pxpkVIOn5NGKusFw5sxA1PeLstBrOH0OLqOTRSy9TVIMFddZ6iT427sxG5xrJ3DQXqHcqAmdUBq
 LhYu6gadwSSzV4XGpOfAMyE6NYBf6SWAtC5fMLYqLHoX3UPn8tC9ZKtriEgdIhe0TXG7A55DGZA
 ImZqTL6w46IMVKuvLj/2M1rbbuM5vC4lrAHWoXvxqCRQlgbQfLX9VYNKXxpWWPa7GoP0pxeacYH
 +ZYKBulesoCHcX9yM80IfQokwbg/s616zZDG
X-Google-Smtp-Source: AGHT+IF2qttiGHHWgi4RmlsJ/pYV/uqPJLfTDpg10sErcTmscJoXgcjQhaLw9484S3CHLAYFRqrgWw==
X-Received: by 2002:a05:651c:601:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-305f4643865mr4228341fa.37.1736333005922; 
 Wed, 08 Jan 2025 02:43:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67218001fa.33.2025.01.08.02.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 02:43:24 -0800 (PST)
Date: Wed, 8 Jan 2025 12:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
Subject: Re: [PATCH] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-ID: <lu2haon4sj3kvge6cowqgratgnoxg26kiwrjyjdgh7pt5v2hwi@v3xulffewwy6>
References: <20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw>
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

On Wed, Jan 08, 2025 at 01:45:14PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The loop of V compare is expected to iterate for 5 times
> which compare V array form av[0][] to av[4][].
> It should check loop counter reach the last statement before return true
> 
> Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>

No empty lines between tags, please.

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..e87247aea1d2ffbdad192e241056d34fdfb32163 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2254,9 +2254,12 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
>  			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
>  			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
>  				break;
> -
> -			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
> -			return true;
> +			if (i == 4) {

I think there was a similar patch yesteday.
Anyway, I have exactly the same feedback: please pull this out of the
loop, this is how it's usually checked / done.

> +				DRM_DEV_DEBUG_DRIVER(dev,
> +						     "V' all match!! %d",
> +						     retry);
> +				return true;
> +			}
>  		}
>  	}
>  
> 
> ---
> base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
> change-id: 20250107-fix-hdcp-v-comp-3ba8e3d7adf3
> 
> Best regards,
> -- 
> Hermes Wu <Hermes.wu@ite.com.tw>
> 
> 

-- 
With best wishes
Dmitry
