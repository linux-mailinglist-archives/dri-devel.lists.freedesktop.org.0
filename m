Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69447ED2A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D1E10E416;
	Fri, 24 Dec 2021 08:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 22 Dec 2021 19:06:58 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 516AE10E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:06:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,227,1635174000"; d="scan'208";a="104382674"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2021 04:01:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 87E8240DF445;
 Thu, 23 Dec 2021 04:01:50 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/5] drm/exynos: Use platform_get_irq*() variants to fetch
 IRQ's
Date: Wed, 22 Dec 2021 19:01:29 +0000
Message-Id: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the
    interrupt
  drm/exynos: mixer: Use platform_get_irq() to get the interrupt
  drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the
    interrupt
  drm/exynos/fimc: Use platform_get_irq() to get the interrupt
  drm/exynos: gsc: Use platform_get_irq() to get the interrupt

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
 5 files changed, 21 insertions(+), 41 deletions(-)

-- 
2.17.1

