Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FEF7EDFD9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1224B10E272;
	Thu, 16 Nov 2023 11:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE6410E272
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:29:20 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a8628e54d4so5697007b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700134159; x=1700738959; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S5lTa43//cUFklB5+ZWKlvD2U+T55CUcIy8KREpqNZA=;
 b=faeJsjP/3ODtL8IfpU972q5/3HMZ7T42nqmWHTELcRcMsH4FTqe0PNRSJfWdjsQzmC
 6Z9qqTdgNgWjVwj9iLFbG0I7WG6Tfda4wnS3+YHnDABeC6jD0zUGLqaxZftB+Qy+DT/A
 kOBi3c+6gTbj2AF+HGvZgkcsmhDrej06c0zVhR3O8ImOOPW9HPyEXScUuWYT0l9Ydlwx
 s+rATfvChNd9y+FGhg/JicGSqEUiXFac8zM9968XCfbv6hp2fu2UUY5nKJesJYEKyICr
 2L3eO7C6gKdsR8BcHd+P81zSY4CKA7MD7Ca7PoLeK6s2dSn6TWaZCv2pmTrg/NnGZy9j
 IVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700134159; x=1700738959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S5lTa43//cUFklB5+ZWKlvD2U+T55CUcIy8KREpqNZA=;
 b=OZtV+AtyOyJ+EWdqWI6cf4epK9DGWaafvtizn1h7JzIaGMm2YSqZltj9dh9M1KiLfT
 3NjgO+/WofK2a0+mUAZ5Mz0PnTktG741g01LWhkz4FNnZ/MBooSmJSaNJt1H5m2zU2kV
 +M1fmClaGR4zl6Qr/bodCG3HC8JezE0xTiuIbi3Xqyj1FBihoLVofZQ5Qx9iwrHrrZ3S
 M/QVfWq3FejZJV/0BwCk6ZR2ieeMF5YEmR5aL5Vht2ABMs0T25uZgTDszml56KJ+gPRy
 JgDoQBh+m9kYDizM/cxJrFcnK6/ZLXNuKzwyZonc7H+lbUBOYfX6TafP5dWGfLcrhuhK
 lqVA==
X-Gm-Message-State: AOJu0YyyOsjx3agYVEBIuLZTeSjELYuradrEMQasu0gSZdvKKAOSa4zP
 XB4Q96dfp9F/2yVf4ATfXUTtzHG21Uw+0yBcVf32Eg==
X-Google-Smtp-Source: AGHT+IGErFMqPkXK2Jal0NKNMlezVIeEoPnpOpWdwKLNkwKg18d8jKM1z5k/zbLBqUCnqanAX89cbCNB/R+NRbHjXwA=
X-Received: by 2002:a0d:d686:0:b0:570:2542:cc9b with SMTP id
 y128-20020a0dd686000000b005702542cc9bmr672414ywd.18.1700134159197; Thu, 16
 Nov 2023 03:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
In-Reply-To: <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 13:29:07 +0200
Message-ID: <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 at 13:18, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> >> +
> >> +               ctx->connector = connector;
> >> +       }
> >>
> >>          if (ctx->info->id == ID_IT66121) {
> >>                  ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> >> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
> >>          "vcn33", "vcn18", "vrf12"
> >>   };
> >>
> >> -static int it66121_probe(struct i2c_client *client)
> >> +int it66121_create_bridge(struct i2c_client *client, bool of_support,
> >> +                         bool hpd_support, bool audio_support,
> >> +                         struct drm_bridge **bridge)
> >>   {
> >> +       struct device *dev = &client->dev;
> >>          int ret;
> >>          struct it66121_ctx *ctx;
> >> -       struct device *dev = &client->dev;
> >> -
> >> -       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> >> -               dev_err(dev, "I2C check functionality failed.\n");
> >> -               return -ENXIO;
> >> -       }
> >>
> >>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> >>          if (!ctx)
> >> @@ -1649,24 +1665,19 @@ static int it66121_probe(struct i2c_client *client)
> >>
> >>          ctx->dev = dev;
> >>          ctx->client = client;
> >> -       ctx->info = i2c_get_match_data(client);
> >> -
> >> -       ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       i2c_set_clientdata(client, ctx);
> >>          mutex_init(&ctx->lock);
> >>
> >> -       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it66121_supplies),
> >> -                                            it66121_supplies);
> >> -       if (ret) {
> >> -               dev_err(dev, "Failed to enable power supplies\n");
> >> -               return ret;
> >> +       if (of_support) {
> >> +               ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
> >> +               if (ret)
> >> +                       return ret;
> >> +       } else {
> >> +               ctx->bus_width = 24;
> >> +               ctx->next_bridge = NULL;
> >>          }
> > A better alternative would be to turn OF calls into fwnode calls and
> > to populate the fwnode properties. See
> > drivers/platform/x86/intel/chtwc_int33fe.c for example.
>
>
> Honestly, I don't want to leave any scratch(breadcrumbs).
> I'm worries about that turn OF calls into fwnode calls will leave something unwanted.
>
> Because I am not sure if fwnode calls will make sense in the DT world, while my patch
> *still* be useful in the DT world.

fwnode calls work for both DT and non-DT cases. In the DT case they
work with DT nodes and properties. In the non-DT case, they work with
manually populated properties.

> Because the newly introduced it66121_create_bridge()
> function is a core. I think It's better leave this task to a more advance programmer.
> if there have use case. It can be introduced at a latter time, probably parallel with
> the DT.
>
> I think DT and/or ACPI is best for integrated devices, but it66121 display bridges is
> a i2c slave device. Personally, I think slave device shouldn't be standalone. I'm more
> prefer to turn this driver to support hot-plug, even remove the device on the run time
> freely when detach and allow reattach. Like the I2C EEPROM device in the monitor (which
> contains the EDID, with I2C slave address 0x50). The I2C EEPROM device *also* don't has
> a corresponding struct device representation in linux kernel.

It has. See i2c_client::dev.

> so I still think It is best to make this drivers functional as a static lib, but I want
> to hear you to say more. Why it would be a *better* alternative to turn OF calls into
> fwnode calls? what are the potential benefits?

Because then you can populate device properties from your root device.
Because it allows the platform to specify the bus width instead of
hardcoding 24 bits (which might work in your case, but might not be
applicable to another user next week).

Anyway, even without fwnode, I'd strongly suggest you to drop the
it66121_create_bridge() as it is now and start by populating the i2c
bus from your root device. Then you will need some way (fwnode?) to
discover the bridge chain. And at the last point you will get into the
device data and/or properties business.

-- 
With best wishes
Dmitry
