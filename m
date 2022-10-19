Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842FD604B68
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEAD10F27B;
	Wed, 19 Oct 2022 15:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103B110F27B;
 Wed, 19 Oct 2022 15:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcU0HgrLx+d3LeQTaSN8Rwpxe8G6lI7RUOvS4VGJRxRofmm2QeKgU5lNfcgCWoQaczPFebPlB8xOAp+ukq7h26ZZ5Df+6SFreCzb3bq5AQG92XTcmWA0Bd33hRBdp2oPh4rc2mpZj2Rzb8yaHd898uK40fdMgloYL5ebo9mzyQTLEMECLJNFDtYgfbNe0z1FvAjrNH7POU2Yv1R+REMofADUJqR7KrUaIbHOhROm+FdqKsk7oQuv/efbsTXVklFgK0Gvzy/mFQI4my2SNJH6EShOri2bymP6w2hWRASHczh5Cf0QKWWIHiMD0TUgMwan6XD3/tZzyj32jPM2VjwqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENBBsTyalW/y8wKCBMnMIg8dft+2cF5nQ8rM29eME4Q=;
 b=Y3YELUNaARa+FBtiVu/2u0VC/4T5cbP60liTb+QCTZmNfNNSvXC6psEFYC2J56DEfxvGsCjBgPD6TSgLewH98LGlOv5BwR6hP4lGDsTvP6DeD1YP5OZPDpljxVjKK15Prf34IAnGjbmmD3ZwPl+1MiAvUGfx78arG0N/X2Au3b+zDVpoL9w+ZFWIXGRmAUOr8ZtbR/L7ThH2udoLov7p8vqvnhM335Wyzd3DutZbrcybHZnEK4xJvHtQKK8j2bdM4Wr/edmrdh85IIUQ0zom9FtRR8CIwyb/P6/oeYPbwa+KmC/HsXwv0NrtH67R2yC190BH7dBroiybgFIWKY8jIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENBBsTyalW/y8wKCBMnMIg8dft+2cF5nQ8rM29eME4Q=;
 b=QWX5LgeScpkVEs3xOwuxCbfO3g2Xo2dnjFBvjpTv+G0/qT0pIcWoiVbe+CncvfRqx6jARX2oQ7BeoeEL1cTssMA0bxKKl/ZDXrpuhER+byacvcH+lP+7TulKQJYHWwEH+crc+VD9Vioby6BmLCFrmJ26NK+3KOGYyhqwWaRGBQk=
Received: from DM6PR06CA0030.namprd06.prod.outlook.com (2603:10b6:5:120::43)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 15:29:40 +0000
Received: from DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::cc) by DM6PR06CA0030.outlook.office365.com
 (2603:10b6:5:120::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT098.mail.protection.outlook.com (10.13.173.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:29:40 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:29:35 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 4/6] =?UTF-8?q?drm/nouveau:=20fix=E2=80=99s=20on=20ttm=5Fr?=
 =?UTF-8?q?esource=20rework=20to=20use=20size=5Ft=20type?=
Date: Wed, 19 Oct 2022 20:57:34 +0530
Message-ID: <20221019152736.654451-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT098:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e223010-495e-4c0b-209c-08dab1e6bd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: btzmF9VY2MmPNkeQ8+LbQnmqOc0egqtj95/HPNfwQ/Ryq3/uZ7ypNGcAVnj7rVo1B9m+UtiGzbk++VrBJWKy3BjQx9amSycJMRsVidq9ifTz+QqT/0ThnHk3acKJq9ll7S/6iFrfQ25s9FpDkPGdIzdtjteF0D+ECw+pZpDMQlJQ4aUJhNryPwZlvRwsOwcfxGR2gP6pz8aH3PtRfaIIKijg/sAv3nVWScW77orssR7VlPkrzaGcy8q3bD2ANU2U1RPHz68vw4oJR83oxeSsuzcs2fViVaRODz7uqSrYmvBK0lJAS3SaDSdXaBzyeXCh2n1gVV3FvkwIhO5lHzDoIIczNoeFzGt7isK4KwcdyVhGsQqfImw1FZeEawAla71KsleidmcXfXwZdU2N6DatU0rRuL3na5PrvSGty8fXqgiWnCj/L2JVK36UiNSAIamwwi7m0FwDS45hIdKbDXjiSto3qCpf8zwj3LwVIfxL8Odk4Z9Fdhoef39fs9mfzg5QhfJ7CveA6otNUf/C/MQtQqpQwrpMqO1HLsh9rfe/KZexqHBv+IGo5xW/7m/iuAAW7MqK+GWTP/fqZ4t1Uc91uiRHLQ4mBUxPpFHevJZu5p+M9auzEEudrP3oXxTNpreR9TjluwHMPiFr/pt54Lad9RJ6uWJuWTY9u3wdocXxPfx7ab6cWbhs0O724BXhJ3jEotUbERkZ81TjL76w+nzZ/z+LgyA+Gyruejor+uVddesExxaB4OG862Mu36L1gA6UUemNyWIpboENezQ8F80XqwSXWOTWCgvNjLBqrvOEB9+N6Z8+FW7kjcnWZGpkj6dTD23QUxFnoSWaqk5I3jwNxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(4326008)(36860700001)(7696005)(26005)(82740400003)(40460700003)(1076003)(40480700001)(41300700001)(47076005)(478600001)(8936002)(426003)(86362001)(81166007)(83380400001)(336012)(450100002)(70206006)(70586007)(356005)(5660300002)(2906002)(110136005)(36756003)(186003)(16526019)(316002)(2616005)(54906003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:29:40.2173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e223010-495e-4c0b-209c-08dab1e6bd4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the ttm_resource from num_pages to size_t size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c     | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo0039.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo5039.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo9039.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c    | 5 ++---
 drivers/gpu/drm/nouveau/nouveau_mem.c    | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_ttm.c    | 2 +-
 11 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 126b3c6e12f9..16ca4a141866 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -532,7 +532,7 @@ nouveau_bo_map(struct nouveau_bo *nvbo)
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages, &nvbo->kmap);
+	ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.resource->size), &nvbo->kmap);
 
 	ttm_bo_unreserve(&nvbo->bo);
 	return ret;
@@ -1236,7 +1236,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	} else {
 		/* make sure bo is in mappable vram */
 		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
-		    bo->resource->start + bo->resource->num_pages < mappable)
+		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
 			return 0;
 
 		for (i = 0; i < nvbo->placement.num_placement; ++i) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index 7390132129fe..e2ce44adaa5c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -52,7 +52,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	u32 src_offset = old_reg->start << PAGE_SHIFT;
 	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
 	u32 dst_offset = new_reg->start << PAGE_SHIFT;
-	u32 page_count = new_reg->num_pages;
+	u32 page_count = PFN_UP(new_reg->size);
 	int ret;
 
 	ret = PUSH_WAIT(push, 3);
@@ -62,7 +62,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_BUFFER_IN, src_ctxdma,
 			       SET_CONTEXT_DMA_BUFFER_OUT, dst_ctxdma);
 
-	page_count = new_reg->num_pages;
+	page_count = PFN_UP(new_reg->size);
 	while (page_count) {
 		int line_count = (page_count > 2047) ? 2047 : page_count;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index 4c75c7b3804c..c6cf3629a9f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -41,7 +41,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
-	u64 length = (new_reg->num_pages << PAGE_SHIFT);
+	u64 length = new_reg->size;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
 	int src_tiled = !!mem->kind;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
index ed6c09d67840..9b7ba31fae13 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
@@ -44,7 +44,7 @@ nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
+	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->size,
 				0x0308, upper_32_bits(mem->vma[0].addr),
 				0x030c, lower_32_bits(mem->vma[0].addr),
 				0x0310, upper_32_bits(mem->vma[1].addr),
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
index dec29b2d8bb2..a15a38a87a95 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
@@ -44,10 +44,10 @@ nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	struct nvif_push *push = chan->chan.push;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
-	u32 page_count = new_reg->num_pages;
+	u32 page_count = PFN_UP(new_reg->size);
 	int ret;
 
-	page_count = new_reg->num_pages;
+	page_count = PFN_UP(new_reg->size);
 	while (page_count) {
 		int line_count = (page_count > 8191) ? 8191 : page_count;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
index 776b04976cdf..d2bb2687d401 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
@@ -42,10 +42,10 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
-	u32 page_count = new_reg->num_pages;
+	u32 page_count = PFN_UP(new_reg->size);
 	int ret;
 
-	page_count = new_reg->num_pages;
+	page_count = PFN_UP(new_reg->size);
 	while (page_count) {
 		int line_count = (page_count > 2047) ? 2047 : page_count;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
index 8499f58213e3..4618f4f5ab56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
@@ -37,10 +37,10 @@ nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	struct nvif_push *push = chan->chan.push;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
-	u32 page_count = new_reg->num_pages;
+	u32 page_count = PFN_UP(new_reg->size);
 	int ret;
 
-	page_count = new_reg->num_pages;
+	page_count = PFN_UP(new_reg->size);
 	while (page_count) {
 		int line_count = (page_count > 8191) ? 8191 : page_count;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
index 575212472e7a..07a5c6302c98 100644
--- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
@@ -58,7 +58,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 				PITCH_IN, PAGE_SIZE,
 				PITCH_OUT, PAGE_SIZE,
 				LINE_LENGTH_IN, PAGE_SIZE,
-				LINE_COUNT, new_reg->num_pages);
+				LINE_COUNT, PFN_UP(new_reg->size));
 
 	PUSH_IMMD(push, NVA0B5, LAUNCH_DMA,
 		  NVDEF(NVA0B5, LAUNCH_DMA, DATA_TRANSFER_TYPE, NON_PIPELINED) |
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index fab542a758ff..2f479c96e415 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -679,7 +679,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		}
 
 		if (!nvbo->kmap.virtual) {
-			ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages,
+			ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.resource->size),
 					  &nvbo->kmap);
 			if (ret) {
 				NV_PRINTK(err, cli, "failed kmap for reloc\n");
@@ -868,8 +868,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			if (unlikely(cmd != req->suffix0)) {
 				if (!nvbo->kmap.virtual) {
 					ret = ttm_bo_kmap(&nvbo->bo, 0,
-							  nvbo->bo.resource->
-							  num_pages,
+							  PFN_UP(nvbo->bo.resource->size),
 							  &nvbo->kmap);
 					if (ret) {
 						WIND_RING(chan);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 76f8edefa637..1fde3a5d7c32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 
 	mutex_lock(&drm->master.lock);
 	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
-				 reg->num_pages << PAGE_SHIFT,
+				 reg->size,
 				 &args, sizeof(args), &mem->mem);
 	mutex_unlock(&drm->master.lock);
 	return ret;
@@ -128,7 +128,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	struct nouveau_cli *cli = mem->cli;
 	struct nouveau_drm *drm = cli->drm;
 	struct nvif_mmu *mmu = &cli->mmu;
-	u64 size = ALIGN(reg->num_pages << PAGE_SHIFT, 1 << page);
+	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
 	mutex_lock(&drm->master.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 9602c30928f2..1469a88910e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -139,7 +139,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 	mem = nouveau_mem(*res);
 	ttm_resource_init(bo, place, *res);
 	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
-			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
+			   (long)(*res)->size, &mem->vma[0]);
 	if (ret) {
 		nouveau_mem_del(man, *res);
 		return ret;
-- 
2.32.0

