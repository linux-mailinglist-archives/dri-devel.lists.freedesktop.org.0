Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A263C5B5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082A710E0A0;
	Tue, 29 Nov 2022 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0C10E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:54:16 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso9467849otl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GjK6wLJFPx5Ih8mUW+LXCJ4FyZfD2H0IDjVyBwYNMMM=;
 b=xiduauuFBf2qfRxNcUMRblnEUfLrPfAltlgt6lqpMgDqNSojAre/rwEQItqbThxdK8
 e9mJNQ8kCEEDk3ktRxHenkyE/OwMxS8Ra4weD/uf947jM5pSNzy1z9O2kGCR5oEMoiSu
 LnzV+RDiVe5kZ7+29ENuJ5K1J6RHnrx3PHYWrH/zBcZB9jKPZKxyfjBgZgU+jd8VAaH1
 xB4ki8zWbEzUd5O6HSsQCWD5aJjBm4C7H8yZn5K3WRZCIiE3Oktg/EV0P7B3jS4DBBJN
 Zi1ZSa7jopDccmcMsA1kgIS9LLPIKi1uSLU/uOFGW+LiQC6iBCPnUdFj7c9/bAQ/VFes
 T3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GjK6wLJFPx5Ih8mUW+LXCJ4FyZfD2H0IDjVyBwYNMMM=;
 b=6wmi17amcpPv7wSATqJB9YRJejWJHBWwiSpF/4yKIN+L7gZwseYuUl7PwLIOJAkRzX
 e9ATRuH/Apa86uaBbZKNBmOFYCjzYp4aFB4jFHdUlhYyQyOBReR0DguoeqDBO/VAZG7y
 ANnUMOjhqC1uLfunntf5EozctUlrsk9QPOC5m3jiTlOFLtOQA7AnOU/sskdigm1IfYCN
 m90v5SI8xHkVKcoAqtkLzx5/+CNPdCjOJG//tZREMnY0ENDGTBwIn2wacJsUT6S4u2Ot
 EOQC8DVjWX7j1lMNLFgzOSeauOMx5XCcRnxrpe5xSkZHtFhpck9tVgzIOAoLM3E6Q5FD
 Fk9A==
X-Gm-Message-State: ANoB5pkjKuzn0wqsrf3Di3+lHPIsE/aJ4R3S32VR3E/hIBx7KpZRfOjK
 9Jal3PcpbmWpblBh+o1BygyErjDSzsNcz3tAnxQfhg==
X-Google-Smtp-Source: AA0mqf6Y98DrQOEDHEupyc5vTxxgwP7MNwATXauHvunrFi0GpgHwfmuVTpDmkh+ilLVYz4CM9XlG810hOdv0aIVLV5o=
X-Received: by 2002:a9d:61d6:0:b0:66d:685d:a138 with SMTP id
 h22-20020a9d61d6000000b0066d685da138mr28906736otk.208.1669740856030; Tue, 29
 Nov 2022 08:54:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668602942.git.mazziesaccount@gmail.com>
 <3f0ffbc27e6bcc208d32eb3bb94979a8ab28265f.1668602942.git.mazziesaccount@gmail.com>
In-Reply-To: <3f0ffbc27e6bcc208d32eb3bb94979a8ab28265f.1668602942.git.mazziesaccount@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 17:54:05 +0100
Message-ID: <CAG3jFys-5sqCAtM99HyaEE-3XFNGn++kok3TCzhsFM7czXAXAQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/2] gpu: drm: sii902x: Use
 devm_regulator_bulk_get_enable()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Matti,

Can you use an already used prefix for this commit title:
- drm/bridge: sii902x:

On Wed, 16 Nov 2022 at 14:03, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Simplify using devm_regulator_bulk_get_enable()
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Robert Foss <robert.foss@linaro.org>
>
> ---
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 878fb7d3732b..f6e8b401069b 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -171,7 +171,6 @@ struct sii902x {
>         struct drm_connector connector;
>         struct gpio_desc *reset_gpio;
>         struct i2c_mux_core *i2cmux;
> -       struct regulator_bulk_data supplies[2];
>         bool sink_is_hdmi;
>         /*
>          * Mutex protects audio and video functions from interfering
> @@ -1072,6 +1071,7 @@ static int sii902x_probe(struct i2c_client *client,
>         struct device *dev = &client->dev;
>         struct device_node *endpoint;
>         struct sii902x *sii902x;
> +       static const char * const supplies[] = {"iovcc", "cvcc12"};
>         int ret;
>
>         ret = i2c_check_functionality(client->adapter,
> @@ -1122,27 +1122,11 @@ static int sii902x_probe(struct i2c_client *client,
>
>         mutex_init(&sii902x->mutex);
>
> -       sii902x->supplies[0].supply = "iovcc";
> -       sii902x->supplies[1].supply = "cvcc12";
> -       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
> -                                     sii902x->supplies);
> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplies);
>         if (ret < 0)
> -               return ret;
> -
> -       ret = regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
> -                                   sii902x->supplies);
> -       if (ret < 0) {
> -               dev_err_probe(dev, ret, "Failed to enable supplies");
> -               return ret;
> -       }
> +               return dev_err_probe(dev, ret, "Failed to enable supplies");
>
> -       ret = sii902x_init(sii902x);
> -       if (ret < 0) {
> -               regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
> -                                      sii902x->supplies);
> -       }
> -
> -       return ret;
> +       return sii902x_init(sii902x);
>  }
>
>  static void sii902x_remove(struct i2c_client *client)
> @@ -1152,8 +1136,6 @@ static void sii902x_remove(struct i2c_client *client)
>
>         i2c_mux_del_adapters(sii902x->i2cmux);
>         drm_bridge_remove(&sii902x->bridge);
> -       regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
> -                              sii902x->supplies);
>  }
>
>  static const struct of_device_id sii902x_dt_ids[] = {
> --
> 2.38.1
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]
