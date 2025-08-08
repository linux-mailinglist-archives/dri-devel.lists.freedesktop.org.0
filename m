Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E68B1E30A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 09:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FF310E1C8;
	Fri,  8 Aug 2025 07:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4CD10E4D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 07:19:31 +0000 (UTC)
Received: from jtjnmail201608.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202508081519236158;
 Fri, 08 Aug 2025 15:19:23 +0800
Received: from localhost.localdomain.com (10.94.14.254) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2507.57; Fri, 8 Aug 2025 15:19:22 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 0/1] add Yhgch soc chipset support
Date: Fri, 8 Aug 2025 15:15:39 +0800
Message-ID: <20250808071918.52377-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250808071918.52377-1-chuguangqing@inspur.com>
References: <20250808053508.52202-1-chuguangqing@inspur.com>
 <20250808071918.52377-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.14.254]
tUid: 20258081519235b5f15493e19385d92f39372a92583c0
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

