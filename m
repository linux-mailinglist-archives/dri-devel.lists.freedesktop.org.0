Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B53C3154D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74CF10E5E0;
	Tue,  4 Nov 2025 13:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QzxvE5Dg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XuAIPL/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A33A10E5E0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 13:57:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d194p6Zggz9t27;
 Tue,  4 Nov 2025 14:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762264650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
 b=QzxvE5Dgn/3P5I0WBMJ9uQNOBPBqSn1WLcQafm+LAnDIvmgOkrmb1K4cbqlga0capxFzVq
 DjbrBq69NA1dXkVSWOiFVST1mXqOvKDU40KP11BFw27k7z0yW/CnvDEs6dxmUh07CqXm5s
 xTML1mbReyQ6AkFfi4qNB34myiTj/9saIH2rnAWcV4lAbQoS2rvDuW+Vcupi7tLFIaLnkQ
 MucwQ/1eg10jsk3QWZdniW+PyStnqRj7DxgV6CV323w8AAY/Zn0GTW4fDoREaJ5EQ/vBPB
 MY/Q7I1ViIJ2BGzkrWS6kzRtLHxZBdbLPs6RTGHQHn/GusZEC0tK1Xxpq1N37w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762264648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
 b=XuAIPL/pleVpOMtiG6KAUnTel2TS5JNoTv+cH+IVL1Lr3ENIh0Z2CX1snYXl3NomULKf8P
 NcGwc5KB/xt0cg4wFoOvqCgMo7Fe0xpdLXItPPVFmw/SSsuego4ZG9x1Jbe8+bg51JOxjF
 TpS/sr12qj9ml8IvziGdYJGlceXkHGN4gFEt+Pn5p1Wi1qJQ5IaGzsUMbZFAfDAgB3v6Uy
 YxCB/1dJLuS4jX+aQGVxRJjL/nMExk7x+gVfmZcq5gQCqOxNP33YPDdJ51OZvNcPn6e4uj
 MWMFX94gGE2Tf4j02Mxyqxzy6ekO3Rf/C8aUecDmLFqrA0q1c/3FRia+E0luwQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpu: img,
 powervr-rogue: Keep lists sorted alphabetically
Date: Tue,  4 Nov 2025 14:56:05 +0100
Message-ID: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wg8q95iupj6tko68886b5ooww1sxemjx
X-MBO-RS-ID: 0190ce7413311b3881e
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

Sort the enum: list alphabetically. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: New patch
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..550da008629c 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -134,8 +134,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - img,img-gx6250
               - img,img-bxs-4-64
+              - img,img-gx6250
     then:
       properties:
         power-domains:
-- 
2.51.0

