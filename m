Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F0658D88
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 14:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336010E207;
	Thu, 29 Dec 2022 13:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D220110E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:37:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BADF1CA522
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:33:01 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B7FACFF807;
 Thu, 29 Dec 2022 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1672320760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxd5etkxm/QsMIFmem4kDzhHvir4o1D7dvjd5AYgtdE=;
 b=m6Qu5Vp/bAEdp58VnsZnJ6xKgmv8R10f3xFAf2DzU4DYXFUbuY8DsOMW43JIwedyRqW/OB
 iX8iZ9Njch9B2//I+NtNdgzkiG6g1mKMDp6izNTaJB8x+X/lRZubmblzzeNqxU66auFQqe
 K4t4hSjcenC/RqurzR5VfX/T1B59tqrXlIGfgvuPbWtbrZ+1Ut6I8ST3BSKoSZ6LWv2/6H
 pWv80yHJryuDoy+gIpzadfdUX2Rx/NjmOrzodelcaH3jzbtX4TuujT6bnWzC50Qndus1ZD
 EEVoesPF+fQPfJW8xm4bHdU4lTRPicziSWgds6mSaAfeSMU9k2c7tvh7SXBwsQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 09/21] staging: media: tegra-video: move private struct
 declaration to C file
Date: Thu, 29 Dec 2022 14:31:53 +0100
Message-Id: <20221229133205.981397-10-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct tegra_vi_graph_entity is an internal implementation detail of the VI
module. Move its declaration from vi.h to vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 13 +++++++++++++
 drivers/staging/media/tegra-video/vi.h | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c2724e1ecafb..4e48eaa0fbdc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -31,6 +31,19 @@
 
 #define MAX_CID_CONTROLS		1
 
+/**
+ * struct tegra_vi_graph_entity - Entity in the video graph
+ *
+ * @asd: subdev asynchronous registration information
+ * @entity: media entity from the corresponding V4L2 subdev
+ * @subdev: V4L2 subdev
+ */
+struct tegra_vi_graph_entity {
+	struct v4l2_async_subdev asd;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+};
+
 static const struct tegra_video_format tegra_default_format = {
 	.img_dt = TEGRA_IMAGE_DT_RAW10,
 	.bit_width = 10,
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index dd35c3ac992b..dfd834a69848 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -98,19 +98,6 @@ struct tegra_vi {
 	struct list_head vi_chans;
 };
 
-/**
- * struct tegra_vi_graph_entity - Entity in the video graph
- *
- * @asd: subdev asynchronous registration information
- * @entity: media entity from the corresponding V4L2 subdev
- * @subdev: V4L2 subdev
- */
-struct tegra_vi_graph_entity {
-	struct v4l2_async_subdev asd;
-	struct media_entity *entity;
-	struct v4l2_subdev *subdev;
-};
-
 /**
  * struct tegra_vi_channel - Tegra video channel
  *
-- 
2.34.1

