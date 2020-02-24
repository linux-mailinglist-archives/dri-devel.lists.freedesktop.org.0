Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685316A2B3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B5B6E38A;
	Mon, 24 Feb 2020 09:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387586E220
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 3F09E60A;
 Mon, 24 Feb 2020 04:09:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TS5KQbCSo9nqw
 zFlRo9+6nosro4Q4hmS5FkRXvdZ5Nw=; b=R6wAQSQ6TZ4vaX1/NSarfT9jtNVtu
 67fIqbY/wMNcxyK9ij5TFJ2AfFI+b2ElnAV9CtFpjxEWPCCZLf/zx6yGYQWvMzyE
 93/WpKd+JHOgxXlCNoV7LzYDOZs4CJ+I7DvrGRW7M1mGZFE9eoz415fIwPMxAHuS
 2dkV4EC187bnb22WM0mnqqHres8CUkqKDLmHfgv+QUAuoppfcavGwg1yM+PPa3Mc
 jfiev7dKG8XcvbqH+29ot6iO8v+nsMphp7N7xPf5vWuY0qpdagp+9vVN9lqi58Lz
 C8l8IxWJIp4WrUUKHPkeuXcWHr9ZBK/Uq62Ulgeas92DiFVSwEaC2RJpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TS5KQbCSo9nqwzFlRo9+6nosro4Q4hmS5FkRXvdZ5Nw=; b=YWujkwc0
 LBM+r6oGNIOJRkiP01sZXQ7j8+aBq3l7HqLGp/pjhyysrjVCTiPBVWuGKt7b8ZQ4
 +0FQMWFMKdhR/52TAmNNwanGCs17Xze9A2q7LAhRL0GEPew7gbJU9aUl/JFUmNqj
 jZ4weYsXlqrIZwZIzpZ+4sHkmv/mbuTOS0+X72Q2uElLk9mc5k5mcZyvfAMmPnRz
 exaTFtuE8mtOG/2EAuzUgNH+BM6yF9VhlqCWhWc2hp+hLnXw/Fd3tu5kU80+F48b
 TsbiJoZDopdRHgbbqlMNDWGO46DZch3WBzKgb3QginScecmBzELqes6p7ankEo/i
 81QG9mp3noES/g==
X-ME-Sender: <xms:wpJTXiV6u9P-Mg91f9eHLtp7WqUB1bL2qIu34l9SoVboNPOm5C9kqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudejnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wpJTXgnHGEbiDBHra7wUZOll1UGY9d2Z0fT_OW4x2s2fqxxhP2FmQQ>
 <xmx:wpJTXquJ5RcRq7H22rtUIhy-xJVAf4DCx0CbAfz9usp9tGgL5BId4Q>
 <xmx:wpJTXhhc87sQ-PH-YLNJzP2aKLNtbziLRlg0V45F3RsVROqKUzqEZw>
 <xmx:wpJTXlaci1rG_v0tNkUQ3Ss_bprE3-fBSvmLcXCoQDEFvBI9tIa0EofDNiQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7ED733060BD1;
 Mon, 24 Feb 2020 04:09:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 23/89] ARM: dts: bcm2711: Add firmware clocks node
Date: Mon, 24 Feb 2020 10:06:25 +0100
Message-Id: <8398a0655c7e544db5e8cc71e2338fe7aa222035.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Now that we have a clock driver for the clocks exposed by the firmware,
let's add the device tree nodes for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index d1e684d0acfd..4742e1a77a65 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -12,6 +12,12 @@
 
 	interrupt-parent = <&gicv2>;
 
+	firmware_clocks: firmware-clocks {
+		compatible = "raspberrypi,firmware-clocks";
+		raspberrypi,firmware = <&firmware>;
+		#clock-cells = <1>;
+	};
+
 	soc {
 		/*
 		 * Defined ranges:
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
