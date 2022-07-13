Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D292D572B53
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 04:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B00B11243A;
	Wed, 13 Jul 2022 02:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188B10FEEB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 02:30:10 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id mi10so3936379qvb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OjfC14UX0Yga/TzH1v0XIRdS4rXd21Y3Whv/aSf9VoA=;
 b=d3I0uyWADejKdR2ES/RfLbaYBixqc/pl4ONk6M0eghfOWigj1wL2AwyJTiYBHumkOP
 QMMt9q41clp4V6BsejwpV/Kl0Xz4uTOGgRIlhdZTijpJawwBltr/v573h/+fpHjQVSKw
 8tOC3ZJZwHwwa+Uzoz+G1w7m6LpwkriUVLi/vuR44LkWDCMOb+FknjYGti9zhacuWWSt
 1MUzdrHOXK3MPSFRpdonH2pingai18e94oIAJNGwVbbuAgSEJ4fQerayKzJLnK+Ih/sj
 gacQwjBu8pL2gnKTmJLKdwjAG7tC/E5hPvexUdr63DamPuyfr1asanQdIobuBC+Of5Sj
 HcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OjfC14UX0Yga/TzH1v0XIRdS4rXd21Y3Whv/aSf9VoA=;
 b=S7WNa6eGPcaSXdiNY5O3xpXPXEMGLcGU8yeldmsnAJuZDI8hEfJuxOiOpxRq/z1OP5
 0lCf52x/fxFhuk3ovpP3koUGsBI1pHcyW03xuvcJlk0UYrxQK3uITBqn1CV3MJEDK4V0
 3qTmEyR8e6ElXnaDZeNxYr+afEP3dvLRmxKhSSehmV60TlXYgVITem1i0H4wjPRBGTBq
 Es39nztM/v0bT8O0bbiP1S/l7aARQk79gHNIu6yrk4VhJL7ZCOoo+BrN93vJ+RQS1mgX
 L4aBpUj8snqfXJU/JcMEHwicJ7yj4Y3wuiin8bbFBU6IiiARjH4yX/224Mhxsu8AzHC4
 Lp9A==
X-Gm-Message-State: AJIora/pUaWsBqAV3wmF2nwbm2y2i+iWZoVTjfaR3olB0AwNs5vd5xu2
 ETBdOh/MciZoS1pyqnsvfv7HHFHYNUdNAuE6p9w=
X-Google-Smtp-Source: AGRyM1voO0WaciH9DbhHkt/YKM8zHErAoG8R5FY3ClpbpAMi/UFk4qToRxpZVzAaxlfFrE6sPEoLPhyJTtfHNfIojxg=
X-Received: by 2002:a05:6214:23cb:b0:472:f1a5:5cea with SMTP id
 hr11-20020a05621423cb00b00472f1a55ceamr943713qvb.13.1657679409770; Tue, 12
 Jul 2022 19:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
 <Ys2TTsv1oU8n1fUE@google.com>
In-Reply-To: <Ys2TTsv1oU8n1fUE@google.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 13 Jul 2022 10:29:57 +0800
Message-ID: <CABtFH5LMHrfOdLZZxpjwsHmyHZsHUmevpQJYDFqZtvfpC6AVxg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
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

Hi Lee,

Thanks for your reply.

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E6=99=9A=E4=B8=8A11:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 23 Jun 2022, ChiaEn Wu wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 MFD support.
>
> No such thing as "MFD support".
>
> And you're not getting away with submitting a 370 line patch with a 5
> word change log either. :)
>
> Please at least tell us what the device is and what it's used for.

I sincerely apologize.
We will add more descriptions of the MT6370 feature in the v5 patch.

>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >
> > v3
> > - Refine Kconfig help text
> > - Refine error message of unknown vendor ID in
> >   mt6370_check_vendor_info()
> > - Refine return value handling of mt6370_regmap_read()
> > - Refine all probe error by using dev_err_probe()
> > - Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
> >   mt6370_regmap_write()
> > - Add "#define VENID*" and drop the comments in
> >   mt6370_check_vendor_info()
> > - Drop "MFD" in MODULE_DESCRIPTION()
> > ---
> >  drivers/mfd/Kconfig  |  13 ++
> >  drivers/mfd/Makefile |   1 +
> >  drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 372 insertions(+)
> >  create mode 100644 drivers/mfd/mt6370.c
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 3b59456..4c900c4 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -937,6 +937,19 @@ config MFD_MT6360
> >         PMIC part includes 2-channel BUCKs and 2-channel LDOs
> >         LDO part includes 4-channel LDOs
> >
> > +config MFD_MT6370
> > +     tristate "Mediatek MT6370 SubPMIC"
> > +     select MFD_CORE
> > +     select REGMAP_I2C
> > +     select REGMAP_IRQ
> > +     depends on I2C
> > +     help
> > +       Say Y here to enable MT6370 SubPMIC functional support.
> > +       It consists of a single cell battery charger with ADC monitorin=
g, RGB
> > +       LEDs, dual channel flashlight, WLED backlight driver, display b=
ias
> > +       voltage supply, one general purpose LDO, and the USB Type-C & P=
D
> > +       controller complies with the latest USB Type-C and PD standards=
.
> > +
> >  config MFD_MT6397
> >       tristate "MediaTek MT6397 PMIC Support"
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 858cacf..62b2712 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)        +=3D inte=
l_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)   +=3D intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)        +=3D intel_soc_pmic_chtdc=
_ti.o
> >  obj-$(CONFIG_MFD_MT6360)     +=3D mt6360-core.o
> > +obj-$(CONFIG_MFD_MT6370)     +=3D mt6370.o
> >  mt6397-objs                  :=3D mt6397-core.o mt6397-irq.o mt6358-ir=
q.o
> >  obj-$(CONFIG_MFD_MT6397)     +=3D mt6397.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)   +=3D intel_soc_pmic_mrfld.o
> > diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> > new file mode 100644
> > index 0000000..49f02b1
> > --- /dev/null
> > +++ b/drivers/mfd/mt6370.c
> > @@ -0,0 +1,358 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> No Copyright?

We have already added Copyright in the v4 patch.

>
> > +#include <linux/bits.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +enum {
> > +     MT6370_USBC_I2C =3D 0,
> > +     MT6370_PMU_I2C,
> > +     MT6370_MAX_I2C
> > +};
> > +
> > +#define MT6370_REG_DEV_INFO  0x100
> > +#define MT6370_REG_CHG_IRQ1  0x1C0
> > +#define MT6370_REG_CHG_MASK1 0x1E0
> > +
> > +#define MT6370_VENID_MASK    GENMASK(7, 4)
> > +
> > +#define MT6370_NUM_IRQREGS   16
> > +#define MT6370_USBC_I2CADDR  0x4E
> > +#define MT6370_REG_ADDRLEN   2
> > +#define MT6370_REG_MAXADDR   0x1FF
> > +
> > +#define MT6370_VENID_RT5081  0x8
> > +#define MT6370_VENID_RT5081A 0xA
> > +#define MT6370_VENID_MT6370  0xE
> > +#define MT6370_VENID_MT6371  0xF
> > +#define MT6370_VENID_MT6372P 0x9
> > +#define MT6370_VENID_MT6372CP        0xB
> > +
> > +/* IRQ definitions */
> > +#define MT6370_IRQ_DIRCHGON          0
> > +#define MT6370_IRQ_CHG_TREG          4
> > +#define MT6370_IRQ_CHG_AICR          5
> > +#define MT6370_IRQ_CHG_MIVR          6
> > +#define MT6370_IRQ_PWR_RDY           7
> > +#define MT6370_IRQ_FL_CHG_VINOVP     11
> > +#define MT6370_IRQ_CHG_VSYSUV                12
> > +#define MT6370_IRQ_CHG_VSYSOV                13
> > +#define MT6370_IRQ_CHG_VBATOV                14
> > +#define MT6370_IRQ_CHG_VINOVPCHG     15
> > +#define MT6370_IRQ_TS_BAT_COLD               20
> > +#define MT6370_IRQ_TS_BAT_COOL               21
> > +#define MT6370_IRQ_TS_BAT_WARM               22
> > +#define MT6370_IRQ_TS_BAT_HOT                23
> > +#define MT6370_IRQ_TS_STATC          24
> > +#define MT6370_IRQ_CHG_FAULT         25
> > +#define MT6370_IRQ_CHG_STATC         26
> > +#define MT6370_IRQ_CHG_TMR           27
> > +#define MT6370_IRQ_CHG_BATABS                28
> > +#define MT6370_IRQ_CHG_ADPBAD                29
> > +#define MT6370_IRQ_CHG_RVP           30
> > +#define MT6370_IRQ_TSHUTDOWN         31
> > +#define MT6370_IRQ_CHG_IINMEAS               32
> > +#define MT6370_IRQ_CHG_ICCMEAS               33
> > +#define MT6370_IRQ_CHGDET_DONE               34
> > +#define MT6370_IRQ_WDTMR             35
> > +#define MT6370_IRQ_SSFINISH          36
> > +#define MT6370_IRQ_CHG_RECHG         37
> > +#define MT6370_IRQ_CHG_TERM          38
> > +#define MT6370_IRQ_CHG_IEOC          39
> > +#define MT6370_IRQ_ADC_DONE          40
> > +#define MT6370_IRQ_PUMPX_DONE                41
> > +#define MT6370_IRQ_BST_BATUV         45
> > +#define MT6370_IRQ_BST_MIDOV         46
> > +#define MT6370_IRQ_BST_OLP           47
> > +#define MT6370_IRQ_ATTACH            48
> > +#define MT6370_IRQ_DETACH            49
> > +#define MT6370_IRQ_HVDCP_STPDONE     51
> > +#define MT6370_IRQ_HVDCP_VBUSDET_DONE        52
> > +#define MT6370_IRQ_HVDCP_DET         53
> > +#define MT6370_IRQ_CHGDET            54
> > +#define MT6370_IRQ_DCDT                      55
> > +#define MT6370_IRQ_DIRCHG_VGOK               59
> > +#define MT6370_IRQ_DIRCHG_WDTMR              60
> > +#define MT6370_IRQ_DIRCHG_UC         61
> > +#define MT6370_IRQ_DIRCHG_OC         62
> > +#define MT6370_IRQ_DIRCHG_OV         63
> > +#define MT6370_IRQ_OVPCTRL_SWON              67
> > +#define MT6370_IRQ_OVPCTRL_UVP_D     68
> > +#define MT6370_IRQ_OVPCTRL_UVP               69
> > +#define MT6370_IRQ_OVPCTRL_OVP_D     70
> > +#define MT6370_IRQ_OVPCTRL_OVP               71
> > +#define MT6370_IRQ_FLED_STRBPIN              72
> > +#define MT6370_IRQ_FLED_TORPIN               73
> > +#define MT6370_IRQ_FLED_TX           74
> > +#define MT6370_IRQ_FLED_LVF          75
> > +#define MT6370_IRQ_FLED2_SHORT               78
> > +#define MT6370_IRQ_FLED1_SHORT               79
> > +#define MT6370_IRQ_FLED2_STRB                80
> > +#define MT6370_IRQ_FLED1_STRB                81
> > +#define mT6370_IRQ_FLED2_STRB_TO     82
> > +#define MT6370_IRQ_FLED1_STRB_TO     83
> > +#define MT6370_IRQ_FLED2_TOR         84
> > +#define MT6370_IRQ_FLED1_TOR         85
> > +#define MT6370_IRQ_OTP                       93
> > +#define MT6370_IRQ_VDDA_OVP          94
> > +#define MT6370_IRQ_VDDA_UV           95
> > +#define MT6370_IRQ_LDO_OC            103
> > +#define MT6370_IRQ_BLED_OCP          118
> > +#define MT6370_IRQ_BLED_OVP          119
> > +#define MT6370_IRQ_DSV_VNEG_OCP              123
> > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > +#define MT6370_IRQ_DSV_BST_OCP               125
> > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > +#define MT6370_IRQ_DSV_VPOS_SCP              127
>
> Can you pop these into a header file please?

We have already popped them into "mt6370.h" in the v4 patch.

>
> > +struct mt6370_info {
> > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > +     struct device *dev;
>
> You don't need both 'i2c' and 'dev'.
>
> You can derive one from the other.
>
> > +     struct regmap *regmap;
> > +     struct regmap_irq_chip_data *irq_data;
> > +};
>
> This can do into the header file too.
>
> > +static const struct regmap_irq mt6370_irqs[] =3D {
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
> > +     REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)
> > +};
> > +
> > +static const struct regmap_irq_chip mt6370_irq_chip =3D {
> > +     .name           =3D "mt6370-irqs",
> > +     .status_base    =3D MT6370_REG_CHG_IRQ1,
> > +     .mask_base      =3D MT6370_REG_CHG_MASK1,
> > +     .num_regs       =3D MT6370_NUM_IRQREGS,
> > +     .irqs           =3D mt6370_irqs,
> > +     .num_irqs       =3D ARRAY_SIZE(mt6370_irqs),
> > +};
> > +
> > +static const struct resource mt6370_regulator_irqs[] =3D {
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")
> > +};
> > +
> > +static const struct mfd_cell mt6370_devices[] =3D {
> > +     MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> > +     MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger=
"),
> > +     MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backl=
ight"),
> > +     MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flas=
hlight"),
> > +     MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indic=
ator"),
> > +     MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
> > +     MFD_CELL_RES("regulator", mt6370_regulator_irqs)
>
> The first parameters here should be prepended with something, perhaps
> "mt6370_"?

OK, we will add the prefix in the next patch.

>
> > +};
> > +
> > +static int mt6370_check_vendor_info(struct mt6370_info *info)
> > +{
> > +     unsigned int devinfo;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> > +     case MT6370_VENID_RT5081:
> > +     case MT6370_VENID_RT5081A:
> > +     case MT6370_VENID_MT6370:
> > +     case MT6370_VENID_MT6371:
> > +     case MT6370_VENID_MT6372P:
> > +     case MT6370_VENID_MT6372CP:
> > +             break;
> > +     default:
> > +             dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinfo)=
;
> > +             return -ENODEV;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_regmap_read(void *context, const void *reg_buf,
> > +                           size_t reg_size, void *val_buf, size_t val_=
size)
> > +{
> > +     struct mt6370_info *info =3D context;
> > +     u8 bank_idx, bank_addr;
> > +     int ret;
> > +
> > +     bank_idx =3D *(u8 *)reg_buf;
> > +     bank_addr =3D *(u8 *)(reg_buf + 1);
> > +
> > +     ret =3D i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_a=
ddr,
> > +                                         val_size, val_buf);
> > +     if (ret < 0)
> > +             return ret;
> > +     else if (ret !=3D val_size)
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_regmap_write(void *context, const void *data, size_t=
 count)
> > +{
> > +     struct mt6370_info *info =3D context;
> > +     u8 bank_idx, bank_addr;
> > +     int len =3D count - MT6370_REG_ADDRLEN;
> > +
> > +     bank_idx =3D *(u8 *)data;
> > +     bank_addr =3D *(u8 *)(data + 1);
> > +
> > +     return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_a=
ddr,
> > +                                           len, data + MT6370_REG_ADDR=
LEN);
> > +}
> > +
> > +static const struct regmap_bus mt6370_regmap_bus =3D {
> > +     .read           =3D mt6370_regmap_read,
> > +     .write          =3D mt6370_regmap_write,
> > +};
> > +
> > +static const struct regmap_config mt6370_regmap_config =3D {
> > +     .reg_bits               =3D 16,
> > +     .val_bits               =3D 8,
> > +     .reg_format_endian      =3D REGMAP_ENDIAN_BIG,
> > +     .max_register           =3D MT6370_REG_MAXADDR,
> > +};
> > +
> > +static int mt6370_probe(struct i2c_client *i2c)
> > +{
> > +     struct mt6370_info *info;
> > +     struct i2c_client *usbc_i2c;
> > +     int ret;
> > +
> > +     info =3D devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     info->dev =3D &i2c->dev;
> > +
> > +     usbc_i2c =3D devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
> > +                                          MT6370_USBC_I2CADDR);
> > +     if (IS_ERR(usbc_i2c))
> > +             return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
> > +                                  "Failed to register USBC I2C client\=
n");
> > +
> > +     /* Assign I2C client for PMU and TypeC */
> > +     info->i2c[MT6370_PMU_I2C] =3D i2c;
> > +     info->i2c[MT6370_USBC_I2C] =3D usbc_i2c;
> > +
> > +     info->regmap =3D devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, =
info,
> > +                                     &mt6370_regmap_config);
>
> Apart from in mt6370_check_vendor_info() where is this actually used?

Well... from my understanding, we use this MFD driver to make other
drivers of MT6370 (e.g. charger, ADC, led...) use the same regmap
settings.
Thus, this regmap is not only used in mt6370_check_vendor_info().

>
> > +     if (IS_ERR(info->regmap))
> > +             return dev_err_probe(&i2c->dev, PTR_ERR(info->regmap),
> > +                                  "Failed to register regmap\n");
> > +
> > +     ret =3D mt6370_check_vendor_info(info);
> > +     if (ret)
> > +             return dev_err_probe(&i2c->dev, ret,
> > +                                  "Failed to check vendor info\n");
> > +
> > +     ret =3D devm_regmap_add_irq_chip(&i2c->dev, info->regmap, i2c->ir=
q,
> > +                                    IRQF_ONESHOT, -1, &mt6370_irq_chip=
,
> > +                                    &info->irq_data);
> > +     if (ret)
> > +             return dev_err_probe(&i2c->dev, ret,
> > +                                  "Failed to add irq chip\n");
> > +
> > +     return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> > +                                 mt6370_devices, ARRAY_SIZE(mt6370_dev=
ices),
> > +                                 NULL, 0,
> > +                                 regmap_irq_get_domain(info->irq_data)=
);
> > +}
> > +
> > +static const struct of_device_id mt6370_match_table[] =3D {
> > +     { .compatible =3D "mediatek,mt6370", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6370_match_table);
> > +
> > +static struct i2c_driver mt6370_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mt6370",
> > +             .of_match_table =3D mt6370_match_table,
> > +     },
> > +     .probe_new =3D mt6370_probe,
> > +};
> > +module_i2c_driver(mt6370_driver);
> > +
> > +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> > +MODULE_DESCRIPTION("MT6370 I2C Driver");
>
> This is not an I2C driver.
>
> > +MODULE_LICENSE("GPL v2");
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Best regards,
ChiaEn Wu
