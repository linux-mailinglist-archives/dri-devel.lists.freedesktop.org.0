Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09218839FA1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 03:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0E10F5A8;
	Wed, 24 Jan 2024 02:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8EC10F5A6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpPo1KL4SfyxHnEpr5d3B56Iwt4+NqLjafW1KEztp6WvI2N/9f8fbogHqnQ1midaCZvj+bNjYq/uHVFFs4r6QSHkzItGrUiPhSYYDX5eJqR4utg2ViUkkzyiJtvyi7BJgEOIVhJR17dFlaWV6J4M1g2zbzQDZL2bXo6t793VfdcW5+n+HvcVhcu21atSmtltz5A3IHsNIO+N35A4CD+3y77AyLaqcbxqH3b4NpfYbEjKczxUmcmKULN+pCVXlprom0x/Zm41S4/Pc6T4DkobgnWOgmS87MvCDe1guFa6jwRVMHU7JgSgnM51LY6eZ73k4NjzuUbmmuAgTSplTQhzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mh8SYDYtZS4FEJxEJLtuXOIRmITcFUz9I9YrWBMw7k=;
 b=Nd6osq90nxS1RimFZlyfhxa/vgN8w44nCiGbqoNzPv2Fc5aC1foMmjHRnZllZDK1IGynFhR1jjAekJtUiqnwnMfVVXU/Tv5IpY+0jfM8lNEvMgZT1Yh1uA1+nxMEQfgW01KG2L1+tByrJlCsdzY6aCk+IZB+n0/5h83Qhr1Bt/1EWORfJPsYW3Wvfv2Ms7gNbGP84GARqfRxP8ypQqTWrpZ1XqaWwR3ffZ6EEabIk7ULQOmx2XLPgqP6xJA1UbXEPzs0wGMO4IDd+G4pjM6EUDe7yaSLRpu3eynYcEjq0DxVbxGamy992MiOXJY2QgeG8ETaWs2Uq/tYKH/S/+0X5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mh8SYDYtZS4FEJxEJLtuXOIRmITcFUz9I9YrWBMw7k=;
 b=qqvEriiwXk5Q1AYH4snZ1DlrFxAiVhGCjbBXtYPwePoHQG03YcFm16Pu87nm2bgluxuakt5iACaqluoy2jwkdaSwpn8CnJqh2W3eeT6ZR1MW4blSWNvbLVzmxYkb3LBT4UGLGOHdPvf+5dsWhWKqN2ZyodW0mXVyoRQPgavuN94=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by BN9PR12MB5340.namprd12.prod.outlook.com (2603:10b6:408:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 02:54:12 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::7f) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37 via Frontend
 Transport; Wed, 24 Jan 2024 02:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 02:54:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:08 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 23 Jan 2024 20:54:07 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/5] drm: xlnx: zynqmp_dpsub: Set live video in format
Date: Tue, 23 Jan 2024 18:54:02 -0800
Message-ID: <20240124025402.373620-6-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|BN9PR12MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd51ae2-9da4-4251-99e6-08dc1c87be9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zR5u6b4E2R6SgJ/+tCwfKyfUjaJf3llIWKwTUcC3c86oJWGGmennL6a5HTpgwEZxMluyhr7TferzfKNZOuB/lGOvVUKNM5LrckY+ZhjQ++NlrxuGH/IPvm8dxSLre0j1ofTqv7yQqrofnKEfVNsvX/TZavFrfugDomc32OPjVKhgYhiwu7S5NFq64rv4amFTFHYD5YA+FauFcyzCx3FOChLb+443Rn9BFlhsKrUciAS0tNUSCOrBRTufH4bT85WxaSVgk0z2r1AL+OwJZuj5POSh0CnaL1lMCTFRH28S9h0isD/z8wsCCKVRZC3pbbB8aUVCRpmAHkk4J92cAIoEr8ibbXjNz9tg2w7zjzP/Yro0nshHG3C2pzUGnJl3T/wKJMBME0pqyxw8AJTcZFBVHdyIJLv543xLK4WHrc5SojQPjQxsSS6XnwLpvZ5rusTWs5gp9UFaUkrhhZ+dLffwfsM7Szy2ntEyTSqyi7EwtMxvE97gSpcZZexVttD9TA673qL/nhOVPVYORMEGwn7nqmn82amR/z6JKxHEsSD54nknVXSmQzJXpibEkaudfj6jqXZPQvEviG91pTGNF9YdcB1qywhBl6kOW2mA4OrPF+AhyOpZCIieUPynWp7AtdcynIE1iU5xXwYEZWgoCU845x0Xm7Ldmm43S678NZWmU9v9VGevBDDO51vIVXv3EhIogGfqM7jzVqCCEKJAg+UArylk7EC7ob5H283E/Y9M5lxvRg6ZxVGMpZEBtzyNdpulOhxN2ofE3yKRTvLeURyl7Jnz7d5bTvAc6TUu+wABFhQ6NVYdIwX9K97uvHJAJKYm1+cXcvhfSlLoUbImdYDOoIExpn9OWIU46/QjWSJ+ecq4VV5S7ldUZU1TqPPAI9Yq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(921011)(70206006)(110136005)(40480700001)(40460700003)(2906002)(30864003)(70586007)(5660300002)(44832011)(316002)(8676002)(8936002)(81166007)(356005)(478600001)(36756003)(82740400003)(86362001)(26005)(47076005)(426003)(336012)(6666004)(1076003)(36860700001)(83380400001)(2616005)(41300700001)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 02:54:12.2549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd51ae2-9da4-4251-99e6-08dc1c87be9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5340
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

ZynqMP DPSUB supports 2 modes of operations in regard to video data
input.

In the first mode, DPSUB uses DMA engine to pull video data from memory
buffers. To support this the driver implements CRTC and DRM bridge
representing DP encoder.

In the second mode, DPSUB acquires video data pushed from FPGA and
passes it downstream to DP output. This mode of operation is modeled in
the driver as a DRM bridge that should be attached to some external
CRTC. DPSUB supports multiple input data formats. In order to properly
operate exact media bus format should be negotiated between external
CRTC and DPSUB bridge. DRM framework provides a mechanism to negotiate
media bus formats between bridges connected into a chain, but not
between CRTC and encoder (first bridge in the chain). This change
mitigates the issue for FPGA based CRTC, which would typically have a
single fixed media bus format.

Expect live video input format to be set as "bus-format" property in
connected remote endpoint.

Set display layer mode in the layer creation context.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 109 ++++++++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
 5 files changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 8a39b3accce5..a7115321b3fb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -18,8 +18,10 @@
 #include <linux/dma/xilinx_dpdma.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -67,12 +69,16 @@
 /**
  * struct zynqmp_disp_format - Display subsystem format information
  * @drm_fmt: DRM format (4CC)
+ * @bus_fmt: Live video media bus format
  * @buf_fmt: AV buffer format
  * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
  * @sf: Scaling factors for color components
  */
 struct zynqmp_disp_format {
-	u32 drm_fmt;
+	union {
+		u32 drm_fmt;
+		u32 bus_fmt;
+	};
 	u32 buf_fmt;
 	bool swap;
 	const u32 *sf;
@@ -354,6 +360,16 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
 	},
 };
 
+/* TODO: add support for different formats */
+static const struct zynqmp_disp_format avbuf_live_vid_fmts[] = {
+	{
+		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
+				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
+		.sf		= scaling_factors_888,
+	}
+};
+
 static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
 {
 	return readl(disp->avbuf.base + reg);
@@ -369,6 +385,34 @@ static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
 }
 
+/**
+ * zynqmp_disp_avbuf_set_live_format - Set live input format for a layer
+ * @disp: Display controller
+ * @layer: The layer
+ * @fmt: The format information
+ *
+ * Set the live video input format for @layer to @fmt.
+ */
+static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp,
+					      struct zynqmp_disp_layer *layer,
+					      const struct zynqmp_disp_format *fmt)
+{
+	u32 reg, i;
+
+	reg = zynqmp_disp_layer_is_video(layer)
+	    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+	    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+	zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
+
+	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
+		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
+	}
+	layer->disp_fmt = fmt;
+}
+
 /**
  * zynqmp_disp_avbuf_set_format - Set the input format for a layer
  * @disp: Display controller
@@ -902,15 +946,12 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 /**
  * zynqmp_disp_layer_enable - Enable a layer
  * @layer: The layer
- * @mode: Operating mode of layer
  *
  * Enable the @layer in the audio/video buffer manager and the blender. DMA
  * channels are started separately by zynqmp_disp_layer_update().
  */
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
-			      enum zynqmp_dpsub_layer_mode mode)
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
-	layer->mode = mode;
 	zynqmp_disp_avbuf_enable_video(layer->disp, layer);
 	zynqmp_disp_blend_layer_enable(layer->disp, layer);
 }
@@ -950,11 +991,12 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
 	layer->drm_fmt = info;
 
-	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
-
-	if (!layer->disp->dpsub->dma_enabled)
+	/* Live format set during layer creation */
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return;
 
+	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
+
 	/*
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
@@ -1083,7 +1125,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	unsigned int i;
 	int ret;
 
-	if (!disp->dpsub->dma_enabled)
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return 0;
 
 	for (i = 0; i < layer->info->num_channels; i++) {
@@ -1104,6 +1146,43 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	return 0;
 }
 
+/**
+ * zynqmp_disp_get_live_fmt - Get live video format
+ * @disp: Display controller
+ * @layer: Display layer
+ *
+ * Parse connected remote endpoint and retrieve configured bus-format
+ *
+ * Return: live format pointer on success, NULL otherwise
+ */
+static const struct zynqmp_disp_format *zynqmp_disp_get_live_fmt(struct zynqmp_disp *disp,
+								 struct zynqmp_disp_layer *layer)
+{
+	struct device_node *local, *remote, *dpsub = disp->dev->of_node;
+	int rc, i;
+	u32 fmt;
+
+	local = of_graph_get_endpoint_by_regs(dpsub, layer->id, -1);
+	if (!local)
+		return NULL;
+
+	remote = of_graph_get_remote_endpoint(local);
+	of_node_put(local);
+	if (!remote)
+		return NULL;
+
+	rc = of_property_read_u32(remote, "bus-format", &fmt);
+	of_node_put(remote);
+	if (rc)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(avbuf_live_vid_fmts); ++i)
+		if (avbuf_live_vid_fmts[i].bus_fmt == fmt)
+			return &avbuf_live_vid_fmts[i];
+
+	return NULL;
+}
+
 /**
  * zynqmp_disp_create_layers - Create and initialize all layers
  * @disp: Display controller
@@ -1130,9 +1209,15 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
+		const struct zynqmp_disp_format *disp_fmt;
 
 		layer->id = i;
 		layer->disp = disp;
+		/* For now we assume dpsub works in either live or non-live mode for both layers.
+		 * Hybrid mode is not supported yet.
+		 */
+		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
+						       : ZYNQMP_DPSUB_LAYER_LIVE;
 		layer->info = &layer_info[i];
 
 		ret = zynqmp_disp_layer_request_dma(disp, layer);
@@ -1140,6 +1225,12 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 			goto err;
 
 		disp->dpsub->layers[i] = layer;
+
+		if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE) {
+			disp_fmt = zynqmp_disp_get_live_fmt(disp, layer);
+			if (disp_fmt)
+				zynqmp_disp_avbuf_set_live_format(disp, layer, disp_fmt);
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 123cffac08be..f3357b2d5c09 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -62,8 +62,7 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 
 u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 				   unsigned int *num_formats);
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
-			      enum zynqmp_dpsub_layer_mode mode);
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..926e07c255bb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -165,10 +165,10 @@
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x00
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x10
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x20
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x30
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
 #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 9f48e5bbcdec..6fd7eab0f6db 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1295,7 +1295,7 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 	/* TODO: Make the format configurable. */
 	info = drm_format_info(DRM_FORMAT_YUV422);
 	zynqmp_disp_layer_set_format(layer, info);
-	zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_LIVE);
+	zynqmp_disp_layer_enable(layer);
 
 	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
 		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, true, 255);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index db3bb4afbfc4..43bf416b33d5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -122,7 +122,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable or re-enable the plane if the format has changed. */
 	if (format_changed)
-		zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_NONLIVE);
+		zynqmp_disp_layer_enable(layer);
 }
 
 static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
-- 
2.25.1

