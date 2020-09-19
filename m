Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7238270C03
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EACC6E1D2;
	Sat, 19 Sep 2020 08:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30D66EDBA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 01:28:03 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AB19A843893E053C5C04;
 Sat, 19 Sep 2020 09:28:00 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 09:27:54 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dp: update kernel-doc line comments
Date: Sat, 19 Sep 2020 09:25:30 +0800
Message-ID: <1600478730-43417-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update kernel-doc line comments to fix warnings reported by make W=1.

drivers/gpu/drm/drm_dp_helper.c:1036: warning: Function parameter or member
'dpcd' not described in 'drm_dp_subconnector_type'
drivers/gpu/drm/drm_dp_helper.c:1036: warning: Function parameter or member
'port_cap' not described in 'drm_dp_subconnector_type'
drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
'connector' not described in 'drm_dp_set_subconnector_property'
drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
'status' not described in 'drm_dp_set_subconnector_property'
drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
'dpcd' not described in 'drm_dp_set_subconnector_property'
drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
'port_cap' not described in 'drm_dp_set_subconnector_property'

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 90807a6..a12485f 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1026,7 +1026,7 @@ void drm_dp_downstream_debug(struct seq_file *m,
 }
 EXPORT_SYMBOL(drm_dp_downstream_debug);
 
-/**
+/*
  * drm_dp_subconnector_type() - get DP branch device type
  *
  */
@@ -1077,7 +1077,7 @@ drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_subconnector_type);
 
-/**
+/*
  * drm_mode_set_dp_subconnector_property - set subconnector for DP connector
  *
  * Called by a driver on every detect event.
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
