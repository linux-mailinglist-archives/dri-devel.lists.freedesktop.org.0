Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F87DC76C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925E10E415;
	Tue, 31 Oct 2023 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D6410E417
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RyOH+5XohJsIi1BgqWOXofRQQQgrLCw4FAt/fm6z/yk=; b=PGtix28Zf4pAIEsP4nKidFn+f7
 huANLzHOeBDGKkkye39AHonmxcBa0p3WKZ4Y1JXbx8+tbZHTOC6f4WAB4IoamKHiye39bhyRlkw9e
 K0JUM74BPxm7yTs48GG8xbds71OmjUBUWw7jQBrWYQp2deNtknGblZTVrxS8zvIIGcIwBYA1Q2FXE
 kVBIsQPUSNhE5rwFfWaN0uOh3cRfXiahY0T6bgkLNOAitTfhvcQaA58rinWweUsG6FGds6LFrK98y
 9mFAvwij9iuTlU4WCx9jjwsZW/mHHxNjc68jTnxJWFwHS+Gco2U9xFKbxReucCYJpKvTz5PTHI7lM
 6ws7In1w==;
Received: from 251.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.251]
 helo=vega.mundo-R.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxjLW-00FHU5-63; Tue, 31 Oct 2023 08:39:30 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org,
	Maira Canal <mcanal@igalia.com>
Subject: [PATCH v3 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Date: Tue, 31 Oct 2023 08:38:58 +0100
Message-Id: <20231031073859.25298-4-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031073859.25298-1-itoral@igalia.com>
References: <20231031073859.25298-1-itoral@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 Rob Herring <robh+dt@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its specific
compatible to the bindings.

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index dae55b8a267b..dc078ceeca9a 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - brcm,2711-v3d
+      - brcm,2712-v3d
       - brcm,7268-v3d
       - brcm,7278-v3d
 
-- 
2.39.2

