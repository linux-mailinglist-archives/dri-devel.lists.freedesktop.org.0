Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17657565EBB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 23:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4170B18A5DA;
	Mon,  4 Jul 2022 21:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647718A5A8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 21:06:00 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id g4so18647589ybg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VjZ3yzk/koQQf8zjxBLs4QwpOzuOIkcuZx3e6uOiaGo=;
 b=XAO9XvLkJnavV0BlpGD+ClNY1uK6ZfLyjbo4n/ZLW8wmrgbwYg5bneBkPszuL0qItE
 XJI/Um1JbtICgrAWB2CbGTIQL3XiiI2CrvIzS3z6cX+0fWMEmTP/m05hoU/XeDh0JO+1
 eeHvwD6DxA036OjtJ1Awdqd8jOkI2onMTEJcqz2T5m6m+nRgsY0HzmkAIs+HuG9M0gvY
 OFUCInVfTCYeAF0Lc4c62oICHpgKN8SFXHnHvcx1YtkZYz9O+ZylSp/45sY17OaSjN0m
 IlghfWm5NOnrrvHQ0++R9QZOLHNJ+fo0gumeOMXqd+yZ0GZJC1bXUW/tMLgcUZq+m6/s
 0PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjZ3yzk/koQQf8zjxBLs4QwpOzuOIkcuZx3e6uOiaGo=;
 b=v/KQh2G47zh8Jw7cjPnUDc/lKCWdWLhpb8QE3a7uH5mELSCdESm6CcWCV4oi1/didW
 jnK8iIiJZEuBdEDtKzz7/qh+fl+r5feNWr2zTnrV89sdHewoD7PO7cwg8gJVK204Z62o
 VOhYiklRFmiHrxRh+0fFf5yLTbSuuqG9Hlt6qHQUmj7TV/aiDCFBmCt7iHSr1oQJ3X9F
 YNB4ycWf8ILEgBfzBjSp5QzUDPBjFgvD5Hh9SYuVPdL1QuRLJ0WLB1lTogFJpU6pXcp5
 4R9PrUKjj7zsUQp7lTIukAznigVsFLjGzanhSpX+BAHNUta1hRMHgAgLH7LwK3bCXABw
 rHAA==
X-Gm-Message-State: AJIora8PBJo1KPubw4ICA8jQ3iAvGyApN+gKIT0I1VCZHtJgt5lkRi6A
 /1f/iyfWIYWq9NYFfBDZicXQ45Amuc0bPQbV0qQ=
X-Google-Smtp-Source: AGRyM1sv4WckZUH06N23fcQXnL/x2rHJiYiT8ToR3cUqaWbGObXlg//Fkee64+CFjVKfldQI9mTw3vJ9ryFFyL1X6HM=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8717309ybq.570.1656968759476; Mon, 04
 Jul 2022 14:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-13-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 23:05:22 +0200
Message-ID: <CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
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

On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> Add Mediatek MT6370 flashlight support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "leds-mt6370-flash.ko".

No ".ko" part.

...

> +#define MT6370_ITORCH_MINUA            25000
> +#define MT6370_ITORCH_STEPUA           12500
> +#define MT6370_ITORCH_MAXUA            400000
> +#define MT6370_ITORCH_DOUBLE_MAXUA     800000
> +#define MT6370_ISTRB_MINUA             50000
> +#define MT6370_ISTRB_STEPUA            12500
> +#define MT6370_ISTRB_MAXUA             1500000
> +#define MT6370_ISTRB_DOUBLE_MAXUA      3000000
> +#define MT6370_STRBTO_MINUS            64000
> +#define MT6370_STRBTO_STEPUS           32000
> +#define MT6370_STRBTO_MAXUS            2432000

Make units suffix visible, i.e. _US, _uA, etc.

...

> +       if (curr)
> +               val |= MT6370_TORCHEN_MASK;
> +
> +

One blank line is enough.

...

> +       /*
> +        * Due to the current spike when turning on flash,
> +        * let brightness to be kept by framework.

brightness be
the framework

> +        * This empty function is used to
> +        * prevent led_classdev_flash register ops check failure.
> +        */

...

> +       } else {
> +               ret = regmap_update_bits(priv->regmap,
> +                                        MT6370_REG_FLEDISTRB(led->led_no),
> +                                        MT6370_ISTROBE_MASK, val);

> +               if (ret)
> +                       return ret;

Dup of the below.

> +       }
> +       return ret;

...

> +       /*
> +        * If the flash need to be on,
> +        * config the flash current ramping up to the setting value
> +        * Else, always recover back to the minimum one

Missed periods.

> +        */

...

> +       /*
> +        * For the flash turn on/off, HW ramping up/down time is 5ms/500us
> +        * respectively.
> +        */
> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

Comment doesn't explain why this is suddenly a busy loop operation?


> +static int mt6370_led_register(struct device *parent, struct mt6370_led *led,
> +                               struct led_init_data *init_data)
> +{
> +       struct v4l2_flash_config v4l2_config = {0};
> +       int ret;
> +
> +       ret = devm_led_classdev_flash_register_ext(parent, &led->flash,
> +                                                  init_data);
> +       if (ret) {
> +               dev_err(parent, "Couldn't register flash %d\n", led->led_no);
> +               return ret;
> +       }
> +
> +       mt6370_init_v4l2_flash_config(led, &v4l2_config);
> +       led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode,
> +                                         &led->flash, &v4l2_flash_ops,
> +                                         &v4l2_config);
> +       if (IS_ERR(led->v4l2_flash)) {
> +               dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
> +               return PTR_ERR(led->v4l2_flash);
> +       }
> +
> +       return 0;
> +}

...

> +       } else
> +               val = clamp_align(val, MT6370_STRBTO_MINUS, MT6370_STRBTO_MAXUS,
> +                                 MT6370_STRBTO_STEPUS);

Missed {}

> +
> +

One blank line is enough.

-- 
With Best Regards,
Andy Shevchenko
