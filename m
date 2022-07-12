Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE4571F23
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B328CFC1;
	Tue, 12 Jul 2022 15:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9F8BECA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:29:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v14so11683562wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Q+JH/qWaiP2eJjuYW7C2uW3S0RkJ71Ub5nbWi6ekYbU=;
 b=OczFGqywfdpy/mS2TpodOJOjuQVYsPEbYTpYSvI59PBCT2BHt/vguhiU3Z+P/25Xy1
 NX12SAQIPHWI4v65pWrdKecJzJ1ZGNsVrm4p4CkSKIuywvfuizpOzZ9Wqb5Jt0s0UHBp
 T5PS8SW072ViH7TP9Q1PP6fDrZJHGcvg2WmV6fg5I4zrNV3XGkuRlHjgoLdrxTGYU28w
 Z87I9ucdUZ9RkKjmGgpr804KkfSTtYBOnSa8OCgcdq8A7jMi3r48eOJ1/nJefL8+oJ9R
 cLWhrGedBVWmNXkrHud8KRNz7PKK4gOV5vdbwVuBC3Im5EaXVYsYxBfTlWzC718rBE5u
 DBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q+JH/qWaiP2eJjuYW7C2uW3S0RkJ71Ub5nbWi6ekYbU=;
 b=6tyDPbooBBtWV+bVesXkhs3AxXY9Gp/p9Q+jGSK3swX++3mp/EpcMSoRwI54KuSDy6
 WlQY4ORfugNQvamnWtZDGzoUOyLmfxQNDhOTZNyFgi44qdTvaTSYeikwgJrSiAlBtF02
 cJLkEh4xMd4NDjSh4CPfbIbGpoqBg/AD+gEvuHWzsYtGqPUTkdwf1bZwMZzcx+/cARaT
 BuRKSMVSYeL1dcujLcUszRXX0jJxcEjS309IC+cUI3/PSxtI2npE8hDTF0YKddXyEnWS
 3Uz9txJ9HWDeoYodbR8NXbOs+078RXFqNkAQMVzH+ISO4+kpve01P4dtRM1h4+AMDN+6
 daCw==
X-Gm-Message-State: AJIora/SiPvfEsp9YLMQrrVdnmr08GO6nG9Rj01JCHvc7N4ca6dLfTHO
 qfjup10XxIBsUGoIlKcSg8JbGQ==
X-Google-Smtp-Source: AGRyM1uSLPcm2Pav8BPF3Jx+Guud3701li2mH9y8hYpZuHdD2WZOCC/W4swCDeXJTVRAPp66ckDPSg==
X-Received: by 2002:a5d:414a:0:b0:21d:6be5:1765 with SMTP id
 c10-20020a5d414a000000b0021d6be51765mr22980167wrq.419.1657639761463; 
 Tue, 12 Jul 2022 08:29:21 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b003a2e89d1fb5sm5149242wmb.42.2022.07.12.08.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 08:29:20 -0700 (PDT)
Date: Tue, 12 Jul 2022 16:29:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
Message-ID: <Ys2TTsv1oU8n1fUE@google.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220623115631.22209-8-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 MFD support.

No such thing as "MFD support".

And you're not getting away with submitting a 370 line patch with a 5
word change log either. :)

Please at least tell us what the device is and what it's used for.

> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Refine Kconfig help text
> - Refine error message of unknown vendor ID in
>   mt6370_check_vendor_info()
> - Refine return value handling of mt6370_regmap_read()
> - Refine all probe error by using dev_err_probe()
> - Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
>   mt6370_regmap_write()
> - Add "#define VENID*" and drop the comments in
>   mt6370_check_vendor_info()
> - Drop "MFD" in MODULE_DESCRIPTION()
> ---
>  drivers/mfd/Kconfig  |  13 ++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 372 insertions(+)
>  create mode 100644 drivers/mfd/mt6370.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3b59456..4c900c4 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -937,6 +937,19 @@ config MFD_MT6360
>  	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
>  	  LDO part includes 4-channel LDOs
>  
> +config MFD_MT6370
> +	tristate "Mediatek MT6370 SubPMIC"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	depends on I2C
> +	help
> +	  Say Y here to enable MT6370 SubPMIC functional support.
> +	  It consists of a single cell battery charger with ADC monitoring, RGB
> +	  LEDs, dual channel flashlight, WLED backlight driver, display bias
> +	  voltage supply, one general purpose LDO, and the USB Type-C & PD
> +	  controller complies with the latest USB Type-C and PD standards.
> +
>  config MFD_MT6397
>  	tristate "MediaTek MT6397 PMIC Support"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 858cacf..62b2712 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
>  obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
> +obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
>  mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)	+= intel_soc_pmic_mrfld.o
> diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> new file mode 100644
> index 0000000..49f02b1
> --- /dev/null
> +++ b/drivers/mfd/mt6370.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0

No Copyright?

> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +enum {
> +	MT6370_USBC_I2C = 0,
> +	MT6370_PMU_I2C,
> +	MT6370_MAX_I2C
> +};
> +
> +#define MT6370_REG_DEV_INFO	0x100
> +#define MT6370_REG_CHG_IRQ1	0x1C0
> +#define MT6370_REG_CHG_MASK1	0x1E0
> +
> +#define MT6370_VENID_MASK	GENMASK(7, 4)
> +
> +#define MT6370_NUM_IRQREGS	16
> +#define MT6370_USBC_I2CADDR	0x4E
> +#define MT6370_REG_ADDRLEN	2
> +#define MT6370_REG_MAXADDR	0x1FF
> +
> +#define MT6370_VENID_RT5081	0x8
> +#define MT6370_VENID_RT5081A	0xA
> +#define MT6370_VENID_MT6370	0xE
> +#define MT6370_VENID_MT6371	0xF
> +#define MT6370_VENID_MT6372P	0x9
> +#define MT6370_VENID_MT6372CP	0xB
> +
> +/* IRQ definitions */
> +#define MT6370_IRQ_DIRCHGON		0
> +#define MT6370_IRQ_CHG_TREG		4
> +#define MT6370_IRQ_CHG_AICR		5
> +#define MT6370_IRQ_CHG_MIVR		6
> +#define MT6370_IRQ_PWR_RDY		7
> +#define MT6370_IRQ_FL_CHG_VINOVP	11
> +#define MT6370_IRQ_CHG_VSYSUV		12
> +#define MT6370_IRQ_CHG_VSYSOV		13
> +#define MT6370_IRQ_CHG_VBATOV		14
> +#define MT6370_IRQ_CHG_VINOVPCHG	15
> +#define MT6370_IRQ_TS_BAT_COLD		20
> +#define MT6370_IRQ_TS_BAT_COOL		21
> +#define MT6370_IRQ_TS_BAT_WARM		22
> +#define MT6370_IRQ_TS_BAT_HOT		23
> +#define MT6370_IRQ_TS_STATC		24
> +#define MT6370_IRQ_CHG_FAULT		25
> +#define MT6370_IRQ_CHG_STATC		26
> +#define MT6370_IRQ_CHG_TMR		27
> +#define MT6370_IRQ_CHG_BATABS		28
> +#define MT6370_IRQ_CHG_ADPBAD		29
> +#define MT6370_IRQ_CHG_RVP		30
> +#define MT6370_IRQ_TSHUTDOWN		31
> +#define MT6370_IRQ_CHG_IINMEAS		32
> +#define MT6370_IRQ_CHG_ICCMEAS		33
> +#define MT6370_IRQ_CHGDET_DONE		34
> +#define MT6370_IRQ_WDTMR		35
> +#define MT6370_IRQ_SSFINISH		36
> +#define MT6370_IRQ_CHG_RECHG		37
> +#define MT6370_IRQ_CHG_TERM		38
> +#define MT6370_IRQ_CHG_IEOC		39
> +#define MT6370_IRQ_ADC_DONE		40
> +#define MT6370_IRQ_PUMPX_DONE		41
> +#define MT6370_IRQ_BST_BATUV		45
> +#define MT6370_IRQ_BST_MIDOV		46
> +#define MT6370_IRQ_BST_OLP		47
> +#define MT6370_IRQ_ATTACH		48
> +#define MT6370_IRQ_DETACH		49
> +#define MT6370_IRQ_HVDCP_STPDONE	51
> +#define MT6370_IRQ_HVDCP_VBUSDET_DONE	52
> +#define MT6370_IRQ_HVDCP_DET		53
> +#define MT6370_IRQ_CHGDET		54
> +#define MT6370_IRQ_DCDT			55
> +#define MT6370_IRQ_DIRCHG_VGOK		59
> +#define MT6370_IRQ_DIRCHG_WDTMR		60
> +#define MT6370_IRQ_DIRCHG_UC		61
> +#define MT6370_IRQ_DIRCHG_OC		62
> +#define MT6370_IRQ_DIRCHG_OV		63
> +#define MT6370_IRQ_OVPCTRL_SWON		67
> +#define MT6370_IRQ_OVPCTRL_UVP_D	68
> +#define MT6370_IRQ_OVPCTRL_UVP		69
> +#define MT6370_IRQ_OVPCTRL_OVP_D	70
> +#define MT6370_IRQ_OVPCTRL_OVP		71
> +#define MT6370_IRQ_FLED_STRBPIN		72
> +#define MT6370_IRQ_FLED_TORPIN		73
> +#define MT6370_IRQ_FLED_TX		74
> +#define MT6370_IRQ_FLED_LVF		75
> +#define MT6370_IRQ_FLED2_SHORT		78
> +#define MT6370_IRQ_FLED1_SHORT		79
> +#define MT6370_IRQ_FLED2_STRB		80
> +#define MT6370_IRQ_FLED1_STRB		81
> +#define mT6370_IRQ_FLED2_STRB_TO	82
> +#define MT6370_IRQ_FLED1_STRB_TO	83
> +#define MT6370_IRQ_FLED2_TOR		84
> +#define MT6370_IRQ_FLED1_TOR		85
> +#define MT6370_IRQ_OTP			93
> +#define MT6370_IRQ_VDDA_OVP		94
> +#define MT6370_IRQ_VDDA_UV		95
> +#define MT6370_IRQ_LDO_OC		103
> +#define MT6370_IRQ_BLED_OCP		118
> +#define MT6370_IRQ_BLED_OVP		119
> +#define MT6370_IRQ_DSV_VNEG_OCP		123
> +#define MT6370_IRQ_DSV_VPOS_OCP		124
> +#define MT6370_IRQ_DSV_BST_OCP		125
> +#define MT6370_IRQ_DSV_VNEG_SCP		126
> +#define MT6370_IRQ_DSV_VPOS_SCP		127

Can you pop these into a header file please?

> +struct mt6370_info {
> +	struct i2c_client *i2c[MT6370_MAX_I2C];
> +	struct device *dev;

You don't need both 'i2c' and 'dev'.

You can derive one from the other.

> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *irq_data;
> +};

This can do into the header file too.

> +static const struct regmap_irq mt6370_irqs[] = {
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
> +	REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
> +	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)
> +};
> +
> +static const struct regmap_irq_chip mt6370_irq_chip = {
> +	.name		= "mt6370-irqs",
> +	.status_base	= MT6370_REG_CHG_IRQ1,
> +	.mask_base	= MT6370_REG_CHG_MASK1,
> +	.num_regs	= MT6370_NUM_IRQREGS,
> +	.irqs		= mt6370_irqs,
> +	.num_irqs	= ARRAY_SIZE(mt6370_irqs),
> +};
> +
> +static const struct resource mt6370_regulator_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
> +	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")
> +};
> +
> +static const struct mfd_cell mt6370_devices[] = {
> +	MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> +	MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
> +	MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
> +	MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
> +	MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
> +	MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
> +	MFD_CELL_RES("regulator", mt6370_regulator_irqs)

The first parameters here should be prepended with something, perhaps
"mt6370_"?

> +};
> +
> +static int mt6370_check_vendor_info(struct mt6370_info *info)
> +{
> +	unsigned int devinfo;
> +	int ret;
> +
> +	ret = regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
> +	if (ret)
> +		return ret;
> +
> +	switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> +	case MT6370_VENID_RT5081:
> +	case MT6370_VENID_RT5081A:
> +	case MT6370_VENID_MT6370:
> +	case MT6370_VENID_MT6371:
> +	case MT6370_VENID_MT6372P:
> +	case MT6370_VENID_MT6372CP:
> +		break;
> +	default:
> +		dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinfo);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6370_regmap_read(void *context, const void *reg_buf,
> +			      size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct mt6370_info *info = context;
> +	u8 bank_idx, bank_addr;
> +	int ret;
> +
> +	bank_idx = *(u8 *)reg_buf;
> +	bank_addr = *(u8 *)(reg_buf + 1);
> +
> +	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
> +					    val_size, val_buf);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret != val_size)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int mt6370_regmap_write(void *context, const void *data, size_t count)
> +{
> +	struct mt6370_info *info = context;
> +	u8 bank_idx, bank_addr;
> +	int len = count - MT6370_REG_ADDRLEN;
> +
> +	bank_idx = *(u8 *)data;
> +	bank_addr = *(u8 *)(data + 1);
> +
> +	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
> +					      len, data + MT6370_REG_ADDRLEN);
> +}
> +
> +static const struct regmap_bus mt6370_regmap_bus = {
> +	.read		= mt6370_regmap_read,
> +	.write		= mt6370_regmap_write,
> +};
> +
> +static const struct regmap_config mt6370_regmap_config = {
> +	.reg_bits		= 16,
> +	.val_bits		= 8,
> +	.reg_format_endian	= REGMAP_ENDIAN_BIG,
> +	.max_register		= MT6370_REG_MAXADDR,
> +};
> +
> +static int mt6370_probe(struct i2c_client *i2c)
> +{
> +	struct mt6370_info *info;
> +	struct i2c_client *usbc_i2c;
> +	int ret;
> +
> +	info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->dev = &i2c->dev;
> +
> +	usbc_i2c = devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
> +					     MT6370_USBC_I2CADDR);
> +	if (IS_ERR(usbc_i2c))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
> +				     "Failed to register USBC I2C client\n");
> +
> +	/* Assign I2C client for PMU and TypeC */
> +	info->i2c[MT6370_PMU_I2C] = i2c;
> +	info->i2c[MT6370_USBC_I2C] = usbc_i2c;
> +
> +	info->regmap = devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, info,
> +					&mt6370_regmap_config);

Apart from in mt6370_check_vendor_info() where is this actually used?

> +	if (IS_ERR(info->regmap))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(info->regmap),
> +				     "Failed to register regmap\n");
> +
> +	ret = mt6370_check_vendor_info(info);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to check vendor info\n");
> +
> +	ret = devm_regmap_add_irq_chip(&i2c->dev, info->regmap, i2c->irq,
> +				       IRQF_ONESHOT, -1, &mt6370_irq_chip,
> +				       &info->irq_data);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to add irq chip\n");
> +
> +	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
> +				    NULL, 0,
> +				    regmap_irq_get_domain(info->irq_data));
> +}
> +
> +static const struct of_device_id mt6370_match_table[] = {
> +	{ .compatible = "mediatek,mt6370", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6370_match_table);
> +
> +static struct i2c_driver mt6370_driver = {
> +	.driver = {
> +		.name = "mt6370",
> +		.of_match_table = mt6370_match_table,
> +	},
> +	.probe_new = mt6370_probe,
> +};
> +module_i2c_driver(mt6370_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("MT6370 I2C Driver");

This is not an I2C driver.

> +MODULE_LICENSE("GPL v2");

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
