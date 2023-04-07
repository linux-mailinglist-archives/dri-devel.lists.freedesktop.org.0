Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46836DADD1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B879E10EAA7;
	Fri,  7 Apr 2023 13:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EADA10EAFA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 13:39:59 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8874C1BF206;
 Fri,  7 Apr 2023 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680874797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJDY9VLOjAm0U6o1WP9jLg5I8rh9YsDWVtTFxXS87zw=;
 b=WuXAakOmOjF3NcMfLb7aijl9MpDsF5Pas5VZcx3wovJo3Ho4U7wXQP3XFf24c4K5702CUC
 munDXiq3AgmdqfO8BiU9WYP0QK3f69zYva9X+FwoKBr+ZnqVtdrO4nqeCD8wtOf4LrcAMg
 ehmvt+IFFOnO5fLQSw3cPDUVMXcOxRfa3SaewKE0p28A5SC4jEX0tyJDpz7B9+epeeMfgh
 gL6LbzsA2NxXCXN0iNEhUuJzdTp43D9UGqSppYS+/LRODorgpT8fhUd2oCyIYnM/S3w4Q9
 QXaPAH73bENeKkQvIJlqGr+0dBRQJG0/6d/4lUb7i6oHfemlA9zJ77lv+CNBUQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v5 08/20] staging: media: tegra-video: move private struct
 declaration to C file
Date: Fri,  7 Apr 2023 15:38:40 +0200
Message-Id: <20230407133852.2850145-9-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct tegra_vi_graph_entity is an internal implementation detail of the VI
module. Move its declaration from vi.h to vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 13 +++++++++++++
 drivers/staging/media/tegra-video/vi.h | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index ce4ff4cbf587..db98d06351b4 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -32,6 +32,19 @@
 
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
index 5396bf53ab75..9959cbe02ca0 100644
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

