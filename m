Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C26AE6D3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEA710E115;
	Tue,  7 Mar 2023 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 07 Mar 2023 16:37:44 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB13E10E653
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=k1; bh=TPA/48OT+2kB9yn2MigoHhqgXOt
 p9jPFDswRzTAc5g8=; b=3Zoihj5Dt8eXrRj9jMkYSxw6mJKY59FPznWASEkzuOO
 88NfaXIF96AWq7r5T29loJerRYjPDWaDQz70BSdlZXjlDFTF7UU59wyYWX38cmFL
 dJVRN7YalCZNx44TZR/D/SkYWgs7FzXt4zm9MRCD7856KAhoLQG7/VbN7jyubl3c
 =
Received: (qmail 751813 invoked from network); 7 Mar 2023 17:31:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 7 Mar 2023 17:31:01 +0100
X-UD-Smtp-Session: l3s3148p1@Urm671H2UIMgAQnoAFQ+AGEn9EY5VOxJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/11] tree-wide: remove support for Renesas R-Car H3 ES1
Date: Tue,  7 Mar 2023 17:30:28 +0100
Message-Id: <20230307163041.3815-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, iommu@lists.linux.dev,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because H3 ES1 becomes an increasing maintenance burden and was only available
to a development group, we decided to remove upstream support for it. Here are
the patches to remove driver changes. Review tags have been gathered before
during an internal discussion. Only change since the internal version is a
plain rebase to v6.3-rc1. A branch with all removals is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/h3es1-removal

Please apply individually per subsystem. There are no dependencies and the SoC
doesn't boot anymore since v6.3-rc1.

Thanks and happy hacking!


Wolfram Sang (11):
  iommu/ipmmu-vmsa: remove R-Car H3 ES1.* handling
  drm: rcar-du: remove R-Car H3 ES1.* workarounds
  media: rcar-vin: remove R-Car H3 ES1.* handling
  media: rcar-vin: csi2: remove R-Car H3 ES1.* handling
  media: renesas: fdp1: remove R-Car H3 ES1.* handling
  thermal/drivers/rcar_gen3_thermal: remove R-Car H3 ES1.* handling
  ravb: remove R-Car H3 ES1.* handling
  mmc: renesas_sdhi: remove R-Car H3 ES1.* handling
  usb: host: xhci-rcar: remove leftover quirk handling
  usb: host: xhci-rcar: remove R-Car H3 ES1.* handling
  usb: gadget: udc: renesas_usb3: remove R-Car H3 ES1.* handling

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 37 ++-----------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 48 -----------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  2 -
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |  3 +-
 drivers/iommu/ipmmu-vmsa.c                    |  1 -
 .../platform/renesas/rcar-vin/rcar-core.c     | 36 -------------
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 15 ++----
 drivers/media/platform/renesas/rcar_fdp1.c    |  4 --
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 10 ++--
 drivers/net/ethernet/renesas/ravb_main.c      | 15 ------
 drivers/thermal/rcar_gen3_thermal.c           | 52 +------------------
 drivers/usb/gadget/udc/renesas_usb3.c         | 23 +-------
 drivers/usb/host/xhci-rcar.c                  | 34 +-----------
 13 files changed, 16 insertions(+), 264 deletions(-)

-- 
2.35.1

