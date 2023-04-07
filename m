Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA96DADC7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F1C10EA60;
	Fri,  7 Apr 2023 13:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DF910EA60
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 13:39:42 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id F41121BF20A;
 Fri,  7 Apr 2023 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680874779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aH/0pWDWwHi66R8zw0a+KvHzUfrz5U6/JqZutTqpfXk=;
 b=mo8B7zRHs18+LKmTXK7HQsnbwaxzdPbsrpVMw+9CmmNwNFMr8/U0y+sh4fJhaQEeQARAhR
 fWLsZZZtf5M4ufd2hRCzsetrmDKoWNL+F+BwuFMPb77P3YDv80baPSeOfP+gFp5TGxvoHO
 1qamylGEgkyTAN+DTmH2q8YdelBnGINcMBs4TcntZpHwOL6iBBYAbRlN/D6/haZDPktbIG
 dCS82Iy6bvQuoR6lM2y9I9KKUQm4f9VqTlhkHAlDfHPyQaBZJjI5m67MBDWNppuhBbFnsE
 PeSPVYrtsouLJQi8MI0j+/tsbh52zMRvnrjg4bgf3A7wzcaW/R76VJNURkM4ng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v5 05/20] staging: media: tegra-video: fix typos in comment
Date: Fri,  7 Apr 2023 15:38:37 +0200
Message-Id: <20230407133852.2850145-6-luca.ceresoli@bootlin.com>
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

Add "skip" in "so we can *skip* the current channel" or it doesn't make
sense.

Also add articles where appropriate to fix English grammar.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 44c56dc85980..79dd02a1e29b 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1859,10 +1859,10 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 	 * Walk the links to parse the full graph. Each channel will have
 	 * one endpoint of the composite node. Start by parsing the
 	 * composite node and parse the remote entities in turn.
-	 * Each channel will register v4l2 async notifier to make the graph
-	 * independent between the channels so we can the current channel
+	 * Each channel will register a v4l2 async notifier to make the graph
+	 * independent between the channels so we can skip the current channel
 	 * in case of something wrong during graph parsing and continue with
-	 * next channels.
+	 * the next channels.
 	 */
 	list_for_each_entry(chan, &vi->vi_chans, list) {
 		struct fwnode_handle *ep, *remote;
-- 
2.34.1

