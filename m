Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AEBA86D30
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 15:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFD510E110;
	Sat, 12 Apr 2025 13:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m6KoERnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4EA10E0F3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 13:16:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB8AB5C57BF;
 Sat, 12 Apr 2025 13:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 688AFC4CEE3;
 Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744463775;
 bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=m6KoERnmQRTnT6xlveWbaJaIFNSpG0ku5DPDSID2PVeZQCApVmd4dufC4AZvzwZBo
 rm7OAjgXJZuWM77c2WfCRSXP4727I7Iy477WxRh9FY+cu7N5k6Y3B5HwAoISbl6LX1
 zoscBCeZqdKTMgh5q6cUfwRr/60r5giKZgfB3RTzx1yyZ+T0I24cEaJ18B//+1ElKa
 xcqXodYXSJ1kUbD8CtLUhRNYMJHEZIL13mfMuLzaQi24P8L5tOdlVY3bp35EdLFNOM
 4QkcpE7t+2te6tzl1YgFF1vEN93eopLuoqtUO1xKNFsRvPqROOzb/kh6seMIYnPSRd
 jlRg4YgLHfjHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4D569C369AE;
 Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?=
 <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v5 0/4] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Sat, 12 Apr 2025 15:16:01 +0200
Message-Id: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJJn+mcC/12M0QqDIBhGXyX+6zlMc+Wu9h5jF5p/S2gpGrKI3
 n0WjNEuz/dxzgIRg8UI12KBgMlG68YM4lRA26vxicSazMAoE5QxSrxvZ/UaCA66JVo3QlZlp/M
 JWfEBO/vec/dH5t7GyYV5rye+rd/Q5RhKnFCiJEVTl0Y1vLl5Fyd05xEn2Eqp+tm85H92lW0hJ
 OU1Y0aiOtjrun4A3zenyecAAAA=
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=2344;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
 b=l8PaOuZLZFLI6LwsdeDccOzUR5+w3wL0myBNaBkGAkjCETbCBt7yiXeoObNwacrPSy2z+vcwW
 DeL3eMq8UnHAa+kP3OoEG0MKsMRHNlchAXiL/mnJA48QconA9bwH2yb
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

This series converts the fsl,elbc binding to YAML and adds new bindings
for related devices (particular kinds of chip on the eLBC).

For readability, the existing unit address syntax of <cs>,<offset>
(e.g. nand@1,0) is kept. This results in a few dtc validation warnings,
when combined with other choices in this patchset:

- For compatibility with existing kernels which don't explicitly probe
  under an eLBC controller, the "simple-bus" compatible string is kept
  on eLBC controller nodes. The validation logic requires a linear unit
  address, though (e.g. @100000000 instead of @1,0)

The patches in this series were previously part of the following series,
which turned out to be too large and unwieldy:
[PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
https://lore.kernel.org/lkml/20250207-ppcyaml-v2-0-8137b0c42526@posteo.net/

Changelogs are present in the individual patches.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v5:
- Rebase on v6.15-rc1
- Add Rob Herring's reviewed-by tags to patches 1,3
- Fix documentation reference in Documentation/devicetree/bindings/display/ssd1289fb.txt
- Link to v4: https://lore.kernel.org/r/20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net

Changes in v4:
- Reintroduce patch "dt-bindings: mtd: raw-nand-chip: Relax node name pattern"
- Link to v3: https://lore.kernel.org/r/20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net

---
J. Neuschäfer (4):
      dt-bindings: mtd: raw-nand-chip: Relax node name pattern
      dt-bindings: memory-controllers: Add fsl,elbc-gpcm-uio
      dt-bindings: nand: Add fsl,elbc-fcm-nand
      dt-bindings: memory-controllers: Convert fsl,elbc to YAML

 .../devicetree/bindings/display/ssd1289fb.txt      |   2 +-
 .../memory-controllers/fsl,elbc-gpcm-uio.yaml      |  59 ++++++++
 .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  68 +++++++++
 .../devicetree/bindings/mtd/raw-nand-chip.yaml     |   2 +-
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 6 files changed, 287 insertions(+), 45 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-ppcyaml-elbc-bb85941fb250

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


