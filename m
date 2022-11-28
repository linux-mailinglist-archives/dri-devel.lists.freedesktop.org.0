Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7463AC41
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 16:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCC510E236;
	Mon, 28 Nov 2022 15:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48B10E206
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 15:24:36 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5FD1910000F;
 Mon, 28 Nov 2022 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669649075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xURqg5VhnwpWjIFhJeVPGCVtr+haaQvdgkjCNGPG9f8=;
 b=jVYFNWHq+sJjS7uz59THV4bh6mQnodC7z6V/HeqtYVk19/PWhr3CfgtbuE5/Gk80yr9NWX
 Xh9ypfvpZdVy/j8Ms/UgNsXY/cG09cRREuwahll5Xi2WWNGYfLu8G6ubPcCgmlYpjvandq
 yp0XJqQtjKfBjxbyU9gAoA12KjT8GAfX4Ucc1/gx9Pgb9367tx4P850y23//ElUCLmvoj4
 LQwjVeS/KbIsf/3RI+dMQsM4s3lrs3bGP7kRLF5UpnL2mTQk4ruE3g2btcOOcsJIwnKMSe
 7f7x9X7aYHjRaPwvHhweyBnyfsgx4P3stT2BijC7AwZP2mUxZZ7bXym8/sxkMg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 06/21] staging: media: tegra-video: fix typos in comment
Date: Mon, 28 Nov 2022 16:23:21 +0100
Message-Id: <20221128152336.133953-7-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
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
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add "skip" in "so we can *skip* the current channel" or it doesn't make
sense.

Also add articles where appropriate to fix English grammar.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 8a7512ce2273..b24b9353077f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1762,10 +1762,10 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
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

