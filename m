Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F555BA5D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D9710E72F;
	Mon, 27 Jun 2022 14:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17310E72F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:14:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v14so13273174wra.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fzRgLe9m2O60QsakGbQjRYT6Y0at8N6xntNn4PtH2sA=;
 b=rS2K1O+/NsrN3tYcW0JAMAWEvt6Kd9yF8NX/xZe+b81YZyaLNrglwaAvGbYbT/9sIR
 SmNoJOkd94Fsnzi+kwjhFayt8Hbal0A0ozXoZKouWFZhWyCwaJlURlS8wSy1kK6xsrEz
 rJBbm9NpQXs4dN7egShMBlumK1iGVDF9bRyYDeMgMXGIdFzBE1QDk7JVGs13Jokg04Ru
 nP39kgNr1J0Z3FebRgSe8xtRklnQ0oGntNE8aIV6l/SWct83wMAPmymJZeOYnSDezmsA
 v3vmFKxtidbJG7q2P091YmqycVloNUH64OxYgwGEBYjUHuI4mosXBrXksb2Wa2YSBnGE
 Zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fzRgLe9m2O60QsakGbQjRYT6Y0at8N6xntNn4PtH2sA=;
 b=W78gbulYizQ86rqePY6pnlzY8ljO12HV4m5L9cae8hvq5luIuJWqELdiBSw80Ml3vE
 u5QTuYQ5rppnCnTbQ+aOPa6VksI5j8F79cJ3s+e+S89DJyS/8L4vZmBlkfPErzatiwIL
 8UbaftkEOQf+oyTR/tqUkWCHQN59f1dQqkscTdmcIK91hROQwhJR1piWKXFjyX/DOvOz
 5wARUjmb2vfRfUmiV3ix/OuP4LzMWuyw2/A+hKd+cV46/JVgNkk4cil8nnm7g97baMRD
 t6zFT23uW4baZrzQ3Sq5ZPXabZOYJeeFbR7WWc4oeqd1YFevHzbspsem3SybngVtIMsc
 mQnQ==
X-Gm-Message-State: AJIora9KAADheZwvs4Wur5wzPHmPQCoORfZdqNJU7cJGCi89wcurMwCK
 2PQJi4mGDVCPPeOYEX4WDOpJiA==
X-Google-Smtp-Source: AGRyM1tysibMVY1W8fJ2UJWIdLpfevMVr6nGvPZqcPjcZSbaSdql0n8PPX5Emq6JfIdmv+SyRqY26Q==
X-Received: by 2002:a5d:584e:0:b0:21c:e4db:35e with SMTP id
 i14-20020a5d584e000000b0021ce4db035emr4279421wrf.192.1656339256659; 
 Mon, 27 Jun 2022 07:14:16 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0021b92171d28sm13048073wro.54.2022.06.27.07.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:14:15 -0700 (PDT)
Date: Mon, 27 Jun 2022 15:14:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
Message-ID: <Yrm7NTID16g8gM5t@google.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-9-peterwu.pub@gmail.com>
 <Yqph8jwHU8rPooJA@google.com>
 <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Jun 2022, ChiaEn Wu wrote:

> Hi Lee,
> 
> Thanks for your helpful comments, we have some questions and replies below.
> 
> Lee Jones <lee.jones@linaro.org> 於 2022年6月16日 週四 清晨6:49寫道：
> 
> >
> > On Mon, 13 Jun 2022, ChiaEn Wu wrote:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 MFD support.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  drivers/mfd/Kconfig  |  13 ++
> > >  drivers/mfd/Makefile |   1 +
> > >  drivers/mfd/mt6370.c | 349 +++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 363 insertions(+)
> > >  create mode 100644 drivers/mfd/mt6370.c
> > >
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 3b59456f5545..d9a7524a3e0e 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -937,6 +937,19 @@ config MFD_MT6360
> > >         PMIC part includes 2-channel BUCKs and 2-channel LDOs
> > >         LDO part includes 4-channel LDOs
> > >
> > > +config MFD_MT6370
> > > +     tristate "Mediatek MT6370 SubPMIC"
> > > +     select MFD_CORE
> > > +     select REGMAP_I2C
> > > +     select REGMAP_IRQ
> > > +     depends on I2C
> > > +     help
> > > +       Say Y here to enable MT6370 SubPMIC functional support.
> > > +       It integrate single cell battery charger with adc monitoring, RGB
> >
> > s/integrates/consists of a/
> >
> > "ADC"
> 
> We will fine it in the next patch.
> 
> >
> > > +       LEDs, dual channel flashlight, WLED backlight driver, display bias
> >
> > > +       voltage supply, one general purpose LDO, and cc logic
> > > +       controller with USBPD commmunication capable.
> >
> > The last part makes no sense - "and is USBPD"?
> 
> If we modify this help text to
> "one general purpose LDO, and the USB Type-C & PD controller complies
> with the latest USB Type-C and PD standards",
> did these modifications meet your expectations?

"one general purpose LDO and a USB Type-C & PD controller that
complies with the latest USB Type-C and PD standards"

Better?

> > >  config MFD_MT6397
> > >       tristate "MediaTek MT6397 PMIC Support"
> > >       select MFD_CORE
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 858cacf659d6..62b27125420e 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)        += intel_soc_pmic_bxtwc.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)   += intel_soc_pmic_chtwc.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)        += intel_soc_pmic_chtdc_ti.o
> > >  obj-$(CONFIG_MFD_MT6360)     += mt6360-core.o
> > > +obj-$(CONFIG_MFD_MT6370)     += mt6370.o
> > >  mt6397-objs                  := mt6397-core.o mt6397-irq.o mt6358-irq.o
> > >  obj-$(CONFIG_MFD_MT6397)     += mt6397.o
> > >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)   += intel_soc_pmic_mrfld.o
> > > diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> > > new file mode 100644
> > > index 000000000000..6af9f73c9c0c
> > > --- /dev/null
> > > +++ b/drivers/mfd/mt6370.c
> > > @@ -0,0 +1,349 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +enum {
> > > +     MT6370_USBC_I2C = 0,
> > > +     MT6370_PMU_I2C,
> > > +     MT6370_MAX_I2C
> > > +};
> > > +
> > > +#define MT6370_REG_DEV_INFO  0x100
> > > +#define MT6370_REG_CHG_IRQ1  0x1C0
> > > +#define MT6370_REG_CHG_MASK1 0x1E0
> > > +
> > > +#define MT6370_VENID_MASK    GENMASK(7, 4)
> > > +
> > > +#define MT6370_NUM_IRQREGS   16
> > > +#define MT6370_USBC_I2CADDR  0x4E
> > > +#define MT6370_REG_ADDRLEN   2
> > > +#define MT6370_REG_MAXADDR   0x1FF
> > > +
> > > +/* IRQ definitions */
> > > +#define MT6370_IRQ_DIRCHGON          0
> > > +#define MT6370_IRQ_CHG_TREG          4
> > > +#define MT6370_IRQ_CHG_AICR          5
> > > +#define MT6370_IRQ_CHG_MIVR          6
> > > +#define MT6370_IRQ_PWR_RDY           7
> > > +#define MT6370_IRQ_FL_CHG_VINOVP     11
> > > +#define MT6370_IRQ_CHG_VSYSUV                12
> > > +#define MT6370_IRQ_CHG_VSYSOV                13
> > > +#define MT6370_IRQ_CHG_VBATOV                14
> > > +#define MT6370_IRQ_CHG_VINOVPCHG     15
> > > +#define MT6370_IRQ_TS_BAT_COLD               20
> > > +#define MT6370_IRQ_TS_BAT_COOL               21
> > > +#define MT6370_IRQ_TS_BAT_WARM               22
> > > +#define MT6370_IRQ_TS_BAT_HOT                23
> > > +#define MT6370_IRQ_TS_STATC          24
> > > +#define MT6370_IRQ_CHG_FAULT         25
> > > +#define MT6370_IRQ_CHG_STATC         26
> > > +#define MT6370_IRQ_CHG_TMR           27
> > > +#define MT6370_IRQ_CHG_BATABS                28
> > > +#define MT6370_IRQ_CHG_ADPBAD                29
> > > +#define MT6370_IRQ_CHG_RVP           30
> > > +#define MT6370_IRQ_TSHUTDOWN         31
> > > +#define MT6370_IRQ_CHG_IINMEAS               32
> > > +#define MT6370_IRQ_CHG_ICCMEAS               33
> > > +#define MT6370_IRQ_CHGDET_DONE               34
> > > +#define MT6370_IRQ_WDTMR             35
> > > +#define MT6370_IRQ_SSFINISH          36
> > > +#define MT6370_IRQ_CHG_RECHG         37
> > > +#define MT6370_IRQ_CHG_TERM          38
> > > +#define MT6370_IRQ_CHG_IEOC          39
> > > +#define MT6370_IRQ_ADC_DONE          40
> > > +#define MT6370_IRQ_PUMPX_DONE                41
> > > +#define MT6370_IRQ_BST_BATUV         45
> > > +#define MT6370_IRQ_BST_MIDOV         46
> > > +#define MT6370_IRQ_BST_OLP           47
> > > +#define MT6370_IRQ_ATTACH            48
> > > +#define MT6370_IRQ_DETACH            49
> > > +#define MT6370_IRQ_HVDCP_STPDONE     51
> > > +#define MT6370_IRQ_HVDCP_VBUSDET_DONE        52
> > > +#define MT6370_IRQ_HVDCP_DET         53
> > > +#define MT6370_IRQ_CHGDET            54
> > > +#define MT6370_IRQ_DCDT                      55
> > > +#define MT6370_IRQ_DIRCHG_VGOK               59
> > > +#define MT6370_IRQ_DIRCHG_WDTMR              60
> > > +#define MT6370_IRQ_DIRCHG_UC         61
> > > +#define MT6370_IRQ_DIRCHG_OC         62
> > > +#define MT6370_IRQ_DIRCHG_OV         63
> > > +#define MT6370_IRQ_OVPCTRL_SWON              67
> > > +#define MT6370_IRQ_OVPCTRL_UVP_D     68
> > > +#define MT6370_IRQ_OVPCTRL_UVP               69
> > > +#define MT6370_IRQ_OVPCTRL_OVP_D     70
> > > +#define MT6370_IRQ_OVPCTRL_OVP               71
> > > +#define MT6370_IRQ_FLED_STRBPIN              72
> > > +#define MT6370_IRQ_FLED_TORPIN               73
> > > +#define MT6370_IRQ_FLED_TX           74
> > > +#define MT6370_IRQ_FLED_LVF          75
> > > +#define MT6370_IRQ_FLED2_SHORT               78
> > > +#define MT6370_IRQ_FLED1_SHORT               79
> > > +#define MT6370_IRQ_FLED2_STRB                80
> > > +#define MT6370_IRQ_FLED1_STRB                81
> > > +#define mT6370_IRQ_FLED2_STRB_TO     82
> > > +#define MT6370_IRQ_FLED1_STRB_TO     83
> > > +#define MT6370_IRQ_FLED2_TOR         84
> > > +#define MT6370_IRQ_FLED1_TOR         85
> > > +#define MT6370_IRQ_OTP                       93
> > > +#define MT6370_IRQ_VDDA_OVP          94
> > > +#define MT6370_IRQ_VDDA_UV           95
> > > +#define MT6370_IRQ_LDO_OC            103
> > > +#define MT6370_IRQ_BLED_OCP          118
> > > +#define MT6370_IRQ_BLED_OVP          119
> > > +#define MT6370_IRQ_DSV_VNEG_OCP              123
> > > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > > +#define MT6370_IRQ_DSV_BST_OCP               125
> > > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > > +#define MT6370_IRQ_DSV_VPOS_SCP              127
> > > +
> > > +struct mt6370_info {
> > > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > > +     struct device *dev;
> > > +     struct regmap *regmap;
> > > +     struct regmap_irq_chip_data *irq_data;
> > > +};
> >
> > Can we shove all of the above into a header file?
> 
> Well... In Patch v1, we put these "#define IRQ" into
> "include/dt-bindings/mfd/mediatek,mt6370.h".
> But the reviewer of DT files hoped us to remove this header file, we
> put these "#define IRQ" in this .c file.
> Shall we leave them here or put them into the header file in
> "driver/power/supply/mt6370-charger.h"?

Where are they used?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
