Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC725C938
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 21:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C006E20E;
	Thu,  3 Sep 2020 19:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7609D6E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 19:14:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5334320DD4;
 Thu,  3 Sep 2020 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599160494;
 bh=5wEJhG2qmYzHCfFTECenuZ9F/HtYOo5DQI6qyiDLdrE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=2FC8aimwkuS5Ij29DocsCjkGFX8YLW5sNerkU/tTLZUNN1YWCZoIqD7qV2OsuBL0c
 2mVDDSB0VtORO6hzQuBoCvWDF9Gm4xPzaigkWrZyG/SsaQFVZwCx+K0dBnshRkEHgO
 Nl8mejAC2BVFBo/OVwsbHUgAZMJRTwbTt9tTFksU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: gpu: samsung-rotator: Add missing
 properties
Date: Thu,  3 Sep 2020 21:14:36 +0200
Message-Id: <20200903191438.12781-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903191438.12781-1-krzk@kernel.org>
References: <20200903191438.12781-1-krzk@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add common properties appearing in DTSes (iommus, power-domains) to fix
dtbs_check warnings like:

  arch/arm/boot/dts/exynos4210-i9100.dt.yaml: rotator@12810000:
    'iommus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add properties instead of using unevaluated
---
 Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
index 665c6e3b31d3..f480174fe0d3 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
@@ -22,6 +22,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  iommus: true
+  power-domains: true
+
   clocks:
     maxItems: 1
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
