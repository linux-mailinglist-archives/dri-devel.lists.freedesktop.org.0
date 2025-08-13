Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0FB24562
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C9210E6B5;
	Wed, 13 Aug 2025 09:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k22fezY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689810E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755077212;
 bh=11w7t7zhO72bKApbRTzhV3WgYHOscMthRkOh7Z5hAOQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k22fezY0h0tYbdC3RUleVKUUK5k3424TlpCjs3dSo5LtiNeTMvi3px5zHoMpXv4wS
 t0UBRhUMRrr3mZ9MAhXfjOBN2dpJMmx90Uvy18CJiSi6lAzpOS17Kw2x3eJS8/uvdy
 mWY+dSNuCgASbUpFYeYRg21bJyz0Rm9OfGzgv+mMynDQoHGj86w6ul1zyCamlmx5vN
 vxaqzGkPe9DQYHzMKRUx7Y8Jp9p8XhDogpd3HzwfsyZQW7ZCM3XYguuMnRmso8DW2R
 7cULRu9mUyYBZ5HyP8bb5yYivMtSVKhLvEhGG5oJTQOQn2Y1hv4baW8Er+iafsEe8l
 MaRbDejGJJGAA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 192B917E00AC;
 Wed, 13 Aug 2025 11:26:52 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 13 Aug 2025 11:25:42 +0200
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-mt8365-enable-gpu-v1-1-46c44c6c1566@collabora.com>
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
In-Reply-To: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077211; l=1002;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=11w7t7zhO72bKApbRTzhV3WgYHOscMthRkOh7Z5hAOQ=;
 b=O8QMM7cimLtdue9wMkMVhb5ZMnZRNXW+HVuPEJvDa7lncx1u0aXiG0bbv4kczItPKVMefCCcj
 TTaqh9IfTuaDECcn9ug8KcN56f7sDvCOSwVNj0D2QJi34oXW8DK/Xhf
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

Add a compatible for the MediaTek MT8365 SoC, that has an integrated
ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index be198182dbfe0dba61176f7205b08be131f4845c..db49b8ff8c74864afb25fdde40174d521c72c6e7 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -22,6 +22,7 @@ properties:
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
               - mediatek,mt8186-mali
+              - mediatek,mt8365-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali

-- 
2.50.1

