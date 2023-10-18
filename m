Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BC7CD866
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0967010E12A;
	Wed, 18 Oct 2023 09:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id BEFB310E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KyufP
 Gb3cqH8zioLS7lrQHPVVPvHYmUqJ25IUFAAyko=; b=OkbIb3hEDFvSzSIqDV5fZ
 G5yd/OUwv/5sBIQUQPcOeLvph4rfgSWCaMjutz3ASfL7HO/VCaqZ/1LkPNx+n69M
 ilR9+1/rv+UaT/dij61h/0xmLTIj0cMTIDmsQf/lQwG6hSoG1LufKIqVzio3tRQa
 V1sHZ77oMWdEMl+yIYTY7Q=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3P3tEqC9lQkp+Aw--.37510S2;
 Wed, 18 Oct 2023 17:41:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: [PATCH v3 0/4] Add more format for vop2 driver
Date: Wed, 18 Oct 2023 17:41:22 +0800
Message-Id: <20231018094122.2475668-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3P3tEqC9lQkp+Aw--.37510S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5urW7tr4DZry7Cr1kAFb_yoWDXrcEk3
 yxJ345uFy8AF98Gas2qws7GrZ7tay29Fn0gFyvyF48Jas3Zr1kJ3ykCrZFqa4FvFW3Arn7
 Ja4UXrWIkF9rujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0KiiDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiTAoNXmI0bm1VQQAAsU
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>


This is a preparation for the upcoming support for rk3588 vop.

Patch 1 make the bpp calculation covery more format
Patch 2 remove formats that are unsupported by cluster windows
Patch 3 add more formats
Patch 4 is a format table rename

And I drop two patches that have applied by Heiko[0]
[0]https://patchwork.kernel.org/project/linux-rockchip/cover/20231013122001.1594009-1-andyshrk@163.com/

Changes in v3:
- add a bpp calculation function
- split patch 
- add format check and convert

Andy Yan (4):
  drm/rockchip: fix vop format bpp calculation
  drm/rockchip: remove the unsupported format of vop2 cluster window
  drm/rockchip: Add more format supported by vop2
  drm/rockchip: rename windows format for vop2

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 71 +++++++++++++++-----
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 55 ++++++++-------
 2 files changed, 85 insertions(+), 41 deletions(-)

-- 
2.34.1

