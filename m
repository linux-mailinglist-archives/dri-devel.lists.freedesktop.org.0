Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB684B447DC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77D10EADC;
	Thu,  4 Sep 2025 20:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vMLCBk8Y";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aeVWcsDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407610EADC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:58:01 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHsJ83szSz9smB;
 Thu,  4 Sep 2025 22:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2tq3gJuMl6bujxraVEKI0u7CgBG/jl3cRzPkCwMKG2o=;
 b=vMLCBk8YkWBvz/PFjcduKg+r4TzMPk7VDdBYmSGoasVlces2+tfk17uuhhtOnO2te6lXrZ
 ar92hicJGO9ftEE3xRn6qJ5uAJGs+nelrNDrYsUAn+SeCZLOKumzcIn5z3lN5qYUNdCaTG
 UKQGhuXulwJprfNZL2lXtAJ1+JH7tZCkqtPy95VpA00JkdHf04GhXq/XGDXPLPkAgEgvSZ
 OJLtbwpKDu/EpX2fgr50D9cMW98w+jQW+iC69mq0p+pwAahyaB/xRPFCFNo5AsppoRNat1
 RcaDKfZKSDmB9Rwt3fHY13cc/ZauU+BBFYc3l1oU6LL2qywNcv+lJ39mymA4ug==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2tq3gJuMl6bujxraVEKI0u7CgBG/jl3cRzPkCwMKG2o=;
 b=aeVWcsDlpIVswZj8/EikCEm4qirrSbmxdwp9bZkp2MbD3yBsxP5kAwvYxd28cL5qD+SP6k
 x+lmiiwbmTyDqMgegKlTehJB6RAfHKJF8AkcdArFT1M7SoZT6bNscxSBLmBzd90i88MHbM
 7FTTU/0mT3xiv00wXIFKhsT6w1mRvI9DYW7FJx3HVB63nJT1kDClTy1vjbxQbKAlPWCIL1
 tL1ugp7HC8CYTmi4KcM6itXfMM8HSbX5beAeKZlzc0e1EPTw6nXbu8dO56D94asGcWHie3
 7GM4CLTy2IfDj1mVTwKg2vhP5a6cM05E7HCmSolkW6PHWKDRglf/GBQhpw1Njg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
Date: Thu,  4 Sep 2025 22:56:56 +0200
Message-ID: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 06307c98fe897621fb7
X-MBO-RS-META: nfqh8c7aa7fuyjwrp938qe7zft84q5p7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index cf0aa996e072d..34a612705e8c4 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -20,6 +20,7 @@ properties:
           - bananapi,lhr050h41
           - bestar,bsd1218-a101kl68
           - feixin,k101-im2byl02
+          - raspberrypi,dsi-5inch
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
-- 
2.50.1

