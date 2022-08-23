Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997059F445
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8E31123F8;
	Wed, 24 Aug 2022 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1020 seconds by postgrey-1.36 at gabe;
 Tue, 23 Aug 2022 12:11:26 UTC
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C45113C70
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:11:26 +0000 (UTC)
X-QQ-mid: bizesmtp68t1661256679tov9dh2x
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:11:17 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: 4do7Yod3Qisv2fBV3BL8PyGx5qFmkAnPeIRHODAsHOnet4x0f7jRE8B9GKE0a
 mp8mH1ERDA8l9KwqSwptYfEJObC1HlARMrXwOW/m9rCS3ndkjZY5y2tHqw4L6JBqxNQvRIB
 tM9zH3TmWvcmcfvTE3LBxX/XUIgpJz9wNcp4HMIh/zM4wlY/B+hD9PrQUksNfjlAfj8dd79
 InNJCWKFrflelwMOyPHnARQ44EIKzD0fGyZOhYzWDrIY4dFv6XuYWZxc5eZulmW1HPgB/39
 IpTFEM8wR6PWa3QYtdqtXE0+QATWIP57abu1zUbQ2gY8pBqCz2bpOEtmhrzoIYxubNaL4GU
 5J5Q2lQMSwQlc2nyzZ26MBpylvJZtVVuEI6N6cPBCZ+ZvgefbHqyRMvvRaBMDWJIXOYtNP6
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, aniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:11:12 +0800
Message-Id: <20220823121112.5087-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/drm_ioctl.c    | 2 +-
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51fcf1298023..8faad23dc1d8 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -83,7 +83,7 @@
  *
  * 1. Directly call VERSION to get the version and to match against the driver
  *    name returned by that ioctl. Note that SET_VERSION is not called, which
- *    means the the unique name for the master node just opening is _not_ filled
+ *    means the unique name for the master node just opening is _not_ filled
  *    out. This despite that with current drm device nodes are always bound to
  *    one device, and can't be runtime assigned like with drm 1.0.
  * 2. Match driver name. If it mismatches, proceed to the next device node.
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..fd2790a5664d 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -606,7 +606,7 @@ EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral);
 
 /*
  * mipi_dsi_set_maximum_return_packet_size() - specify the maximum size of the
- *    the payload in a long packet transmitted from the peripheral back to the
+ *    payload in a long packet transmitted from the peripheral back to the
  *    host processor
  * @dsi: DSI peripheral device
  * @value: the maximum size of the payload
-- 
2.36.1

