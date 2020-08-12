Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A20243487
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B796E6E47A;
	Thu, 13 Aug 2020 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D46E8CF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:40:04 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by lucky1.263xmail.com (Postfix) with ESMTP id 684A1A1B42;
 Wed, 12 Aug 2020 16:31:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P37123T139693005121280S1597221089119037_; 
 Wed, 12 Aug 2020 16:31:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <ad9528e0bf7ae9b013df868bd4c7e1c9>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: a.hajda@samsung.com
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Algea Cao <algea.cao@rock-chips.com>
To: a.hajda@samsung.com, kuankuan.y@gmail.com, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 airlied@linux.ie, heiko@sntech.de, jernej.skrabec@siol.net,
 algea.cao@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 0/6] Support change dw-hdmi output color
Date: Wed, 12 Aug 2020 16:31:20 +0800
Message-Id: <20200812083120.743-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support userspace to set hdmi output color via hdmi properties.
Add hdmi atomic_begin/atomic_flush to make sure screen don't flash
when updating color.


Algea Cao (6):
  drm: Add connector atomic_begin/atomic_flush
  drm: bridge: dw-hdmi: Implement connector atomic_begin/atomic_flush
  drm: bridge: dw-hdmi: Introduce previous_pixelclock/previous_tmdsclock
  drm/rockchip: dw_hdmi: Add vendor hdmi properties
  drm/rockchip: dw_hdmi: Add get_output_bus_format
  drm: bridge: dw-hdmi: Get output bus format when dw-hdmi is the only
    bridge

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 123 ++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h   |   4 +
 drivers/gpu/drm/drm_atomic_helper.c         |  46 ++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 221 ++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                |  23 ++
 include/drm/drm_modeset_helper_vtables.h    |  19 ++
 6 files changed, 428 insertions(+), 8 deletions(-)

-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
