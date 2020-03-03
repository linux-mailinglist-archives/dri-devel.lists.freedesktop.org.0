Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F225176D7F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 04:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827B06E421;
	Tue,  3 Mar 2020 03:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 581206E421
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 03:18:48 +0000 (UTC)
X-UUID: 3848e601389b4c439b4b7bbc89d2e7aa-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tX5ZlBPnN+H9zqPEwz3p9EXFe3HV0cb5nDE9m2ebWQQ=; 
 b=t5oEcNqt0sqqzUCUd6hHXZ/8BhoL7ywk+AJTg+jx+mmVYsmwUkqFdpVQkt/kDqEJaLbK1NZ9bP3R+2chaKcuDHHIB4O31MVNcsLGFB7q5eP2zvi2h6d/s3MwAqnuDRDDq6Xs/a/+8i6nZylL/yH83MqolR4SjWMkZGSswhUMm80=;
X-UUID: 3848e601389b4c439b4b7bbc89d2e7aa-20200303
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 848565754; Tue, 03 Mar 2020 11:18:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 11:18:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 11:16:13 +0800
Message-ID: <1583205520.12858.13.camel@mtksdaap41>
Subject: Re: [PATCH v10 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Tue, 3 Mar 2020 11:18:40 +0800
In-Reply-To: <ed2722ab-8339-359b-8698-14c0b36d1f92@suse.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-4-enric.balletbo@collabora.com>
 <72d0e155-83f3-05c3-8f3f-e46f3860453d@suse.com>
 <ed2722ab-8339-359b-8698-14c0b36d1f92@suse.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C72E52F7AE72402D1DB10659F83E362613CDEA184CB1CB79069EA94ABE0A8F992000:8
X-MTK: N
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

On Thu, 2020-02-27 at 19:22 +0100, Matthias Brugger wrote:
> 
> On 27/02/2020 19:21, Matthias Brugger wrote:
> > 
> > 
> > On 27/02/2020 19:08, Enric Balletbo i Serra wrote:
> >> From: Matthias Brugger <mbrugger@suse.com>
> >>
> >> There is no strong reason for this to use CLK_OF_DECLARE instead of
> >> being a platform driver. Plus, this driver provides clocks but also
> >> a shared register space for the mediatek-drm and the mediatek-mdp
> >> driver. So move to drivers/soc/mediatek as a platform driver.
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> > 
> > regarding the merge strategy, I propose that CK takes it through his tree and
> > provides a stable branch in case I'll need to put some patches on top of the
> > drivers/soc part.
> > 
> 
> Sorry, that was meant for 4/5 not this patch.
> 
> > Makes sense?

There are many dependencies in this series, so I would like to apply
this series to a tree together. I think mmsys driver is major of this
series, and this series does not conflict with Mediatek DRM tree now, so
I would like to apply this series to soc tree. How do you think?

Regards,
CK

> > 
> > Regards,
> > Matthias
> > 
> >>
> >> Changes in v10:
> >> - Renamed to be generic mtk-mmsys
> >> - Add driver data support to be able to support diferent SoCs
> >>
> >> Changes in v9:
> >> - Move mmsys to drivers/soc/mediatek (CK)
> >>
> >> Changes in v8:
> >> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> >>
> >> Changes in v7:
> >> - Free clk_data->clks as well
> >> - Get rid of private data structure
> >>
> >>  drivers/clk/mediatek/clk-mt8173.c | 104 --------------------
> >>  drivers/soc/mediatek/Kconfig      |   7 ++
> >>  drivers/soc/mediatek/Makefile     |   1 +
> >>  drivers/soc/mediatek/mtk-mmsys.c  | 154 ++++++++++++++++++++++++++++++
> >>  4 files changed, 162 insertions(+), 104 deletions(-)
> >>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> >> index 537a7f49b0f7..8f898ac476c0 100644
> >> --- a/drivers/clk/mediatek/clk-mt8173.c
> >> +++ b/drivers/clk/mediatek/clk-mt8173.c
> >> @@ -753,93 +753,6 @@ static const struct mtk_gate img_clks[] __initconst = {
> >>  	GATE_IMG(CLK_IMG_FD, "img_fd", "mm_sel", 11),
> >>  };
> >>  
> >> -static const struct mtk_gate_regs mm0_cg_regs __initconst = {
> >> -	.set_ofs = 0x0104,
> >> -	.clr_ofs = 0x0108,
> >> -	.sta_ofs = 0x0100,
> >> -};
> >> -
> >> -static const struct mtk_gate_regs mm1_cg_regs __initconst = {
> >> -	.set_ofs = 0x0114,
> >> -	.clr_ofs = 0x0118,
> >> -	.sta_ofs = 0x0110,
> >> -};
> >> -
> >> -#define GATE_MM0(_id, _name, _parent, _shift) {			\
> >> -		.id = _id,					\
> >> -		.name = _name,					\
> >> -		.parent_name = _parent,				\
> >> -		.regs = &mm0_cg_regs,				\
> >> -		.shift = _shift,				\
> >> -		.ops = &mtk_clk_gate_ops_setclr,		\
> >> -	}
> >> -
> >> -#define GATE_MM1(_id, _name, _parent, _shift) {			\
> >> -		.id = _id,					\
> >> -		.name = _name,					\
> >> -		.parent_name = _parent,				\
> >> -		.regs = &mm1_cg_regs,				\
> >> -		.shift = _shift,				\
> >> -		.ops = &mtk_clk_gate_ops_setclr,		\
> >> -	}
> >> -
> >> -static const struct mtk_gate mm_clks[] __initconst = {
> >> -	/* MM0 */
> >> -	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
> >> -	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
> >> -	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
> >> -	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
> >> -	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
> >> -	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
> >> -	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
> >> -	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
> >> -	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
> >> -	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
> >> -	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
> >> -	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
> >> -	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
> >> -	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
> >> -	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
> >> -	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
> >> -	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
> >> -	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
> >> -	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
> >> -	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
> >> -	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
> >> -	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
> >> -	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
> >> -	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
> >> -	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
> >> -	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
> >> -	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
> >> -	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
> >> -	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
> >> -	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
> >> -	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
> >> -	/* MM1 */
> >> -	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
> >> -	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
> >> -	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
> >> -	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
> >> -	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
> >> -	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
> >> -	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
> >> -	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
> >> -	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
> >> -	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
> >> -	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
> >> -	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
> >> -	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
> >> -	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
> >> -	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
> >> -	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
> >> -	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
> >> -	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
> >> -	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
> >> -	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
> >> -	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
> >> -};
> >> -
> >>  static const struct mtk_gate_regs vdec0_cg_regs __initconst = {
> >>  	.set_ofs = 0x0000,
> >>  	.clr_ofs = 0x0004,
> >> @@ -1144,23 +1057,6 @@ static void __init mtk_imgsys_init(struct device_node *node)
> >>  }
> >>  CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
> >>  
> >> -static void __init mtk_mmsys_init(struct device_node *node)
> >> -{
> >> -	struct clk_onecell_data *clk_data;
> >> -	int r;
> >> -
> >> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> >> -
> >> -	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> >> -						clk_data);
> >> -
> >> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> >> -	if (r)
> >> -		pr_err("%s(): could not register clock provider: %d\n",
> >> -			__func__, r);
> >> -}
> >> -CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
> >> -
> >>  static void __init mtk_vdecsys_init(struct device_node *node)
> >>  {
> >>  	struct clk_onecell_data *clk_data;
> >> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> >> index 2114b563478c..7a156944d50e 100644
> >> --- a/drivers/soc/mediatek/Kconfig
> >> +++ b/drivers/soc/mediatek/Kconfig
> >> @@ -44,4 +44,11 @@ config MTK_SCPSYS
> >>  	  Say yes here to add support for the MediaTek SCPSYS power domain
> >>  	  driver.
> >>  
> >> +config MTK_MMSYS
> >> +	bool "MediaTek MMSYS Support"
> >> +	depends on COMMON_CLK_MT8173
> >> +	help
> >> +	  Say yes here to add support for the MediaTek Multimedia
> >> +	  Subsystem (MMSYS).
> >> +
> >>  endmenu
> >> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> >> index b01733074ad6..01f9f873634a 100644
> >> --- a/drivers/soc/mediatek/Makefile
> >> +++ b/drivers/soc/mediatek/Makefile
> >> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> >>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> >> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> >> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> >> new file mode 100644
> >> index 000000000000..473cdf732fb5
> >> --- /dev/null
> >> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> >> @@ -0,0 +1,154 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2014 MediaTek Inc.
> >> + * Author: James Liao <jamesjj.liao@mediatek.com>
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +#include "../../clk/mediatek/clk-gate.h"
> >> +#include "../../clk/mediatek/clk-mtk.h"
> >> +
> >> +#include <dt-bindings/clock/mt8173-clk.h>
> >> +
> >> +static const struct mtk_gate_regs mm0_cg_regs = {
> >> +	.set_ofs = 0x0104,
> >> +	.clr_ofs = 0x0108,
> >> +	.sta_ofs = 0x0100,
> >> +};
> >> +
> >> +static const struct mtk_gate_regs mm1_cg_regs = {
> >> +	.set_ofs = 0x0114,
> >> +	.clr_ofs = 0x0118,
> >> +	.sta_ofs = 0x0110,
> >> +};
> >> +
> >> +#define GATE_MM0(_id, _name, _parent, _shift) {			\
> >> +		.id = _id,					\
> >> +		.name = _name,					\
> >> +		.parent_name = _parent,				\
> >> +		.regs = &mm0_cg_regs,				\
> >> +		.shift = _shift,				\
> >> +		.ops = &mtk_clk_gate_ops_setclr,		\
> >> +	}
> >> +
> >> +#define GATE_MM1(_id, _name, _parent, _shift) {			\
> >> +		.id = _id,					\
> >> +		.name = _name,					\
> >> +		.parent_name = _parent,				\
> >> +		.regs = &mm1_cg_regs,				\
> >> +		.shift = _shift,				\
> >> +		.ops = &mtk_clk_gate_ops_setclr,		\
> >> +	}
> >> +
> >> +static const struct mtk_gate mt8173_mm_clks[] = {
> >> +	/* MM0 */
> >> +	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
> >> +	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
> >> +	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
> >> +	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
> >> +	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
> >> +	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
> >> +	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
> >> +	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
> >> +	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
> >> +	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
> >> +	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
> >> +	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
> >> +	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
> >> +	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
> >> +	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
> >> +	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
> >> +	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
> >> +	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
> >> +	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
> >> +	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
> >> +	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
> >> +	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
> >> +	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
> >> +	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
> >> +	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
> >> +	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
> >> +	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
> >> +	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
> >> +	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
> >> +	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
> >> +	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
> >> +	/* MM1 */
> >> +	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
> >> +	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
> >> +	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
> >> +	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
> >> +	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
> >> +	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
> >> +	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
> >> +	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
> >> +	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
> >> +	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
> >> +	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
> >> +	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
> >> +	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
> >> +	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
> >> +	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
> >> +	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
> >> +	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
> >> +	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
> >> +	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
> >> +	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
> >> +	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
> >> +};
> >> +
> >> +struct mtk_mmsys_driver_data {
> >> +	const struct mtk_gate *gates_clk;
> >> +	int gates_num;
> >> +};
> >> +
> >> +static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> >> +	.gates_clk = mt8173_mm_clks,
> >> +	.gates_num = ARRAY_SIZE(mt8173_mm_clks),
> >> +};
> >> +
> >> +static int mtk_mmsys_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device_node *node = pdev->dev.of_node;
> >> +	const struct mtk_mmsys_driver_data *data;
> >> +	struct clk_onecell_data *clk_data;
> >> +	int ret;
> >> +
> >> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> >> +	if (!clk_data)
> >> +		return -ENOMEM;
> >> +
> >> +	data = of_device_get_match_data(&pdev->dev);
> >> +
> >> +	ret = mtk_clk_register_gates(node, data->gates_clk, data->gates_num,
> >> +				     clk_data);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct of_device_id of_match_mtk_mmsys[] = {
> >> +	{
> >> +		.compatible = "mediatek,mt8173-mmsys",
> >> +		.data = &mt8173_mmsys_driver_data,
> >> +	},
> >> +	{ }
> >> +};
> >> +
> >> +static struct platform_driver mtk_mmsys_drv = {
> >> +	.driver = {
> >> +		.name = "mtk-mmsys",
> >> +		.of_match_table = of_match_mtk_mmsys,
> >> +	},
> >> +	.probe = mtk_mmsys_probe,
> >> +};
> >> +
> >> +builtin_platform_driver(mtk_mmsys_drv);
> >>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
