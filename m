Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB56A13020
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 01:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB1910E187;
	Thu, 16 Jan 2025 00:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t54f4/uR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC37C10E187
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:43:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so353602e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736988221; x=1737593021; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cQ0TPLlJKN1P51GLhGvi0h6ujIY+ObPhqVi/Jqxajdw=;
 b=t54f4/uR7+En2JPL58DCtb005FbNuM4GDUbBMMypQ/s1P61wHWzLzPvftXMBQNLRm+
 CZDmb/KPAczSIB3H53aK8i2oqEj81qDOpItG+xI5oWxE2Tzt57Wi7TQsAHjafJWGq1a5
 UyzTIwH9F9DRambxpa8w+5XR2DK9saOV4tOpJ2T9Vv9prHrv16WrAlmtEKVYa9eWS3jf
 yBCHAjE1q/50mw1vRhU5P1ygZyp1nH/mZt3QnVewjJ4pWGTYfGMVKtFWfyUaZNXv38xS
 rdIIxTqlgQ+0F2Q1/j6Q7ZW/65tCf0E4Ai0k0iU9hrLYAeYkOVBzgvu+5P9dCuAjAvGQ
 OzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736988221; x=1737593021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQ0TPLlJKN1P51GLhGvi0h6ujIY+ObPhqVi/Jqxajdw=;
 b=NCgx5iXn/r/gI+HN35Jhb8NzZMSrI/9p+PdsHRsk7Q+xat+Iu4YFIG0Yjy1Qtyuc4s
 4qPzt0qlninCs/5i60WaKQGJoT2UjYEWi5D6cdusJwWktju1cAxoU4Nf8JkdcXFgd11a
 DFZ5N4Z5fm0Av0A0O1cymJje9znloG03kwSDyA8uXwFKj+mCqF9guoeiX80Yx4Fh1f9+
 mblLhd8mLDx7cQOxsoycIiWCdBo9Sb4RBbkLqL4HshXd7zNZzRSGwm5HbBCHZ4IuTtKX
 Z+Kq3cKjpfEwIuQRM0KZ1EZIYVQ49kBP78uBofkuyL72YngjGySpg7qYcpyzwz9pCvVi
 fagw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsRwnzg/6bMuDI4GXNGarOrxoeO9Yc7hmaIz822BiZ7PmiyD/b1RJFdVfUPzqO6pUenMj/YEGA0Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxubxgNxmKpsJL5hspWsw1RjjicZ/2iO/r88NEjF18PC0tKxJ2e
 ocLNm3JTdb3pkgS5tAsxXrgcOdfCfej8NtY1m+7tQujPpnZtlP5Ps6sYSg1humLT+9OegO0NEot
 z
X-Gm-Gg: ASbGncs0rlcGbEYp35GZ0WMykPgy++PaI8X75KhnOghBZpwsNpuitoYHNb3WtBKXuET
 xxGW8DNiQ49HrebDUOP6jUXxAk4ZuU4WSNu3qpWSGFR2LyRWXK2qxQFfvqYahNjznip+SSUHoEA
 YQ4WZRA1hQRh0zAUCF6i19yE4YFiOcRm56lQrl3C4GRb+Jd13qt3xT+9Kr0afEX+a43BfL0N0/O
 1b8ad8KsE6cYvoU8t8iasApj+xVq2PTnyhv7AjY6ulmGGALphbinuIZT1YxEDfA8zv9LThF6ICF
 VlxlMlqovmUFt8646z7dth/MYVOxgM/C+0fO
X-Google-Smtp-Source: AGHT+IGSufqOMY6MiDi92IFsAF82d8xmZycjq5iNTl8gAz7pYUqL+WcjDWLOpJd8t4wV+JmrFR+MHw==
X-Received: by 2002:a05:6512:23a3:b0:540:1d37:e79 with SMTP id
 2adb3069b0e04-54284558dbemr8977761e87.27.1736988221082; 
 Wed, 15 Jan 2025 16:43:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becaf6fsm2121616e87.241.2025.01.15.16.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:43:39 -0800 (PST)
Date: Thu, 16 Jan 2025 02:43:37 +0200
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
Subject: Re: [PATCH 23/29] drm/bridge: Provide a helper to retrieve current
 bridge state
Message-ID: <opuc3fhvncg6rb3mtktirytr3jexun344bkaatv46sq3nvx3qm@qn54dhudksw4>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-23-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-23-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:30PM +0100, Maxime Ripard wrote:
> The current bridge state is accessible from the drm_bridge structure,
> but since it's fairly indirect it's not easy to figure out.
> 
> Provide a helper to retrieve it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8e18130be8bb85fc2463917dde9bf1d281934184..95c5037a6335e4c1be511e6c31308202015c7754 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -955,10 +955,27 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
>  	return NULL;
>  }
>  #endif
>  
> +/**
> + * @drm_bridge_get_current_state() - Get the current bridge state
> + * @bridge: bridge object
> + *
> + * RETURNS:
> + *
> + * The current bridge state, or NULL if there is none.

Are there any kind of limitations on when and how this function can be
used? I don't think we can be accessing the state randomly, as the
framework can change it at some points. E.g. what if the driver uses
this state from audio or cec callbacks, while the DRM framework performs
atomic commit and changes / frees the state right concurrently?

> + */
> +static inline struct drm_bridge_state *
> +drm_bridge_get_current_state(struct drm_bridge *bridge)
> +{
> +	if (!bridge)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(bridge->base.state);
> +}
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object
>   *
>   * RETURNS:
> 
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry
