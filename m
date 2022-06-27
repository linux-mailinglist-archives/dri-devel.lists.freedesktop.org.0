Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B660555BAC7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 17:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DABA10E43D;
	Mon, 27 Jun 2022 15:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5110E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 15:35:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p128so9968766iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DWaXwbPhQLHYiofNZTdJv3EVFnAdrGH7jDTx9yceMtw=;
 b=ksb5BcoUCSVfEkzZlG0QrskY3cFp4GorVjfAwA3x4/5DZbPV7fLw1Y7J523xOVf8Ub
 /uyDjbniffH4qZhCtgHefzhHJo5mDm1SLBrVlKteg1HKo0DpS5G1aajvx+71eeOVJU7Q
 V4ZSW+Fs3gR00ecyUtfFkLY/YrQJb75P9Lay6ZgTpnjMaG3lJ8lSFhfuzPBet7jTFz86
 r8Jp0gvd0VPvh+m7ZA80t71BWSP+6AdPAP6nTiZk/uORkFE4rkKY4sdquPFdYg8vknvT
 ZPVreFYVVRCZhl/EqFCOa1/hWPqIzoofIZunlmWCNSBK3Hh/lH8Vel38c3b/0AxKeA2x
 1yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DWaXwbPhQLHYiofNZTdJv3EVFnAdrGH7jDTx9yceMtw=;
 b=rbX+ZqdLZA+fllCfyHfmtlMidCzPcorxxZZCuDFGaW5cyVZ0gXgSRubn2i7oNWaCx6
 jNQeVl8iiobtYIoRVScpubbgWcWKZmGWtUE/9I9qlMt2KIwBU7KrTYgbGs9zC1xlJwqX
 2FVG/2ezpeQ3UWBAsezICa2R980xXVahdniN7hLIupra8BRvmBCT8mYgw3O0lO+hseAF
 RqO/CcWOc9m4B3kQgb9hoUY3inqgUyAGO3G1qtw7ExYjqaH8+Ing0ntsYc2ox9l5bxrx
 nwppI2u6S6wSL7k/hPxTLJfoDWKQ19phawKxC0qu2FpJ8rLcx+JNel7CUNwyI4TpvP7T
 jHqQ==
X-Gm-Message-State: AJIora9bg6y19qgIKzwm6XGSPwcscdQbMJEQDl8KOCgbden+W/U0n/6+
 SxPv5evYXCfo96J6rc5gA5n11U1C7w5WhK36rEk=
X-Google-Smtp-Source: AGRyM1uuqQ0pteqznSDBc+rr+xZIcchgLPVUMC7kEEbrXp0/Nr/J1O/NizWgVIIzmtRuba13kEvcIfC6ruo3to2Wzrw=
X-Received: by 2002:a05:6638:210e:b0:33c:953d:5676 with SMTP id
 n14-20020a056638210e00b0033c953d5676mr4041037jaj.196.1656344128174; Mon, 27
 Jun 2022 08:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-9-peterwu.pub@gmail.com>
 <Yqph8jwHU8rPooJA@google.com>
 <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
 <Yrm7NTID16g8gM5t@google.com>
In-Reply-To: <Yrm7NTID16g8gM5t@google.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 27 Jun 2022 23:35:06 +0800
Message-ID: <CABtFH5L7B_kEvG5E2Um5EANEScJPTfQthyLNfCbvoHq_YDpXxQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, szuni chen <szunichen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

Thanks for your reply!

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8827=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E6=99=9A=E4=B8=8A10:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sat, 18 Jun 2022, ChiaEn Wu wrote:
>
> > Hi Lee,
> >
> > Thanks for your helpful comments, we have some questions and replies be=
low.
> >
> > Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8816=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E6=B8=85=E6=99=A86:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > >
> > > On Mon, 13 Jun 2022, ChiaEn Wu wrote:
> > >
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > >
> > > > Add Mediatek MT6370 MFD support.
> > > >
> > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > ---
> > > >  drivers/mfd/Kconfig  |  13 ++
> > > >  drivers/mfd/Makefile |   1 +
> > > >  drivers/mfd/mt6370.c | 349 +++++++++++++++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 363 insertions(+)
> > > >  create mode 100644 drivers/mfd/mt6370.c
> > > >
> > > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > > index 3b59456f5545..d9a7524a3e0e 100644
> > > > --- a/drivers/mfd/Kconfig
> > > > +++ b/drivers/mfd/Kconfig
> > > > @@ -937,6 +937,19 @@ config MFD_MT6360
> > > >         PMIC part includes 2-channel BUCKs and 2-channel LDOs
> > > >         LDO part includes 4-channel LDOs
> > > >
> > > > +config MFD_MT6370
> > > > +     tristate "Mediatek MT6370 SubPMIC"
> > > > +     select MFD_CORE
> > > > +     select REGMAP_I2C
> > > > +     select REGMAP_IRQ
> > > > +     depends on I2C
> > > > +     help
> > > > +       Say Y here to enable MT6370 SubPMIC functional support.
> > > > +       It integrate single cell battery charger with adc monitorin=
g, RGB
> > >
> > > s/integrates/consists of a/
> > >
> > > "ADC"
> >
> > We will fine it in the next patch.
> >
> > >
> > > > +       LEDs, dual channel flashlight, WLED backlight driver, displ=
ay bias
> > >
> > > > +       voltage supply, one general purpose LDO, and cc logic
> > > > +       controller with USBPD commmunication capable.
> > >
> > > The last part makes no sense - "and is USBPD"?
> >
> > If we modify this help text to
> > "one general purpose LDO, and the USB Type-C & PD controller complies
> > with the latest USB Type-C and PD standards",
> > did these modifications meet your expectations?
>
> "one general purpose LDO and a USB Type-C & PD controller that
> complies with the latest USB Type-C and PD standards"
>
> Better?

Yes, thanks! We will modify it like that in the next patch.

>
> > > >  config MFD_MT6397
> > > >       tristate "MediaTek MT6397 PMIC Support"
> > > >       select MFD_CORE
> > > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > > index 858cacf659d6..62b27125420e 100644
> > > > --- a/drivers/mfd/Makefile
> > > > +++ b/drivers/mfd/Makefile
> > > > @@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)        +=3D =
intel_soc_pmic_bxtwc.o
> > > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)   +=3D intel_soc_pmic_chtwc.o
> > > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)        +=3D intel_soc_pmic_c=
htdc_ti.o
> > > >  obj-$(CONFIG_MFD_MT6360)     +=3D mt6360-core.o
> > > > +obj-$(CONFIG_MFD_MT6370)     +=3D mt6370.o
> > > >  mt6397-objs                  :=3D mt6397-core.o mt6397-irq.o mt635=
8-irq.o
> > > >  obj-$(CONFIG_MFD_MT6397)     +=3D mt6397.o
> > > >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)   +=3D intel_soc_pmic_mrfld.o
> > > > diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> > > > new file mode 100644
> > > > index 000000000000..6af9f73c9c0c
> > > > --- /dev/null
> > > > +++ b/drivers/mfd/mt6370.c
> > > > @@ -0,0 +1,349 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +#include <linux/bits.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/mfd/core.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +enum {
> > > > +     MT6370_USBC_I2C =3D 0,
> > > > +     MT6370_PMU_I2C,
> > > > +     MT6370_MAX_I2C
> > > > +};
> > > > +
> > > > +#define MT6370_REG_DEV_INFO  0x100
> > > > +#define MT6370_REG_CHG_IRQ1  0x1C0
> > > > +#define MT6370_REG_CHG_MASK1 0x1E0
> > > > +
> > > > +#define MT6370_VENID_MASK    GENMASK(7, 4)
> > > > +
> > > > +#define MT6370_NUM_IRQREGS   16
> > > > +#define MT6370_USBC_I2CADDR  0x4E
> > > > +#define MT6370_REG_ADDRLEN   2
> > > > +#define MT6370_REG_MAXADDR   0x1FF
> > > > +
> > > > +/* IRQ definitions */
> > > > +#define MT6370_IRQ_DIRCHGON          0
> > > > +#define MT6370_IRQ_CHG_TREG          4
> > > > +#define MT6370_IRQ_CHG_AICR          5
> > > > +#define MT6370_IRQ_CHG_MIVR          6
> > > > +#define MT6370_IRQ_PWR_RDY           7
> > > > +#define MT6370_IRQ_FL_CHG_VINOVP     11
> > > > +#define MT6370_IRQ_CHG_VSYSUV                12
> > > > +#define MT6370_IRQ_CHG_VSYSOV                13
> > > > +#define MT6370_IRQ_CHG_VBATOV                14
> > > > +#define MT6370_IRQ_CHG_VINOVPCHG     15
> > > > +#define MT6370_IRQ_TS_BAT_COLD               20
> > > > +#define MT6370_IRQ_TS_BAT_COOL               21
> > > > +#define MT6370_IRQ_TS_BAT_WARM               22
> > > > +#define MT6370_IRQ_TS_BAT_HOT                23
> > > > +#define MT6370_IRQ_TS_STATC          24
> > > > +#define MT6370_IRQ_CHG_FAULT         25
> > > > +#define MT6370_IRQ_CHG_STATC         26
> > > > +#define MT6370_IRQ_CHG_TMR           27
> > > > +#define MT6370_IRQ_CHG_BATABS                28
> > > > +#define MT6370_IRQ_CHG_ADPBAD                29
> > > > +#define MT6370_IRQ_CHG_RVP           30
> > > > +#define MT6370_IRQ_TSHUTDOWN         31
> > > > +#define MT6370_IRQ_CHG_IINMEAS               32
> > > > +#define MT6370_IRQ_CHG_ICCMEAS               33
> > > > +#define MT6370_IRQ_CHGDET_DONE               34
> > > > +#define MT6370_IRQ_WDTMR             35
> > > > +#define MT6370_IRQ_SSFINISH          36
> > > > +#define MT6370_IRQ_CHG_RECHG         37
> > > > +#define MT6370_IRQ_CHG_TERM          38
> > > > +#define MT6370_IRQ_CHG_IEOC          39
> > > > +#define MT6370_IRQ_ADC_DONE          40
> > > > +#define MT6370_IRQ_PUMPX_DONE                41
> > > > +#define MT6370_IRQ_BST_BATUV         45
> > > > +#define MT6370_IRQ_BST_MIDOV         46
> > > > +#define MT6370_IRQ_BST_OLP           47
> > > > +#define MT6370_IRQ_ATTACH            48
> > > > +#define MT6370_IRQ_DETACH            49
> > > > +#define MT6370_IRQ_HVDCP_STPDONE     51
> > > > +#define MT6370_IRQ_HVDCP_VBUSDET_DONE        52
> > > > +#define MT6370_IRQ_HVDCP_DET         53
> > > > +#define MT6370_IRQ_CHGDET            54
> > > > +#define MT6370_IRQ_DCDT                      55
> > > > +#define MT6370_IRQ_DIRCHG_VGOK               59
> > > > +#define MT6370_IRQ_DIRCHG_WDTMR              60
> > > > +#define MT6370_IRQ_DIRCHG_UC         61
> > > > +#define MT6370_IRQ_DIRCHG_OC         62
> > > > +#define MT6370_IRQ_DIRCHG_OV         63
> > > > +#define MT6370_IRQ_OVPCTRL_SWON              67
> > > > +#define MT6370_IRQ_OVPCTRL_UVP_D     68
> > > > +#define MT6370_IRQ_OVPCTRL_UVP               69
> > > > +#define MT6370_IRQ_OVPCTRL_OVP_D     70
> > > > +#define MT6370_IRQ_OVPCTRL_OVP               71
> > > > +#define MT6370_IRQ_FLED_STRBPIN              72
> > > > +#define MT6370_IRQ_FLED_TORPIN               73
> > > > +#define MT6370_IRQ_FLED_TX           74
> > > > +#define MT6370_IRQ_FLED_LVF          75
> > > > +#define MT6370_IRQ_FLED2_SHORT               78
> > > > +#define MT6370_IRQ_FLED1_SHORT               79
> > > > +#define MT6370_IRQ_FLED2_STRB                80
> > > > +#define MT6370_IRQ_FLED1_STRB                81
> > > > +#define mT6370_IRQ_FLED2_STRB_TO     82
> > > > +#define MT6370_IRQ_FLED1_STRB_TO     83
> > > > +#define MT6370_IRQ_FLED2_TOR         84
> > > > +#define MT6370_IRQ_FLED1_TOR         85
> > > > +#define MT6370_IRQ_OTP                       93
> > > > +#define MT6370_IRQ_VDDA_OVP          94
> > > > +#define MT6370_IRQ_VDDA_UV           95
> > > > +#define MT6370_IRQ_LDO_OC            103
> > > > +#define MT6370_IRQ_BLED_OCP          118
> > > > +#define MT6370_IRQ_BLED_OVP          119
> > > > +#define MT6370_IRQ_DSV_VNEG_OCP              123
> > > > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > > > +#define MT6370_IRQ_DSV_BST_OCP               125
> > > > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > > > +#define MT6370_IRQ_DSV_VPOS_SCP              127
> > > > +
> > > > +struct mt6370_info {
> > > > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > > > +     struct device *dev;
> > > > +     struct regmap *regmap;
> > > > +     struct regmap_irq_chip_data *irq_data;
> > > > +};
> > >
> > > Can we shove all of the above into a header file?
> >
> > Well... In Patch v1, we put these "#define IRQ" into
> > "include/dt-bindings/mfd/mediatek,mt6370.h".
> > But the reviewer of DT files hoped us to remove this header file, we
> > put these "#define IRQ" in this .c file.
> > Shall we leave them here or put them into the header file in
> > "driver/power/supply/mt6370-charger.h"?
>
> Where are they used?

Sorry, I wrote the wrong path last time...
What I should say last time was to put them into the header file into
"driver/mfd/mt6370.h"
These "#define IRQ" are just used in "driver/mfd/mt6370.c"
I=E2=80=99m really sorry for making this mistake...

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Best regards,
ChiaEn Wu
