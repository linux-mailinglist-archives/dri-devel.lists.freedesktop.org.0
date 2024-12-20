Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5342D9F88DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C0010E093;
	Fri, 20 Dec 2024 00:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oXXBjC3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E1A10E093
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:16:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30039432861so13825441fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734653804; x=1735258604; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OvJSw2Y9AN4Bj+vC236l/3ETv8TjOwlc4v68lk/FkAI=;
 b=oXXBjC3EEtqvk4faDLoNP11nu8aCgSrXA8V5bMBbNeArtlKou2jQXXKPbix/5mRk5V
 EOVlmBLp5gIZ6HV7PNRt+JDdM0Zf9M96um0sVAYOG+23qpXsF7DSJmDQ/yEJ2lbXTD1n
 raFp58Fops0CYj/n3r/vx9Xs+6Rpk6VSpPHSctm7fDJOCb5KnxeLrUaTSiT8sQ7bARCP
 tzoSJldaa7XLQFbZKyURJQc3E3qP34FavlvjyMbOnMXMeV3fdat1zKO6b8qe3WKXH6zD
 uUjEeQfZ3YVpPqVD1xuWoI3kIGFDheblg3qg55PjYEcs4AekX3JK6L+csRXM0hrSrcrS
 adQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734653804; x=1735258604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvJSw2Y9AN4Bj+vC236l/3ETv8TjOwlc4v68lk/FkAI=;
 b=YXRlm45DpdLfaU7VKIigAP/SWGD+Vj9M2lOUgOscqrX9CDBPeBfsH5YUcqdsj0Hqzp
 MDTHxMpEs56kSKdfmTs4D0GHIIz7JrNNsLrfIS9SKdjW1/w4vXKVcDe8hextg0BFZ+dh
 FSOHcR/U5yPeUhnl2wjOIuwBfvp+j6SJgUPnr+PSEtQ0gUnr2WLw7gXrK6xlSUT+0aCJ
 0Lx3XoXiaWxv6yQsohTQTdRRnjqXbS+jsg+z92OEiKh/B1X9A5k5JEwOsHsZALaxlbtu
 /Y0enuLoaZyIT6K55hDdA2npfTdEW1134yp8b6ZHEluug09LCZXxD3wwC2lwVKYulCcb
 jBtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK7UZ+CPaB5tkkp5S9S/opFoadN+hIPNBYHaIUSlImxlZcsSJMb0OMffrPbKe2+0DEQaO1fL2OJGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/d2qZh2wUX+Y+h+HgeLnNQCQxs0/sr48gnPPwfwfLOfGofy42
 LsDDo0wuosW0XWLJCupHRueCgYFRVA6VAfpff+I7w8cbCslusGPA4D1m+hOVAlQ=
X-Gm-Gg: ASbGncvmjZDomIyy57E/TC1ZZCOC7XUs8hVK5/PbKY3PKErPUbMy34uu+FquEGILfaz
 bJEWJawO3zz1p7PwsVGQIpfwnrUZ3MsuOvSGKgqb/73p0f1MaPP6yBMqjDLlAOVziziEviriZmz
 N2pIT/HrZx3Jj0jNpR69JNMhMAjmN6iQM6OY6eU5ytbOPQy60NEjumyymnD81bc0xUNe/a1Dbkr
 Gt/EMCCvmAoCg+fCh5U2CQK9MtZ6DSiZbOBMVKUIqunzcUB5TvbrI65SqWDoM3pOMWW7I/dTZOO
 0v0Ww+yXVyJ2BcTdXcLHRfgF3yHb5FENnQs/
X-Google-Smtp-Source: AGHT+IFzvivVhPXKl3I4o3iSV3ve0+PcDzlRsGs5VisyomFwo0ktK1fC6BvzsZrAH0qVPPj4EFPZsg==
X-Received: by 2002:a05:651c:543:b0:302:17e7:e17e with SMTP id
 38308e7fff4ca-3046831fbc7mr2884171fa.0.1734653804472; 
 Thu, 19 Dec 2024 16:16:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b06a200sm3596771fa.79.2024.12.19.16.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:16:43 -0800 (PST)
Date: Fri, 20 Dec 2024 02:16:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 08/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <aiggslcdbdmnc2amlvmzycyxmu3f5zp6kt4ifgzq5gkuugmnem@oqnwf4o7hbss>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-9-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:05:57PM +0800, Damon Ding wrote:
> The rockchip_dp_of_panel_on_aux_bus() helps to check whether the DT
> configurations related to the DP AUX bus are correct or not.
> 
> If failed to get the panel from the platform bus, it is good to try
> the DP AUX bus. Then, the probing process will continue until it enters
> the analogix_dp_bind(), where devm_of_dp_aux_populate_bus() is called
> after &analogix_dp_device.aux has been initialized.

No. devm_of_dp_aux_populate_bus() should be called before bind(). And
bind should only be called from the done_probing() callback. The reason
is very simple: the panel driver might be built as a module and might be
not available when the analogix driver is being probed.

Also, please invert the logic of the commit message (and the driver).
The platform bus should be a fallback if there is no AUX bus panel, not
other way around.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index ba5263f85ee2..60c902abf40b 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -317,6 +317,24 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
>  	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
>  };
>  
> +static bool rockchip_dp_of_panel_on_aux_bus(const struct device_node *np)
> +{
> +	struct device_node *bus_node, *panel_node;
> +
> +	bus_node = of_get_child_by_name(np, "aux-bus");
> +	if (!bus_node)
> +		return false;
> +
> +	panel_node = of_get_child_by_name(bus_node, "panel");
> +	of_node_put(bus_node);
> +	if (!panel_node)
> +		return false;
> +
> +	of_node_put(panel_node);
> +
> +	return true;
> +}
> +
>  static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  {
>  	struct device *dev = dp->dev;
> @@ -435,8 +453,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret < 0)
> -		return ret;
> +	if (ret < 0) {
> +		if (!rockchip_dp_of_panel_on_aux_bus(dev->of_node))
> +			return ret;
> +	}
>  
>  	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
