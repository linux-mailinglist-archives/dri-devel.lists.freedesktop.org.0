Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F09DEF6D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FA210E386;
	Sat, 30 Nov 2024 08:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mmiSzfTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D935310E386
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:55:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53de6b7da14so2639815e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732956941; x=1733561741; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tWYIp2XJ9QFXc1y2xfe4G78/qq9zuMJu2hdWvSe+Nws=;
 b=mmiSzfTfcz8H/2sGhDdl4YBWJCEs7PMHbQTJVel1CtxDUUNJMz+cThzJDxHdX4jAyu
 mpu9xN4JFCD/ZvrqHLdUFckLr9Tu3zMv9F3quhTvlcsx0dgH6WxsvpJkrcPddEJ0sBUN
 z7VN3GQQILex11EzCwhl93E5jPCj1tlMeUD5+BXYCm5mkIDsofX6br2NBX0gOvtoIKXk
 GDu+z+PC9StKoiNhCIz1j3SWT2LCHJ2JWNJir5WRBKLb3Mf2b2Kwi6Qs59bdK9SM0L1v
 tyK87kyn4pz8Q8ydVjvXakLbTl/ask+smQxWZnjOKJ8V+JWvqpnW/AZYu6KVLrIn0NY2
 7/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732956941; x=1733561741;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWYIp2XJ9QFXc1y2xfe4G78/qq9zuMJu2hdWvSe+Nws=;
 b=mudNskE1CIFDOrgu7H7WtYJdDZJgp85RKevDayjNLNNg/bR2Szb90WWohmgXe1DzD6
 hHhgf+kKAt09M5ZPOz98/kxM68CWkq378n9RwIvLH2+XQgmczGLbjbsjGBXjsKR9Gu5g
 Txi8jxIwj1B1HZjFQ4GQJrWa0SN/K8Os4mwdkyVYvf2hJrFrvPGOxz2eBJmZFzQvauDm
 cI7cZIntq9a8c97Ct/GJhg34WuudsVsktSSOAFRd+x2Cf6zXYYz21nj3eZ0bhITJq2mo
 Voi/IMnykV2A7rWiqpkiF0meIBxKDAKzjn5SftEIL8YAFs1IyL6kVapxMuqz1yxqMbzJ
 FJSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWDT/FEaIaq6vNUqkqqWpywqSh6wcggzgesP3cJQ0+LcZMN4aaXmJz5ouGhZ+QGFfbaqfziDFhKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAFhav3Gpyf2rne20JBw1XYKv9KFJOIr4KdkXqOvbOFLIegFqZ
 vfpOWJxij1wL9PkaiSSv/45A1085judUvd7McN6qTTXgdisYUlHRXpNOzFjVDq8=
X-Gm-Gg: ASbGnculHLoaeflItaKp9LpgJOcKj1fOiMA9ppgjqyvylx2k4Tiz5f8sFOuCOoUF3VX
 itLaLTWFeQwM5nU8BKTxmRX3XByf4KZui5CnVxZETcQGWfcO3/1bBvZsTElIX1WawiotAEMvWi6
 o6hF7cqWnqS5FZe57VKgQIEu+JOq7G06xgZ6R/n4E/o0MssdBDZZmJXDX+ddN42/eOoOTPYXXvA
 l8BSkbkCEDvbsQxGWDBwpZnE3pGeDXhM4A5kWXjcmI0Gjpt0H8yFkrGm2qRX/I4S50qspmzP+iZ
 fE7rfhmAYYZnvhXhmkwD6xjDLlM08A==
X-Google-Smtp-Source: AGHT+IFGpIIuU0NV+ptiObgzcvj/OfHO1P/2xGAhJue3uJys9uUaaKu+obE+URGKCHPGZpBab5Jpbg==
X-Received: by 2002:a05:6512:2398:b0:53d:e7b6:c6ec with SMTP id
 2adb3069b0e04-53df010493emr5483484e87.41.1732956940996; 
 Sat, 30 Nov 2024 00:55:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a09e6sm718764e87.264.2024.11.30.00.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:55:39 -0800 (PST)
Date: Sat, 30 Nov 2024 10:55:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, 
 qwen@analogixsemi.com, treapking@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge:anx7625: Update HDCP status at atomic_disable()
Message-ID: <rsorgspggl325hx3atrvn3jqhbhy3sg5tvd4ckufrw7hsphrpv@6z63jtk5co4v>
References: <20241127030221.1586352-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127030221.1586352-1-xji@analogixsemi.com>
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

On Wed, Nov 27, 2024 at 11:02:20AM +0800, Xin Ji wrote:
> Update HDCP content_protection to DRM_MODE_CONTENT_PROTECTION_UNDESIRED
> in bridge .atomic_disable().

PLease describe why, not what.

> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a2675b121fe4..a75f519ddcb8 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
>  				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
>  }
>  
> +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> +{
> +	struct device *dev = ctx->dev;
> +
> +	if (!ctx->connector)
> +		return;
> +
> +	anx7625_hdcp_disable(ctx);
> +
> +	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +	drm_hdcp_update_content_protection(ctx->connector,
> +					   ctx->hdcp_cp);
> +
> +	dev_dbg(dev, "update CP to UNDESIRE\n");
> +}
> +
>  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  {
>  	u8 bcap;
> @@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
>  			dev_err(dev, "current CP is not ENABLED\n");
>  			return -EINVAL;
>  		}
> -		anx7625_hdcp_disable(ctx);
> -		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -		drm_hdcp_update_content_protection(ctx->connector,
> -						   ctx->hdcp_cp);
> -		dev_dbg(dev, "update CP to UNDESIRE\n");
> +
> +		anx7625_hdcp_disable_and_update_cp(ctx);
>  	}
>  
>  	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> @@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
>  
>  	dev_dbg(dev, "drm atomic disable\n");
>  
> +	anx7625_hdcp_disable_and_update_cp(ctx);
> +
>  	ctx->connector = NULL;
>  	anx7625_dp_stop(ctx);
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
