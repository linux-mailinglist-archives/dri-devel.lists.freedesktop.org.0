Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B0B446E1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025F10EAC3;
	Thu,  4 Sep 2025 20:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="k3D8n0+b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DIATLXcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0E10EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:02:55 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHr4Y5B27z9spd;
 Thu,  4 Sep 2025 22:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u0RpGGWqV5NASl/QJDnqetU+45dX5R5bWdYvRTzXBgw=;
 b=k3D8n0+bEsuU2Ukh+75IzedVHGB0G/C017eZG2RDXTkRAQpI1YITj4lmnabAtPKO0BYcCO
 8xttSN/hWmJDLJREEEgqMDyA9Zv4nDlc4apVH9kfqU6mCgYdwzVt31tsOLYraCRxGGI6Zx
 5GmxdjN5UDKAT1w6TyNG5l5vqOAcN+uH6ecXpmvx57ZKcBNnMMoorcba+JdOlndhaJT4A4
 zLq5rtRH7Nz2SnN95IiZVzOQwbhEDwX+Lc/yIu8XrqrI4yA+51Mq3ZkyUd8q1C1zJEm4dj
 luMavJz2p4b5vS5OvvqGARKORayXTi9ZtUrrIkmNDABRn901fGNaRAgKYOz3nQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DIATLXcS;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u0RpGGWqV5NASl/QJDnqetU+45dX5R5bWdYvRTzXBgw=;
 b=DIATLXcSvcXcOWZQc8l0dwJEYOve7ySE4+Qp41tOEpt8e6P6AdEFd7P3bN3FI6r7aGDmeI
 AV4M7XXxxwO9uniubbfYO7kL0shrSBXUwAUZZ+1P8fkQ1bvdFYfgBd/FYfmYMH0bm9m0kz
 Y4rZqwnM5/hhUNeG8KFrrVVJ2fPjaw94BoIfuyRWB9npwjbFByUlAvFnAMDWqMv3aMYKnq
 7HlNYZxRTG5cbcTkegm2YBaNsKnTfjXyMyEvppIL4iH0vsGtW3rZg4Bbah8R7idbnE2uzt
 MWuCpJL6j83Z6+2uWaTIQ2PF45Toaj3JmM/IijRlThrthpSS8cVfS2BxDD293g==
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
Subject: [PATCH 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
Date: Thu,  4 Sep 2025 22:01:54 +0200
Message-ID: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0bbc404cd03b4fe38b7
X-MBO-RS-META: w34czd1w43fce5e6qt4kzeo8d4dkmx3w
X-Rspamd-Queue-Id: 4cHr4Y5B27z9spd
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

