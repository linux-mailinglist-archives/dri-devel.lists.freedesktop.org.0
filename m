Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78600A66482
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 02:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321CA10E1CE;
	Tue, 18 Mar 2025 01:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sj4PzN59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2202910E1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8NxVomW9DWAYhxW1+ZIVolnO/+UNs5eeSPgtB/h/M8=; b=Sj4PzN59A03zaO+q3OMLF2+6uZ
 wXiulUB+WrDhqxWV2ZMhwlCPlzL+stJ6IzhfUxRgT6CPuOYj2q7v7RXBnhClHG0lR1FHGZprjZQWV
 Rnu6j2RuY8T9SHnhxUR4e/PzO8A1NOj6tD9dda3d33haHa+uNnQCBLE3d0KZqd1TTcyFtyy7XPhg/
 5ISjzflSwTHz+axuQ65XUSVW6H28+otFVePXYUI++DGLPxgR7xLqhcFYKhhfmP+K17CjvA32fiK1p
 f5EMyrdrfCoB0yvGnEyaissv5hfkMUx/QZnDF0AT0PxbSzwq1ENmj3eSslCo/fpLxbikOAKq2bmsW
 1ORbAteQ==;
Received: from [189.7.87.178] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuLMh-002UCS-Od; Tue, 18 Mar 2025 02:03:32 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 17 Mar 2025 22:01:11 -0300
Subject: [PATCH v6 3/5] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v3d-gpu-reset-fixes-v6-3-f3ee7717ed17@igalia.com>
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=rJbTknw79ReeQ6TgfiOLvPcNamduI2cLLWcndgkzxHc=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn2MZHE5MmRnWamdkPq4xoiS2j1Dzg4tLtKaEVL
 w1MqBdV4b6JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9jGRwAKCRA/8w6Kdoj6
 qqdXB/4qLFTgdUcLG61sC0yWNQ7FgY0ocZLSoh4FnMLrW4eN0mGYF4lu1/Rw5awKya7M4JB6e1R
 MVbFbe2oyDNn2LLWQq0hlrDlnEjcifEc7skDEF4wL/gs9QkhoqfzNCGZhc/MqqqW2vsqDEIMRuP
 vA66R5E3z6q5/UdrCwGuIIVU65R9tyanOmqDlfLiow/g2ah0hJWCoeaDVi9/Vu2EV548PwcERzi
 HrgN6G9IMe5eiE3Kntp2qz9YFkkvtTptKCVBjaAn6aju0elM3QCy/TAN3b0oKbZKdnqhR9kEM4d
 +Kb8nQGT0IFiGbmGZWIZM1qbkJ2ECRCiaYIL5BweIPIfW2tt
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
index 6a1a09031983eda4691a939329ed159b32f77669..dd2cc63c9a51da11691e4e81b225b74fbe86d709 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -77,10 +77,12 @@ allOf:
           items:
             - description: hub register
             - description: core0 register
+            - description: SMS state manager register
         reg-names:
           items:
             - const: hub
             - const: core0
+            - const: sms
   - if:
       properties:
         compatible:

-- 
2.49.0

