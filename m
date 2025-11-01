Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F414C27E77
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 13:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAAA10E2E3;
	Sat,  1 Nov 2025 12:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="efH/3QAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F2910E0BD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 12:54:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23050601D3;
 Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62912C113D0;
 Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762001682;
 bh=rDu4alBE9xc96IQ8M88D+0yqiGPw2gKwSwKTC6CV0mg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=efH/3QALhJh3vncaZPmjWA08dj7ABgo/ne3hYLiCD3gqEBOMI6NQyCemKlK+iBF75
 soAvnRkbZV4zIY3hpupyGOQsmfC2mgG3KV/CUMBqyci7bKZw5nT/Er3g9/GhWBa40s
 eBR78cK0auclU+giayq3aKmpQddno92+rtQ0xY4V7dJc95PJ/rd12VpQfBLzD4OSUV
 C/CApa19Bk20UFSBudC6bSqog4w6Ek13NmPW+VuASbrD6PZkXt3XUxXVeCuhlPX1nP
 cQPrngdZsWyPrSXRd64T87R9jU60RQG5OAk8LJQzMtUzVUtvxmBYvrCgHsJbm9gYAK
 G5e0ZHafcMBHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 528CACCFA03;
 Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 01 Nov 2025 13:54:12 +0100
Subject: [PATCH 1/6] dt-bindings: display: bridge: simple: document the
 Parade PS185HDM DP-to-HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-asus_usbc_dp-v1-1-9fd4eb9935e8@hotmail.com>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
In-Reply-To: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=812;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=OQShTopki2aCGWcGKpxk+5iRM+E9syn+/c170E3+gpU=;
 b=v10KXQFzQ1p49KCoi11KOfvf7wV76/VOoc6mzZMj5sAEC8d30AiU1ywFBJ9hoarSb3yPYwiGU
 zTGPqM+DFYwCLykcz91aTgzKiveMXc/u8fJKJhjguItS/L7YHoI0uZ9
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
2.51.1


