Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B364358A9F7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 13:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEC4B41F0;
	Fri,  5 Aug 2022 11:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36AB3F9C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 11:07:55 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id h7so1772020qtu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xevi7s0+mr+ptfy7uVrWQvtAVkuN9tBhA8DON7VF3hc=;
 b=a9+SkJgUlA0b0/BHR/ZnCRMvTgWWiTfbn+7hCLvZBsaMMCRDTPxUJBAC7vZNjxq/vo
 k8OLi0uQ406lmhmpDT6bTA8Ln7hcqHBvrfJ6793g1OGhONtOUz8WZFu//S4D+ajPvm+/
 HiavKm1cieEdFkxt1ha+nayBdzC2mzMdgbZG3PWagP1NkKBygX5opsEMSZg7lLxmqjo8
 LBS37LwpObC3ROrIeGlDwWsw0zgdY3DWHlzFAJgr2ZjpMu5E7HGDXRWesXtLS8v9Z+Us
 O4BT37Ii/msU+LJssnGZn5Y8/ZMnoo5h2TyNnno4biJLWE9r//68n4cVGwG19hhQqWRQ
 N3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xevi7s0+mr+ptfy7uVrWQvtAVkuN9tBhA8DON7VF3hc=;
 b=JiHlam8RFoW+15GHHKs2Se9KMUchViFSSYft2JehTGdRqNzvE8H45klrF+aCoItG4P
 XuejAublnIW4EPWWkKr1YF7NFrHy3kB1drTXn7ZD/5csF0xuUwFG6izlL/GusIjTUaXb
 kNr4m1sONsfo7JFKN+ouQ5fW1ZIDkRRfuOMEJmDon5V2B0Yr03EvS7SDsMC8e835FNkd
 pQOFiehO+mvYJhSrQY+dvPIl20WG9gVy4Sw4FRrYG+sCTYbI306wWVPHHJTagen4DKCm
 kQROODLMeushBi66wGRTzjRbwAVsnjeUoZEz9R4dsDNVLf5iSrFHh8CrmrvQU6nxMDB1
 AWTA==
X-Gm-Message-State: ACgBeo08QAjYYs+6h4qlziIwMVFK1iTkupcNl+QX+RqCcGVpjKJulekz
 oOJDDkbN2OWDCUkHbLJ+vh+t6rtExGiRpxXFMTo=
X-Google-Smtp-Source: AA6agR616g5NuJiBX7N2EN5Udk4icnJWQWfoN9qnVhTU27eNGicOdpHWiuxBhRNAeZcqXVc1r4KkqHm9jBQr5PV+ypI=
X-Received: by 2002:ac8:5784:0:b0:31f:24e:93f5 with SMTP id
 v4-20020ac85784000000b0031f024e93f5mr5286928qta.429.1659697674792; Fri, 05
 Aug 2022 04:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-12-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-12-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 13:07:18 +0200
Message-ID: <CAHp75VeL=GVMSQaxePwc47FsQczs10m0ZFc-Y3Z2rGx45vLnuQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add a support for the MediaTek MT6370 Current Sink Type LED Indicator

Add support

(This is also for all other commit messages)

> driver. It can control four channels current-sink RGB LEDs with 3 modes,

3 modes:

> constant current, PWM, and breath mode.

...

> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +                                    struct led_pattern *pattern, u32 len,
> +                                    u8 *pattern_val, u32 val_len)
> +{
> +       enum mt6370_led_ranges sel_range;
> +       struct led_pattern *curr;
> +       unsigned int sel;
> +       u32 val = 0;
> +       int i;
> +
> +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +               return -EINVAL;
> +
> +       /*
> +        * Pattern list
> +        * tr1:  byte 0, b'[7: 4]
> +        * tr2:  byte 0, b'[3: 0]
> +        * tf1:  byte 1, b'[7: 4]
> +        * tf2:  byte 1, b'[3: 0]
> +        * ton:  byte 2, b'[7: 4]
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
> +               val <<= i % 2 == 0 ? 8 : 0;
> +               val |= sel << (i % 2 == 0 ? 4 : 0);

It's too cryptic, why not simply:

  if (i % 2) {
    val |= sel;
  } else {
    val <<= 8;
    val |= sel << 4;
  }

?

> +       }
> +
> +       put_unaligned_be24(val, pattern_val);
> +
> +       return 0;
> +}

...

> +       const char * const states[] = { "off", "keep", "on" };

> +       ret = fwnode_property_read_string(init_data->fwnode, "default-state",
> +                                         &stat_str);
> +       if (!ret) {
> +               ret = match_string(states, ARRAY_SIZE(states), stat_str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

Replace this by using led_init_default_state_get().

-- 
With Best Regards,
Andy Shevchenko
