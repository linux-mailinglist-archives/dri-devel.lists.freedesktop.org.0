Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A9572FFE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0F493695;
	Wed, 13 Jul 2022 08:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB2212A032
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:04:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o4so14356421wrh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yaBi5+j2aB+gOEpu/CS6a4crTXK1oluI+G7cSMbxelM=;
 b=MduZJ4LcUwia674sobuaUywFu/y9XJbPCqF8UXjn0wnRaCT+QZ3XOGx+YAje4xxfsx
 x9gPEEwK6l26zgKylqiCX6kg+6Qcrx6/7WQ/ytwHvcda4vtybERuZ4s70YTn/BNqLy24
 5MeZn8161zhdqCh3Gug8o1zPTpESCgZp9pNlebMEHS9aj8RGpd5fMetXcNCgQ8tnZWl2
 oITFcoQoNbdZcmx8uMXLq2HS15pvFWibAtvysAkVPH+IejhAt1//CsNF6qnytW3Sp+Yo
 iZrLyWZCZeToIHPCPlOTz9lFBuwhiDKL4zdw/LqWzu1dOoE8C4t19oUDKrZTd7BZsh3v
 b4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yaBi5+j2aB+gOEpu/CS6a4crTXK1oluI+G7cSMbxelM=;
 b=uP5m0tt+P2xOd797Q/AgyztscAvHfVS+me/MEm9GXfQ13MMGJJQSU4lu8q87mGA6Fg
 Syj7KM4vrDJK3qfBaQcRILIyBvsqAEqkP90nroauCtXi1OY9w3SayGR8nkrM+/F4LBkT
 6OyQK3ZHHJ3ZUPO/C9DQ8HL+IgAYv944pmBYJbAN4dUfnsREGMFYuXOoXfJBzOwnBtVN
 VSt9aIjwBmjvWjYN9VoxK+OYLgUy6TcNX4tcODL914W0pSWas9CbV1C9zj0rlY9sUqAC
 kYlhrlBlE+pdUCMqnj6SVjLzv33rh9SjuVta12wEZ+PNQm2a+1Shvnf645t/+ga2k/Lx
 B6hA==
X-Gm-Message-State: AJIora9wtf1ydvukyDECEoubpHQsjiZQIc3Jp5D2/CIIrGUBmI/uWy1U
 dFlzRu9yECh92N+nyTZ4NPkyGA==
X-Google-Smtp-Source: AGRyM1sox2gwD2oOUs0Po8YP6r0hOoKvkq7xKaXz/jSSA3VY7uq2zQIZPBxBD2yVdN4jLfilFwtkQw==
X-Received: by 2002:a5d:4890:0:b0:21d:9bf3:89b5 with SMTP id
 g16-20020a5d4890000000b0021d9bf389b5mr1887795wrq.153.1657699465867; 
 Wed, 13 Jul 2022 01:04:25 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0039749b01ea7sm1616879wms.32.2022.07.13.01.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:04:25 -0700 (PDT)
Date: Wed, 13 Jul 2022 09:04:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
Message-ID: <Ys58hr3AK/p/4/ng@google.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
 <Ys2TTsv1oU8n1fUE@google.com>
 <CABtFH5LMHrfOdLZZxpjwsHmyHZsHUmevpQJYDFqZtvfpC6AVxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5LMHrfOdLZZxpjwsHmyHZsHUmevpQJYDFqZtvfpC6AVxg@mail.gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jul 2022, ChiaEn Wu wrote:

> Hi Lee,
> 
> Thanks for your reply.
> 
> Lee Jones <lee.jones@linaro.org> 於 2022年7月12日 週二 晚上11:29寫道：
> >
> > On Thu, 23 Jun 2022, ChiaEn Wu wrote:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 MFD support.
> >
> > No such thing as "MFD support".
> >
> > And you're not getting away with submitting a 370 line patch with a 5
> > word change log either. :)
> >
> > Please at least tell us what the device is and what it's used for.
> 
> I sincerely apologize.
> We will add more descriptions of the MT6370 feature in the v5 patch.
> 
> >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >
> > > v3
> > > - Refine Kconfig help text
> > > - Refine error message of unknown vendor ID in
> > >   mt6370_check_vendor_info()
> > > - Refine return value handling of mt6370_regmap_read()
> > > - Refine all probe error by using dev_err_probe()
> > > - Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
> > >   mt6370_regmap_write()
> > > - Add "#define VENID*" and drop the comments in
> > >   mt6370_check_vendor_info()
> > > - Drop "MFD" in MODULE_DESCRIPTION()
> > > ---
> > >  drivers/mfd/Kconfig  |  13 ++
> > >  drivers/mfd/Makefile |   1 +
> > >  drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 372 insertions(+)
> > >  create mode 100644 drivers/mfd/mt6370.c

[...]

> > > +static int mt6370_probe(struct i2c_client *i2c)
> > > +{
> > > +     struct mt6370_info *info;
> > > +     struct i2c_client *usbc_i2c;
> > > +     int ret;
> > > +
> > > +     info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> > > +     if (!info)
> > > +             return -ENOMEM;
> > > +
> > > +     info->dev = &i2c->dev;
> > > +
> > > +     usbc_i2c = devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
> > > +                                          MT6370_USBC_I2CADDR);
> > > +     if (IS_ERR(usbc_i2c))
> > > +             return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
> > > +                                  "Failed to register USBC I2C client\n");
> > > +
> > > +     /* Assign I2C client for PMU and TypeC */
> > > +     info->i2c[MT6370_PMU_I2C] = i2c;
> > > +     info->i2c[MT6370_USBC_I2C] = usbc_i2c;
> > > +
> > > +     info->regmap = devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, info,
> > > +                                     &mt6370_regmap_config);
> >
> > Apart from in mt6370_check_vendor_info() where is this actually used?
> 
> Well... from my understanding, we use this MFD driver to make other
> drivers of MT6370 (e.g. charger, ADC, led...) use the same regmap
> settings.
> Thus, this regmap is not only used in mt6370_check_vendor_info().

Well for that to happen you need to store the data somewhere for the
child devices to fetch from.  I don't see that happening in this
patch?  What did I miss?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
