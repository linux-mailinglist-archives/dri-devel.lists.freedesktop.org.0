Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407CB07749
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F4C10E7C8;
	Wed, 16 Jul 2025 13:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JkVlO+4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE810E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 085F45C54B9;
 Wed, 16 Jul 2025 13:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AB3C4CEF6;
 Wed, 16 Jul 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752673655;
 bh=ckGXL7OnCquHJZR35uviuEeY5gCHUP3bzsBXwXjI+0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JkVlO+4N70vvaOR4LcEIwuRDgywvGZlQ8KIUGL6gjE+HG/mYoCESDTgdxydD3imtN
 GdVmDJbiLXzxi2GPhVouo8T+u82o9akf7XpKWC+Wk+KBpD4mxFTs91/DfTT7OdIUKQ
 oT4dvON4FRQrVUrmlxEtxVSlAAutXlGjrdsPpOmcyupVr/Dz+IVWsbHkIRlAPMY5f2
 EvkGsv4AS+RDJwUIYgS3bhIpGBcsqf9b5byfpalMkeS2QOy2bYcl9bD+7N4+azH+8S
 CiImB9iPu5oR1yv4fVw4WtHBuJPCWCI1x+6+CIa/frE2fgil6KS5H8A9Kg+f38mGQM
 bxvyhFGJ5iLKw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Date: Wed, 16 Jul 2025 15:47:15 +0200
Message-Id: <20250716134717.4085567-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
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

The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
new SoC specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3c..bad3e412a168 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -23,6 +23,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
-- 
2.39.5

