Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5149A86D2D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 15:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E5010E02B;
	Sat, 12 Apr 2025 13:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lJdk0iiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A12410E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 13:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9D90CA40A2D;
 Sat, 12 Apr 2025 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0A6C4CEE9;
 Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744463775;
 bh=sDmeVGHitZSfQDaX8FV1eo5UbMMDoWgDE63yAq2budU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=lJdk0iiBGm6tynEY/QosWaZy2cBbcR1A9W3CRDwkijjCww7XwEOhQ0pa5zG4P4pus
 fman/cYhBfXIH+0eqzLeRLLl5bDUQ4Al/qDDvX7iqSKLmXNSp60U7wysjjYf/UKwHq
 Xv/eKlP3z3MdEKHfFsUVinlxmO6qlcXA6OG4LafZdK0n3w24DYhk/SYoRJKo4G0DJ8
 gVv096PrSryfZnsJFmYRBUshGdYT+UDABnz5yoACMiTVAhNH2H/68Fxv2WKmN0R6dE
 R2QQlX62MMoq0ChBLlhDvjcdhKjv3x0yrYN7TM/8haPjX3Vl8FpGtv2xg9YybDhNBo
 rpG14Vn1+ivoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 682E9C369B2;
 Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?=
 <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:02 +0200
Subject: [PATCH v5 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250412-ppcyaml-elbc-v5-1-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=1564;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=pxFM9O27wqy9fcJew44o1PX/qgcWx5g0CLREATU2JSs=;
 b=QPWzJKXuu2pDA7ddayiQm8050PDpnlNu5Ss5jLRmkr8q7le4OSnoDHRIDwwDewQpf0ccFnNtR
 h9QIpWTh3OqCqs2AqSBvTctWleweoYhYidrpUvvP7tbiqTlD7sJO2wA
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
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
Reply-To: j.ne@posteo.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "J. Neuschäfer" <j.ne@posteo.net>

In some scenarios, such as under the Freescale eLBC bus, there are raw
NAND chips with a unit address that has a comma in it (cs,offset).
For reasons of compatibility with historical device trees and
readability of the unit addresses, this format is kept.

Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
addresses. Unfortunately $nonenames defined in bindings that reference
raw-nand

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V5:
- Add Rob's review tag

V4:
- reintroduce patch to silence dtc validation error, after discussion
  with Rob Herring and Miquèl Raynal
- add some more detail to the commit message
- remove unit address format rather than extending it
  (old pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$")

V3:
- remove patch after discussion with Miquèl Raynal

V2:
- new patch
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 092448d7bfc5ccd246ca4b2341464e18722a2d51..d655f6673fc31b1d9ee7cd734cbe1d310f88090b 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -25,7 +25,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^nand@[a-f0-9]$"
+    pattern: "^nand@"
 
   reg:
     description:

-- 
2.48.0.rc1.219.gb6b6757d772


