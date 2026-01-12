Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A4D15DE3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819510E2DA;
	Mon, 12 Jan 2026 23:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="c3KoTaTw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hP4vqZBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087D210E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 23:48:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dqpx93MyCz9tCT;
 Tue, 13 Jan 2026 00:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768261725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eUbMXuVri41hcEdHLFuizo5f7hR7q4K8BFuRxgKtq7A=;
 b=c3KoTaTwFujL/xgizZKeM6BoupPDwEVqO+bbzak2gcbBG1wRnnLNkd7k20DKUhZtEefJEG
 tX5E5raM/UVkFE7OcrnQ6kuWc5xEgyfpZdPmlNnEuFjLQDdi2KtjLX+FK+8oZWtRBcBFMt
 xe0cyjt0ADwVZdQQlLXD0Moh1CdhOxIBgBMaf1slIww0fP8EIVtBqaf/90whGUv1DQYsyU
 Uu7bgM1AfyjrtkinEo273fc+iJ5LplfWlcidT0j8L/nRa6kvUkJ6FxoS0KwBPpFkHuuQ8y
 gw/tlaJLV/S3e3j5BOA7mMlYuGDe4wLjDfEnWcvTtjiB78m0ZmrkJqaY66tYEg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hP4vqZBE;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768261723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eUbMXuVri41hcEdHLFuizo5f7hR7q4K8BFuRxgKtq7A=;
 b=hP4vqZBEc1SNC5xdJoBlhtifYNCPqa5I2iKsnAPN8ILmaUSP9w2G79BDjlIz2ehbfcUhwV
 fbbQ7D1VSdTI8ukn6o7IuDxjTtM1TwGAylFsUmN/TLpojADX8KQXAkJoelWcWTEitZKPIf
 GZ8yegGFMpFxuy0/OZKjz58fJcra1ajj/cZm6AcnsyxunW3hEKzgjlqCj3aSIQ2++sRsU9
 RW3nUOcUCHID9DrFet5MolTEc5Rv9E1RuP2otJb1/YoZCp1Qs9bM8OxLZQTcbV0r7ZQPoP
 4iAkFlD4ojFi32RH4Sxx0VtdDWZsvdlq3qfpKf5q4yNEu8k97Om6iej3SAtz9w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: waveshare,
 dsi2dpi: Document 1..4 DSI lane support
Date: Tue, 13 Jan 2026 00:47:38 +0100
Message-ID: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 65d4d573ca4b3c32f46
X-MBO-RS-META: 4pi3w94uourscirswxd786cx76bany7w
X-Rspamd-Queue-Id: 4dqpx93MyCz9tCT
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

Describe 1..4 DSI lanes as supported. Internally, this bridge is
an ChipOne ICN6211 which loads its register configuration from a
dedicated storage and its I2C does not seem to be accessible. The
ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
this bridge. The lane configuration is preconfigured in the bridge
for each of the WaveShare panels.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Joseph Guo <qijian.guo@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
index 5e8498c8303dd..3820dd7e11af1 100644
--- a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
@@ -40,9 +40,12 @@ properties:
             properties:
               data-lanes:
                 description: array of physical DSI data lane indexes.
+                minItems: 1
                 items:
                   - const: 1
                   - const: 2
+                  - const: 3
+                  - const: 4
 
             required:
               - data-lanes
-- 
2.51.0

