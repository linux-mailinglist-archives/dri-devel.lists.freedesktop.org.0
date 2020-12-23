Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF812E216B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9246E891;
	Wed, 23 Dec 2020 20:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Wed, 23 Dec 2020 20:37:01 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D189EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MYvPq-1kWE1242ZE-00UqQg; Wed, 23 Dec 2020 21:27:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 0/4] drm/v3d: Minor improvements
Date: Wed, 23 Dec 2020 21:27:21 +0100
Message-Id: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:eLT937f2cEY8ttpu9rSnMc1CBoudoq5pk7CxpZQWt6503QgiqGR
 Y1A5zf0zLI250QhlfHHGz8a+uQB+udt5k4h8ChBj9nJxevGT1Mj+a1spkazcI4nh7Wc7321
 SigWNL2G1pgO6ZdIzDMi13c0gTJ5iVdCmSP50RX3WHu3Cy2XiTF0rmGcMrhI20aVc+nMZ7M
 BXBpnvW0PfSqlAx6yu//w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0WFHw7sMT84=:aVssyibHk1y4m4UmCuv4fA
 h9NcweF9BTLgnUDoopKAS6IK/eRHBzbYg30u9lmKXrpK1O7Tok/FfScUEkEwvh8OotMeM1Ihj
 IG3Jv2Of6PoRrAADf2y73UONoztdKp8GLNO/AfC8H9jBv+AI/n3Um1N2DuCuvGMCskulqZJ1j
 TMGIAERIhOcYenYgqEhs6f4HgSYKXOHuonJI8vb24FWEqQuN2ZpTQ8EVe48Kh6ePZgHUFEoej
 V1BFa1GUudmTRUnb9JQpRzTr3K5eNg3t5/7xD1sGbw+9yhnggcSjwNqk8MevD9MAzgIqqhrZg
 qrOTuEaiW3rEBKK3k77ceVtYhVl5X5IHsFW4WgJaPmmgdiO0nIumc8DA56sTFf/wjaV8+4Im8
 JY52i5TmLubAO5Ts2V6t7MOqD1hZhHlYFSrN+rKGi+K+8f3/f032xXHv0HWnmArMvU8ts6mM3
 l6lrJgf0OQ==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This small series of v3d patches is a preparation for the upcoming bcm2711
support. The bcm2711 support will be send separate, because it involves
bigger changes.

I'm not sure that the schema conversion patch is sufficient.

Patch 2,3 are directly taken from Raspberry Pi 4 vendor tree.

Nicolas Saenz Julienne (1):
  drm/v3d: Use platform_get_irq_optional() to get optional IRQs

Phil Elwell (2):
  drm/v3d: Set dma_mask as well as coherent_dma_mask
  drm/v3d: Don't clear MMU control bits on exception

Stefan Wahren (1):
  dt-bindings: gpu: Convert v3d to json-schema

 .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 76 ++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.c                      |  4 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |  7 +-
 4 files changed, 80 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
