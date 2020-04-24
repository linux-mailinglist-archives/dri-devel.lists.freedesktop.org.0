Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1391B84C8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 10:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B40D6E1CF;
	Sat, 25 Apr 2020 08:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909E6EB5A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 20:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587760495;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=lF9dyjLoZHjudQmO6ZwMP9Mys6YNoJtGMfbh9ODYzHA=;
 b=IVyzrrLw3IFTJZjEyP2M0Bknm8yhNwd1OUx5qLsFyJBJy4+dkxbsp4IgC+Tgr5F1o3
 vmUuDcRyycOFhMV05w4tkeaql2YNwhE+v65eiciWwS8CjANYt3w7BxsLgZ/AjoNsMMkm
 LAb0ffEL+3Y9+wR2/dV1IIWiHtxLNGgY9k0ZFeBAo38qg56lzPwGwVFJLN9mGGmH6EfK
 iFjieZ0WrQpW6m94CowF4c8r1VFz78OS/ikyvFiIe3bR4eGDxd8KMpJMaFC2HBhQl7ZQ
 +TQUk8BdiwekbKMCSsVcrBzeupMm9G8QQNhojRRlIcfF5nYYrBIQEERxydiL+MhcqyBW
 yMQQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GK44R2FE"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw3OKYKEVB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 24 Apr 2020 22:34:20 +0200 (CEST)
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
Subject: [PATCH v7 03/12] ARM: DTS: am3517: add sgx gpu child node
Date: Fri, 24 Apr 2020 22:34:06 +0200
Message-Id: <de2646a8a63a27ea5570c8845670e56ed218bd3c.1587760454.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 25 Apr 2020 08:42:24 +0000
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
 Philipp Rossak <embed3d@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Jonathan Bakker <xc-racer2@live.ca>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add SGX GPU node with interrupt.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am3517.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index e0b5a00e2078..3fce56a646d1 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -138,10 +138,11 @@ sgx_module: target-module@50000000 {
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x4000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,am3517-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x0 0x4000>;
+				interrupts = <21>;
+			};
 		};
 	};
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
