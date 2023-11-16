Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECA7EE424
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629610E616;
	Thu, 16 Nov 2023 15:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B210E616
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 15:23:22 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d9fe0a598d8so865929276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 07:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700148201; x=1700753001; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jSgupIeANP5tueuGjabzmCgxHpd7wjSVIIaOyj586g8=;
 b=L8avutLgY27lj7Kw/yaKV11FF0pe1bWKRfJxJG8lpGkKdkLgSjzAWa+WAwmui/4od+
 jGUiNqd/1HuO82Z8CMJlcbHtn9sVimIXKS4HVvAn9/YGV3mUA6YMOHWyFKCMZYFG+S+R
 cl2fHO2mSVDEA3el58MmMT2nGIuqLFnRxSHTtAbHphIHjzxwYnHbzVg/p8ZSSavDV0yv
 fcmv21orHKwsl3+bxxxkEwbg8oSxbDHXV4QnQur+gIl4zv2fSDMx2EEV7/VRWHMmY4ZV
 sDgizOxyAqMifDjx6qIAMYehDOnXhpK7g6Aahb5G/VrWWlCYehtPWCVcZy6SY3W0REc+
 D1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700148201; x=1700753001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jSgupIeANP5tueuGjabzmCgxHpd7wjSVIIaOyj586g8=;
 b=BMzzjiGrj7Gsey426SpIfo6TiSnUqFWlXuCUQpWEJ7Cusy0IBXDETd7iWplAvx//+j
 tHnA1vg1rq8+clt9U2E1zM02YMbBm1lEZBkd8H0orWCbA7aOmY6mdstXQlYp/ib4IudS
 g6RcVirjF4p4vx0kOi7tksvoPLQ5/YF8gY8f+dt00L24QLcgA3M8bQLX+sSF2+paCJg1
 7cnsny483tofsQIjeCnIPacVz3DGchXMeDnH0TLL4QJLV57KAKU9NQ3njrs3pkBeVJJZ
 RYAvU767VFwzYcCDlHKIJ111qbYpIszt+XgICw7QOdUrPY9Wwoj3JQP0dCMNRD2M9Mcq
 M0eg==
X-Gm-Message-State: AOJu0YwBKDA9e5r9941DkVeG6Lnl1hBIY8xgfTHeZE9CLoUwHhq/IL0L
 /UrfiueKpAHgGbfKSncbVGPWmyTB7kT/BXqBSd8e4g==
X-Google-Smtp-Source: AGHT+IEIVa1NI6XgtzOUgIl2iL6jHoUviE3ArBPvKGR5eaRoUTXtbiZhuEKkizVPrrGfKMTq8p/Vw7/vzby5tkqKXs8=
X-Received: by 2002:a05:6902:188d:b0:d9a:49bb:3d1d with SMTP id
 cj13-20020a056902188d00b00d9a49bb3d1dmr18422215ybb.3.1700148201540; Thu, 16
 Nov 2023 07:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
In-Reply-To: <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 17:23:09 +0200
Message-ID: <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
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

On Thu, 16 Nov 2023 at 14:08, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
>
> On 2023/11/16 19:53, Sui Jingfeng wrote:
> > Hi,
> >
> >
> > On 2023/11/16 19:29, Dmitry Baryshkov wrote:
> >> On Thu, 16 Nov 2023 at 13:18, Sui Jingfeng <sui.jingfeng@linux.dev>
> >> wrote:
> >>> Hi,
> >>>
> >>>
> >>> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> >>>>> +
> >>>>> +               ctx->connector = connector;
> >>>>> +       }
> >>>>>
> >>>>>           if (ctx->info->id == ID_IT66121) {
> >>>>>                   ret = regmap_write_bits(ctx->regmap,
> >>>>> IT66121_CLK_BANK_REG,
> >>>>> @@ -1632,16 +1651,13 @@ static const char * const
> >>>>> it66121_supplies[] = {
> >>>>>           "vcn33", "vcn18", "vrf12"
> >>>>>    };
> >>>>>
> >>>>> -static int it66121_probe(struct i2c_client *client)
> >>>>> +int it66121_create_bridge(struct i2c_client *client, bool
> >>>>> of_support,
> >>>>> +                         bool hpd_support, bool audio_support,
> >>>>> +                         struct drm_bridge **bridge)
> >>>>>    {
> >>>>> +       struct device *dev = &client->dev;
> >>>>>           int ret;
> >>>>>           struct it66121_ctx *ctx;
> >>>>> -       struct device *dev = &client->dev;
> >>>>> -
> >>>>> -       if (!i2c_check_functionality(client->adapter,
> >>>>> I2C_FUNC_I2C)) {
> >>>>> -               dev_err(dev, "I2C check functionality failed.\n");
> >>>>> -               return -ENXIO;
> >>>>> -       }
> >>>>>
> >>>>>           ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> >>>>>           if (!ctx)
> >>>>> @@ -1649,24 +1665,19 @@ static int it66121_probe(struct i2c_client
> >>>>> *client)
> >>>>>
> >>>>>           ctx->dev = dev;
> >>>>>           ctx->client = client;
> >>>>> -       ctx->info = i2c_get_match_data(client);
> >>>>> -
> >>>>> -       ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
> >>>>> -       if (ret)
> >>>>> -               return ret;
> >>>>> -
> >>>>> -       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
> >>>>> -       if (ret)
> >>>>> -               return ret;
> >>>>> -
> >>>>> -       i2c_set_clientdata(client, ctx);
> >>>>>           mutex_init(&ctx->lock);
> >>>>>
> >>>>> -       ret = devm_regulator_bulk_get_enable(dev,
> >>>>> ARRAY_SIZE(it66121_supplies),
> >>>>> - it66121_supplies);
> >>>>> -       if (ret) {
> >>>>> -               dev_err(dev, "Failed to enable power supplies\n");
> >>>>> -               return ret;
> >>>>> +       if (of_support) {
> >>>>> +               ret = it66121_of_read_bus_width(dev,
> >>>>> &ctx->bus_width);
> >>>>> +               if (ret)
> >>>>> +                       return ret;
> >>>>> +
> >>>>> +               ret = it66121_of_get_next_bridge(dev,
> >>>>> &ctx->next_bridge);
> >>>>> +               if (ret)
> >>>>> +                       return ret;
> >>>>> +       } else {
> >>>>> +               ctx->bus_width = 24;
> >>>>> +               ctx->next_bridge = NULL;
> >>>>>           }
> >>>> A better alternative would be to turn OF calls into fwnode calls and
> >>>> to populate the fwnode properties. See
> >>>> drivers/platform/x86/intel/chtwc_int33fe.c for example.
> >>>
> >>> Honestly, I don't want to leave any scratch(breadcrumbs).
> >>> I'm worries about that turn OF calls into fwnode calls will leave
> >>> something unwanted.
> >>>
> >>> Because I am not sure if fwnode calls will make sense in the DT
> >>> world, while my patch
> >>> *still* be useful in the DT world.
> >> fwnode calls work for both DT and non-DT cases. In the DT case they
> >> work with DT nodes and properties. In the non-DT case, they work with
> >> manually populated properties.
> >>
> >>> Because the newly introduced it66121_create_bridge()
> >>> function is a core. I think It's better leave this task to a more
> >>> advance programmer.
> >>> if there have use case. It can be introduced at a latter time,
> >>> probably parallel with
> >>> the DT.
> >>>
> >>> I think DT and/or ACPI is best for integrated devices, but it66121
> >>> display bridges is
> >>> a i2c slave device. Personally, I think slave device shouldn't be
> >>> standalone. I'm more
> >>> prefer to turn this driver to support hot-plug, even remove the
> >>> device on the run time
> >>> freely when detach and allow reattach. Like the I2C EEPROM device in
> >>> the monitor (which
> >>> contains the EDID, with I2C slave address 0x50). The I2C EEPROM
> >>> device *also* don't has
> >>> a corresponding struct device representation in linux kernel.
> >> It has. See i2c_client::dev.
> >
> > No, what I mean is that there don't have a device driver for
> > monitor(display) hardware entity.
> > And the drm_do_probe_ddc_edid() is the static linked driver, which is
> > similar with the idea
> > this series want to express.

Because the monitor is not a part of the display pipeline.

> >
> >
> >>> so I still think It is best to make this drivers functional as a
> >>> static lib, but I want
> >>> to hear you to say more. Why it would be a *better* alternative to
> >>> turn OF calls into
> >>> fwnode calls? what are the potential benefits?
> >> Because then you can populate device properties from your root device.
> >> Because it allows the platform to specify the bus width instead of
> >> hardcoding 24 bits (which might work in your case, but might not be
> >> applicable to another user next week).
> >
> >
> > No, this problem can be easily solved. Simply add another argument.
> >
> > ```
> >
> > int it66121_create_bridge(struct i2c_client *client, bool of_support,
> >                           bool hpd_support, bool audio_support, u32
> > bus_width,
> >                           struct drm_bridge **bridge);
> > ```
> >
> >
> >> Anyway, even without fwnode, I'd strongly suggest you to drop the
> >> it66121_create_bridge() as it is now and start by populating the i2c
> >> bus from your root device.
> >
> > This will force all non-DT users to add the similar code patter at the
> > display controller side,
> > which is another kind of duplication. The monitor is also as I2C slave
> > device, can be abstract
> > as a identify drm bridges in theory, I guess.
> >
>
> 'identify' -> 'identity'
>
>
> >
> >> Then you will need some way (fwnode?) to
> >> discover the bridge chain. And at the last point you will get into the
> >> device data and/or properties business.
> >>
> > No, leave that chance to a more better programmer and forgive me please,
> > too difficult, I'm afraid of not able to solve. Thanks a lot for the
> > trust!

From my point of view: no.

-- 
With best wishes
Dmitry
