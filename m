Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4615A5F8E7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984710E8CB;
	Thu, 13 Mar 2025 14:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fX+B5TS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204E810E8CB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5z11XCkk+Olrb0qdRXbaySaPHVPUwcEpmj1dOh7LRYg=; b=fX+B5TS4BhxefCfs/kzwUczxnL
 46ODNgz4PF3miNqkFRhTHkmx6Rd2k8MipkGjPUplg+8Ni4KFc2fTfaKTd7pFzeqCwt+iT1stqkyZ1
 FdLyKRhOVHrHH692BBS/nkNwvHWdKCMt2WRDiATCzUnPzyugH3VxbDlJvvqXxRP07w7FmOdWEklyu
 3pSl63gTpEbXjgltsnIsr1Vnlne2Oicqu5xpMvMdfyTmp+y595/MKvjyNOBZrQix2KpFuMdSmJgMA
 43OAF9XFHG51G+AP6Lsw1gZoWIW8w55nAs7xhbXfKUMKjt5CZAXxdJn3wgPdmRFCZA+x3q9wqHtkS
 OoulcJgg==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsjpp-008Cju-K2; Thu, 13 Mar 2025 15:47:03 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 13 Mar 2025 11:43:32 -0300
Subject: [PATCH v4 7/7] dt-bindings: gpu: Add V3D driver maintainer as DT
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-v3d-gpu-reset-fixes-v4-7-c1e780d8e096@igalia.com>
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
In-Reply-To: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=AYQpa+lLCT/gJFjXsPTbg7lMEMQt2GqcT1gzUMZPWj8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0u/JcspJ7uVcOQS6Z9nOGZ0zyV5GHU+U12Wr+
 zKkUVpsEvKJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9LvyQAKCRA/8w6Kdoj6
 qvqACACMJrGZ0e8kJO7n6rumxmCljyyKj9aZg1A/X663z1bSfrb5xIY8eXjTbArrSBwTADDZHp3
 +wdHTgUnFg/j7ul0MMp5eRGhcNOfa2gfzwbI0CEsAHxiWU9PwKq9/oxPKvjSELU6C+2kN6BlJCF
 1r1m77WF7Nw2IJzY1Srwkik7BhjnDw1gMCIOU1u0ustaax77Zr8MFes+DRrspubg81O+6l51xdK
 5QISUFk1DqhuHLw4BcVKXEWTxDH78RaoRnNCGMCD0CdKfiMmJgw6N1o/LIrefdhSYjwhVyjWvTI
 JdpN9+t7LHhzqL77Q++Tyj31BKBoYGdg3pNN6RbDEfdFCGSe
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
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index 739e8afcacebe63ac6cd8853a58750f4f83146d3..82bc2f7c4006055df1031ddd4c64432c5ed3a14f 100644
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

