Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA4565E75
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437CC10E534;
	Mon,  4 Jul 2022 20:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8610E2DD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:29:50 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id 64so9228178ybt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BJ5uLmaL6h68lsnPAamuG1muud74QSPIe8Sz8xN9JKc=;
 b=IyhykYvWClWsa/rmW6Z/KwjZd5OEnZBjTZJoLjjQF9DF//3C/8TDLUZ9WgQcftxTIg
 RSAO/m1TfA810UfvrDxUciTgRWK2V4vdbkEYBtyWoxZlfSzBqFx5f84Zp+uH4jhvnzq/
 HsHVqaeINcK2mj/R1Ossi/8UDOV+jsLE5fw3mKztcr2IiO0IBISDLkBu1k6BwebWsnEj
 rhZLb6XD3sUUzdCeoSWKQm/M4LzSdBs90raNvlZ4+hvPn95gzOFxzHeI3LQRisB4w0up
 aec9JMZAW5+VoFpw7BV31bnXLr9oQpCTjtoPy02YGKT8SUHH8jzuYOAiMXH/V2hoIFH5
 cM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BJ5uLmaL6h68lsnPAamuG1muud74QSPIe8Sz8xN9JKc=;
 b=xAYa6e2AxSqB6yIzLvVUVboerMl/7yTJsiNHQQelEDV7RqXKufzeKpHIq8+eSLu1hf
 IzT9LZHivDhJsmnuhssJHnwXFbh7bgbuOtPqD7Uwhu2piL+W6T8eEnvlCEAEG9I34rzb
 AqB2Huz52Cl6wBbGbTv9viMSN0gRW5avF+takLDUM73dhlJR5ysEXhUWeXUdxnAp4OFD
 VtLCjUOHzXxZETuD2sWh5wN9vvd7Ih2miSIUEMAvGf6JQllJsxB/d2OBW003m4HCLIq6
 s+r1SIysow4Yj5nZC8D8OozgNWy3iJrRAAFenyZQNHpqAqStgf3LXEOqlCp2xaZdJ8fe
 o/Mg==
X-Gm-Message-State: AJIora8G8KK1X+Qg8xgHlWzhcoFyruuHN89/DQ82IymcugrBKgYBu2JV
 5V3hf4YVpDWmU8fpw1fArIJZ5KIqibtSvlHph4g=
X-Google-Smtp-Source: AGRyM1vEHdw+U96rIzhW6zkgtaj72ZS8Mc4Jf0CUsUjgZNa7gf9zGcS1I+LbCSSAS46frig4pqKB5Woq3OBcI+Ti+RY=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr8437278ybk.296.1656966589934; Mon, 04
 Jul 2022 13:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-8-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:29:13 +0200
Message-ID: <CAHp75VcmEasZu53kZFO9R0Y=gZau-XFpAPd2a00deHv3PO1ZOg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] mfd: mt6370: Add Mediatek MT6370 support
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

On Mon, Jul 4, 2022 at 7:41 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> Add Mediatek MT6370 MFD support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370.ko".

".ko" part is not needed.

To all your patches in the series where this applies.

...

> +static const struct regmap_irq mt6370_irqs[] = {
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
> +       REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)

Leave a comma here.

> +};

...

> +static const struct resource mt6370_regulator_irqs[] = {
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")

Leave a comma here.

> +};
> +
> +static const struct mfd_cell mt6370_devices[] = {
> +       MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> +       MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
> +       MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
> +       MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
> +       MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
> +       MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
> +       MFD_CELL_RES("regulator", mt6370_regulator_irqs)

Leave a comma here.

> +};


-- 
With Best Regards,
Andy Shevchenko
