Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF17324E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFAE6EE21;
	Fri, 28 Feb 2020 07:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0135F6E817
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:22:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B4FAB239;
 Thu, 27 Feb 2020 18:22:24 +0000 (UTC)
Subject: Re: [PATCH v10 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-4-enric.balletbo@collabora.com>
 <72d0e155-83f3-05c3-8f3f-e46f3860453d@suse.com>
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; prefer-encrypt=mutual; keydata=
 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
 HxUCQ9Y1Y/Ct
Message-ID: <ed2722ab-8339-359b-8698-14c0b36d1f92@suse.com>
Date: Thu, 27 Feb 2020 19:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <72d0e155-83f3-05c3-8f3f-e46f3860453d@suse.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/02/2020 19:21, Matthias Brugger wrote:
> 
> 
> On 27/02/2020 19:08, Enric Balletbo i Serra wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> There is no strong reason for this to use CLK_OF_DECLARE instead of
>> being a platform driver. Plus, this driver provides clocks but also
>> a shared register space for the mediatek-drm and the mediatek-mdp
>> driver. So move to drivers/soc/mediatek as a platform driver.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
> 
> regarding the merge strategy, I propose that CK takes it through his tree and
> provides a stable branch in case I'll need to put some patches on top of the
> drivers/soc part.
> 

Sorry, that was meant for 4/5 not this patch.

> Makes sense?
> 
> Regards,
> Matthias
> 
>>
>> Changes in v10:
>> - Renamed to be generic mtk-mmsys
>> - Add driver data support to be able to support diferent SoCs
>>
>> Changes in v9:
>> - Move mmsys to drivers/soc/mediatek (CK)
>>
>> Changes in v8:
>> - Be a builtin_platform_driver like other mediatek mmsys drivers.
>>
>> Changes in v7:
>> - Free clk_data->clks as well
>> - Get rid of private data structure
>>
>>  drivers/clk/mediatek/clk-mt8173.c | 104 --------------------
>>  drivers/soc/mediatek/Kconfig      |   7 ++
>>  drivers/soc/mediatek/Makefile     |   1 +
>>  drivers/soc/mediatek/mtk-mmsys.c  | 154 ++++++++++++++++++++++++++++++
>>  4 files changed, 162 insertions(+), 104 deletions(-)
>>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
>> index 537a7f49b0f7..8f898ac476c0 100644
>> --- a/drivers/clk/mediatek/clk-mt8173.c
>> +++ b/drivers/clk/mediatek/clk-mt8173.c
>> @@ -753,93 +753,6 @@ static const struct mtk_gate img_clks[] __initconst = {
>>  	GATE_IMG(CLK_IMG_FD, "img_fd", "mm_sel", 11),
>>  };
>>  
>> -static const struct mtk_gate_regs mm0_cg_regs __initconst = {
>> -	.set_ofs = 0x0104,
>> -	.clr_ofs = 0x0108,
>> -	.sta_ofs = 0x0100,
>> -};
>> -
>> -static const struct mtk_gate_regs mm1_cg_regs __initconst = {
>> -	.set_ofs = 0x0114,
>> -	.clr_ofs = 0x0118,
>> -	.sta_ofs = 0x0110,
>> -};
>> -
>> -#define GATE_MM0(_id, _name, _parent, _shift) {			\
>> -		.id = _id,					\
>> -		.name = _name,					\
>> -		.parent_name = _parent,				\
>> -		.regs = &mm0_cg_regs,				\
>> -		.shift = _shift,				\
>> -		.ops = &mtk_clk_gate_ops_setclr,		\
>> -	}
>> -
>> -#define GATE_MM1(_id, _name, _parent, _shift) {			\
>> -		.id = _id,					\
>> -		.name = _name,					\
>> -		.parent_name = _parent,				\
>> -		.regs = &mm1_cg_regs,				\
>> -		.shift = _shift,				\
>> -		.ops = &mtk_clk_gate_ops_setclr,		\
>> -	}
>> -
>> -static const struct mtk_gate mm_clks[] __initconst = {
>> -	/* MM0 */
>> -	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
>> -	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
>> -	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
>> -	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
>> -	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
>> -	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
>> -	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
>> -	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
>> -	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
>> -	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
>> -	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
>> -	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
>> -	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
>> -	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
>> -	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
>> -	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
>> -	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
>> -	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
>> -	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
>> -	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
>> -	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
>> -	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
>> -	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
>> -	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
>> -	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
>> -	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
>> -	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
>> -	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
>> -	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
>> -	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
>> -	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
>> -	/* MM1 */
>> -	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
>> -	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
>> -	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
>> -	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
>> -	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
>> -	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
>> -	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
>> -	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
>> -	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
>> -	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
>> -	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
>> -	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
>> -	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
>> -	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
>> -	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
>> -	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
>> -	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
>> -	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
>> -	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
>> -	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
>> -	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
>> -};
>> -
>>  static const struct mtk_gate_regs vdec0_cg_regs __initconst = {
>>  	.set_ofs = 0x0000,
>>  	.clr_ofs = 0x0004,
>> @@ -1144,23 +1057,6 @@ static void __init mtk_imgsys_init(struct device_node *node)
>>  }
>>  CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
>>  
>> -static void __init mtk_mmsys_init(struct device_node *node)
>> -{
>> -	struct clk_onecell_data *clk_data;
>> -	int r;
>> -
>> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> -
>> -	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
>> -						clk_data);
>> -
>> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>> -	if (r)
>> -		pr_err("%s(): could not register clock provider: %d\n",
>> -			__func__, r);
>> -}
>> -CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
>> -
>>  static void __init mtk_vdecsys_init(struct device_node *node)
>>  {
>>  	struct clk_onecell_data *clk_data;
>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>> index 2114b563478c..7a156944d50e 100644
>> --- a/drivers/soc/mediatek/Kconfig
>> +++ b/drivers/soc/mediatek/Kconfig
>> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>>  	  driver.
>>  
>> +config MTK_MMSYS
>> +	bool "MediaTek MMSYS Support"
>> +	depends on COMMON_CLK_MT8173
>> +	help
>> +	  Say yes here to add support for the MediaTek Multimedia
>> +	  Subsystem (MMSYS).
>> +
>>  endmenu
>> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
>> index b01733074ad6..01f9f873634a 100644
>> --- a/drivers/soc/mediatek/Makefile
>> +++ b/drivers/soc/mediatek/Makefile
>> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> new file mode 100644
>> index 000000000000..473cdf732fb5
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2014 MediaTek Inc.
>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "../../clk/mediatek/clk-gate.h"
>> +#include "../../clk/mediatek/clk-mtk.h"
>> +
>> +#include <dt-bindings/clock/mt8173-clk.h>
>> +
>> +static const struct mtk_gate_regs mm0_cg_regs = {
>> +	.set_ofs = 0x0104,
>> +	.clr_ofs = 0x0108,
>> +	.sta_ofs = 0x0100,
>> +};
>> +
>> +static const struct mtk_gate_regs mm1_cg_regs = {
>> +	.set_ofs = 0x0114,
>> +	.clr_ofs = 0x0118,
>> +	.sta_ofs = 0x0110,
>> +};
>> +
>> +#define GATE_MM0(_id, _name, _parent, _shift) {			\
>> +		.id = _id,					\
>> +		.name = _name,					\
>> +		.parent_name = _parent,				\
>> +		.regs = &mm0_cg_regs,				\
>> +		.shift = _shift,				\
>> +		.ops = &mtk_clk_gate_ops_setclr,		\
>> +	}
>> +
>> +#define GATE_MM1(_id, _name, _parent, _shift) {			\
>> +		.id = _id,					\
>> +		.name = _name,					\
>> +		.parent_name = _parent,				\
>> +		.regs = &mm1_cg_regs,				\
>> +		.shift = _shift,				\
>> +		.ops = &mtk_clk_gate_ops_setclr,		\
>> +	}
>> +
>> +static const struct mtk_gate mt8173_mm_clks[] = {
>> +	/* MM0 */
>> +	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
>> +	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
>> +	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
>> +	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
>> +	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
>> +	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
>> +	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
>> +	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
>> +	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
>> +	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
>> +	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
>> +	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
>> +	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
>> +	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
>> +	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
>> +	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
>> +	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
>> +	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
>> +	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
>> +	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
>> +	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
>> +	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
>> +	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
>> +	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
>> +	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
>> +	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
>> +	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
>> +	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
>> +	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
>> +	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
>> +	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
>> +	/* MM1 */
>> +	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
>> +	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
>> +	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
>> +	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
>> +	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
>> +	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
>> +	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
>> +	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
>> +	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
>> +	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
>> +	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
>> +	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
>> +	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
>> +	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
>> +	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
>> +	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
>> +	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
>> +	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
>> +	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
>> +	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
>> +	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
>> +};
>> +
>> +struct mtk_mmsys_driver_data {
>> +	const struct mtk_gate *gates_clk;
>> +	int gates_num;
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> +	.gates_clk = mt8173_mm_clks,
>> +	.gates_num = ARRAY_SIZE(mt8173_mm_clks),
>> +};
>> +
>> +static int mtk_mmsys_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *node = pdev->dev.of_node;
>> +	const struct mtk_mmsys_driver_data *data;
>> +	struct clk_onecell_data *clk_data;
>> +	int ret;
>> +
>> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	data = of_device_get_match_data(&pdev->dev);
>> +
>> +	ret = mtk_clk_register_gates(node, data->gates_clk, data->gates_num,
>> +				     clk_data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id of_match_mtk_mmsys[] = {
>> +	{
>> +		.compatible = "mediatek,mt8173-mmsys",
>> +		.data = &mt8173_mmsys_driver_data,
>> +	},
>> +	{ }
>> +};
>> +
>> +static struct platform_driver mtk_mmsys_drv = {
>> +	.driver = {
>> +		.name = "mtk-mmsys",
>> +		.of_match_table = of_match_mtk_mmsys,
>> +	},
>> +	.probe = mtk_mmsys_probe,
>> +};
>> +
>> +builtin_platform_driver(mtk_mmsys_drv);
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
