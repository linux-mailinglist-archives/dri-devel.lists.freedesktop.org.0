Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2C455AE49
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 04:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C5310F739;
	Sun, 26 Jun 2022 02:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ED210F732
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656212233;
 bh=/KCh/fWm+fHdQuxyurwzpxbpgDpKYmDdno0ZNuSSOwo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NgJLmQJv73FBs1REES1fV3tcTdutZwWmc1RrS/1lcPyk/W5R1nX8bjSSa1I2z9MgN
 QLOAfIxi7Cy/JI8TvtNqK/tfENoLYTYaYutpGJM/HlWekcTcFkYMW1Bj2vJ1Rxl4Fa
 RYPuPPnA8Bu7FolMFV7gV1rE/3qhqGI+OcnCWXJk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([172.58.190.218]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MEFvp-1nv9zE3Jzh-00AEUQ; Sun, 26 Jun 2022 04:57:13 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] Delete VIA DRM
Date: Sat, 25 Jun 2022 21:56:40 -0500
Message-Id: <20220626025641.4464-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cz4nzZ2TFuLIfjROZdw47vsqUTy8Ukxlvus14T0RC6jNpjo/r+o
 BNT/GaklI2U92PYc49BCp7MYzjVcjFaf4ZZi5OGfu8fsIhVhCxfnCddsXmBDLTqHQUVu8OC
 ZStV66YbBdPwnyWQKzwLkGE17fAJukhnYNsNQgM0TJfiJ7/jUpnQ+ic73IuO8K07PPY8nNT
 gt+2ciQzDJRmdri0osNWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GXB90XUbIW8=:aE/0eMK/j9cDpPqJ6TWLz5
 RYKn3/wtHtg0weY3ezq8DYOMU/0pQbCRTHxoppLWtO/L90H1b6QPtzF2QDUCzHmoGJEeLKzE5
 PB4Xr7kcHlOal9cSfrI7fljgeseydDAxTTTBRyqk8FkuSv1LsQSH3oqupa4zJGsfzbN8iISG7
 LZx52xV1NK5clXcobp+v3nB4ZXq9BR0g9pKPdfQ3mL3vuXdLOuWvhzOjCB3CNkDziN2lzwxXM
 /w8OfPocxHQJ66t9aJJFaeBylf9/pY5HzdzInJcHfwBIghSmIExx66+8SB6K/AcTi8+3bGHoL
 SnOFAaGKdoOQFrgRKfd8luDwTsxLqy/DGxfmNmJ2JCw0yxsuhFtPCW6MZLkJOfwSbbnbOIwov
 Jz9Owgb8jZ4tZPcDLlnD8zAd7fsYIN/+et8TpLHaYYH7tLRUib/J+gxKYz3WVrwJJ7dH7GF/5
 mjPtr7LUCxh/L2cOq/KYaz9qs15r1+PHR1Z5hNf86HMA6cHvvCx06fOD1C1cnlspJC6v6XHe7
 6rK+JTT+KWIoEjdQFa6rH66ltFW3BKc2xF1kJM8QIntkZ8bUtg/LLgQoe3/J/kBNpmAzXvA0p
 vTbLtgcROMbudEfLlndZnRarEiCokswQMkbVYBhicX7wQj3QhRVJzEUUxBcAzJuvRXW021ZVi
 Nz26H9eTGe1IdDbPXLbfSpgyTs7yw5Am+et/UABwB5xsxPcK9h3vODO5SXdq4GKfTAycKdGnj
 3De2JOnHBhFrArE8ug4tJUC3LxKlnUJyycE1L6tfkYnLQF5l9/4vXx/ge/NaPrqBle4EnhMUD
 NhivS09DQyPMwOKK8YS1NXnRBjVTAIuVxoDkIqQx5SuItZr1SMwHSXp+aUdCB69Xzeq/z8Xpt
 LtmPCK+KAER66Up4dLrcBybLtX0phrou8izXaHoMPxA2tQ3BHunjBPZ18sR3+QMtt7L0oojCX
 Xx+2lg2U3SMlDgikjKU0Qw4PaFmmXFWyBgpuZlqEAv7G/bjPc8U2lAg8/2GGSxAnu/o8CIML5
 rJ67DWSO1xyzi4qsniqklicoBT6bvGCCEvE3zNAnP3hcNHUsJ+Bpj8QtudX5lwbApSUK/BOsi
 ePHNGeNEhS2U6jRrnYIUNWRLa8Ppmkx3GTwfCN+WKGNYEoPS2iEor2Mvw==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

This patch is a supplemental patch to delete VIA DRM so that the proposed
OpenChrome DRM module can be compiled against drm-next-2022-06-03-1 tag of
drm-next branch.
Apply this patch first before applying the rest of OpenChrome DRM patches.
Thanks to Sam Ravnborg for pointing out the deficiency of my proposed
patches.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


=2D--
Kevin Brace (1):
  drm/via: Delete VIA DRM code

 drivers/gpu/drm/Makefile           |    1 -
 drivers/gpu/drm/via/Makefile       |    8 -
 drivers/gpu/drm/via/via_3d_reg.h   | 1650 ----------------------------
 drivers/gpu/drm/via/via_dma.c      |  744 -------------
 drivers/gpu/drm/via/via_dmablit.c  |  807 --------------
 drivers/gpu/drm/via/via_dmablit.h  |  140 ---
 drivers/gpu/drm/via/via_drv.c      |  124 ---
 drivers/gpu/drm/via/via_drv.h      |  229 ----
 drivers/gpu/drm/via/via_irq.c      |  388 -------
 drivers/gpu/drm/via/via_map.c      |  132 ---
 drivers/gpu/drm/via/via_mm.c       |  241 ----
 drivers/gpu/drm/via/via_verifier.c | 1110 -------------------
 drivers/gpu/drm/via/via_verifier.h |   62 --
 drivers/gpu/drm/via/via_video.c    |   94 --
 14 files changed, 5730 deletions(-)
 delete mode 100644 drivers/gpu/drm/via/Makefile
 delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
 delete mode 100644 drivers/gpu/drm/via/via_dma.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.h
 delete mode 100644 drivers/gpu/drm/via/via_drv.c
 delete mode 100644 drivers/gpu/drm/via/via_drv.h
 delete mode 100644 drivers/gpu/drm/via/via_irq.c
 delete mode 100644 drivers/gpu/drm/via/via_map.c
 delete mode 100644 drivers/gpu/drm/via/via_mm.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.h
 delete mode 100644 drivers/gpu/drm/via/via_video.c

=2D-
2.35.1

