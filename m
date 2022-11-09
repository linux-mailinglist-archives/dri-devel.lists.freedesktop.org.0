Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899AC623DCD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C43A10E699;
	Thu, 10 Nov 2022 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DEF8920D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2995CD04AE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:19:50 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3E45AFF810;
 Wed,  9 Nov 2022 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MfEY6qNJmle8dG3mVnv/FdB23DDX5FGvXt/PgtRbi0=;
 b=EFRdtXEFhEhia1JbEDNKzAwCB9Mh+yP6b4KjqO4lqyA2HbNmAGzMByMAiDqMOXS1ueUluO
 PWumd/t60Oh3NdRsm0rCUdtc5XHCxGQrEyml82bS/b/0oZAFq14Ce3aMwJ2Brd+68GdR2G
 Oyp8hY/RQz+lE71RibbuIhjfevqZkIr9VOWmZVlOQDV1jdwQE1BmbPgzk8PPytXC4W6cRw
 AKaQTUcpWHBrUDAORmfyhX2tljzxmsysZJEcD6l+ljZIhr9MbV3B/yji3VL/cCN7hMejaA
 0l+Olv6wYYRjXDtKe5urnbxXIObp77ERXqeiiIz1vw9WWgCeIz1qTiwSIQ/xpg==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 11/23] staging: media: tegra-video: move private struct
 declaration to C file
Date: Wed,  9 Nov 2022 15:18:40 +0100
Message-Id: <20221109141852.729246-12-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:29 +0000
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

struct tegra_vi_graph_entity is an internal implementation detail of the VI
module. Move its declaration from vi.h to vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.c | 13 +++++++++++++
 drivers/staging/media/tegra-video/vi.h | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 2657207e5b7d..55a135bef1a9 100644
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

