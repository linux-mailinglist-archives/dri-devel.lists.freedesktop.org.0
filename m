Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043FB1E1B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076B10E4BA;
	Fri,  8 Aug 2025 05:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9F10E4B9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 05:35:21 +0000 (UTC)
Received: from jtjnmail201620.home.langchao.com
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202508081335138617;
 Fri, 08 Aug 2025 13:35:13 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201620.home.langchao.com (10.100.2.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 8 Aug 2025 13:35:14 +0800
Received: from localhost.localdomain.com (10.94.11.40) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server id
 15.1.2507.57; Fri, 8 Aug 2025 13:35:14 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.c>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 0/1] add Yhgch soc chipset support
Date: Fri, 8 Aug 2025 13:35:07 +0800
Message-ID: <20250808053508.52202-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.11.40]
tUid: 2025808133513b942b79cf05a565a617dd8cf9bd90417
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

add Yhgch soc chipset support for Yhgch BMC chipset

chuguangqing (1):
  [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/yhgch/Kconfig                 |   5 +
 drivers/gpu/drm/yhgch/Makefile                |   4 +
 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig       |  12 +
 drivers/gpu/drm/yhgch/yhgch-drm/Makefile      |  20 +
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c    | 458 ++++++++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c   | 374 ++++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h   |  53 ++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c   |  89 ++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h  | 209 ++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c  | 116 +++++
 13 files changed, 1348 insertions(+)
 create mode 100644 drivers/gpu/drm/yhgch/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c

-- 
2.43.5

