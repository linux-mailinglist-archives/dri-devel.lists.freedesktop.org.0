Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F557FAD3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6811BF61;
	Mon, 25 Jul 2022 08:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6749E11BF36
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:04:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ss3so19019543ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r9oGiDsxiFpBH+3rbxjYFk4fKS6kxjytRyEJ438nM14=;
 b=CJb2GrDqw5wptQkMGvGnlEHmNqNpBTz+oVejWM8vbDuV20ZOTC6BJ/xAOcSduhufTS
 CtY8s0Ob07oaPbu/f4yqfvkHz/xDY1O6vs2/oftm3gv1Uc+ykJC+fUd1S21cXIv8VjyW
 kSXeGTgiv3k4SaU7t5pXcn2tjl5/OFjnaZJ8Uu0DxeB/9Oof1BN5BOo2rRbXDmOoY1Oc
 CAj9lT0OP1cy+XTY99JtA98O+TDOotsScJIH1YM0dQeqD+8VHoEVugkGshM79Qhx2IYY
 Qmh4+CVjG1cahmKQrRaUHy+VKbjtu21T43SHNPAsr2ti4ofng6x5uib9AjGL5NY7lM5l
 yEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r9oGiDsxiFpBH+3rbxjYFk4fKS6kxjytRyEJ438nM14=;
 b=XZIAQ/kVYAzPeKIX58tm6CYU1ZcCHIVpEKOlXxj5Jm/dM5X9rTY9hWPEyARVGeON8B
 Tfwod9ejqFgTHlQrfsybEr7G/0rXN6Fr00WVoo+ZDuSKiAxFoQrBDtV9R1tFa3Sn/Fo8
 iJjQuRSssuO1mxb57z4WYaRfRy0TPhg/f5oUnkR3g4XvMWodFXELrF7DZFRH9mkgcu1o
 Ey+2YJcrjmVJ1goW9asOhfwGuZsj4GhK5RtzoU8axgQuWxfvvSCvP9Eje53afVO0okLh
 9c4N3I90SDvqMYQ9g7jwSPhVCHsjiD4fJS21fI49POata9gPi78z8TC2TXQXIJok9oBd
 2kSA==
X-Gm-Message-State: AJIora+m1iamSqka97u4Cam2GmQcavAk4Ms0GINACMbyX8vV8qSLueIS
 ncXYNB2SjIH9xrmoi5DCrL1xEunGZOmX+eIAXs8=
X-Google-Smtp-Source: AGRyM1slRdGOzS2afMezkzisSa07VKYBk0S3NkjvREARPdSLLPsbko0C4F61HAPbqNjfvUDyrYKyJb1xX+GfnwkFVZU=
X-Received: by 2002:a17:906:8a4a:b0:72b:5b23:3065 with SMTP id
 gx10-20020a1709068a4a00b0072b5b233065mr9334315ejc.557.1658736256789; Mon, 25
 Jul 2022 01:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-9-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:03:40 +0200
Message-ID: <CAHp75VessBZMBA6wNWhhXhPshDCghgkV8EkEUUqOeLqn-5pmpA@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add support for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.

...

> +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
> +                                bool enable)
> +{
> +       return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> +                                 MT6370_AUTOIDLE_MASK,
> +                                 !enable ? MT6370_AUTOIDLE_MASK : 0);

Why not positive conditional?

  enable ? 0 : mask

> +}

...

> +       ret = devm_add_action_or_reset(dev, mt6370_unregister_tcpci_port,
> +                                      priv->tcpci);

I believe nothing bad will happen if you put it on one line.

-- 
With Best Regards,
Andy Shevchenko
