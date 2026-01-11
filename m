Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D383FD0E6C6
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 10:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12F310E082;
	Sun, 11 Jan 2026 09:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="oN9hi+cB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at gabe;
 Sun, 11 Jan 2026 09:05:32 UTC
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1D310E042
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 09:05:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1768121947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2qIhBHdruxrsrN5s9W/Zj5ognfZkeHYHVmMGj3CpRs=;
 b=oN9hi+cBLu8Qx2bzZumQ3t99HWUQIPvficYZ4E2o/KSwnFtNE3ZZ7t+awUE+U/5MsA/X+M
 4aQSdISqktobutuKEhVJOYEpjRy5wYjibYIspnN74kAgUL1CBXLhqSwVApO21RSxOwPQVr
 n9HJ2/l0KXJPFfNvL4vseX2tNb0r14dr1fOIPL9mr3G9dSuJivo02yaF/lxGCnwfXYe+C1
 hDy28BGFtvluLlXnoAV2ZjXe1zlcLUgWOldOumBn7WkL0HuDAha5nAcO1YcnbDA6wHQc6U
 BzgJEa8cTV0VF7NCB6WqukkMNuVjexTffoaNavbU18z8puj8AyTiqfY7aQb8Mg==
From: Val Packett <val@packett.cool>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: display: bridge: simple: document the
 Algoltek AG6311 DP-to-HDMI bridge
Date: Sun, 11 Jan 2026 05:35:10 -0300
Message-ID: <20260111085726.634091-4-val@packett.cool>
In-Reply-To: <20260111085726.634091-2-val@packett.cool>
References: <20260111085726.634091-2-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The Algoltek AG6311 is a transparent DisplayPort to HDMI bridge.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 20c7e0a77802..e6808419f625 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -27,6 +27,7 @@ properties:
           - const: adi,adv7123
       - enum:
           - adi,adv7123
+          - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
           - parade,ps185hdm
-- 
2.51.2

