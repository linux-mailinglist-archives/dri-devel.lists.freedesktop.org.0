Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CBC4D0BFB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D74D10E1A2;
	Mon,  7 Mar 2022 23:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62010E1A2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:22:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d10so35329954eje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7c0lRQq10amigm9U6do+3Ys9rNR/b4CU3fPdyFOu4gY=;
 b=HwY5GTqnDqf74vvoTyzbBQmxNTwIEvaO8ErNPwkqdmhJj9sEm6Y9G+EStOPRdb4K7S
 iNeYXpjX7AWkD3Cf5J56hkeHc87m1Wze/ve9MZEDylQ53RIwtqNduwOM1SYKpVbOImc/
 rrmWooZg1AhyGRoFUXt26TjfoiOUAyUGKf0dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7c0lRQq10amigm9U6do+3Ys9rNR/b4CU3fPdyFOu4gY=;
 b=6MTK/JrKt8xdcSvnlvb748adCid7wlsQROP/ZrL5b3DrjASSA5eeZmkNHosEsuVlfM
 oIp/l48dDhVMYGHiO8+Z06WMTlYLx7SfBue/gf9OPYDNNreabQ+zhZVEtAxU6Cl/a/WF
 jIO/owuF1hnorxQ3Mv2GXBy0Xdtn7dJCfafJy/6l+OxWST6GeOGzVkpR6eFr0/rpHWRJ
 Kp0iq9X2w6IiKSWaGG0sE32CI80kD6TlZ+QCNVd0wnqo2o23FPN36NSVpd78Xb7bwqT3
 m6cqzrGBJo9kXBcMWkT8GLIpFXtUjN7KQAW6LOJecBtWt4fkPkCraZyvPZ0cqXKQ+/F7
 PNwg==
X-Gm-Message-State: AOAM531qcVo6Sb71WSvNm3gOKOEpELUltT1usYlyW7SzOou6fnKwX6uE
 kKbb5JETLqQilZm5pIE+NhiySVTctQJ7W9Z9
X-Google-Smtp-Source: ABdhPJye87uIFJ2U7jfSvO0OAPxnhuTdcg+ZZj+xKY2oDltoNE3XgtJMGND/0IpQjZk2uY6dRsqRiA==
X-Received: by 2002:a17:906:7245:b0:6cf:d3c6:8c63 with SMTP id
 n5-20020a170906724500b006cfd3c68c63mr10467942ejk.677.1646695352071; 
 Mon, 07 Mar 2022 15:22:32 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 u19-20020a17090617d300b006cea86ca384sm5224062eje.40.2022.03.07.15.22.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 15:22:31 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so364579wmq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:22:31 -0800 (PST)
X-Received: by 2002:a05:600c:4ec7:b0:389:bf36:ce3a with SMTP id
 g7-20020a05600c4ec700b00389bf36ce3amr1065825wmq.118.1646695350832; Mon, 07
 Mar 2022 15:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Mar 2022 15:22:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
Message-ID: <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Support hotplug detection
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> @@ -1264,6 +1321,14 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>                 return PTR_ERR(pdata->next_bridge);
>         }
>
> +       pdata->no_hpd = of_property_read_bool(np, "no-hpd");
> +       if (pdata->next_bridge->type != DRM_MODE_CONNECTOR_DisplayPort &&
> +           !pdata->no_hpd) {
> +               dev_warn(pdata->dev,
> +                        "HPD support requires a DisplayPort connector\n");

Maybe "HPD support only implemented for full DP connectors".

Plausibly someone could come up with a reason to hook HPD up for eDP
one day, but so far we haven't seen it.


> @@ -1272,7 +1337,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = np;
> -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD)
> +                         | DRM_BRIDGE_OP_EDID;

Seems like "OP_HPD" ought to be dependent on whether the IRQ was
provided, right? AKA you could have "detect" because HPD is plumbed
through to the bridge but not "HPD" if the IRQ from the bridge isn't
hooked up to the main processor...


> @@ -1840,6 +1906,34 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>                                        pdata->supplies);
>  }
>
> +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> +{
> +       struct ti_sn65dsi86 *pdata = arg;
> +       int ret;
> +       int hpd;

`hpd` should be an `unsigned int` to match the prototype of regmap-read.


> @@ -1881,6 +1975,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>                 return dev_err_probe(dev, PTR_ERR(pdata->refclk),
>                                      "failed to get reference clock\n");
>
> +       if (client->irq > 0) {
> +               ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +       }

Is this the right place to request the IRQ, or should it be in
ti_sn_bridge_probe(). As soon as you request it the interrupt can go
off, but you're relying on a bunch of bridge stuff to have been
initted, right?


> @@ -1888,6 +1992,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>         pm_runtime_set_autosuspend_delay(pdata->dev, 500);
>         pm_runtime_use_autosuspend(pdata->dev);
>
> +       /* Enable interrupt handling */
> +       regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);

Shouldn't we only enable interrupt handling if client->irq > 0? AKA
combine this with the "if" statement?



-Doug
