Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D00EA63601
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6F610E14D;
	Sun, 16 Mar 2025 14:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WnBuQ/LT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CA210E14D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JpQ/V4V8/BjMpi0+QIotZYziuJM0Co7C1OiSx5drf3E=; b=WnBuQ/LTZbRCTEmqDIYMbPS3Y0
 WrkYpZMKjLR+Last6xnA2WEG6zB2DeR6Z3BgwHwtMW+gv8oTC7wjN3fGpy7njTEYIjWCJQYNAod/h
 FlPPGhpIXpEYXmoBCTqFHbrBLn76EATtASIQ0DjxbFFqPERHmuWyI3rGjNrBAFpwK9/HIki0CDlJt
 Ca9QfKfdmAdFQEtLmat1teqgFXPMy7+Fp7fKzxsQaXHiPbI14Tpoy6GOSe/M07c84eh14CGf4E6Zo
 sCnV8yEhh8bemYXptIvXtHXTEmYxhW4buKyEO1m5XCBM0xxDeapXuwrag4A3sFzS0p/+01cNKepbs
 /uF3NGRA==;
Received: from [189.7.87.178] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tton9-0016D3-Er; Sun, 16 Mar 2025 15:16:39 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Mar 2025 11:15:10 -0300
Subject: [PATCH v5 3/6] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250316-v3d-gpu-reset-fixes-v5-3-9779cdb12f06@igalia.com>
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
In-Reply-To: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=1JHZXkfVPgyQWTcW1WUoMK2E5izCuOpjwsBoEycDAco=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn1t0y8ytSHryq4yXclfZcfnS2COX/3zaTHhdbj
 g/zPLQ19uGJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9bdMgAKCRA/8w6Kdoj6
 qpsmCACxoJIFL4hHl//RtLcHEahMSn/eT8AeVvF6YtbO5+NY25+71/ot8d/oWT/BBvWdMdZcmVL
 QfL07RmOv1SixynbjonaNmX9BtT+DzaXzeOKbe2Kba1j6jclF9UcRhNhSJyqxFp4Z41YJ189z0R
 uO8l0HTrcDknqaCvYt6V66RbPxi1ozYovf1EGBqGaNx0OiHy6f8OphxWD844mSSbh0eqsGPONGb
 gJg6eqP3a6XUd5p1/8aGJQa2XYlCu+3pW4CidN9NnBDG9b2Hy09JbIQCuJ3NkXU86yH5acKLHWR
 ezk5USmpg6b06NiZCoMtVb3Pa4o0NwcHEJcyJMmJgKlXBXmJ
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index c736b3b00ed2c259c263615bdc2bc1899c8961f8..766a310ab653855d7cc9a80f18c2083218fe307e 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -77,10 +77,12 @@ allOf:
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

