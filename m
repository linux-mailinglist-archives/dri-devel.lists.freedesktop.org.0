Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702E1BBDFC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5176E3C4;
	Tue, 28 Apr 2020 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 27 Apr 2020 08:27:07 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC4296E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:27:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,323,1583161200"; d="scan'208";a="45816323"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 27 Apr 2020 17:22:03 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown
 [172.29.51.26])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id A203E41D982B;
 Mon, 27 Apr 2020 17:21:58 +0900 (JST)
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Icenowy Zheng <icenowy@aosc.io>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Vivek Unune <npcomplete13@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/3]
Date: Mon, 27 Apr 2020 09:21:46 +0100
Message-Id: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: devicetree@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gareth Williams <gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds DRM support for the Digital Blocks db9000
LCD controller with RZ/N1 specific changes and updates simple-panel to
include the associated panel. As this has not previously been
documented, also include a yaml file to provide this.

Gareth Williams (3):
  drm/db9000: Add Digital Blocks DB9000 LCD Controller
  drm/db9000: Add bindings documentation for LCD controller
  drm/panel: simple: Add Newhaven ATXL#-CTP panel

 .../devicetree/bindings/display/db9000,du.yaml     |  87 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/digital-blocks/Kconfig             |  13 +
 drivers/gpu/drm/digital-blocks/Makefile            |   3 +
 drivers/gpu/drm/digital-blocks/db9000-du.c         | 953 +++++++++++++++++++++
 drivers/gpu/drm/digital-blocks/db9000-du.h         | 192 +++++
 drivers/gpu/drm/panel/panel-simple.c               |  27 +
 9 files changed, 1280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/db9000,du.yaml
 create mode 100644 drivers/gpu/drm/digital-blocks/Kconfig
 create mode 100644 drivers/gpu/drm/digital-blocks/Makefile
 create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.c
 create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
