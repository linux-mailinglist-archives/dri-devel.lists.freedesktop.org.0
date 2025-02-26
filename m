Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC3A46B9D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F78D10E9DA;
	Wed, 26 Feb 2025 19:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I7DlS1a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD0210E9DB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LvPGDinM9llCj5p+swf8NoBLMbWfKeVJmHFC+xY+KCQ=; b=I7DlS1a8Ljk4cqnWHdy0chjoof
 +qabQH12tHezk0j3/hjXDXlIhXa2vWbnfkeksAa22hlJDQPv57pg6nGOlV6QSR5xqEGgH8+v172qE
 SfuNg1PBr/CjjlrWIsjr6706LBelz2QtxcY5QCLd1OLyfRhkyZDV/NFGeqsDUYlN3dvPerdKAWauE
 1HjuTMLHYhgDXZTvFdKVMZ0klbV1e3uQJ1/PoeN4bpOtnAJYEIZws8T8W6tQWX6cR6m0tETyCrTcl
 Cuepn87wjmQs6SMyMpwaEfoLocv3BsRe4N56+6C79QKMijb8hMSXfHBHAfUKbPbHCw0xe609r9AJh
 aPJrSxnA==;
Received: from [187.36.213.55]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnNZI-0019lA-MI; Wed, 26 Feb 2025 20:59:50 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 26 Feb 2025 16:59:04 -0300
Subject: [PATCH 6/6] dt-bindings: gpu: Add V3D driver maintainer as DT
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-v3d-gpu-reset-fixes-v1-6-83a969fdd9c1@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=57fWKRv9+K7Vas+bEJyhapzSfgJcdRPGqr3tqBM82Zg=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnv3KgEVanEDW/Nd/cRsQoEfYNCfMZBzusBsdpj
 XC/1uwLx6+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ79yoAAKCRA/8w6Kdoj6
 qmUoB/0bN+M6JtKkdudMiF3Pd2DFa44dcovElPqf5apNG8YcLrPSlEa8b54nibgNrKMpwhvOzsS
 fE6UloG4dk+xVndJCogoJwreQbBk9D8BaVD22qrGG/UZ1OyrQaaDDzj00nLOn6J4BWROagvsJAP
 MnJtySZR+ZO9nxX5iw5v9JsNbafrCTbqgKsILA3kjwoG5jocVXP+6zEgCiBLyqeybDaPH0jKVTT
 EZe3BLEzd8Wggu1+ClCLYYWpB2c/+gPjeafB+6OJBrAtRhsyUmNZAqdiGmMm7w8YU9CUozkRwcx
 +0dpDtZiK8ZwbZqf4Cs8v9RblLdWKxjnun44uE0MhPMUp77o
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

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index 8a3d3fc6065d7756da141bda4dc522f63be5e9a1..13eaa1a40485153eea0e5d4bb164009d1030e314 100644
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

