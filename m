Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E5A56098
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C10C10EAD3;
	Fri,  7 Mar 2025 06:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NEuodTZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505610EAD3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 06:05:20 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30bd11bfec6so14787681fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 22:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741327518; x=1741932318; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oQxWHUkgzXFo3DC5BqgaBEvfW4iqfmaghFAvNLTV6rc=;
 b=NEuodTZO+CyJnEZTVCiXg7tXT8JclZzuMMWsG88pNtEVpqfptV1GYq5S4b2rXtouNp
 j6qDVb6phhCmk8lW4hkMeJRGwMaomDlCiS4doo+BDXa43RSdiBGiC7N4fv5eDKE7bD9n
 MhG34zLKLkQ6g8qEqNZXJyIPCmuvLHVUQIWRfPqix47cCojblILVCJwrxrOYiCLDmhMa
 6hXYQpKM1//f4E0MofEK4KK4kJMX9SPTu52hOPwMftC7HrQL9e/+84XrqYsRxwqkeg6X
 LSfD5qD9pfmTzji9QW5dWC9Ho5O5jrr2d30OnaKQI1jAYDrvv1SZGjf4zu5BZ+08ZsQx
 nxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741327518; x=1741932318;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQxWHUkgzXFo3DC5BqgaBEvfW4iqfmaghFAvNLTV6rc=;
 b=GIRQiNf0h+V2E2ZyHIAZrXi7v8quQm696SyAmRN4V9tTvztv5cT5ztOCscUOQdYVZY
 xgiV86mGo3DQllwyjof8HgesfwIXkI3BHdgWvRDOG+UYCGyFjdd4b6pGlSn+lUATk0B5
 Pax1ZyXdmm1rQ6aK03c7E+LK14aYn3gqQ7VfgJZ2IM1cbQZID3zMC8yosL9dtNifqYMc
 v0RJ3k11hCWVmpJtxNZA5FQ0A2Wklt+wxBjlfpoRj9ItbdGbFmhALZa2bT5vmT6boujJ
 lJAPtyzooIwuVIVkCyZUIU9VEHE1T8fbDVZPpKG42xpO/RwJ2YjhAHZu8KKwCGiD15ug
 xc0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTiUVq4mgkS8wP1BEdlA+PtUvvxPMN3nediVjcl30qEhzvmg6Z1CRR6r/lS00ndVOaow1B0U7IArI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTk0MPZ5zzHeZ+hD7O39ZTIR5hs1Yznttj03sEOVQHTcwuXoQl
 bywagw+4B2m3GN5SxzHHzrdSEL7MzPpSwFctG8mCOYBfkMbT9SQRZIV3YtPyYw4=
X-Gm-Gg: ASbGncvKOC0JCbsjj5i5DCtSsEUpeghpHfFJY8T7I7xF11UCnk+w7CfqpnpD4XyL6kI
 aHiqvcgt1yrR/Xu+e650T7vrUiNsoc/pwFyxWHpsyc6gbB9SCMGsbXpldyniFJAFyHRmjP5OUW6
 2MMVMaMw1OPGbIMe+Z2B+lkovw9rm48CBLeh6VEu9V6gSMMi/xeKPg4c57jnwxrklBgUk2KbjwY
 KZ+ORNgaRTzR7wLFY5E6Tr4csQQc5UDvSiVIdeHxM4i/9C6dB7JA7parkZBMpZ+vV6gJ49QDLsd
 9e2IUmk4udDxw6z5vdvot/Lu8XcshT5nOUdkWEowM1tGwtZeCsMGcavn9UWWKiWy0dGjwFfsr/M
 +V2ELGNXNwxzO6eUoxRjRbXDs
X-Google-Smtp-Source: AGHT+IGS2APQvJItHsZgLmFWo8W33oL6dWOXuTifkVI2zFj+1cGRJhJN/teqyZE7pKDUwjLhiguAyQ==
X-Received: by 2002:a2e:3803:0:b0:30b:d073:9e7d with SMTP id
 38308e7fff4ca-30bf4665dfemr5006821fa.37.1741327517913; 
 Thu, 06 Mar 2025 22:05:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98d08c5sm4360741fa.11.2025.03.06.22.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 22:05:16 -0800 (PST)
Date: Fri, 7 Mar 2025 08:05:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "A. Zini" <alessandro.zini@siemens.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 Andrej Picej <andrej.picej@norik.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Message-ID: <tzrdtqpim2srjl3dihjdyejrwunirq7mbwngyqi3avdtympkjx@2kqsg562fcke>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
 <20250306091133.46888-3-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306091133.46888-3-alessandro.zini@siemens.com>
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

On Thu, Mar 06, 2025 at 10:11:33AM +0100, A. Zini wrote:
> From: Alessandro Zini <alessandro.zini@siemens.com>
> 
> The h/vsync-disable properties are used to control whether to use or
> not h/vsync signals, by configuring their pulse width to zero.
> 
> This is required on some panels which are driven in DE-only mode but do
> not ignore sync packets, and instead require them to be low-voltage level
> or ground.

If this is required by 'some panels', then it should be a property of
the panel, not by the bridge itself. Can the panel return the mode with
hsync_end = hsync_start and vsync_enc = vsync_start?

> 
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 95563aa1b450d..c94ea92159402 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -164,6 +164,8 @@ struct sn65dsi83 {
>  	int				irq;
>  	struct delayed_work		monitor_work;
>  	struct work_struct		reset_work;
> +	bool				hsync_disable;
> +	bool				vsync_disable;
>  };
>  
>  static const struct regmap_range sn65dsi83_readable_ranges[] = {
> @@ -604,10 +606,12 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  	/* 32 + 1 pixel clock to ensure proper operation */
>  	le16val = cpu_to_le16(32 + 1);
>  	regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &le16val, 2);
> -	le16val = cpu_to_le16(mode->hsync_end - mode->hsync_start);
> +	le16val = cpu_to_le16(ctx->hsync_disable ?
> +		0 : mode->hsync_end - mode->hsync_start);
>  	regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
>  			  &le16val, 2);
> -	le16val = cpu_to_le16(mode->vsync_end - mode->vsync_start);
> +	le16val = cpu_to_le16(ctx->vsync_disable ?
> +		0 : mode->vsync_end - mode->vsync_start);
>  	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
>  			  &le16val, 2);
>  	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> @@ -867,6 +871,14 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  		}
>  	}
>  
> +	ctx->hsync_disable = false;
> +	if (of_property_present(dev->of_node, "hsync-disable"))
> +		ctx->hsync_disable = true;
> +
> +	ctx->vsync_disable = false;
> +	if (of_property_present(dev->of_node, "vsync-disable"))
> +		ctx->vsync_disable = true;
> +
>  	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
>  	if (IS_ERR(panel_bridge))
>  		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
