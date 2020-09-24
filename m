Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806C277A1C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6846E06B;
	Thu, 24 Sep 2020 20:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822276E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:22:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so271660lfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brE6v+PgA6FJ2dU2AD140ORTA0itDZcq4xRrk6BKZMM=;
 b=DtyfFRVunusaNAXahnNWGweC32SHMmshwBPIJAKLPbmbKDKZqRbmsXpq9MwzHT2ZTL
 ECQ9ILRpREa9cJoWCjLrYnZpgoTaq3adkRZiBSzHGkmbJFK6A+hV2BFCDbYIXlmMsyLO
 nrpkXSgbEUJ25/HL1e8GbxY2Np21CiAjiqzKNWV8RozczEnwvJlit9EpdZsOClsECxYd
 NmxxqdebgGBYLW1y9tNc4YsJhOk+qyjKePTZ/+5WkDslH068i5RDrOSXZB2cfseiPwXi
 1XHpb61yiD5IqIwtSzPGctjyrvopYwIRhrsYa/g21mKtpXovNnBI+yaSK6Di1pctOSeu
 ry3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brE6v+PgA6FJ2dU2AD140ORTA0itDZcq4xRrk6BKZMM=;
 b=MdhveAAnDSqGkjfZXRGODWx0yOAtpqh1J3zI8oXs3Qpu8FeI4Zd/54Cpi63fotWIN+
 PMP3p5CLMgHho4zqcFKRslFBEoVVENl0gQrH7g1mDmEE3C5E/f27VS0g4yrw/+sULYKq
 3s2Iiw5/hPUIbhJoPgG/KpqHkinU6Z3wvmH6If/Lct538dQ7IwGJ9DDi7j5TfHWH0arY
 OK7uI25lJeACPqbL3Cu7siqWGeb27Nirb7BZVtWXsdm1tpcq7btvPMNiDYP9ku5EanMq
 3/fqM08310qcud5E3yUvIAPKmEazJjIVkXNTwTnAW/Bp55j+nziw3YjArBOw1YM8RjQ5
 UiTQ==
X-Gm-Message-State: AOAM533nZpo7LlLPTmSJrZzNv5BqdeDBMkxku/ZJeTjTEEHtIFKZPmZ4
 TEWqS5/y/AwkYBK4l1kIZCSnChnS9AKeV3eh+Zs=
X-Google-Smtp-Source: ABdhPJyzsymEO5+8ArwUCaLPi7Z1BAU2Eh2QCjGHPncS54IsFCJ5uYytpqdEDWHlwytq1l/0Nzwk22meeaFRsJ1Xk0w=
X-Received: by 2002:ac2:4e92:: with SMTP id o18mr197010lfr.527.1600978955722; 
 Thu, 24 Sep 2020 13:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Sep 2020 17:22:23 -0300
Message-ID: <CAOMZO5B4S3JCVQAi-y=vKaQv3AF6eXronTkmG_DZs_ALtEHtgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Enable I/O and core VCC supplies
 if present
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandre,

On Thu, Sep 24, 2020 at 5:16 PM Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:

> +       ret = regulator_enable(sii902x->cvcc12);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable cvcc12 supply: %d\n", ret);
> +               regulator_disable(sii902x->iovcc);
> +               return PTR_ERR(sii902x->cvcc12);

return ret;

>
>         ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
> @@ -1012,11 +1052,11 @@ static int sii902x_probe(struct i2c_client *client,
>         regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
>         regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
>
> -       if (client->irq > 0) {
> +       if (sii902x->i2c->irq > 0) {

Unrelated change.

>                 regmap_write(sii902x->regmap, SII902X_INT_ENABLE,
>                              SII902X_HOTPLUG_EVENT);
>
> -               ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +               ret = devm_request_threaded_irq(dev, sii902x->i2c->irq, NULL,

 Unrelated change.
                                                 sii902x_interrupt,
>                                                 IRQF_ONESHOT, dev_name(dev),
>                                                 sii902x);
> @@ -1031,9 +1071,9 @@ static int sii902x_probe(struct i2c_client *client,
>
>         sii902x_audio_codec_init(sii902x, dev);
>
> -       i2c_set_clientdata(client, sii902x);
> +       i2c_set_clientdata(sii902x->i2c, sii902x);

Unrelated change.

> -       sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
> +       sii902x->i2cmux = i2c_mux_alloc(sii902x->i2c->adapter, dev,

Unrelated change.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
