Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D53A5CD90
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 19:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52810E657;
	Tue, 11 Mar 2025 18:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iwIXMwU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ED810E657
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHfm+dDO395R2eG8WU/d9U717WWZTtw7JHQg5xw8yFQ=; b=iwIXMwU2HIpji2Mgb/YGMOSbGP
 2T3DBO7zED0tqZGPJIRt8jly4jLODlx15iPSE/llFfixj8b1W7hG1cYI2FtlX3dBVYY1xjv9Q7SKl
 lYmz/ALN+zwad/vGWYTqWz3K2ZZg533+fZ919i1OhFQZObu1eQQF5sxNxH2QsgYdlwIgpFaMrkJyI
 /CMKm26KiLjO5L+arnkhaR8HAxcdDFCTP641JHeyrBEztCJlz/undhos9Co86uj0kuZmmYh26PRXA
 1XkgQITdsUsXFjX6xYXtj4SwjURckcfhgYuVFgZbmzZqUIo8fTRjV4Mlyw2QW2BPqeLwXvXu2oB5x
 TemTT+zg==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ts47i-007Dal-S0; Tue, 11 Mar 2025 19:14:44 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 11 Mar 2025 15:13:49 -0300
Subject: [PATCH v3 7/7] dt-bindings: gpu: Add V3D driver maintainer as DT
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250311-v3d-gpu-reset-fixes-v3-7-64f7a4247ec0@igalia.com>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
In-Reply-To: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=IgswhJeGUCpn63w4wEQWBrPTgIx/PwHZlZGaseENbg0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0H12DUQfcuNsBJwPrP/IZEJnVmqx143UoS+L9
 JIGrVuYgk2JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9B9dgAKCRA/8w6Kdoj6
 qrhYCAC6Cub2Zd9xeoNAa6XtKNw0MiPmmlYujFly+c+ODzzbsHGiueegnWus44ghow+w31bOKFi
 Bihm1CPDPhF2Lw0Xnz7JzXu2hNyp8zBEv0/4CNXji+GrNRv7BT3teF1bY0Ma/wOou6AiJZ0Ad/b
 USLngj3N1svqEbcweXYu6xnwrj5Lf6h0WiSm5UeqECaN/ekYAE/ARGoQ1yzLY16stZ6Jr1oiCKb
 ijTNTcfFz8++B4BWqdcMELn0+AL5D0Gk5I70Hm1SAGg4wT+WsZRHK1rPnt500mPPX9CFtJFHooA
 dAPihYsSxtL/krxvLjsaqvpjmlt9iFnOzDd9pxzGJYWmkUW0
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
index 7349347da1c0034a8849deaa6d64dde6d9d5a81a..95cc459e805b41359e14e1e081904f1c831adf90 100644
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

