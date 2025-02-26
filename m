Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F1A46B9B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACB110E9D3;
	Wed, 26 Feb 2025 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hs0ihFLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7C10E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 19:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0nKWja8y7Glbsl1fYAv1qi5WQuD/NLSr3JYfajiPXt8=; b=hs0ihFLSM5j0sDz95O9m01ijKg
 s4oeN2j+nPmjaoZTuoUibprGH3gmeUQcQHw/fhhCq1+o9Efs77YfITVHrWZH35G6W1BnMsdgv1Cud
 4YGOu9/Q9HbiBe/7OqmA1KPu23LF7b12vF9gQFD5ur0Va3rgC3xuFRmHc/oVJj1V4/fJDy+fTGa+3
 /QCrp6tA21s9dGiq4wrf21XcC4I36oFp68AowW95RKmdc30R3Sce0uctkbK1bx2zZybHbDNVWj0Vw
 GuvyTNh5XXK/wMfaD4iIpczm+GQconrkARz6IWc7H5KEH0wOAdnTBqggzTNvMP0j0fKANNaLDQTaC
 Q2VK1A2Q==;
Received: from [187.36.213.55]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnNZC-0019lA-CW; Wed, 26 Feb 2025 20:59:44 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 26 Feb 2025 16:59:02 -0300
Subject: [PATCH 4/6] dt-bindings: gpu: v3d: Add SMS to the registers' list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-v3d-gpu-reset-fixes-v1-4-83a969fdd9c1@igalia.com>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, devicetree@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=UZZEmnmLRiLVAt7CCJZw0AzbMS+4b1g6yiItvZuf0ME=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDOn7ixaIl+5qWbrSMem9evP3vNrF/y4LsuyMi2h5OHdj5
 SHXAvuiTkZjFgZGDgZZMUWWH09iaxnFytk1l5VfhBnEygQyhYGLUwAmIjuTg6HBbP8XzcDtkRdf
 RK3I17329ddnwZjSc+k+/xX8L3/2tNXpfnn5e5OHrY/lZuNymechgpEWormfKi1ibAWcNl++Gf9
 0zY+t11449uoEaH7itspa88hZTHimUZTvqltnmm6uCvKp6W5l3WNV7l8UsVVcRm/Bv7qie43l6W
 aprgmn9pgxf6zKNkmPzctYxHntstM6zlc9T3ltTF8w3L08ffpdZ421QucLDir9X3Lm5KIzKowzu
 r+mTFLsVb4Wf+vC1qCUeVtnxMwUW88dXr7QW8m5grdSpEj8X/n8J62uNnKPZpzff+/Bd6kd/lcv
 vIsPUbtRFeDz4IlhCV9Uk5VbwfSg4mCBskQlS0lG82tTAQ==
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
V3D 7.1 core, add a new register item to the list. Similar to the GCA
and bridge register, SMS is optional and should only be added for V3D
7.1 variants.

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..8a3d3fc6065d7756da141bda4dc522f63be5e9a1 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -27,14 +27,16 @@ properties:
       - description: core0 register (required)
       - description: GCA cache controller register (if GCA controller present)
       - description: bridge register (if no external reset controller)
+      - description: SMS register (if SMS controller present)
     minItems: 2
 
   reg-names:
     items:
       - const: hub
       - const: core0
-      - enum: [ bridge, gca ]
-      - enum: [ bridge, gca ]
+      - enum: [ bridge, gca, sms ]
+      - enum: [ bridge, gca, sms ]
+      - enum: [ bridge, gca, sms ]
     minItems: 2
 
   interrupts:

-- 
Git-154)

