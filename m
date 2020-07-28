Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7C231298
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2156E2E4;
	Tue, 28 Jul 2020 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jul 2020 11:23:53 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6F96E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935431;
 bh=kKz6J2TJMa/GicbvTCv76Ky9V4fO/FV3yZh5V+NhgHA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=S+wM/wAaXHLNJuOGHR/kmNSo3NzHgl3u4I3Yf+Jctfcu7TqlXDkou7o5QklMv44RX
 p2+1oqqLX3WBUTkhG8C7FGTLaMEMth2EKAgwhLI18tm1IsF/OJ0nmyPMt8Hor0soVO
 ih2LTcB3S+QT8QsH5jepYSQqqPmZ3CGMikFINpE8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MEUz4-1jym7135gI-00FzVD; Tue, 28 Jul 2020 13:18:17 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] make hdmi work on bananapi-r2
Date: Tue, 28 Jul 2020 13:17:55 +0200
Message-Id: <20200728111800.77641-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+y5CoX8QurDPY0IO98TiGJ9LRNcAE9xACEixzFfMq7Rc9pJV6/F
 VIOEtUITqe74q6u2ezJ4CIbpDVVJNTJugvVeL9HglsnPh8Husf3ag6TligX+Syc5hziPW09
 ER2o83PdhsHrZ1mvkVFnWBMYpn1ixkPjVaA30e4evKXJ+WzDhFbNGkKNRPet6RUPF6aFX69
 ZYJDeR5cZL/ysODW/uUsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G3AHFkQI4No=:n7GF6rIqM26MFvWu8OeyUs
 jzEzJcJwCrM+myesS9srOs2eNr2352XSiox3AdhsQaMI6dISjLLNGDO/5xiVCgiDn+z+KSQg7
 SLoGLYTxFynb3JSsJxV2NKvNTff5eEeNoeTzfjBqw32tmUJ00iqZ0hwoGZrrSjVc5rmYN0rVd
 XMxd3ICQj+fF4wzv47BYvnhDns+y1KXXefAzWt3d643SutqCWwlBkfTryNq7aTCljogs01mah
 tTphgY531h1OnmYH8cyDvUQWohE/Etr0ZFgTTHBy9fBudd6KBleQJhX7A3tKp0eVOoJMfjPkC
 8zix4n/S2k90HRMxvThlRcuN94J7+mR3bL2yUkCSQDkEbRq9miLKHH4mYWDY2fQ7h2hJ2hz/X
 6uhajgQjHh2cDbcDnGKOFmSHAx4RcutrNkI2mBq66hDVG4VRYSMPzdmia94IgDzpSSboWo+4A
 0Pm7LxQWzfTYW+O/FplW49cOpbbIOfucxOxCpfSs7TOB1NY0OdX8k1+xONTAFBgZ72vD7/URg
 xrRC4OGIDBmdOAzVEqoTN+PpoDm5Q3sRgizghqqP9ODDY80QDK79HUdi6HBYNZeHLcUH0bzWQ
 cpKyGRzZPlUoz9XPIfHbrlUDqADklwC/QUh715E+gN3QOZ78VctacRLt7IJ8vgLrvtCsBpGvZ
 eUhXF8KwCjMaDy+0/QI5m9u/gdhmnnKl5i60JLS7qQwaeURX0RhpRCcQBLuzpTUUTckbDIJc5
 KAz8kqH6hbImDAW2RbvDNHTQjauKtJEXiDxCDD3OqHvDEbUiS3rEnkE50wIB6c4p/pmre5Szb
 lMilHwxcOOXGvex9ZZ8oistlcvyc/8J3xQR4js5fV0E2jBlgxQAXoCaPq2VMpiQqiQ7EIsO22
 U5NXvPfdeT+pq6RE+mBtV2L91YL22kFSh3PuxK/JsdfmReJxqjdwP6I4bjtSoHKsdgJzPQBYY
 Dd1Drhs5ianhz5vkyYAj6rwfppQdogtQnBLegLowspuR/JRnnA5EmNxG7rtBBAQIPXJGVohV5
 Wj03KT8f0duZbXlNvfuss/M3qKojYAIu3fT1FOyNx+yocHY7NW+fwdGfDEn8T6nMvBxINPTS9
 OeDwC7bqBuAnjsqOKF8LwYJaixJNFCP7WItkbv9lFzpf+2101GIxXY1hcDMkN+ocAfDM8DilV
 A+csLH5mySWd+XHnOcExsgtb2Xrpl5cLsBjhUryOpHiZSFO81GZnGID1X52JvyH+60/2HBERh
 NrjY1e0aFpo1KrLpuvXp2rOf++I3xPaN9rgAX/Q==
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This Patch-Series adds missing Patches/Bugfixes to get hdmi working
on BPI-R2
This is v2 of series https://patchwork.kernel.org/cover/10903309/ after
getting mmsys done

v1->v2:
 - using get_possible_crtc API instead of hardcoded
 - drop unused dts-nodes
 - refine commit-messages as far as i can :)
   "config component output by device node port" is needed to fix a WARN_ON()
   "fix boot up for 720 and 480 but 1080" fixes flickering,
     which may cause also some resolutions not working on some TFT (had some problems on my smaller TFT)

2 Patches were already posted, but not yet merged into mainline
- config component output by device node port
  https://patchwork.kernel.org/patch/10609007/
- add display subsystem related device nodes (resend)
  https://patchwork.kernel.org/patch/10588951/

Bibby Hsieh (1):
  drm/mediatek: config component output by device node port

Jitao Shi (1):
  drm/mediatek: dpi/dsi: change the getting possible_crtc way

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

Stu Hsieh (1):
  drm: Add get_possible_crtc API for dpi, dsi

chunhui dai (1):
  drm/mediatek: fix boot up for 720 and 480 but 1080

 arch/arm/boot/dts/mt7623.dtsi                 | 177 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  85 +++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  85 +++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  42 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  46 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c       |   3 +
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |   1 +
 .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |   1 +
 12 files changed, 442 insertions(+), 10 deletions(-)

--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
