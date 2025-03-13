Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7CA5F8E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0273910E8C2;
	Thu, 13 Mar 2025 14:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dem+SQj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B710E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hGOuamMSkBkgB1uiAeAodBYuwsjFtZOlYclf9AOrTik=; b=dem+SQj3/UUsdId4+/dkPFS+qw
 6DLtDpBmw0AMrBeEVTe6oRLRCcFrLdP45uucF+wuKybrGZv+dge8Nci5auBvqGPkrRMJ4MRibYBWm
 Cn3uEbl/jHNSyi4dJFCuR2sNF9uv9yylFeuD5f6dadFc6h/B7XT6v6Fp5GJsmWjIH888BBPY2f0CY
 k3EBh7uL7gbtOaL1GmkMFd2+28SbOH+PDPsUND4GC6bg7s2ugKrJRSD4P/4OViis2ZzsBpmpRKCsu
 W4mzGbZ2Ai5PVA+vBrWS6Pre5YztYL84I0NrRexFowsMavcApAYq4VhvNSMZoP6+8+wuDoet1kx5z
 ZIkc3KLg==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsjpi-008Cju-F8; Thu, 13 Mar 2025 15:46:56 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 13 Mar 2025 11:43:30 -0300
Subject: [PATCH v4 5/7] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-v3d-gpu-reset-fixes-v4-5-c1e780d8e096@igalia.com>
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
In-Reply-To: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=r5imuymP4X0zUGvpGaAkVo75JWLZIVFCwbk+odMdqSc=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0u/IYGgl95UOhl6r1F1d0Quk4tDL7e4Vs4Dlk
 A1q211C0oaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9LvyAAKCRA/8w6Kdoj6
 qsDXB/sG5DkDOjt0FoT+GPSiTTIsYZ3k2uUdRaJf94Qlb730EoVwMp0hr+qutLNGXyreilcjeRr
 sC4fp124VLFgb/ogR+jxlYZ8SlF/BteqOenlhRbrzv0A1j+TXcYAwLMn2Jv9B+z2PlhaGWs0ifL
 /sNBOL3RUMXFv/NgmWEZCHHIsZ13GIvlPnK1n3UiluDkBkp6mbKrMzROXCu2Fv8g80aBOLwVWx9
 N73Tl5Pfnt7DsUFi8LwRSXPAmmiyg60CMMSnflCihkBQRBUwLuyB0bHa7eh7tUsB8byIH1m1XAY
 y9gHuzfnY26px+ViiTxKISwZpIiohQZFaheyKqfFVkfRYbcy
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
V3D 7.1 core, add a new register item to its compatible. Similar to the
GCA, which is specific for V3D 3.3, SMS should only be added for V3D 7.1
variants (such as brcm,2712-v3d).

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index 9867b617c60c6fe34a0f88a3ee2f581a94b69a5c..739e8afcacebe63ac6cd8853a58750f4f83146d3 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -81,10 +81,12 @@ allOf:
           items:
             - description: hub register
             - description: core0 register
+            - description: SMS register
         reg-names:
           items:
             - const: hub
             - const: core0
+            - const: sms
   - if:
       properties:
         compatible:

-- 
Git-154)

