Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFF219923
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493D96E9E9;
	Thu,  9 Jul 2020 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6489C19
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5171C102B;
 Wed,  8 Jul 2020 13:43:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2CTtQl9zYZdP4
 8ecrZFGcu5o0wTAWbI+Td/UJrPcJVs=; b=oNA/4oSL5m55fwQ9t7MSB+Rxk8Yaf
 AlguCjWE7tRu5au2ZIEXSZpaDx2CYJmmbEyvWdSq0h5JHT31V/BxP6XWLj5bWkJU
 fmyMO2zzrpx/SWBaVJF7Swo0OGd4PPGhbJqFjKPXo6JilD13OkP+e1BEupp3UhS5
 BYqeoZ5papnaKAYEPG5fFMsCt8zmLePPMFJjihCK7C55GcQdizzZf4JWAornVs6E
 EE4mcYIKQ4ITTWDZ7kdFCe+83zrvlsCPKJELCVxMtiAp9KpITZKEMFEwulTSPeJ7
 Tf/DqgvWFX+HTG6f31xVw4WnDtNNZjvZXzjIaS+8iOs8om1MkV72Etweg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2CTtQl9zYZdP48ecrZFGcu5o0wTAWbI+Td/UJrPcJVs=; b=UTugaYck
 n0DJa7IIL91QbQuGsdoVvruZbz/q/6Chs/X1p6fNL2FBk9l6houzsJ6pzRx5xOkb
 WV1H6me3+vd0M5AiITiD0L6xCzLb87W4+xNr42/4lcIFzKI+ZrkRr+BBqCy1KWBt
 qS4OihuI1D691qmgaxBvJ+17hHWuBq+rjc8NABE1UnDzvB3ZvQDQHVQXgv/O0u/b
 Lv9ETWoP/qFpqaEP9Ca6Mz3AovE5s6xpaBgm03VCUGZWJw8Rul2f1WnDJ5dIbPDc
 zVe0A5pJU1lK5YP768aUXD9nxS6EKfbrNOcMNL05vCKzRY8iGYTl/bgkJjIk7uGc
 NMgBtS31ub2L3Q==
X-ME-Sender: <xms:vQUGX_VtYmyF6ashk11_Jk_0qNy-ET_--Nn2zwaOGOhzOF_duUwKWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vQUGX3kLhbAAKz1t0pilEkZJs1feK7s_lPyGTLZBmZ-hgFgKpC1n4w>
 <xmx:vQUGX7bw4ClAFtPz0EuG8oGxSK9BMGF6P1W-Zs-RPsorg-leyB71_Q>
 <xmx:vQUGX6Vtte1JDiST4WSEgHYy0VxmWy6ZEUi7n7Ltw9Hw8Lr4VAiJcQ>
 <xmx:vQUGX_VlHGFpUXHMTHjdByS6DHqghr-nnX2AZTV-ZnkJEEZytdTDNZptGoo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BD07328005D;
 Wed,  8 Jul 2020 13:43:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 38/78] drm/vc4: hdmi: Use debugfs private field
Date: Wed,  8 Jul 2020 19:41:46 +0200
Message-Id: <e525fbbaf61454712c1ae8d281c68392b83ec541.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're calling vc4_debugfs_add_file with our struct vc4_hdmi pointer set
in the private field, but we don't use that field and go through the
main struct vc4_dev to get it.

Let's use the private field directly, that will save us some trouble
later on.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d9e48fbd7519..f6b4a05a7d96 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -183,9 +183,7 @@ static const struct debugfs_reg32 hd_regs[] = {
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *hdmi = node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_print_regset32(&p, &hdmi->hdmi_regset);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
