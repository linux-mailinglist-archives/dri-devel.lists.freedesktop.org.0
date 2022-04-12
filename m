Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5944FD363
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9487C10E57E;
	Tue, 12 Apr 2022 09:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEDA10E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:46:48 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e2442907a1so19846250fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=/jXr7871p381hezvOM6vz2wGQV6Q8hqnBtj8tP6/2+4=;
 b=VHPkrbWcWhDRP0Ms+E2ACz/1QyUjPo0clFwBk6WOFH6mtQhSc+3trkDfS8BktiQTgk
 jDvBk2DZx4OiU1b/J6vb/oI4wOcMcwlUy65k6UEgzkDpk3oiVv3mJjLy6Dmka/y+y0+2
 4+BMwv80HCcgjsoMfkcw6p40XjJOdZKMZRiLIR8jwRlH2b87swkcRxg3yfdEOmlwRFW+
 r4D3j++ZdzxzoDaeuKzvKM1Y3mmKShpdDFb45gc7mJ6Lmh6yvJ3385iXuLs3ZIDz0LOV
 RY/TmrM9YPtNOp0O5QVsedwn2E9tCmYw+iJ+yXRS6CVLyDLFDUoTGtq7lkiNbATkNr5a
 E67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=/jXr7871p381hezvOM6vz2wGQV6Q8hqnBtj8tP6/2+4=;
 b=wsvTWg4z5EBvF59VaJKVlYg3RJ4kXxnsFPRHjx70yjdoDCifJGdYnnAkop3PiPm/Pw
 DuOzVMBPwxVDoG4NxeddWHauE/ti2OIWF6rbdIOiyJ0oL/oq2zXkgYCM0lW7W4ddWnL9
 7RMCO58y44fXNvFjXWI2viKIyKwGxB4CjFWh7R2bktGRA3jTHOnxER2+EkANJuqTU814
 a982+FsHTLxl5DRVomLT3PGwGC3rnu+JdSi2rJNGL1M0JBv+MluCr5+FBwOAu3uh7yGr
 YCCTqnIr58xnYrkkvMCwEmw11pJ2LBdGDZKq7OPhzhl2bKf6nVwwayNdIhSlCuclFYIV
 EzKw==
X-Gm-Message-State: AOAM533sGKFcJu4mal896fdu0ARjGb5WC2cyj1+N5RP+HLvco0VXWHwN
 RuZRYyd2iK6b28fVgHl+5oeSlpQwj5vnXHhLd1Fq5A==
X-Google-Smtp-Source: ABdhPJwabGFxqMM9aNBwQhX+XGgbWUrZp4HhkNVL1WH8Hx1XIVIXklfCi1gQEx/UMlxSIC+w3fsVzTCkbv7z8mjDFR0=
X-Received: by 2002:a05:6870:d191:b0:dd:a91e:82dc with SMTP id
 a17-20020a056870d19100b000dda91e82dcmr1599775oac.248.1649756807795; Tue, 12
 Apr 2022 02:46:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 02:46:47 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <9a31c1ce-829b-acc7-6fc1-2a9df45e5c38@collabora.com>
In-Reply-To: <9a31c1ce-829b-acc7-6fc1-2a9df45e5c38@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 02:46:47 -0700
Message-ID: <CABnWg9tou2S-LX7SpW=ALEdLwu9dXbOsxhvQ2WBWaCJW-qt8_Q@mail.gmail.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 11:14, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
>>
>> It supports the mt8195, the embedded DisplayPort units. It offers
>> DisplayPort 1.4 with up to 4 lanes.
>>
>> The driver shares its iomap range with the mtk-dp-phy driver using
>> the regmap/syscon facility.
>>
>> This driver is based on an initial version by
>> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>
>Hello Guillaume,
>as you know, there's some more work to do on this driver.
>
>I will also mention here, not on the code, that at this point, your
>mtk_dp_aux_transfer() function has something VERY similar to function
>drm_dp_dpcd_access(), so I really believe that you can instead use
>functions drm_dp_dpcd_read() and drm_dp_dpcd_write(), avoiding code
>duplication around.
>
>Please check drivers/gpu/drm/dp/drm_dp.c.
>

This is already in my TODO list as this has been suggested by Rex earlier.

>> ---
>>   drivers/gpu/drm/mediatek/Kconfig       |    8 +
>>   drivers/gpu/drm/mediatek/Makefile      |    2 +
>>   drivers/gpu/drm/mediatek/mtk_dp.c      | 2221 ++++++++++++++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>>   6 files changed, 2801 insertions(+)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index 2976d21e9a34..03ffa9b896c3 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -28,3 +28,11 @@ config DRM_MEDIATEK_HDMI
>>   	select PHY_MTK_HDMI
>>   	help
>>   	  DRM/KMS HDMI driver for Mediatek SoCs
>> +
>> +config MTK_DPTX_SUPPORT
>
>Actually, I think that the best would be DRM_MEDIATEK_DP_TX or DRM_MEDIATEK_DP...
>...also, ordering is important, please!
>
I will update the name.
What do you mean by ordering? do you expect the configs to be ordered
alphabetically?

>> +	tristate "DRM DPTX Support for Mediatek SoCs"
>> +	depends on DRM_MEDIATEK
>> +	select PHY_MTK_DP
>> +	select DRM_DP_HELPER
>> +	help
>> +	  DRM/KMS Display Port driver for Mediatek SoCs.
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index 29098d7c8307..d86a6406055e 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>>   			  mtk_hdmi_ddc.o
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>> +
>> +obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>> new file mode 100644
>> index 000000000000..7cd8459cf719
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -0,0 +1,2221 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019 MediaTek Inc.
>> + * Copyright (c) 2021 BayLibre
>> + */
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/dp/drm_dp_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <linux/arm-smccc.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/errno.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/nvmem-consumer.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <sound/hdmi-codec.h>
>> +#include <video/videomode.h>
>> +
>> +#include "mtk_dp_reg.h"
>> +
>> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
>> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
>> +
>> +//TODO: platform/device data or dts?
>
>Assuming that your TODO is about the maximum number of lanes,
>{ .compatible = "mediatek,mt8195-edp-tx", .data = &some_const_structure },

Yes, exactly that, it'll be in v10.
>
>> +#define MTK_DP_MAX_LANES 4
>> +#define MTK_DP_MAX_LINK_RATE MTK_DP_LINKRATE_HBR3
>
>..snip..
>
>> +
>> +static int mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
>> +				   size_t length)
>> +{
>> +	int i;
>> +	int ret = 0;
>> +	int num_regs = (length + 1) / 2;
>> +
>> +	/* 2 bytes per register */
>> +	for (i = 0; i < num_regs; i++) {
>> +		u32 val = buf[i * 2] |
>> +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 : 0);
>> +
>> +		ret = mtk_dp_write(mtk_dp, offset + i * 4, val);
>> +		if (ret)
>> +			goto out;
>
>if (ret)
>     return ret;
>
>> +	}
>> +
>> +out:
>
>Remove this label.
>
>> +	return ret;
>> +}
>> +
>> +static unsigned long mtk_dp_sip_atf_call(unsigned int cmd, unsigned int para)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0, 0, 0,
>> +		      &res);
>> +
>> +	pr_debug("[DPTX]%s cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx", __func__, cmd,
>> +		 para, res.a0, res.a1);
>> +	return res.a1;
>> +}
>> +
>> +static int mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	const u16 bits_to_set =
>> +		BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(HSP_SEL_DP_ENC0_P0_SHIFT) | BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
>> +		BIT(VSP_SEL_DP_ENC0_P0_SHIFT) | BIT(VSW_SEL_DP_ENC0_P0_SHIFT);
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030, bits_to_set,
>> +			   bits_to_set);
>> +}
>> +
>> +#define MTK_UPD_BITS_OR_OUT(mtk_dp, offset, val, mask, ret, label) \
>> +	do {\
>> +		ret = mtk_dp_update_bits(mtk_dp, offset, val, mask); \
>> +		if (ret) \
>> +			goto label; \
>> +	} while (0)
>
>I'm sorry, no offense - but this macro is a bit ugly...
>
>I think I understand why you have introduced it, but in my opinion this decreases
>human readability a lot, I was even about to point out multiple functions that
>you had unused labels before checking this macro, as that was totally unexpected...
>
>In my opinion, this should be open-coded everywhere... yes it makes the file a
>bit fatter in terms of amount of text, but eh... it's life :)))
>
>
No offense taken... I find the macro ugly too... but I couldn't think
of anything less
ugly... I'll bite the bullet and write all of the code then.

>> +
>
>....snip....
>
>> +
>> +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
>> +				   enum mtk_dp_color_format color_format)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	mtk_dp->info.format = color_format;
>> +
>> +	/* Update MISC0 */
>> +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
>> +				 color_format << DP_TEST_COLOR_FORMAT_SHIFT,
>> +			   DP_TEST_COLOR_FORMAT_MASK);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (color_format) {
>> +	case MTK_DP_COLOR_FORMAT_YUV_422:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
>> +		break;
>> +	case MTK_DP_COLOR_FORMAT_YUV_420:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
>> +		break;
>> +	case MTK_DP_COLOR_FORMAT_YONLY:
>> +	case MTK_DP_COLOR_FORMAT_RAW:
>> +	case MTK_DP_COLOR_FORMAT_RESERVED:
>> +	case MTK_DP_COLOR_FORMAT_UNKNOWN:
>> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
>> +			 color_format);
>> +		fallthrough;
>
>Uhm, are you sure that you should fallthrough?
>If we get a color format that we don't understand, the best thing that would
>happen is that we'd get scrambled colors... which is something unwanted.
>
>The best idea is to return -EINVAL here, hence refuse to go on with an invalid
>color format.
>

Will do.

>> +	case MTK_DP_COLOR_FORMAT_RGB_444:
>> +	case MTK_DP_COLOR_FORMAT_YUV_444:
>> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
>> +		break;
>> +	}
>> +
>> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
>> +			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>> +}
>> +
>
>...snip...
>
>> +
>> +static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
>> +{
>> +	// Debounce threshold
>
>I think I already told you to fix comments style.
>
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
>> +			   HPD_DEB_THD_DP_TRANS_P0_MASK);
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
>> +			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
>> +				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
>> +			   HPD_INT_THD_DP_TRANS_P0_MASK);
>> +
>> +	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
>> +	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>> +			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
>> +				   (5 << HPD_CONN_THD_DP_TRANS_P0_SHIFT),
>> +			   HPD_DISC_THD_DP_TRANS_P0_MASK |
>> +				   HPD_CONN_THD_DP_TRANS_P0_MASK);
>> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
>> +			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
>> +			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
>> +}
>> +
>
>..snip..
>
>> +
>> +static int mtk_dp_power_disable(struct mtk_dp *mtk_dp)
>> +{
>> +	int ret;
>> +
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	usleep_range(10, 200);
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_0034,
>> +			   DA_CKM_CKTX0_EN_FORCE_EN | DA_CKM_BIAS_LPF_EN_FORCE_VAL |
>> +		     DA_CKM_BIAS_EN_FORCE_VAL |
>> +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
>> +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* Disable RX */
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
>> +			   0x550 | BIT(FUSE_SEL_SHIFT) | BIT(MEM_ISO_EN_SHIFT));
>> +
>> +out:
>
>You are using a goto instead of a return, but you're not reverting any change,
>so this goto usage is not justified - hence, wrong.
>
>Please simply return ret when anything fails, and return 0 at the end of this
>function.
>
>	.......
>	(blahblah function code)
>
>	ret = something()
>	if (ret)
>		return ret;
>
>	return 0;
>}
>
>> +	return ret;
>> +}
>> +
>
>...snip...

I'll remove all the gotos that have no unwrapping then.

>
>> +
>> +static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
>> +			   struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret = 0;
>> +	void __iomem *base;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	mtk_dp->regs = syscon_node_to_regmap(dev->of_node);
>> +	if (IS_ERR(mtk_dp->regs))
>> +		return PTR_ERR(mtk_dp->regs);
>> +
>> +	//TODO: optional clock?
>
>Well, if it's optional, you should use devm_clk_get_optional(), meaning
>that......
>
>> +	mtk_dp->dp_tx_clk = devm_clk_get(dev, "faxi");
>> +	if (IS_ERR(mtk_dp->dp_tx_clk)) {
>> +		ret = PTR_ERR(mtk_dp->dp_tx_clk);
>> +		dev_info(dev, "Failed to get dptx clock: %d\n", ret);
>> +		mtk_dp->dp_tx_clk = NULL;
>
>...I shouldn't see this snippet of code, as it should be a bit different... :)
>
It is still unclear to me if this should be optional or not, hence the 'TODO'

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>
>..snip..
>
>> +static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>> +					 struct drm_bridge_state *old_state)
>> +{
>> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>> +
>> +	mtk_dp_video_mute(mtk_dp, true);
>> +	mtk_dp->state = MTK_DP_STATE_IDLE;
>> +	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
>> +
>> +	mtk_dp->enabled = false;
>
>> +	msleep(100);
>
>100 milliseconds is an eternity, why are we sleeping for *so long* here?
>
>Please, either add a comment that fully explains the resons for that, or
>remove the sleep entirely: to my eyes, it doesn't look like this sleep is
>really needed for anything important because here you are disabling the
>bridge and *powering off* the IP entirely.
>
This sleep can be removed.
I will also make an effort to document all the other delays in the code for v10.

>> +	mtk_dp_poweroff(mtk_dp);
>> +}
>> +
>
>..snip..
>
>> +
>> +static enum drm_mode_status
>> +mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
>> +			 const struct drm_display_info *info,
>> +			 const struct drm_display_mode *mode)
>> +{
>> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>> +	u32 rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
>> +	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
>> +
>> +	if (rx_linkrate * mtk_dp->train_info.lane_count < mode->clock * bpp / 8)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	if (mode->clock > 600000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	//TODO: explain magic number: 62?
>
>Please fix this TODO for v10.
>
>> +	if ((mode->clock * 1000) / (mode->htotal * mode->vtotal) > 62)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>
>

Thx a lot for your review,
Guillaume.
