Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B011BABD0B5
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BCF10E127;
	Tue, 20 May 2025 07:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JMbN3d8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDDE10E127
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:44:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7014EA4DF93;
 Tue, 20 May 2025 07:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064D7C4CEE9;
 Tue, 20 May 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747727086;
 bh=2XGlz9R8H+zhZDJ5kNa0PjUKq77CWh9IQL8V2XTDtw8=;
 h=From:To:Cc:Subject:Date:From;
 b=JMbN3d8DC8scld5c7jdCdayYQkAyNvArAuJCNCr6X8yEvCHsZOje861OunHeqkq05
 kR3CCwYXYG4y3XZaVuuYV/N5XZjNflV/Fy7P/P5ttuX0RtEjBitLPmR9LeWqfs1HfX
 9QJLowFXp6606GR3T32V9hqHKEK4qkerzd4OGW/Zaevn7KTpw1HDal2adE+GR/EJEg
 sRdCmeNMdZ6IUhOBoB7q5VtM2Msnqgwn2iTGdBlQ1a9t/pkgKCxdV3ft6XyVj7eujH
 Oy7thN/SuZpn3g8maPPSfXWqmFoyEj5VKPy4dHq1HdJzhrttZRa9ts1GHJbfhdLkCJ
 SgXncVH5xJxjQ==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
Date: Tue, 20 May 2025 09:44:38 +0200
Message-Id: <20250520074439.655749-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54..1ac1f0219079 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -57,6 +57,8 @@ properties:
       - auo,g121ean01
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
       - auo,g156xtn01
+        # AU Optronics Corporation 23.8" FHD (1920x1080) TFT LCD panel
+      - auo,p238han01
         # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
       - auo,p320hvn03
         # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
-- 
2.39.5

