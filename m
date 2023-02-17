Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB169B14C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786B910E0D5;
	Fri, 17 Feb 2023 16:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270FE10E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 16:47:21 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id b25so188695qkk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GH868rgUEO26fE/9L8hE/xTptuIJLQgdCHIKc9KHlQA=;
 b=tzti2zMXgjC7xDPCCQgVVELtdhe+ncD7mXfNLsElN9jWy4oAlhrby9/aQRVP3XdziK
 8ogb6/T7CuY+6UGYKRtVCG3v7vkDzgeSW7n06NRMru74J7uZuySoNpqEam9gZzWWxJhm
 XVlm27NqmUA1u0MXlBkt29yvXOjxUsXkINkblI/mgGTqAS3YbunZ9buNsMSxPuQcKzby
 94H/TzZCiFJLDDYKT1b02DN3WiSTVST6E6UTLHxvoId3f6UPTSWRZFgamvHg7Ck7EEFp
 zNU8itoN1G0sQ646chPmOwPk9prjBHTgLgj6tk8olh3RXjNpQmEoa5N97szgnaHY0YlA
 v7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH868rgUEO26fE/9L8hE/xTptuIJLQgdCHIKc9KHlQA=;
 b=RN1C45aEUqihkbE4J0ZVI/R8Zs6IRszRU2Cdq+EekzkKN5bqIlQp4PkhctTSTz9lOf
 YTCS6hb6mwZVxBskAE6zzO6i0BSgxtT7WAhlpIcklBtB1vilo2TbRR+c5i+F53lre78F
 7TX3+w5lUotrAGuURIWs3FYhgjpPbcDrzfZhljIN81yXuAIbgJCa48kXSd2VhGp0wAwy
 YUAKqN+MoNQjcT/cFwewlxKmmr+OxIVTLfIgQx/r/81vENfzYei7WE9oWmZJVZ6kzj7K
 iWdVNKZ83XYAEfxXjPm5vngqa61kfGATNYZfIcP3HLHlz8s0V7pnZBX1K2voB0S9L47+
 Wzlg==
X-Gm-Message-State: AO0yUKUieUWqsHKuMPZxBJyiSpOaVRGYy63Vsv9thkcV4AmnTAa8PMNu
 Y+E/PdnIIWEbNV1YfMNSD1HUz93HRFhzhsvrWHtq5g==
X-Google-Smtp-Source: AK7set9siV/mnNP7MyoD6AYlO3exUJPFWGflQIdy2PyObLidgTkusfWzgoPZzNdGWCVdwL4Fexbxy7wdw2pQSNXn4Bo=
X-Received: by 2002:a37:6389:0:b0:73b:a32e:a4a5 with SMTP id
 x131-20020a376389000000b0073ba32ea4a5mr540705qkb.3.1676652439943; Fri, 17 Feb
 2023 08:47:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Feb 2023 08:47:19 -0800
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-4-nancy.lin@mediatek.com>
In-Reply-To: <20221227081011.6426-4-nancy.lin@mediatek.com>
MIME-Version: 1.0
Date: Fri, 17 Feb 2023 08:47:19 -0800
Message-ID: <CABnWg9vP0nVS6J=Lrx5o-9E5x9NiMd8kRoRyUtS8k5P+Bywjaw@mail.gmail.com>
Subject: Re: [PATCH v29 3/7] drm/mediatek: add ovl_adaptor support for MT8195
To: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Dec 2022 09:10, "" wrote:

Hi Nancy.

I've been using your patches lately to test out the HDMI series on
mt8195 and I have hit a scheduling bug.

>Add ovl_adaptor driver for MT8195.
>Ovl_adaptor is an encapsulated module and designed for simplified
>DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
>an ETHDR. Two RDMAs merge into one layer, so this module support 4
>layers.
>
>Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>---
> drivers/gpu/drm/mediatek/Makefile             |   1 +
> drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  26 +
> .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 533 ++++++++++++++++++
> drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
> 4 files changed, 561 insertions(+)
> create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>
>diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>index 840f14436d3c..d4d193f60271 100644
>--- a/drivers/gpu/drm/mediatek/Makefile
>+++ b/drivers/gpu/drm/mediatek/Makefile
>@@ -6,6 +6,7 @@ mediatek-drm-y := mtk_disp_aal.o \
> 		  mtk_disp_gamma.o \
> 		  mtk_disp_merge.o \
> 		  mtk_disp_ovl.o \
>+		  mtk_disp_ovl_adaptor.o \
> 		  mtk_disp_rdma.o \
> 		  mtk_drm_crtc.o \
> 		  mtk_drm_ddp_comp.o \
>diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>index 33e61a136bbc..654f8e257984 100644
>--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
>@@ -7,6 +7,8 @@
> #define _MTK_DISP_DRV_H_
>
> #include <linux/soc/mediatek/mtk-cmdq.h>
>+#include <linux/soc/mediatek/mtk-mmsys.h>
>+#include <linux/soc/mediatek/mtk-mutex.h>
> #include "mtk_drm_plane.h"
> #include "mtk_mdp_rdma.h"
>
>@@ -116,6 +118,30 @@ void mtk_rdma_unregister_vblank_cb(struct device *dev);
> void mtk_rdma_enable_vblank(struct device *dev);
> void mtk_rdma_disable_vblank(struct device *dev);
>
>+void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
>+void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
>+void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
>+			     unsigned int next);
>+void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
>+				unsigned int next);
>+int mtk_ovl_adaptor_clk_enable(struct device *dev);
>+void mtk_ovl_adaptor_clk_disable(struct device *dev);
>+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>+			    unsigned int h, unsigned int vrefresh,
>+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>+				  struct mtk_plane_state *state,
>+				  struct cmdq_pkt *cmdq_pkt);
>+void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(void *),
>+					void *vblank_cb_data);
>+void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev);
>+void mtk_ovl_adaptor_enable_vblank(struct device *dev);
>+void mtk_ovl_adaptor_disable_vblank(struct device *dev);
>+void mtk_ovl_adaptor_start(struct device *dev);
>+void mtk_ovl_adaptor_stop(struct device *dev);
>+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
>+struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
>+
> int mtk_mdp_rdma_clk_enable(struct device *dev);
> void mtk_mdp_rdma_clk_disable(struct device *dev);
> void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>new file mode 100644
>index 000000000000..046217828ab3
>--- /dev/null
>+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>@@ -0,0 +1,533 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright (c) 2021 MediaTek Inc.
>+ */
>+
>+#include <drm/drm_fourcc.h>
>+#include <drm/drm_of.h>
>+#include <linux/clk.h>
>+#include <linux/component.h>
>+#include <linux/of_device.h>
>+#include <linux/of_address.h>
>+#include <linux/platform_device.h>
>+#include <linux/pm_runtime.h>
>+#include <linux/reset.h>
>+#include <linux/soc/mediatek/mtk-cmdq.h>
>+#include <linux/soc/mediatek/mtk-mmsys.h>
>+#include <linux/soc/mediatek/mtk-mutex.h>
>+
>+#include "mtk_disp_drv.h"
>+#include "mtk_drm_crtc.h"
>+#include "mtk_drm_ddp_comp.h"
>+#include "mtk_drm_drv.h"
>+#include "mtk_ethdr.h"
>+
>+#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
>+#define MTK_OVL_ADAPTOR_LAYER_NUM 4
>+
>+enum mtk_ovl_adaptor_comp_type {
>+	OVL_ADAPTOR_TYPE_RDMA = 0,
>+	OVL_ADAPTOR_TYPE_MERGE,
>+	OVL_ADAPTOR_TYPE_ETHDR,
>+	OVL_ADAPTOR_TYPE_NUM,
>+};
>+
>+enum mtk_ovl_adaptor_comp_id {
>+	OVL_ADAPTOR_MDP_RDMA0,
>+	OVL_ADAPTOR_MDP_RDMA1,
>+	OVL_ADAPTOR_MDP_RDMA2,
>+	OVL_ADAPTOR_MDP_RDMA3,
>+	OVL_ADAPTOR_MDP_RDMA4,
>+	OVL_ADAPTOR_MDP_RDMA5,
>+	OVL_ADAPTOR_MDP_RDMA6,
>+	OVL_ADAPTOR_MDP_RDMA7,
>+	OVL_ADAPTOR_MERGE0,
>+	OVL_ADAPTOR_MERGE1,
>+	OVL_ADAPTOR_MERGE2,
>+	OVL_ADAPTOR_MERGE3,
>+	OVL_ADAPTOR_ETHDR0,
>+	OVL_ADAPTOR_ID_MAX
>+};
>+
>+struct ovl_adaptor_comp_match {
>+	enum mtk_ovl_adaptor_comp_type type;
>+	int alias_id;
>+};
>+
>+struct mtk_disp_ovl_adaptor {
>+	struct device *ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
>+	struct device *mmsys_dev;
>+	bool children_bound;
>+};
>+
>+static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>+	[OVL_ADAPTOR_TYPE_RDMA]		= "vdo1-rdma",
>+	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>+	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
>+};
>+
>+static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
>+	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_RDMA, 0 },
>+	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_RDMA, 1 },
>+	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_RDMA, 2 },
>+	[OVL_ADAPTOR_MDP_RDMA3]	= { OVL_ADAPTOR_TYPE_RDMA, 3 },
>+	[OVL_ADAPTOR_MDP_RDMA4]	= { OVL_ADAPTOR_TYPE_RDMA, 4 },
>+	[OVL_ADAPTOR_MDP_RDMA5]	= { OVL_ADAPTOR_TYPE_RDMA, 5 },
>+	[OVL_ADAPTOR_MDP_RDMA6]	= { OVL_ADAPTOR_TYPE_RDMA, 6 },
>+	[OVL_ADAPTOR_MDP_RDMA7]	= { OVL_ADAPTOR_TYPE_RDMA, 7 },
>+	[OVL_ADAPTOR_MERGE0]	= { OVL_ADAPTOR_TYPE_MERGE, 1 },
>+	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
>+	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
>+	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
>+	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
>+};
>+
>+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>+				  struct mtk_plane_state *state,
>+				  struct cmdq_pkt *cmdq_pkt)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct mtk_plane_pending_state *pending = &state->pending;
>+	struct mtk_mdp_rdma_cfg rdma_config = {0};
>+	struct device *rdma_l;
>+	struct device *rdma_r;
>+	struct device *merge;
>+	struct device *ethdr;
>+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
>+	bool use_dual_pipe = false;
>+	unsigned int align_width;
>+	unsigned int l_w = 0;
>+	unsigned int r_w = 0;
>+
>+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
>+		pending->enable, pending->format);
>+	dev_dbg(dev, "addr 0x%pad, fb w:%d, {%d,%d,%d,%d}\n",
>+		&pending->addr, (pending->pitch / fmt_info->cpp[0]),
>+		pending->x, pending->y, pending->width, pending->height);
>+
>+	rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
>+	rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
>+	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>+	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
>+
>+	if (!pending->enable) {
>+		mtk_merge_stop_cmdq(merge, cmdq_pkt);

It doesn't seem to be safe here to call mtk_merge_stop_cmdq() as shown
with this stack trace on i1200-demo:

 BUG: scheduling while atomic: swapper/0/0/0x00010002
 Modules linked in:
 CPU: 0 PID: 0 Comm: swapper/0 Not tainted
6.2.0-rc7-next-20230213-mtk-00029-g9bf9f23daebe-dirty #118
 Hardware name: MediaTek MT8195 demo board (DT)
 Call trace:
  dump_backtrace+0x98/0xf4
  show_stack+0x18/0x24
  dump_stack_lvl+0x48/0x60
  dump_stack+0x18/0x24
  __schedule_bug+0x50/0x68
  __schedule+0x74c/0x80c
  schedule+0x5c/0xc4
  schedule_hrtimeout_range_clock+0xb0/0x150
  schedule_hrtimeout_range+0x14/0x20
  usleep_range_state+0x74/0xa8
  mtk_mmsys_reset+0x7c/0xd0
  reset_control_reset+0x50/0x154
  mtk_merge_stop_cmdq+0x50/0x80
  mtk_ovl_adaptor_layer_config+0x1ec/0x20c
  mtk_crtc_ddp_config+0xa4/0x1cc
  mtk_crtc_ddp_irq+0xd0/0xd4
  mtk_ethdr_irq_handler+0x2c/0x44
  __handle_irq_event_percpu+0x60/0x14c
  handle_irq_event+0x4c/0xac
  handle_fasteoi_irq+0xa4/0x198
  generic_handle_domain_irq+0x2c/0x44
  gic_handle_irq+0x50/0x124
  call_on_irq_stack+0x24/0x4c
  do_interrupt_handler+0x80/0x84
  el1_interrupt+0x34/0x68
  el1h_64_irq_handler+0x18/0x24
  el1h_64_irq+0x64/0x68
  cpuidle_enter_state+0x1d8/0x2e8
  cpuidle_enter+0x38/0x50
  do_idle+0x1fc/0x27c
  cpu_startup_entry+0x28/0x2c
  kernel_init+0x0/0x1dc
  arch_post_acpi_subsys_init+0x0/0x8
  start_kernel+0x3dc/0x6e8
  __primary_switched+0xbc/0xc4
 bad: scheduling from the idle thread!

HTH,
Guillaume.

>+		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
>+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
>+		mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
>+		return;
>+	}
>+
>+	/* ETHDR is in 1T2P domain, width needs to be 2 pixels align */
>+	align_width = ALIGN_DOWN(pending->width, 2);
>+
>+	if (align_width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
>+		use_dual_pipe = true;
>+
>+	if (use_dual_pipe) {
>+		l_w = (align_width / 2) + ((pending->width / 2) % 2);
>+		r_w = align_width - l_w;
>+	} else {
>+		l_w = align_width;
>+	}
>+	mtk_merge_advance_config(merge, l_w, r_w, pending->height, 0, 0, cmdq_pkt);
>+	mtk_mmsys_merge_async_config(ovl_adaptor->mmsys_dev, idx, align_width / 2,
>+				     pending->height, cmdq_pkt);
>+
>+	rdma_config.width = l_w;
>+	rdma_config.height = pending->height;
>+	rdma_config.addr0 = pending->addr;
>+	rdma_config.pitch = pending->pitch;
>+	rdma_config.fmt = pending->format;
>+	rdma_config.color_encoding = pending->color_encoding;
>+	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
>+
>+	if (use_dual_pipe) {
>+		rdma_config.x_left = l_w;
>+		rdma_config.width = r_w;
>+		mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
>+	}
>+
>+	mtk_merge_start_cmdq(merge, cmdq_pkt);
>+
>+	mtk_mdp_rdma_start(rdma_l, cmdq_pkt);
>+	if (use_dual_pipe)
>+		mtk_mdp_rdma_start(rdma_r, cmdq_pkt);
>+	else
>+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
>+
>+	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
>+}
>+
>+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>+			    unsigned int h, unsigned int vrefresh,
>+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_config(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0], w, h,
>+			 vrefresh, bpc, cmdq_pkt);
>+}
>+
>+void mtk_ovl_adaptor_start(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_stop(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+int mtk_ovl_adaptor_clk_enable(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct device *comp;
>+	int ret;
>+	int i;
>+
>+	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+		ret = pm_runtime_get_sync(comp);
>+		if (ret < 0) {
>+			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
>+			goto pwr_err;
>+		}
>+	}
>+
>+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+
>+		if (i < OVL_ADAPTOR_MERGE0)
>+			ret = mtk_mdp_rdma_clk_enable(comp);
>+		else if (i < OVL_ADAPTOR_ETHDR0)
>+			ret = mtk_merge_clk_enable(comp);
>+		else
>+			ret = mtk_ethdr_clk_enable(comp);
>+		if (ret) {
>+			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
>+			goto clk_err;
>+		}
>+	}
>+
>+	return ret;
>+
>+clk_err:
>+	while (--i >= 0) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+		if (i < OVL_ADAPTOR_MERGE0)
>+			mtk_mdp_rdma_clk_disable(comp);
>+		else if (i < OVL_ADAPTOR_ETHDR0)
>+			mtk_merge_clk_disable(comp);
>+		else
>+			mtk_ethdr_clk_disable(comp);
>+	}
>+	i = OVL_ADAPTOR_MERGE0;
>+
>+pwr_err:
>+	while (--i >= 0)
>+		pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
>+
>+	return ret;
>+}
>+
>+void mtk_ovl_adaptor_clk_disable(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+	struct device *comp;
>+	int i;
>+
>+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
>+		comp = ovl_adaptor->ovl_adaptor_comp[i];
>+
>+		if (i < OVL_ADAPTOR_MERGE0) {
>+			mtk_mdp_rdma_clk_disable(comp);
>+			pm_runtime_put(comp);
>+		} else if (i < OVL_ADAPTOR_ETHDR0) {
>+			mtk_merge_clk_disable(comp);
>+		} else {
>+			mtk_ethdr_clk_disable(comp);
>+		}
>+	}
>+}
>+
>+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
>+{
>+	return MTK_OVL_ADAPTOR_LAYER_NUM;
>+}
>+
>+struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	return ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0];
>+}
>+
>+void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(void *),
>+					void *vblank_cb_data)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_register_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
>+				     vblank_cb, vblank_cb_data);
>+}
>+
>+void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_unregister_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_enable_vblank(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_enable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_disable_vblank(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
>+
>+	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
>+}
>+
>+void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
>+{
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE1);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
>+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
>+}
>+
>+void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
>+{
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE1);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
>+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
>+}
>+
>+void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
>+{
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
>+}
>+
>+void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, unsigned int next)
>+{
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
>+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
>+}
>+
>+static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
>+				   enum mtk_ovl_adaptor_comp_type type)
>+{
>+	int alias_id = of_alias_get_id(node, private_comp_stem[type]);
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(comp_matches); i++)
>+		if (comp_matches[i].type == type &&
>+		    comp_matches[i].alias_id == alias_id)
>+			return i;
>+
>+	dev_warn(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
>+	return -EINVAL;
>+}
>+
>+static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>+	{
>+		.compatible = "mediatek,mt8195-vdo1-rdma",
>+		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
>+	}, {
>+		.compatible = "mediatek,mt8195-disp-merge",
>+		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
>+	}, {
>+		.compatible = "mediatek,mt8195-disp-ethdr",
>+		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
>+	},
>+	{},
>+};
>+
>+static int compare_of(struct device *dev, void *data)
>+{
>+	return dev->of_node == data;
>+}
>+
>+static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+	struct device_node *node, *parent;
>+	struct platform_device *comp_pdev;
>+
>+	parent = dev->parent->parent->of_node->parent;
>+
>+	for_each_child_of_node(parent, node) {
>+		const struct of_device_id *of_id;
>+		enum mtk_ovl_adaptor_comp_type type;
>+		int id;
>+
>+		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
>+		if (!of_id)
>+			continue;
>+
>+		if (!of_device_is_available(node)) {
>+			dev_dbg(dev, "Skipping disabled component %pOF\n",
>+				node);
>+			continue;
>+		}
>+
>+		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
>+		id = ovl_adaptor_comp_get_id(dev, node, type);
>+		if (id < 0) {
>+			dev_warn(dev, "Skipping unknown component %pOF\n",
>+				 node);
>+			continue;
>+		}
>+
>+		comp_pdev = of_find_device_by_node(node);
>+		if (!comp_pdev)
>+			return -EPROBE_DEFER;
>+
>+		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
>+
>+		drm_of_component_match_add(dev, match, compare_of, node);
>+		dev_dbg(dev, "Adding component match for %pOF\n", node);
>+	}
>+
>+	if (!*match) {
>+		dev_err(dev, "No match device for ovl_adaptor\n");
>+		return -ENODEV;
>+	}
>+
>+	return 0;
>+}
>+
>+static int mtk_disp_ovl_adaptor_comp_bind(struct device *dev, struct device *master,
>+					  void *data)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+
>+	if (!priv->children_bound)
>+		return -EPROBE_DEFER;
>+
>+	return 0;
>+}
>+
>+static void mtk_disp_ovl_adaptor_comp_unbind(struct device *dev, struct device *master,
>+					     void *data)
>+{
>+}
>+
>+static const struct component_ops mtk_disp_ovl_adaptor_comp_ops = {
>+	.bind	= mtk_disp_ovl_adaptor_comp_bind,
>+	.unbind = mtk_disp_ovl_adaptor_comp_unbind,
>+};
>+
>+static int mtk_disp_ovl_adaptor_master_bind(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+	int ret;
>+
>+	ret = component_bind_all(dev, priv->mmsys_dev);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
>+
>+	priv->children_bound = true;
>+	return 0;
>+}
>+
>+static void mtk_disp_ovl_adaptor_master_unbind(struct device *dev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
>+
>+	priv->children_bound = false;
>+}
>+
>+static const struct component_master_ops mtk_disp_ovl_adaptor_master_ops = {
>+	.bind		= mtk_disp_ovl_adaptor_master_bind,
>+	.unbind		= mtk_disp_ovl_adaptor_master_unbind,
>+};
>+
>+static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
>+{
>+	struct mtk_disp_ovl_adaptor *priv;
>+	struct device *dev = &pdev->dev;
>+	struct component_match *match = NULL;
>+	int ret;
>+
>+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	platform_set_drvdata(pdev, priv);
>+
>+	ret = ovl_adaptor_comp_init(dev, &match);
>+	if (ret < 0)
>+		return ret;
>+
>+	priv->mmsys_dev = pdev->dev.platform_data;
>+
>+	component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);
>+
>+	pm_runtime_enable(dev);
>+
>+	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
>+	if (ret != 0) {
>+		pm_runtime_disable(dev);
>+		dev_err(dev, "Failed to add component: %d\n", ret);
>+	}
>+
>+	return ret;
>+}
>+
>+static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
>+{
>+	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
>+	pm_runtime_disable(&pdev->dev);
>+	return 0;
>+}
>+
>+struct platform_driver mtk_disp_ovl_adaptor_driver = {
>+	.probe		= mtk_disp_ovl_adaptor_probe,
>+	.remove		= mtk_disp_ovl_adaptor_remove,
>+	.driver		= {
>+		.name	= "mediatek-disp-ovl-adaptor",
>+		.owner	= THIS_MODULE,
>+	},
>+};
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>index 3fb85776b8b3..d27561e5e274 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>@@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_ccorr_driver;
> extern struct platform_driver mtk_disp_color_driver;
> extern struct platform_driver mtk_disp_gamma_driver;
> extern struct platform_driver mtk_disp_merge_driver;
>+extern struct platform_driver mtk_disp_ovl_adaptor_driver;
> extern struct platform_driver mtk_disp_ovl_driver;
> extern struct platform_driver mtk_disp_rdma_driver;
> extern struct platform_driver mtk_dpi_driver;
>--
>2.18.0
>
>
