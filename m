Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E8719714
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4510E533;
	Thu,  1 Jun 2023 09:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF1310E246
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 09:37:04 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af177f12d1so8651551fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612222; x=1688204222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N72csYWRXaLK1Mlqt6d+OoK5HIL7O34x+wZGLEfCCiQ=;
 b=NQIgApTD70jlwZApjTV0910Q8BR67gNtVRbBXE04M+U9Bq6Rq7HFo8CAlSKVYhzjY2
 ETASu/AdcWwY+AmF2OI+ipCIf4nbE+3drbJdONFK7M09GN3l7HPokeT+TARgs3xzpRi5
 OUJAxwuvNXcbll/25Pz3Y5iH2OnBBHdInqQpI8IXzlgy9/r0PL+tILruxn4UsaVbwwln
 uMkCAzXe74QE8GTXfp6s8g5NwLQ7dxusBmIuiJJEhDMlSC8PWwxyzRBBubRr/fmgzD2T
 Njuj+aJNYbl4RI5TSCd91o9b8+91XKxv9dKlNus/05yqzGbsGEefW0RM695bVQCuX8ad
 tirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612222; x=1688204222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N72csYWRXaLK1Mlqt6d+OoK5HIL7O34x+wZGLEfCCiQ=;
 b=St4AxQPKmFaJy5YtmESPajIwQrhtQCxrB4lYwFYv4C2ly0937vBrl3/FDqJlXtU1JT
 cvInBjE+xP3IpDxjHvs3lkgpPGRA+KfPgWufWC2SL1UN4RSWolkiS7gSC8bopox5uGkV
 e7GwIuxcsrB4PFa+rBkBOyU0aNLRsHkNreshkvSVJOBCz2Iau88D3HM8818Gnpenv7gZ
 n3BPirme0oenwLEy9J3txkNfNNoc1nTy3Ve4MUQOflDoIBlw2d/jLMYAwrieMq5jP2bG
 CziiQY21cTHlyfwPyscnYTWOAWmC6ZCzy8IMhYE2JsLntJ51Sx/+swXyePKVb6JwvQzw
 efgw==
X-Gm-Message-State: AC+VfDx/BDYdaf17P6NawI8cM6QsxJ8rI+x1EyQLcDjN8IwNLc0JAftM
 z7HJzKABPs1hcZGZ22+WtX+MIw==
X-Google-Smtp-Source: ACHHUZ7uwivoGbRr8ppgdNa6Y49ZWaCw3DD4M4+h81jomEGISQdhfsyj4fEEr1+r9xMjXWHJonGuiw==
X-Received: by 2002:a2e:86d1:0:b0:2ad:8ffe:5f37 with SMTP id
 n17-20020a2e86d1000000b002ad8ffe5f37mr4626222ljj.47.1685612221843; 
 Thu, 01 Jun 2023 02:37:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a2e870a000000b002b1a666dddbsm46645lji.126.2023.06.01.02.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 02:37:01 -0700 (PDT)
Message-ID: <36c1b720-f743-4ebc-029e-d04659dfa38f@linaro.org>
Date: Thu, 1 Jun 2023 12:37:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] usb: typec: add support for the nb7vpq904m Type-C
 Linear Redriver
Content-Language: en-GB
To: neil.armstrong@linaro.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20230601-topic-sm8x50-upstream-redriver-v1-0-6ad21094ff6f@linaro.org>
 <20230601-topic-sm8x50-upstream-redriver-v1-2-6ad21094ff6f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601-topic-sm8x50-upstream-redriver-v1-2-6ad21094ff6f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2023 12:21, neil.armstrong@linaro.org wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for the ON Semiconductor NB7VPQ904M Type-C USB SuperSpeed
> and DisplayPort ALT Mode Linear Redriver chip found on some devices
> with a Type-C port.
> 
> The redriver compensates ultra High-Speeed DisplayPort and USB
> Super Speed signal integrity losses mainly due to PCB & transmission
> cables.
> 
> The redriver doesn't support SuperSpeed lines swapping, but
> can support Type-C SBU lines swapping.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/usb/typec/mux/Kconfig      |   8 +
>   drivers/usb/typec/mux/Makefile     |   1 +
>   drivers/usb/typec/mux/nb7vpq904m.c | 526 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 535 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index c46fa4f9d3df..8c4d6b8fb75c 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -35,4 +35,12 @@ config TYPEC_MUX_INTEL_PMC
>   	  control the USB role switch and also the multiplexer/demultiplexer
>   	  switches used with USB Type-C Alternate Modes.
>   
> +config TYPEC_MUX_NB7VPQ904M
> +	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
> +	  redriver chip found on some devices with a Type-C port.
> +
>   endmenu
> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index dda67e19b58b..76196096ef41 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_TYPEC_MUX_FSA4480)		+= fsa4480.o
>   obj-$(CONFIG_TYPEC_MUX_GPIO_SBU)	+= gpio-sbu-mux.o
>   obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
>   obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
> +obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> new file mode 100644
> index 000000000000..2f85ad9e417a
> --- /dev/null
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -0,0 +1,526 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * OnSemi NB7VPQ904M Type-C driver
> + *
> + * Copyright (C) 2023 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#include <linux/i2c.h>
> +#include <linux/mutex.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/of_graph.h>
> +#include <drm/drm_bridge.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define NB7_CHNA		0
> +#define NB7_CHNB		1
> +#define NB7_CHNC		2
> +#define NB7_CHND		3
> +#define NB7_IS_CHAN_AD(channel) (channel == NB7_CHNA || channel == NB7_CHND)
> +
> +#define GEN_DEV_SET_REG			0x00
> +
> +#define GEN_DEV_SET_CHIP_EN		BIT(0)
> +#define GEN_DEV_SET_CHNA_EN		BIT(4)
> +#define GEN_DEV_SET_CHNB_EN		BIT(5)
> +#define GEN_DEV_SET_CHNC_EN		BIT(6)
> +#define GEN_DEV_SET_CHND_EN		BIT(7)
> +
> +#define GEN_DEV_SET_OP_MODE_MASK	GENMASK(3, 1)
> +
> +#define GEN_DEV_SET_OP_MODE_DP_CC2	0
> +#define GEN_DEV_SET_OP_MODE_DP_CC1	1
> +#define GEN_DEV_SET_OP_MODE_DP_4LANE	2
> +#define GEN_DEV_SET_OP_MODE_USB		5
> +
> +#define EQ_SETTING_REG_BASE		0x01
> +#define EQ_SETTING_REG(n)		(EQ_SETTING_REG_BASE + (n) * 2)
> +#define EQ_SETTING_MASK			GENMASK(3, 1)
> +
> +#define OUTPUT_COMPRESSION_AND_POL_REG_BASE	0x02
> +#define OUTPUT_COMPRESSION_AND_POL_REG(n)	(OUTPUT_COMPRESSION_AND_POL_REG_BASE + (n) * 2)
> +#define OUTPUT_COMPRESSION_MASK		GENMASK(2, 1)
> +
> +#define FLAT_GAIN_REG_BASE		0x18
> +#define FLAT_GAIN_REG(n)		(FLAT_GAIN_REG_BASE + (n) * 2)
> +#define FLAT_GAIN_MASK			GENMASK(1, 0)
> +
> +#define LOSS_MATCH_REG_BASE		0x19
> +#define LOSS_MATCH_REG(n)		(LOSS_MATCH_REG_BASE + (n) * 2)
> +#define LOSS_MATCH_MASK			GENMASK(1, 0)
> +
> +#define AUX_CC_REG			0x09
> +
> +#define CHIP_VERSION_REG		0x17
> +
> +struct nb7vpq904m {
> +	struct i2c_client *client;
> +	struct gpio_desc *enable_gpio;
> +	struct regulator *vcc_supply;
> +	struct regmap *regmap;
> +	struct typec_switch_dev *sw;
> +	struct typec_mux_dev *mux;
> +
> +	bool swap_data_lanes;
> +	struct typec_switch *typec_switch;
> +
> +	struct drm_bridge bridge;
> +
> +	struct mutex lock; /* protect non-concurrent mux & switch */
> +
> +	enum typec_orientation orientation;
> +	unsigned long mode;
> +	unsigned int svid;
> +};
> +
> +static void nb7vpq904m_set_channel(struct nb7vpq904m *nb7, unsigned int channel, bool dp)
> +{
> +	u8 eq, out_comp, flat_gain, loss_match;
> +
> +	if (dp) {
> +		eq = NB7_IS_CHAN_AD(channel) ? 0x6 : 0x4;
> +		out_comp = 0x3;
> +		flat_gain = NB7_IS_CHAN_AD(channel) ? 0x2 : 0x1;
> +		loss_match = 0x3;
> +	} else {
> +		eq = 0x4;
> +		out_comp = 0x3;
> +		flat_gain = NB7_IS_CHAN_AD(channel) ? 0x3 : 0x1;
> +		loss_match = NB7_IS_CHAN_AD(channel) ? 0x1 : 0x3;
> +	}
> +
> +	regmap_update_bits(nb7->regmap, EQ_SETTING_REG(channel),
> +			   EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
> +	regmap_update_bits(nb7->regmap, OUTPUT_COMPRESSION_AND_POL_REG(channel),
> +			   OUTPUT_COMPRESSION_MASK, FIELD_PREP(OUTPUT_COMPRESSION_MASK, out_comp));
> +	regmap_update_bits(nb7->regmap, FLAT_GAIN_REG(channel),
> +			   FLAT_GAIN_MASK, FIELD_PREP(FLAT_GAIN_MASK, flat_gain));
> +	regmap_update_bits(nb7->regmap, LOSS_MATCH_REG(channel),
> +			   LOSS_MATCH_MASK, FIELD_PREP(LOSS_MATCH_MASK, loss_match));
> +}
> +
> +static int nb7vpq904m_set(struct nb7vpq904m *nb7)
> +{
> +	bool reverse = (nb7->orientation == TYPEC_ORIENTATION_REVERSE);
> +
> +	switch (nb7->mode) {
> +	case TYPEC_STATE_SAFE:
> +		regmap_write(nb7->regmap, GEN_DEV_SET_REG,
> +			     GEN_DEV_SET_CHIP_EN |
> +			     GEN_DEV_SET_CHNA_EN |
> +			     GEN_DEV_SET_CHNB_EN |
> +			     GEN_DEV_SET_CHNC_EN |
> +			     GEN_DEV_SET_CHND_EN |
> +			     FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
> +					GEN_DEV_SET_OP_MODE_USB));
> +		nb7vpq904m_set_channel(nb7, NB7_CHNA, false);
> +		nb7vpq904m_set_channel(nb7, NB7_CHNB, false);
> +		nb7vpq904m_set_channel(nb7, NB7_CHNC, false);
> +		nb7vpq904m_set_channel(nb7, NB7_CHND, false);
> +		regmap_write(nb7->regmap, AUX_CC_REG, 0x2);
> +
> +		return 0;
> +
> +	case TYPEC_STATE_USB:
> +		/*
> +		 * Normal Orientation (CC1)
> +		 * A -> USB RX
> +		 * B -> USB TX
> +		 * C -> X
> +		 * D -> X
> +		 * Flipped Orientation (CC2)
> +		 * A -> X
> +		 * B -> X
> +		 * C -> USB TX
> +		 * D -> USB RX
> +		 *
> +		 * Reversed if data lanes are swapped
> +		 */
> +		if (reverse ^ nb7->swap_data_lanes) {
> +			regmap_write(nb7->regmap, GEN_DEV_SET_REG,
> +				     GEN_DEV_SET_CHIP_EN |
> +				     GEN_DEV_SET_CHNA_EN |
> +				     GEN_DEV_SET_CHNB_EN |
> +				     FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
> +						GEN_DEV_SET_OP_MODE_USB));
> +			nb7vpq904m_set_channel(nb7, NB7_CHNA, false);
> +			nb7vpq904m_set_channel(nb7, NB7_CHNB, false);
> +		} else {
> +			regmap_write(nb7->regmap, GEN_DEV_SET_REG,
> +				     GEN_DEV_SET_CHIP_EN |
> +				     GEN_DEV_SET_CHNC_EN |
> +				     GEN_DEV_SET_CHND_EN |
> +				     FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
> +						GEN_DEV_SET_OP_MODE_USB));
> +			nb7vpq904m_set_channel(nb7, NB7_CHNC, false);
> +			nb7vpq904m_set_channel(nb7, NB7_CHND, false);
> +		}
> +		regmap_write(nb7->regmap, AUX_CC_REG, 0x2);
> +
> +		return 0;
> +
> +	default:
> +		if (nb7->svid != USB_TYPEC_DP_SID)
> +			return -EINVAL;
> +
> +		break;
> +	}
> +
> +	/* DP Altmode Setup */
> +
> +	regmap_write(nb7->regmap, AUX_CC_REG, reverse ? 0x1 : 0x0);
> +
> +	switch (nb7->mode) {
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		/*
> +		 * Normal Orientation (CC1)
> +		 * A -> DP3
> +		 * B -> DP2
> +		 * C -> DP1
> +		 * D -> DP0
> +		 * Flipped Orientation (CC2)
> +		 * A -> DP0
> +		 * B -> DP1
> +		 * C -> DP2
> +		 * D -> DP3
> +		 */
> +		regmap_write(nb7->regmap, GEN_DEV_SET_REG,
> +			     GEN_DEV_SET_CHIP_EN |
> +			     GEN_DEV_SET_CHNA_EN |
> +			     GEN_DEV_SET_CHNB_EN |
> +			     GEN_DEV_SET_CHNC_EN |
> +			     GEN_DEV_SET_CHND_EN |
> +			     FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
> +					GEN_DEV_SET_OP_MODE_DP_4LANE));
> +		nb7vpq904m_set_channel(nb7, NB7_CHNA, true);
> +		nb7vpq904m_set_channel(nb7, NB7_CHNB, true);
> +		nb7vpq904m_set_channel(nb7, NB7_CHNC, true);
> +		nb7vpq904m_set_channel(nb7, NB7_CHND, true);
> +		break;
> +
> +	case TYPEC_DP_STATE_D:
> +	case TYPEC_DP_STATE_F:
> +		regmap_write(nb7->regmap, GEN_DEV_SET_REG,
> +			     GEN_DEV_SET_CHIP_EN |
> +			     GEN_DEV_SET_CHNA_EN |
> +			     GEN_DEV_SET_CHNB_EN |
> +			     GEN_DEV_SET_CHNC_EN |
> +			     GEN_DEV_SET_CHND_EN |
> +			     FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
> +					reverse ^ nb7->swap_data_lanes ?
> +						GEN_DEV_SET_OP_MODE_DP_CC2
> +						: GEN_DEV_SET_OP_MODE_DP_CC1));
> +
> +		/*
> +		 * Normal Orientation (CC1)
> +		 * A -> USB RX
> +		 * B -> USB TX
> +		 * C -> DP1
> +		 * D -> DP0
> +		 * Flipped Orientation (CC2)
> +		 * A -> DP0
> +		 * B -> DP1
> +		 * C -> USB TX
> +		 * D -> USB RX
> +		 *
> +		 * Reversed if data lanes are swapped
> +		 */
> +		if (nb7->swap_data_lanes) {
> +			nb7vpq904m_set_channel(nb7, NB7_CHNA, !reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHNB, !reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHNC, reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHND, reverse);
> +		} else {
> +			nb7vpq904m_set_channel(nb7, NB7_CHNA, reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHNB, reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHNC, !reverse);
> +			nb7vpq904m_set_channel(nb7, NB7_CHND, !reverse);
> +		}
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nb7vpq904m_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orientation)
> +{
> +	struct nb7vpq904m *nb7 = typec_switch_get_drvdata(sw);
> +	int ret;
> +
> +	ret = typec_switch_set(nb7->typec_switch, orientation);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&nb7->lock);
> +
> +	if (nb7->orientation != orientation) {
> +		nb7->orientation = orientation;
> +
> +		ret = nb7vpq904m_set(nb7);
> +	}
> +
> +	mutex_unlock(&nb7->lock);
> +
> +	return ret;
> +}
> +
> +static int nb7vpq904m_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct nb7vpq904m *nb7 = typec_mux_get_drvdata(mux);
> +	int ret = 0;
> +
> +	mutex_lock(&nb7->lock);
> +
> +	if (nb7->mode != state->mode) {
> +		nb7->mode = state->mode;
> +
> +		if (state->alt)
> +			nb7->svid = state->alt->svid;
> +		else
> +			nb7->svid = 0; // No SVID
> +
> +		ret = nb7vpq904m_set(nb7);
> +	}
> +
> +	mutex_unlock(&nb7->lock);
> +
> +	return ret;
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM)
> +static int nb7vpq904m_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct nb7vpq904m *nb7 = container_of(bridge, struct nb7vpq904m, bridge);
> +	struct drm_bridge *next_bridge;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;
> +
> +	next_bridge = devm_drm_of_get_bridge(&nb7->client->dev, nb7->client->dev.of_node, 0, 0);
> +	if (IS_ERR(next_bridge)) {
> +		dev_err(&nb7->client->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
> +		return PTR_ERR(next_bridge);
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static const struct drm_bridge_funcs nb7vpq904m_bridge_funcs = {
> +	.attach	= nb7vpq904m_bridge_attach,
> +};
> +
> +static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> +{
> +	nb7->bridge.funcs = &nb7vpq904m_bridge_funcs;
> +	nb7->bridge.of_node = nb7->client->dev.of_node;
> +
> +	return devm_drm_bridge_add(&nb7->client->dev, &nb7->bridge);
> +}
> +#else
> +static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> +{
> +	return 0;
> +}
> +#endif

This is what I feared of when we started mixing USB-C and drm bridges. A 
part of me still thinks that the proper solution should involve OOB 
notifications.

If we can expect a sizeable amount of such drivers, can we have a 
generic drm helper for such passthrough bridges?

> +
> +static const struct regmap_config nb7_regmap = {
> +	.max_register = 0x1f,
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +enum {
> +	NORMAL_LANE_MAPPING,
> +	INVERT_LANE_MAPPING,
> +};
> +
> +#define DATA_LANES_COUNT	4
> +
> +static const int supported_data_lane_mapping[][DATA_LANES_COUNT] = {
> +	[NORMAL_LANE_MAPPING] = { 0, 1, 2, 3 },
> +	[INVERT_LANE_MAPPING] = { 2, 3, 0, 1 },
> +};
> +
> +static int nb7vpq904m_parse_data_lanes_mapping(struct nb7vpq904m *nb7)
> +{
> +	struct device_node *ep;
> +	u32 data_lanes[4];
> +	int ret, i, j;
> +
> +	ep = of_graph_get_endpoint_by_regs(nb7->client->dev.of_node, 1, 0);
> +
> +	if (ep) {
> +		ret = of_property_count_u32_elems(ep, "data-lanes");
> +		if (ret == -EINVAL)
> +			/* Property isn't here, consider default mapping */
> +			goto out_done;
> +		if (ret < 0)
> +			goto out_error;
> +
> +		if (ret != DATA_LANES_COUNT) {
> +			dev_err(&nb7->client->dev, "expected 4 data lanes\n");
> +			ret = -EINVAL;
> +			goto out_error;
> +		}
> +
> +		ret = of_property_read_u32_array(ep, "data-lanes", data_lanes, DATA_LANES_COUNT);
> +		if (ret)
> +			goto out_error;
> +
> +		for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> +			for (j = 0; j < DATA_LANES_COUNT; j++) {
> +				if (data_lanes[j] != supported_data_lane_mapping[i][j])
> +					break;
> +			}
> +
> +			if (j == DATA_LANES_COUNT)
> +				break;
> +		}
> +
> +		switch (i) {
> +		case NORMAL_LANE_MAPPING:
> +			break;
> +		case INVERT_LANE_MAPPING:
> +			nb7->swap_data_lanes = true;
> +			dev_info(&nb7->client->dev, "using inverted data lanes mapping\n");
> +			break;
> +		default:
> +			dev_err(&nb7->client->dev, "invalid data lanes mapping\n");
> +			ret = -EINVAL;
> +			goto out_error;
> +		}
> +	}
> +
> +out_done:
> +	ret = 0;
> +
> +out_error:
> +	of_node_put(ep);
> +
> +	return ret;
> +}
> +
> +static int nb7vpq904m_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_mux_desc mux_desc = { };
> +	struct nb7vpq904m *nb7;
> +	int ret;
> +
> +	nb7 = devm_kzalloc(dev, sizeof(*nb7), GFP_KERNEL);
> +	if (!nb7)
> +		return -ENOMEM;
> +
> +	nb7->client = client;
> +
> +	nb7->regmap = devm_regmap_init_i2c(client, &nb7_regmap);
> +	if (IS_ERR(nb7->regmap)) {
> +		dev_err(&client->dev, "Failed to allocate register map\n");
> +		return PTR_ERR(nb7->regmap);
> +	}
> +
> +	nb7->mode = TYPEC_STATE_SAFE;
> +	nb7->orientation = TYPEC_ORIENTATION_NONE;
> +
> +	mutex_init(&nb7->lock);
> +
> +	nb7->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(nb7->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(nb7->enable_gpio),
> +				     "unable to acquire enable gpio\n");
> +
> +	nb7->vcc_supply = devm_regulator_get_optional(dev, "vcc");
> +	if (IS_ERR(nb7->vcc_supply))
> +		return PTR_ERR(nb7->vcc_supply);
> +
> +	nb7->typec_switch = fwnode_typec_switch_get(dev->fwnode);
> +	if (IS_ERR(nb7->typec_switch))
> +		return dev_err_probe(dev, PTR_ERR(nb7->typec_switch),
> +				     "failed to acquire orientation-switch\n");
> +
> +	ret = nb7vpq904m_parse_data_lanes_mapping(nb7);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_enable(nb7->vcc_supply);
> +	if (ret)
> +		dev_warn(dev, "Failed to enable vcc: %d\n", ret);
> +
> +	gpiod_set_value(nb7->enable_gpio, 1);
> +
> +	ret = nb7vpq904m_register_bridge(nb7);
> +	if (ret)
> +		return ret;
> +
> +	sw_desc.drvdata = nb7;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = nb7vpq904m_sw_set;
> +
> +	nb7->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(nb7->sw))
> +		return dev_err_probe(dev, PTR_ERR(nb7->sw), "Error registering typec switch\n");
> +
> +	mux_desc.drvdata = nb7;
> +	mux_desc.fwnode = dev->fwnode;
> +	mux_desc.set = nb7vpq904m_mux_set;
> +
> +	nb7->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(nb7->mux)) {
> +		typec_switch_unregister(nb7->sw);
> +		return dev_err_probe(dev, PTR_ERR(nb7->mux), "Error registering typec mux\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void nb7vpq904m_remove(struct i2c_client *client)
> +{
> +	struct nb7vpq904m *nb7 = i2c_get_clientdata(client);
> +
> +	typec_mux_unregister(nb7->mux);
> +	typec_switch_unregister(nb7->sw);
> +
> +	gpiod_set_value(nb7->enable_gpio, 0);
> +
> +	regulator_disable(nb7->vcc_supply);
> +}
> +
> +static const struct i2c_device_id nb7vpq904m_table[] = {
> +	{ "nb7vpq904m" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nb7vpq904m_table);
> +
> +static const struct of_device_id nb7vpq904m_of_table[] = {
> +	{ .compatible = "onnn,nb7vpq904m" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nb7vpq904m_of_table);
> +
> +static struct i2c_driver nb7vpq904m_driver = {
> +	.driver = {
> +		.name = "nb7vpq904m",
> +		.of_match_table = nb7vpq904m_of_table,
> +	},
> +	.probe_new	= nb7vpq904m_probe,
> +	.remove		= nb7vpq904m_remove,
> +	.id_table	= nb7vpq904m_table,
> +};
> +
> +module_i2c_driver(nb7vpq904m_driver);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("OnSemi NB7VPQ904M Type-C driver");
> +MODULE_LICENSE("GPL");
> 

-- 
With best wishes
Dmitry

