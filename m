Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE055BA72
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFAB112D3D;
	Mon, 27 Jun 2022 14:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFBB10E864
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3RZNhqSXaBemYpK95C/QUsbwl34QNC+TMEjvvF8sTFQ=; b=DG8RvTVbNQcnMUAyCqF+aVOPx6
 F3wv4yK9cVXcGePIRg+bKrS19pX5GwQQ1G5j2gkwZ5qciTdz59vRhWTs8M8UBmjh1UZfMANLQ1qLJ
 gvsyZYgT9jC0C18C+sBG+YjXqOQxyOoNZhQUUGHzCQ7ZC1F94LHU2/tAe6Wga9onTqW8iI2OSLl2G
 GVG0hfLV9RjyOK5NMV9IACDuZ10j8tVyk7QWpfGBUkWxKcT89uj0YVHB+9Nus4sz9N1Setv2eEcmf
 MW36ZJzySM4SO88o7EqPH1xdT56UCrQqKnt/ZYtBoV7an8klfxgXYs+a8MV96wLTMYklXZzILG1EC
 MF03XVVQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbM-003N2J-RE; Mon, 27 Jun 2022 17:20:31 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 10/22] dt-bindings: host1x: Fix bracketing in example
Date: Mon, 27 Jun 2022 17:19:56 +0300
Message-Id: <20220627142008.2072474-11-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

The bracketing for the interrupts property in the device tree
example is incorrect. Fix it.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index e6056e9445a7..5fe25e0a8d48 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -238,8 +238,8 @@ examples:
     host1x@50000000 {
         compatible = "nvidia,tegra20-host1x";
         reg = <0x50000000 0x00024000>;
-        interrupts = <0 65 0x04   /* mpcore syncpt */
-                      0 67 0x04>; /* mpcore general */
+        interrupts = <0 65 0x04>, /* mpcore syncpt */
+                     <0 67 0x04>; /* mpcore general */
         interrupt-names = "syncpt", "host1x";
         clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
         clock-names = "host1x";
-- 
2.36.1

