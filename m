Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A0855ED8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158CA10E580;
	Thu, 15 Feb 2024 10:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cca/FaGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ABC10E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:11:30 +0000 (UTC)
X-UUID: 937b9668cbea11ee9e680517dc993faa-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xmUFyIMD/TgqRbJ7GQkbUHjiBaVTDM/R7c369Zef1g4=; 
 b=cca/FaGdZ+wm7wexaWcv2cE9ytBfdT14bsJRqth190zbX3PLBHxX/IhK0aLaPrCfDCTzo6LQDVhb9ZoH8Z+DqrCyp4KjBmrriqiNPgx0ljq7N3IbpoXALIwp+pshb0xBinQOghElUNdpmXIlGttrreFR440Vu6Y5gjHBdA5eg/w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:eb22be69-f81a-4cb0-b26a-20227e25cbbf, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:67636b80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 937b9668cbea11ee9e680517dc993faa-20240215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1852985467; Thu, 15 Feb 2024 18:11:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 18:11:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 18:11:23 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Sean Paul
 <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 13/13] drm/mediatek: Add comments for the structures
Date: Thu, 15 Feb 2024 18:11:19 +0800
Message-ID: <20240215101119.12629-14-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240215101119.12629-1-shawn.sung@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.975300-8.000000
X-TMASE-MatchedRID: Gep7kObvpEO4pD9RIlWSGmNW0DAjL5p+Wot5Z16+u76OUV82NDH4AnB4
 4IkzjfYyThbvLLI8RvMwZQM0AWPWgNwrRLDk2cbi9Jn/ZrGuc8EK3iJpXUOQQ/NhzIgXtFJVPMA
 rurUD4iIZuRDUp90meSglNnWlJnT+XZXnjooQdcj/VoEOchXiKfngX/aL8PCNUE1mmrDSX3/ZGr
 fobCG633WrcTrQpH0eKmWOtem/9LIspGg/D8oKmYdlc1JaOB1TXru95hSuhjRaW2Ktn+I8/jEGF
 jeZwyRUnbrivw+lJ4g/Z/74EQY5HV+bIMgmNlCEq0j38LygEqSHqtBkN6Eg9o3V8N0KgLoaLikh
 fBJEpmlIbT6B+f046SEX93Xmp5MMIg67HHizFeGXZ9FWlXKjpGYoy6wSP7IF33Nl3elSfso57kF
 jOTI5JcAWmWwzJ75gJeq6/Pd92m7MHUInqqZ02o9hRjNfZeOXMVx/3ZYby7/FJnEpmt9OE+aX92
 YgSYLB6u/xkAmsI959Vk7adRpFX0CbGlypKMBDjc2CQSoA3RH25PfmnPqD743xexyACqYgo8WMk
 QWv6iXBcIE78YqRWo6HM5rqDwqtJzhY1fP3Cl+1sj10naDFSiTlA/5e44yH/1zXNPJNdJ+Cc4gt
 Ze+DZw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.975300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 590B25C83335607A233B4FE573EE9F7EC9BDA74535F899966DD674CB5D6EFD4B2000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments for the structures to improve readability.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 21 +++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 22 ++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 32 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 17 +++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.c        | 11 +++++++
 5 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index cf35783ad4b02..b92c5c3c590a0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -164,6 +164,20 @@ static const u32 mt8195_ovl_crc_ofs[] = {
 	DISP_REG_OVL_CRC,
 };
 
+/**
+ * struct mtk_disp_ovl_data - ovl driver data
+ * @addr: offset of the first layer (layer-0)
+ * @gmc_bits: gmc (gating memory clock) bit masks for adjusting positivity for ovl
+ * @layer_nr: layer numbers that ovl supports
+ * @fmt_rgb565_is_0: whether or not rgb565 is represented as 0
+ * @smi_id_en: determine if smi needs to be enabled
+ * @supports_afbc: determine if ovl supports afbc
+ * @formats: format table that ovl supports
+ * @num_formats: number of formats that ovl supports
+ * @supports_clrfmt_ext: whether the ovl supports clear format (for alpha blend)
+ * @crc_ofs: crc offset table
+ * @crc_cnt: count of crc registers (could be more than one bank)
+ */
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -178,10 +192,15 @@ struct mtk_disp_ovl_data {
 	size_t crc_cnt;
 };
 
-/*
+/**
  * struct mtk_disp_ovl - DISP_OVL driver structure
  * @crtc: associated crtc to report vblank events to
+ * @clk: clock of the ovl
+ * @regs: base address of the ovl register that can be accessed by cpu
+ * @cmdq_reg: register related info for cmdq (subsys, offset ...etc.)
  * @data: platform data
+ * @vblank_cb: callback function when vblank irq happened
+ * @vblank_cb_data: data to the callback function
  * @crc: crc related information
  */
 struct mtk_disp_ovl {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 6cb1ed419dee7..b4f7b3d3bbeb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -28,14 +28,30 @@
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
  * @enabled: records whether crtc_enable succeeded
+ * @pending_needs_vblank: determine if we need to handle vblank event
+ * @event: the vblank event to handle
  * @planes: array of 4 drm_plane structures, one for each overlay plane
+ * @layer_nr: layer numbers that the crtc supports
  * @pending_planes: whether any plane has pending changes to be applied
+ * @pending_async_planes: if there is any pending async update
+ * @cmdq_client: a handler to control cmdq (mbox channel, thread ...etc.)
+ * @cmdq_handle: cmdq packet to store the commands
+ * @cmdq_event: cmdq event that the thread is waiting for
+ * @cmdq_vblank_cnt: vblank count that is dedicated for the cmdq thread
+ * @cb_blocking_queue: wait queue to determine if cmdq is blocked
  * @mmsys_dev: pointer to the mmsys device for configuration registers
+ * @dma_dev: pointer to the dma device (usually rdma)
  * @mutex: handle to one of the ten disp_mutex streams
- * @ddp_comp_nr: number of components in ddp_comp
+ * @ddp_comp_nr_ori: number of the components excludes the route (origin)
+ * @max_ddp_comp_nr: maximum number of the components in routes
+ * @ddp_comp_nr: number of the components in the current path
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
- *
- * TODO: Needs update: this header is missing a bunch of member descriptions.
+ * @conn_route_nr: number of the components in route
+ * @conn_routes: route to the connector
+ * @hw_lock: mutex lock to avoid race condition when layer config
+ * @config_updating: determine if the layer configuration is done
+ * @crc_provider: get crc provider of the crtc
+ * @frames: count the frames that are added to crc entry
  */
 struct mtk_drm_crtc {
 	struct drm_crtc			base;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 231017470607e..dcf8466b8f857 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -48,6 +48,38 @@ enum mtk_ddp_comp_type {
 
 struct mtk_ddp_comp;
 struct cmdq_pkt;
+
+/* struct mtk_ddp_comp_funcs - function pointers of the ddp components
+ * @clk_enable: enable the clocks of the component
+ * @clk_disable: disable the clocks of the component
+ * @config: configure the component
+ * @start: start (enable) the component
+ * @stop: stop (disable) the component
+ * @register_vblank_cb: to register a callback function when vblank irq occurs
+ * @unregister_vblank_cb: to unregister the callback function from the vblank irq
+ * @enable_vblank: enable vblank irq
+ * @disable_vblank: disable vblank irq
+ * @supported_rotations: return rotation capability of the component
+ * @layer_nr: how many layers the component supports
+ * @layer_check: to check if the state of the layer is valid for the component
+ * @layer_config: to configure the component according to the state of the layer
+ * @gamma_set: to set gamma for the component
+ * @bgclr_in_on: turn on background color
+ * @bgclr_in_off: turn off background color
+ * @ctm_set: set color transformation matrix
+ * @dma_dev_get: return the device that uses direct memory access
+ * @get_formats: get the format that is currently in use by the component
+ * @get_num_formats: get number of the formats that the component supports
+ * @connect: connect the sub modules of the component
+ * @disconnect: disconnect the sub modules of the component
+ * @add: add the device to the component (mount them in the mutex)
+ * @remove: remove the device from the component (unmount them from the mutex)
+ * @encoder_index: get the encoder index of the component
+ * @crc: return the start of crc array
+ * @crc_cnt: how many CRCs the component supports
+ * @crc_entry: get the pointer to the crc entry
+ * @crc_read: call this function to read crc from the hardware component
+ */
 struct mtk_ddp_comp_funcs {
 	int (*power_on)(struct device *dev);
 	void (*power_off)(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 414764b4546ba..8ee1f36a6c2b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -33,6 +33,23 @@ struct mtk_drm_route {
 	const unsigned int route_ddp;
 };
 
+/**
+ * struct mtk_mmsys_driver_data - capabilities for the mmsys
+ * @main_path: path of the main display
+ * @main_len: length of the main display path
+ * @ext_path: path of the external display
+ * @ext_len: length of the external display path
+ * @third_path: path of the third display
+ * @third_len: length of the third display path
+ * @conn_routes: routing table of all the possible connectors
+ * @conn_routes_num: number of the routing table for the connectors
+ * @shadow_register: whether or not shadow register is enabled
+ * @mmsys_id: multi-media system ID
+ * @mmsys_dev_num: number of devices for in the mmsys as a whole
+ * @max_pitch: maximum pitch in bytes that the mmsys supports
+ * @min_width: minimum fb pixel width on this device
+ * @min_height: minimum fb pixel height on this device
+ */
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 30eb2c3d95c0b..eae72deacfd2c 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -82,6 +82,17 @@ struct mtk_ethdr_comp {
 	struct cmdq_client_reg	cmdq_base;
 };
 
+/**
+ * struct mtk_ethdr - ethdr driver data
+ * @ethdr_comp: components of ethdr(mixer)
+ * @ethdr_clk: clocks of ethdr components
+ * @mmsys_dev: mmsys device that ethdr binds to
+ * @vblank_cb: callback function when vblank irq occurs
+ * @vblank_cb_data: data fo vblank callback
+ * @irq: irq that triggers irq handler
+ * @reset_ctl: reset control of ethdr
+ * @crc: crc information
+ */
 struct mtk_ethdr {
 	struct mtk_ethdr_comp	ethdr_comp[ETHDR_ID_MAX];
 	struct clk_bulk_data	ethdr_clk[ETHDR_CLK_NUM];
-- 
2.18.0

