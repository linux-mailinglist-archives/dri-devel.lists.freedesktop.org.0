Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BC9D69CE
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 16:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567FC10E1C1;
	Sat, 23 Nov 2024 15:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mI2sGGCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F155010E1C1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 15:56:44 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-21278f3d547so24045325ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732377404; x=1732982204; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=wdhhpCg+taJ4xsLRypTZUl8HmDm+NFsq0ODj29ISJ0M=;
 b=mI2sGGCIv9UmZXzS/whM/eB2vjTx09hSVPTGhnlUdro6o2u2OBHd0iGoo9Yds/4clO
 C8zGtlxC6gD/BYNUvP1TyyJCX4z3FGV17N+R34GrZnFqHXf0khEXOEmU+Bd//YxC5wMD
 d1pzF8Y41D8YpkKJ4v6wrIGkf/yUUdoSllxTLRZn3XSr5QDS6+V5Ynm48wESU6kt0mJf
 59zkHwMbNCFh8/BThy+09ixHJUURVqmjwcgpydHud4NQo9N9yKjC2wg5d/gjx+fHFQUn
 uXJG+D3YjxN1wbMgK/4vGm1M/29PffeOsjaDTLmo4Fn4vYGItlRm24cmxJBvXFkxoBZ7
 W9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732377404; x=1732982204;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdhhpCg+taJ4xsLRypTZUl8HmDm+NFsq0ODj29ISJ0M=;
 b=vOEEK3XMFaNRzEgC6gIOhOJhbuLA9NctCy7RGLSvcS04xKUUrew8eiUoygXG11gO50
 bXH6O9gXuCr8pnngZwv+NsxOxMB3LRpYccp8n+t4q1sKWOUG8OXkZWuYSAXb8kAHgPHT
 wySrhP525PAOtXmWPA/AP5vf8u7C70DiWkNSh39jCElF1xFvV7t0rZ/VkFdlYt69ZgaQ
 7wtctkifD9ql2ycJzl3VyUlEW+LP23yyvHha8tB4qOuXuYwSaDTDJJnZ0tUKzGxhSRPd
 PsFWevxWLYymAoBEyzm1w4ERYCyaKCtrwAq1vzL5el7IcNXmcqGGgcb1xw8mOU6enT5V
 Cotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaBXAEDUQoC/CA6vyqYOC+JDi9FTwF0osxNmONbbVmdTDvNVKJ8FVDuuJMrIOl6O241oQBkh4P1nw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXOo54y08RDVLY9Smo08EHZJRNyaN2slCJ689m1pcQia5ok7KJ
 GahK0+h5+dLKD64bekchFSi2nWkG5uNVHoLOn5M5wupHrG0XgqI5
X-Gm-Gg: ASbGnct6L6Yda4AKltevMye+l7TX4DxXpuBy1iqw+TPT7hN4BZ+Xba0wzpmr/YCVBtR
 dTp1tP+Rl0h2LhYbvD5Q+jbD5CruuZs+W82XrvHspiC2bF5Iaz7LxsLZgM7s6IytKE44LJXXOIp
 SI0mXGFyR701A9Zh1DRA83oM+ma/UggojLx7CvRcfg5F1tiGJJcafAzPJIqxjnjJOovCTOtwyGo
 SeKlOgvN1pmMiy0gOI45lBJzIJWnchbOEU0sE0O3cYvZucg45tBpkHXt1Jpx8Y=
X-Google-Smtp-Source: AGHT+IHB49Ds6XF42rhaBzmjNmAHIN7vXsDlDSoz7p5lUyfP90T9HB2pni6uH8yauXHUV/+wJVdjQw==
X-Received: by 2002:a17:903:283:b0:20e:57c8:6ab3 with SMTP id
 d9443c01a7336-2129f7300c2mr99379585ad.4.1732377404385; 
 Sat, 23 Nov 2024 07:56:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc131d1sm34098095ad.187.2024.11.23.07.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 07:56:43 -0800 (PST)
Date: Sat, 23 Nov 2024 07:56:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [v10,3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <790091a1-00af-43bb-8cdf-814f4cc38d83@roeck-us.net>
References: <20241016-b4-rk3588-bridge-upstream-v10-3-87ef92a6d14e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-b4-rk3588-bridge-upstream-v10-3-87ef92a6d14e@collabora.com>
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

On Wed, Oct 16, 2024 at 11:06:53PM +0300, Cristian Ciocaltea wrote:
> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
> Samsung IP block.
> 
> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
> without audio, CEC or any of the HDMI 2.1 specific features.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
[ ... ]

> +static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
> +	struct drm_crtc *crtc = encoder->crtc;
> +	unsigned long long rate;
> +
> +	/* Unconditionally switch to TMDS as FRL is not yet supported */
> +	gpiod_set_value(hdmi->enable_gpio, 1);
> +
> +	if (crtc && crtc->state) {
> +		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
> +						   8, HDMI_COLORSPACE_RGB);
> +		clk_set_rate(hdmi->ref_clk, rate);
> +		/*
> +		 * FIXME: Temporary workaround to pass pixel clock rate
> +		 * to the PHY driver until phy_configure_opts_hdmi
> +		 * becomes available in the PHY API. See also the related
> +		 * comment in rk_hdptx_phy_power_on() from
> +		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +		 */
> +		phy_set_bus_width(hdmi->phy, rate / 100);

On 32-bit systems:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

in the mainline kernel.

If the driver is not build tested (much less working) on 32-bit builds,
please consider restricting it to 64 bit builds.

Thanks,
Guenter
