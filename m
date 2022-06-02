Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4EC53B385
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 08:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B831134CB;
	Thu,  2 Jun 2022 06:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07B01134CB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 06:27:05 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so4051412pjs.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sgetwGF1PvFvysoUcKKwVGNS/40oEtUezOmpaPDogiY=;
 b=ZMFPdPunvlYPQPU3WvFgrloJ8uyHxXAWCOMTRSZ9UdgD6rlNisHeAFF5/aY9eRXA0W
 RVgqJzVwNnaI7+v11DYXSCOX+1qoTZ4UHTG6/wQD/YlQrYt1Hwg51G8tJEPipcv4GY66
 4jWv5S3N+GmyqU6l+K858iXVMtXZSPnh1xSRU4u2GJihLrDkY356tc/U6/el6POMbuSC
 BVjvraKgPJFIcs7OPE4lDWq0kSaW9OyCoibbg40N5i4AFl2cRDJlVWQrlLKvz816fS2X
 IAmGmyJ+ToO08AHPxyjQEN6ZAc0PXhytlp05lepN1qcMlsN3si+QLc1JoCpWctNrxLBb
 JqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sgetwGF1PvFvysoUcKKwVGNS/40oEtUezOmpaPDogiY=;
 b=8PFUklUTSEG+3809pwnlRVMXFfmME6NVJQ5Wlvh0S2Vr3+IduPEqkW1SZu7QqJOzjU
 7YWqRLrfx7usrL++vBlDy2fUfJts9091thYW33MbbjfTT1Rq0ubF8WtF7qSKRrif1J0x
 F1g5gFJ0pKs3ncu2dorXlWu8Svad4xiWc3DyHmn9lflQRWeOvyCX9nSfWlC5oNZYwSkd
 yI5XA5UKwSN03H30ZOOVq2bjE1g0RRvyiOMU/NHT2MoQTp5R00n3Wa/fhlpJrXyBwz/r
 HYoBIqApgxSDqtPeBkJI29Qjg1ifv/8zVOIA5c2YEYOebO7+7x02q+S0KmTAx8LGG/Sw
 zvPQ==
X-Gm-Message-State: AOAM533pOjAuxGxkTrGBeDXUXExlhEsbDyp2lcT7wcEXOJ6uh6Aaz3t5
 R7iOFSIBBjWXagJY87J3ZHk=
X-Google-Smtp-Source: ABdhPJw/XVMZxQqn7LbpCVPeOLw0PRZZYK3mOXAw1YPVhpRYJee8hLeBKf1SThBKLbxC47OMbHQhGw==
X-Received: by 2002:a17:903:40ce:b0:164:248:1464 with SMTP id
 t14-20020a17090340ce00b0016402481464mr3355617pld.16.1654151225424; 
 Wed, 01 Jun 2022 23:27:05 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt
 ([2402:7500:569:e4e7:9594:e92e:b3a9:bf26])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170902714e00b0015e8d4eb1f9sm2650433plm.67.2022.06.01.23.26.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 23:27:04 -0700 (PDT)
Date: Thu, 2 Jun 2022 14:26:51 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
Message-ID: <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Linux PM <linux-pm@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 u0084500@gmail.com, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 11:48:58AM +0200, Andy Shevchenko wrote:
> On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
> 
> All below comments are applicable to the rest of the series as well
> (one way or another), so please fix all your patches where it's
> appropriate.
> 
> >
> > Add Mediatek MT6370 Indicator support
> 
> What indicator?
It's RGB curent sink type LED driver (maximum supported current is only 24mA).
> Please also keep attention on English punctuation (missed period).
> 
Ack in next.
> ...
>
> > +       help
> > +         Support 4 channels and reg/pwm/breath mode.
> > +         Isink4 can also use as a CHG_VIN power good Indicator.
> 
> be used
> 
Ack in next.
> > +         Say Y here to enable support for
> > +         MT6370_RGB_LED device.
> 
> ...
> 
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> 
> > +#include <linux/of.h>
> 
> Are you sure this is the correct header? Seems you need
> mod_devicetable.h instead.
> 
It's the correct header and be used for the struct 'of_device_id'.
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> 
> ...
> 
> > +struct mt6370_priv {
> > +       struct mutex lock;
> 
> Do you use regmap locking?
>
MFD regmap register already the access lock.

This lock is just to guarantee only one user can access the RGB register
part.

Sorry, from the comment, do you want us to rename or remove this lock?
> > +       struct device *dev;
> 
> > +       struct regmap *regmap;
> 
> > +       struct regmap_field *fields[F_MAX_FIELDS];
> > +       const struct reg_field *reg_fields;
> > +       const struct linear_range *ranges;
> > +       struct reg_cfg *reg_cfgs;
> > +       unsigned int leds_count;
> > +       unsigned int leds_active;
> > +       bool is_mt6372;
> > +       struct mt6370_led leds[];
> > +};
> 
> ...
> 
> > +static const unsigned int common_tfreqs[] = {
> > +       10000, 5000, 2000, 1000, 500, 200, 5, 1
> 
> Leave a comma at the end.
> 
Ack in next.
> > +};
> > +
> > +static const unsigned int mt6372_tfreqs[] = {
> > +       8000, 4000, 2000, 1000, 500, 250, 8, 4
> 
> Ditto.
> 
Ack in next.
> > +};
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
