Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFBCBE25E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 14:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED4D10E498;
	Mon, 15 Dec 2025 13:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dsrgwEID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 993 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 13:55:33 UTC
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5B10E498
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=7JazWsIS/CHK3V
 4xzXhVpv09y6AAYC/e+eQsL6395/k=; b=dsrgwEIDLBPHpP7tJxwg3HRBc3S+J3
 EYQrWfPJrWIOqDSOSr3aLRxEG1UBYPzQpN6lrtMfYW5EdHzWMpN+O5R5YG3/QDc2
 a6LxvqTLye8ql83wDBy52MaP+BLOCOiEYpa+YlTwpY6ft1l0pJ2kqcIdfkZa44Pp
 38j/NlyR6hK7ZR8Ah2QOgyZxGA8RlLFwZCOnBuK37hm68Qr4mwNI2ubbLm1t6i42
 7ChpO63zAojZNtly6mdxQDtIFdOmaRR+jfan/SCUwdTBM8fTmRJHavImzJHI1hb7
 2xgRUqv8PBzPjdEVK5bSnMtHnRYa8Ro1LOnhc2EGTQ008Z3u1Xmnq0lg==
Received: (qmail 1003689 invoked from network); 15 Dec 2025 14:38:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Dec 2025 14:38:55 +0100
X-UD-Smtp-Session: l3s3148p1@E5cVu/1FhdXN3IHv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car V3U
Date: Mon, 15 Dec 2025 22:36:35 +0900
Message-ID: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-Car V3U has the same unit as M3N and its GPU was already added to the
DT. Add the binding description now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Fixes:

arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
        ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
        ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
...

 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 225a6e1b7fcd..86ef68985317 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -20,7 +20,9 @@ properties:
           - const: img,img-gx6250
           - const: img,img-rogue
       - items:
-          - const: renesas,r8a77965-gpu
+          - enum:
+              - renesas,r8a77965-gpu
+              - renesas,r8a779a0-gpu
           - const: img,img-ge7800
           - const: img,img-rogue
       - items:
-- 
2.47.3

