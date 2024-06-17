Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C790BDB1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E8810E521;
	Mon, 17 Jun 2024 22:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xz08eS06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83F310E51F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 22:33:56 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e72224c395so49580881fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718663634; x=1719268434; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pMbrpDKp1fhP8ilsI7JJlavTaNcVpIQgEw9/CSB8wj8=;
 b=xz08eS06Qr3LCBag5QIXMbM4G9jXzhq2V5xFb5joqKNXcKYswwtIUfNl8/jhgyR3an
 VfrDyLy/QPXD7Y3FRA5fW6i2cFy4BbMtfX/RbrDdRbflZxfirfalWkMalFzu3MojaIwh
 Py6Q1LOwjJuBx2dQyscadbYMXZkA+SLoPDuil3atKE8VKs/KwnIII+oKQUvUZF8Wy96l
 g7DrgWfkfoCuCsI8uF8aivKFVJ0WiTp18EJGlv/Y3pT9PEwLvZY3b83re7TDFaA4l+uN
 udG3VAwzvZSUkmJVjl1zDcMsmxpnBmYVflmunkonq/xkG5mFvyVVWWeBXV5BpPcNmr5H
 WQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718663634; x=1719268434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMbrpDKp1fhP8ilsI7JJlavTaNcVpIQgEw9/CSB8wj8=;
 b=Lno2aADCeNljRBA/hWJZgklLXMa+++YsuO0iWqHF8wIRqEmey9HfWDDhpw5UCGjnS+
 4O/QX9MAzmTZnGgMJooXrQf9TAPFEPA0WV+OA77MB7G9Om7gbo8agN2C8YffoYIlUGSW
 rF7GaSAtifcMAZF2HlJRaGq3OlgDaE4eAn/CL/1UPLPdKb7YYzAKatBH2JHRr8cKAPNQ
 0Q9PoTPEEIKUMnIgSVIP1AbEyCmHv/wFmdBzQMnXqDYXIksooQnkFlzTm+TzP6OpvT/O
 auiAuSANLdE2WsI7Gi1ojZSwG5Wk3ZeIxKSkNL/Z6hizqxW/KZTgA2HeDj3RrUymEm3f
 TV3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNwS6IqXZki3BHixUfzLUgSVMAmu045+0QZn/ehLbBIYgxKAE1W6KuRlbLp1i63acWAOp6B1GpuSV1MhfzRFYZvrkwYbgRW6ybGKSu8iJV
X-Gm-Message-State: AOJu0YwOsmowuC7gaqHcnxNq2JqydlYly+LvW/0eRNBoGO1D2bDOaFrx
 sz1ZGdYWujemQ6EI/C07X+QZTn1q8kWQKW9g5HqRk+dVyxtgHL34u02QJBUOAsc=
X-Google-Smtp-Source: AGHT+IEwGNLkbEdSrwc6kD6Y806aXzDyPgo++IYUP1PgrBlAjQfX6C0uka9xwdpkw/8wS+Me0EqH8Q==
X-Received: by 2002:a2e:b013:0:b0:2ec:27e6:39b7 with SMTP id
 38308e7fff4ca-2ec27e63cf0mr38979811fa.37.1718663634399; 
 Mon, 17 Jun 2024 15:33:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c89903sm14830601fa.102.2024.06.17.15.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:33:53 -0700 (PDT)
Date: Tue, 18 Jun 2024 01:33:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 4/4] drm: bridge: simple-bridge: add tdp158 support
Message-ID: <hdhy5pnq4vsdn2axgu3t5vyhwqrqcrvpveeyai2lyvwadr7rbb@te6fucdqclez>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-4-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-4-df98ef7dec6d@freebox.fr>
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

On Mon, Jun 17, 2024 at 06:03:02PM GMT, Marc Gonzalez wrote:
> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 64 ++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index f1e458a15882f..745d253e55f7e 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -6,6 +6,8 @@
>   * Maxime Ripard <maxime.ripard@free-electrons.com>
>   */
>  
> +#include <linux/i2c.h>
> +#include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -32,6 +34,7 @@ struct simple_bridge {
>  	const struct simple_bridge_info *info;
>  
>  	struct drm_bridge	*next_bridge;
> +	struct regulator	*vcc;
>  	struct regulator	*vdd;
>  	struct gpio_desc	*enable;
>  };
> @@ -142,8 +145,16 @@ static void simple_bridge_enable(struct drm_bridge *bridge)
>  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
>  	int ret;
>  
> +	if (sbridge->vcc) {
> +		ret = regulator_enable(sbridge->vcc);
> +		msleep(100);

At least this should be documented or explained in the commit message.
Is it absolutely necessary? Can you use regulator-enable-ramp-delay or
any other DT property instead?

> +		if (ret)
> +			DRM_ERROR("Failed to enable vcc regulator: %d\n", ret);
> +	}
> +
>  	if (sbridge->vdd) {
>  		ret = regulator_enable(sbridge->vdd);
> +		msleep(100);
>  		if (ret)
>  			DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
>  	}
> @@ -159,6 +170,9 @@ static void simple_bridge_disable(struct drm_bridge *bridge)
>  
>  	if (sbridge->vdd)
>  		regulator_disable(sbridge->vdd);
> +
> +	if (sbridge->vcc)
> +		regulator_disable(sbridge->vcc);
>  }
>  
>  static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> @@ -167,16 +181,14 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
>  	.disable	= simple_bridge_disable,
>  };
>  
> -static int simple_bridge_probe(struct platform_device *pdev)
> +static int common_probe(struct device *dev, struct simple_bridge **res)
>  {
> -	struct device *dev = &pdev->dev;
>  	struct simple_bridge *sbridge;
>  	struct device_node *remote;
>  
>  	sbridge = devm_kzalloc(dev, sizeof(*sbridge), GFP_KERNEL);
>  	if (!sbridge)
>  		return -ENOMEM;
> -	platform_set_drvdata(pdev, sbridge);

I think this call can get dropped together with the remove() being
gone...

>  
>  	sbridge->info = of_device_get_match_data(dev);
>  
> @@ -203,6 +215,15 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  		dev_dbg(dev, "No vdd regulator found: %d\n", ret);
>  	}
>  
> +	sbridge->vcc = devm_regulator_get_optional(dev, "vcc");
> +	if (IS_ERR(sbridge->vcc)) {
> +		int ret = PTR_ERR(sbridge->vcc);
> +		if (ret == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		sbridge->vcc = NULL;
> +		dev_dbg(dev, "No vcc regulator found: %d\n", ret);
> +	}
> +
>  	sbridge->enable = devm_gpiod_get_optional(dev, "enable",
>  						  GPIOD_OUT_LOW);
>  	if (IS_ERR(sbridge->enable))
> @@ -213,10 +234,27 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
>  	sbridge->bridge.of_node = dev->of_node;
>  	sbridge->bridge.timings = sbridge->info->timings;
> +	*res = sbridge;
>  
>  	return devm_drm_bridge_add(dev, &sbridge->bridge);
>  }
>  
> +static int simple_bridge_probe(struct platform_device *pdev)
> +{
> +	struct simple_bridge *sbridge = NULL;
> +	int err = common_probe(&pdev->dev, &sbridge);
> +	platform_set_drvdata(pdev, sbridge);

... so, this becomes unnecessary...

> +	return err;
> +}
> +
> +static int i2c_probe(struct i2c_client *client)
> +{
> +	struct simple_bridge *sbridge = NULL;
> +	int err = common_probe(&client->dev, &sbridge);
> +	i2c_set_clientdata(client, sbridge);

... and this too.

> +	return err;
> +}
> +
>  /*
>   * We assume the ADV7123 DAC is the "default" for historical reasons
>   * Information taken from the ADV7123 datasheet, revision D.
> @@ -298,6 +336,26 @@ static struct platform_driver simple_bridge_driver = {
>  };
>  module_platform_driver(simple_bridge_driver);
>  
> +static const struct of_device_id i2c_match_table[] = {
> +	{
> +		.compatible = "ti,tdp158",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, i2c_match_table);
> +
> +static struct i2c_driver i2c_simple_bridge_driver = {
> +	.probe = i2c_probe,

i2c_simple_bridge_probe, or better simple_bridge_i2c_probe. Same applies
to to the driver name and i2c_driver struct name.

> +	.driver = {
> +		.name = "i2c-simple-bridge",
> +		.of_match_table = i2c_match_table,
> +	},
> +};
> +module_i2c_driver(i2c_simple_bridge_driver);

Does this work if the driver is built as a module?

> +
>  MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
>  MODULE_DESCRIPTION("Simple DRM bridge driver");
>  MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
