Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DC1AB917
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4006EB05;
	Thu, 16 Apr 2020 06:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555F6E91A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939755;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=iwq6f4uxoyZcQOQDzwMpNIO6Xy6nAFRtGvlqeQKWcIs=;
 b=HdhpO71UW0V0F9TqS6expiVWnOwlMht9W2x6gjG5TUK/7vybY8NNh9e5zcE9dF1g30
 lERKyNGSkQP1XhTX1ZpuY4NnGuwTkoT6u38F52tJYAIZ0w5WWTeAUdNoS7N9hkC6UYti
 CGhNho6BqTLDzeOuw9nst4utH9WPPbHTYjVa7F2j0p2Qha14SCrZV/goDENIEL0lToRS
 pAhSPTSxAcgyWQ9AlxxU9IJiZyalmKlYhGPqgAW7FP+eNDTTYsCVTgig9tlv+0n48g9b
 jXumLeW7IyQOwSXUm2vPpj/0YLYQIR6PmQJUTSXI1atKcp09TJJP3YI5osObehmiInPi
 /MSw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F8ZS0Iw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:35:28 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v6 10/12] ARM: dts: sun6i: a31s: add sgx gpu child node
Date: Wed, 15 Apr 2020 10:35:17 +0200
Message-Id: <fed0dc035c2e7cfe068588d7b5232924d2960ab1.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philipp Rossak <embed3d@gmail.com>

We are adding the devicetree binding for the PVR-SGX-544-115 gpu.

This driver is currently under development in the openpvrsgx-devgroup.
Right now the full binding is not figured out, so we provide here a
placeholder. It will be completed as soon as there is a demo available.

The currently used binding that is used during development is more
complete and was already verifyed by loading the kernelmodule successful.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/sun6i-a31s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s.dtsi b/arch/arm/boot/dts/sun6i-a31s.dtsi
index 97e2c51d0aea..669770d2934a 100644
--- a/arch/arm/boot/dts/sun6i-a31s.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31s.dtsi
@@ -59,3 +59,13 @@ &pio {
 &tcon0 {
 	compatible = "allwinner,sun6i-a31s-tcon";
 };
+
+&gpu {
+	compatible = "allwinner,sun8i-a31s-sgx544-115",
+		     "img,sgx544-115", "img,sgx544";
+	/*
+	 * This node is currently a placeholder for the gpu.
+	 * This will be completed when a full demonstration
+	 * of the openpvrsgx driver is available for this board.
+	 */
+};
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
