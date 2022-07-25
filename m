Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745B57FB8D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170AF11A5CD;
	Mon, 25 Jul 2022 08:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47C11A5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:41:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z15so1129046edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UdipHJQcUj266PLPEbEmcprZ34Syq9EbeJ0nWcxYTz4=;
 b=ABfKDB+hF3n9Vc4uXcJH/wxowVuuZXANQHezQzdWr5Ngsh/idO85i0Q+mD/KzM+CSB
 JRG1GVu0xs6ZoCw7wBbOa5FdTc5eWvaqw+UVN9SHdJEHFfzbRmgkEdix6DCMyHAi1FCr
 JAr6axiQmtyvfzbVJQU1yILv+fNOSMc4pdNm12H0yVakxITFMYusQqnWis60Xho8AsGP
 L+ODp9hB0BQ9UuYk5DfBPx3HnH1fkimsB44PQM+VpR5aT9SXUllZ5JiUeNza+o1o5KiL
 NcV0q9dJ/h5dX9Q0H/4tQoS8YRcvn0AIT770BeqYm2Um/2gYOKrCHjcAMx/p6BEsJKeg
 en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdipHJQcUj266PLPEbEmcprZ34Syq9EbeJ0nWcxYTz4=;
 b=2YF681owYfV1u37XRFe2a4DmIqdRol+viUL9W0RWiDadoJ9SAXCb+KJvfIV7dX8Uge
 r6JHw6VnjsBbmVutGPRP7BthGPrdGYJeo9YvLHk7nxR7SnCsdYRmtw+y6VW3F4WbkUoa
 9F4NpHT5uLi68QXLJ35IBv63Z/kK/wcmsAt+1abWf8yqDeA8mWTouLD2v6SEqSmQk6q0
 nysM6WfP+xue7OvpyfxQl8QbSVKXkSCYaWLmuttyt57mTfhFEUFy54z3hDXEQ25AHahy
 5/QX/CgVnBRWp7xEvfyZip5nFjjz+q97rJBw9k9482jUZJgzK93GwdB54FZFWA8Djtwy
 6jbA==
X-Gm-Message-State: AJIora+iEVksC0uevLDYl5BCzrzNt4mFJMwJ4eePqA8Lxg7d3mbZ0Ild
 KCg0W5fiG55nR/2j5Ht8yuoEU8ULVaJJ1mnm+tMsFbf6RfCllA==
X-Google-Smtp-Source: AGRyM1uGDvTB0F/h0jI2/Ct5fK7yQVedUikOG6t/KbrLBDyp6j54RIAxbhLcpZDExQEJMEzhAem3RNohcfKc/MXfF0k=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr11897371edc.88.1658738469088; Mon, 25
 Jul 2022 01:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-12-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:40:32 +0200
Message-ID: <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>

^^^^ (Note this and read below)

>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> support hardware pattern for constant current, PWM, and breath mode.
> Isink4 channel can also be used as a CHG_VIN power good indicator.

> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

In conjunction with above what SoB of Alice means?

You really need to take your time and (re-)read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

...

> + * Author: Alice Chen <alice_chen@richtek.com>
> + * Author: ChiYuan Huang <cy_huang@richtek.com>

Would
 * Authors:
 *    Name_of_Author 1
 *    Name_of_Author 2

work for you?

...

> +struct mt6370_led {
> +       union {
> +               struct led_classdev isink;
> +               struct led_classdev_mc mc;
> +       };

Where is the field that makes union work?

> +       struct mt6370_priv *priv;
> +       u32 default_state;
> +       u32 index;
> +};

...

> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +                                    struct led_pattern *pattern, u32 len,
> +                                    u8 *pattern_val, u32 val_len)
> +{
> +       enum mt6370_led_ranges sel_range;
> +       struct led_pattern *curr;
> +       unsigned int sel;
> +       u8 val[P_MAX_PATTERNS / 2] = {};
> +       int i;
> +
> +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +               return -EINVAL;
> +
> +       /*
> +        * Pattern list
> +        * tr1: byte 0, b'[7: 4]
> +        * tr2: byte 0, b'[3: 0]
> +        * tf1: byte 1, b'[7: 4]
> +        * tf2: byte 1, b'[3: 0]
> +        * ton: byte 2, b'[7: 4]
> +        * toff: byte 2, b'[3: 0]
> +        */
> +       for (i = 0; i < P_MAX_PATTERNS; i++) {
> +               curr = pattern + i;
> +
> +               sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> +
> +               linear_range_get_selector_within(priv->ranges + sel_range,
> +                                                curr->delta_t, &sel);
> +
> +               val[i / 2] |= sel << (4 * ((i + 1) % 2));
> +       }
> +
> +       memcpy(pattern_val, val, 3);

Isn't it something like put_unaligned_be24()/put_unaligned_le24()?


> +       return 0;
> +}

...

> +static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
> +{
> +       struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +       struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +       struct mt6370_priv *priv = led->priv;
> +       struct mc_subled *subled;

> +       int i, ret = 0;

Redundant assignment.

> +       mutex_lock(&led->priv->lock);
> +
> +       for (i = 0; i < mccdev->num_colors; i++) {
> +               subled = mccdev->subled_info + i;
> +
> +               ret = mt6370_set_led_mode(priv, subled->channel,
> +                                         MT6370_LED_REG_MODE);
> +               if (ret)
> +                       break;
> +       }
> +
> +       mutex_unlock(&led->priv->lock);
> +
> +       return ret;
> +}

...

> +       if (!fwnode_property_read_string(init_data->fwnode, "default-state",
> +                                        &stat_str)) {

ret = fwnode_...(...);
if (!ret)

> +               ret = match_string(states, ARRAY_SIZE(states), stat_str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

...

> +       int i = 0, ret;

unsigned int i = 0;
int ret;

-- 
With Best Regards,
Andy Shevchenko
