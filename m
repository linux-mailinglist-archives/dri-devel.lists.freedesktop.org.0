Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B9A6360A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9CC10E167;
	Sun, 16 Mar 2025 14:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DfMjcH89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F96B10E162
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yW80kGhERxvdgKvHJPIF2b1jQ8rLTpfgbI977TlYb7Q=; b=DfMjcH89HozFVWC+a7ydCLzZ+y
 o/nFtPYOBwPQmNd+4ChqSSpTYurw4C96jfZZ57Amd6cLC4IKO+SJ/+31Y/umLa2ky3LLmHYePxW/y
 yx/KqYY2msU4WxKLjPW4kNENJsgvutR9SOssztgM/Cm6+bGunNAuJKSAWAgGII85UtX36FxO4uRAf
 yGmTVXKEsTKF2MA8FXLWUpneCA9nMLKFrCqNQ6h/OL6uki3VTbenk55r6ArrKRImPyVCiJxmZO/TM
 NHB8pZ77Yp41jTCS27jgu05q+aQW99mYPyidcA32b2ARdRfyzL/cX0mlXPlaGXgtVn+7PQ7MlqESj
 vYV6C7hQ==;
Received: from [189.7.87.178] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ttonH-0016D3-Lr; Sun, 16 Mar 2025 15:16:48 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Mar 2025 11:15:12 -0300
Subject: [PATCH v5 5/6] dt-bindings: gpu: v3d: Add V3D driver maintainer as
 DT maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250316-v3d-gpu-reset-fixes-v5-5-9779cdb12f06@igalia.com>
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
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Euv/3NWvgCPDDYHuljbzm7CGJWe1ImTFFhtKIdR3PTQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn1t0z05M4NTQ82w54IjShUBiGzfqOUNuMLizoo
 z69mdeYmFWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9bdMwAKCRA/8w6Kdoj6
 qnO8B/4/R9S/NytXS7zzXfzMCeReVbJGRuVWPkMsj1CPuAaYDSrgucnXdZ+JbHSoWPRO947wX0a
 joCN1up7CdF4DPWZM35ZPkCE22JlHlnseXW9W4DucXJjgzrqK5XyU2FLfALI3ggHslEfbMMeaRF
 TMvHeiEUT/JtDa0GxAJrZ99xewwGttXN74oPpydJLoqMeRGXTJTWqOhnN5u2KPSb9m3QnKzqqPx
 ijpuKQodow9/aoYfNPlVYOPFabC6wW+WsDwX5/dKOp7NiQ04ifiyADhxGEIyTG60Cl/jH7lsGr5
 HfPyAyWLMe8bXheLZbMP0gmhsPniTvQek6cTKa3+fGUN84+D
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

As established in commit 89d04995f76c ("MAINTAINERS: Drop Emma Anholt
from all M lines."), Emma is no longer active in the Linux kernel and
dropped the V3D maintainership. Therefore, remove Emma as one of the DT
maintainers and add the current V3D driver maintainer.

Acked-by: Emma Anholt <emma@anholt.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maíra Canal <mcanal@igalia.com>

---

Hi,

I'd like to ask two questions:

1. Nicolas, are you still interested in maintaining this DTB?

2. Florian, would you like to step in as a co-maintainer with me?

Best Regards,
- Maíra
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index 39b8f0ee1f727628307d758844008ae1189902b2..219e1403516fa0c2f2944d50ca829ddbf14a8b79 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Broadcom V3D GPU
 
 maintainers:
-  - Eric Anholt <eric@anholt.net>
+  - Maíra Canal <mcanal@igalia.com>
   - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
 
 properties:

-- 
Git-154)

