Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FAC612CB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 11:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBB310E142;
	Sun, 16 Nov 2025 10:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GAhxUu+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B310E05B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 10:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5406544495;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29D82C16AAE;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763290345;
 bh=rPe4gyipcIF7HL0/VyaXz4O56VvUmhrk2PiF4giFqO8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=GAhxUu+qgwBkn21RjhUIzQk3Pepzp2ofUhPqwFY4VCg0U30pnR5flp3Igj4LEHRnF
 LLtpSokPonzdggaIKjNOR9tAgac6On2jeW2TmkhJoNHj24tILOAY78BifIbL6cnhPj
 OtniCiQQhYPiCZCo8S40al/fXXvbqDw+LpyTYYu1/cqWoVSy27Rrjnqe7DLP2T82sZ
 JFuES7RMRiY4V1+lX3SksIfAVHKUgq50rivJxuCVP4qZ/5hNTkwEhKStg0GW/Ne5KC
 X9eTq/QOdYKLmU5Q3YS5rC0xPGZaZv10eJDqFrs3Ca8mIdEYzWVuz2n1DMTVF6GCJZ
 RvOIKBkJrJSuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 177F9CD4F3E;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:06 +0100
Subject: [PATCH v2 1/6] dt-bindings: display: bridge: simple: document the
 Parade PS185HDM DP-to-HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-1-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=876;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=0pWqVth8tq9Q9WV6wD5wdXxK/GglHDQWiUHPPE01118=;
 b=uCs7Uzr//Sc6LSh9XEE6yvwKOOc/vLSwvHLq61xg4rTW5BnoOg1NobJSdkfZNBWj7DKnG5NcQ
 Ii0T4jpO91xCHXS/0llKwPEIIsTz5fympxxJy77s0cy0jC8w6zpcU7d
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 9ef587d46506..950268632370 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
           - ti,opa362

-- 
2.51.2


