Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A064958124C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 13:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284E11BFB3;
	Tue, 26 Jul 2022 11:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E5114A443
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 11:46:36 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id h22so10223343qta.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 04:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wL1b72wWwttocLxQ4i2N7IFKv69W21HPhWs4hRLf0o0=;
 b=AZ8qDLn4Znu85xCahXNOnmojv9wcePPk3Lf2KSJODsdYIL/u4rdAI0Lnw8MiXeeTQl
 0fNcl+cJw4vrGMs/9mjAcX99bHsbOpeBwt1ay2R33YRq1VsVjC++YG2fmlp7hix1YwsO
 IKZ3zoTB97u6iKZxmk+c33+dSbGXuJXJDQz+RRlu+LRdNCgrsyBWNRh2nYIBbuWUos51
 BrJUcA7G/8NE1M8r1t7zyLNEvXtcGsNdIwqfkXwOFPRNUwWDTrUivYLlX/lxHIIPKvWG
 uXmZtHYk57ezocXOjrXXXwhnGpuE94ql5T95iceJZSiu4iSTtJVip83p/q4s/P1JT7m/
 PgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wL1b72wWwttocLxQ4i2N7IFKv69W21HPhWs4hRLf0o0=;
 b=CVZZUBGAYYQj7Cj3s/35rEqes48CVcAXoUBQ1c2oKTKH61UDtLs6ahrHbovrAx6I5k
 +p83iUmsgaSuEjkPihb7M4upZuEhb7sVHjIGq4RhZbNNCbGYQwykRjOVxXjUaMxMNcnO
 bBhBwxy5wK0NBOJKJglXYgLSy5NNxfbP2tk7W0MJ6JrTgHJ4e9CTSpQdiDiYx3Wh7WPT
 J7qCAiNF2G6yGHrhB0SXi/CXNqDqv/6I85Caj4x12s8Mjdu9znfQY4J9TtRWoRMgsbY0
 ycL2zHohiOvjJvRvMKXqz1FuYmLnJWsixay6CiA50b9wN/IR6iuYQYTCLy7Cx6Jl5Zeq
 wpaQ==
X-Gm-Message-State: AJIora8JGl9fgrEtKs+APImCYwgQZ+HZej8lhoD/U9W2Jb8B7awmGP9E
 IIiTRky/rs5jXLdzSmnbCJXJrOORkz1mjWA4zdsHxzO4jH4=
X-Google-Smtp-Source: AGRyM1sOWaWg8F0hJmRbLUJyv570Fqyt5WL0lP9RdfcVPQQLkd4tLFbTSnSOHuBdwqMxVIGbB1G4Kxurui/itRlhhGY=
X-Received: by 2002:ac8:5a8b:0:b0:31f:27b8:2260 with SMTP id
 c11-20020ac85a8b000000b0031f27b82260mr13732022qtc.198.1658835995667; Tue, 26
 Jul 2022 04:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
In-Reply-To: <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 26 Jul 2022 19:45:59 +0800
Message-ID: <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Mon, Jul 25, 2022 at 4:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
...
> > From: ChiYuan Huang <cy_huang@richtek.com>
>
> ^^^^ (Note this and read below)

...

> In conjunction with above what SoB of Alice means?
>
> You really need to take your time and (re-)read
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Hi Andy,

Thanks for your reply.
We are very sorry for this mistake. We will revise it in the next patch.

>
> ...
>
> > + * Author: Alice Chen <alice_chen@richtek.com>
> > + * Author: ChiYuan Huang <cy_huang@richtek.com>
>
> Would
>  * Authors:
>  *    Name_of_Author 1
>  *    Name_of_Author 2
>
> work for you?

It looks good, thanks! We will apply this in the next patch.

 ...

> > +struct mt6370_led {
> > +       union {
> > +               struct led_classdev isink;
> > +               struct led_classdev_mc mc;
> > +       };
>
> Where is the field that makes union work?

Just for saving memory space.
Because these led_classdevs do not be used at the same time.
Or do you think it would be better to rewrite it as follows?
-------------------------------------------------------------------------------------
struct mt6370_led {
       struct led_classdev isink;
       struct led_classdev_mc mc;
       struct mt6370_priv *priv;
       u32 default_state;
       u32 index;
};
-------------------------------------------------------------------------------------

...

> > +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> > +                                    struct led_pattern *pattern, u32 len,
> > +                                    u8 *pattern_val, u32 val_len)
> > +{
> > +       enum mt6370_led_ranges sel_range;
> > +       struct led_pattern *curr;
> > +       unsigned int sel;
> > +       u8 val[P_MAX_PATTERNS / 2] = {};
> > +       int i;
> > +
> > +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Pattern list
> > +        * tr1: byte 0, b'[7: 4]
> > +        * tr2: byte 0, b'[3: 0]
> > +        * tf1: byte 1, b'[7: 4]
> > +        * tf2: byte 1, b'[3: 0]
> > +        * ton: byte 2, b'[7: 4]
> > +        * toff: byte 2, b'[3: 0]
> > +        */
> > +       for (i = 0; i < P_MAX_PATTERNS; i++) {
> > +               curr = pattern + i;
> > +
> > +               sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> > +
> > +               linear_range_get_selector_within(priv->ranges + sel_range,
> > +                                                curr->delta_t, &sel);
> > +
> > +               val[i / 2] |= sel << (4 * ((i + 1) % 2));
> > +       }
> > +
> > +       memcpy(pattern_val, val, 3);
>
> Isn't it something like put_unaligned_be24()/put_unaligned_le24()?

OK, we will try to apply this method in the next patch.
Thank you so much for reviewing our patches so many times and
providing so many great suggestions!

-- 
Best Regards,
ChiaEn Wu
