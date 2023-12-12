Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CDB80EB86
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1218610E5FB;
	Tue, 12 Dec 2023 12:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DA010E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:20:12 +0000 (UTC)
X-UUID: c7163c0698e811eeba30773df0976c77-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dbD8O1No6ELbDIE/2OQGZ6qruLLxbx5BCWm7Ga8QiXo=; 
 b=bBOkYn4QiHIfjsqbWpIMSXHS0kmYIVFOE6oSp87MLPSwwidje6Mb+Jh9LlgZpfauHO1Oh9tZWiicpYV8DaynTCaJPlveqwPQA3LH9tD+ThIR+1/Ia0FR28iEYYCkuuh4s2dZSTBRNA5A6Jx/BT/i7z83M00ssOrCqyh1zFx6zqs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:5d01109f-7de4-40d2-a89f-5bff6fd6c9c0, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5d391d7, CLOUDID:a8a8b373-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7163c0698e811eeba30773df0976c77-20231212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 509732317; Tue, 12 Dec 2023 20:20:03 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:02 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 17/17] drm/mediatek: Add comments for the structures
Date: Tue, 12 Dec 2023 20:19:57 +0800
Message-ID: <20231212121957.19231-18-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.416000-8.000000
X-TMASE-MatchedRID: DmIE4Tvg5l+4pD9RIlWSGkOLK43kW8U2SjyMfjCRfaPfUZT83lbkEJJo
 t8xOxyL5vhH72H3yPfSvM8tTrzz8JopsQeZV7e/ekDpLRKO9xhSl9VzHf0qr7qvM+zzl/BSTnws
 uROZLCaS5j7tLcdeHTevPanPbI41jL47TD00zmvIyDra4i6b7VFg3VqSTJ7SoBlt4RZwvTdU4bl
 3o5NgJi1hchnpql2OeYVpVTb4KUCIRXrSqR8jJuUhEDfw/93BuYQXxsZnRwoLDTXM3VzSaIpG/q
 oYvgCpndHIwi5HBo1kEGuB4DQT9H3Mp9PZvqqsOMSjlkes0Ka9/r8x3wtvaX1fXgfL55inv9sUL
 EBDqysJYA0BuCSp3oHN0bGsqI3dfRcriDaoCTGJIcJTn2HkqsXcF/0kiqyh4937Ck3f1gVGn/hn
 1bFHD3d5yDFr9us0hTVsTalxdyw21DfGM6db7Xxes/RxhysDbTxfDNc/bKf56bqISdYJSGr1g9p
 Qs6Oo9R4+ZNLoF3plfpDE3h+Imb5cFdomgH0lnFEUknJ/kEl7dB/CxWTRRu25FeHtsUoHug45pb
 8X/zrO6YE652/HW6BgXfxN81f2+1dAzLJAY5Lu+68HqACCvKA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.416000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B0E336AC218068CC60C43F713E6D55F12403E587E79AC0CF073E5DF3B5911E802000:8
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments for the structures to improve readability.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 21 +++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 22 ++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 32 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 15 ++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.c        | 11 +++++++
 5 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f019737078f6..78e5327ceda7 100644
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
index fad728690db7..beefa5804911 100644
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
index 38d08796fae4..af80c9e50d36 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -46,6 +46,38 @@ enum mtk_ddp_comp_type {
 
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
index 3d6c1f58a7ec..6430433fd20d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -28,6 +28,21 @@ struct mtk_drm_route {
 	const unsigned int *route_ddp;
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
+ */
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 30eb2c3d95c0..eae72deacfd2 100644
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

