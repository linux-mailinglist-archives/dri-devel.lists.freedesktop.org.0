Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2713021A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555A06E44B;
	Sat,  4 Jan 2020 11:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935BD6E160;
 Fri,  3 Jan 2020 01:12:00 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8DF79D2A8712AAF9FC4A;
 Fri,  3 Jan 2020 09:11:56 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Fri, 3 Jan 2020 09:11:54 +0800
From: Ma Feng <mafeng.ma@huawei.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/i915: use true,
 false for bool variable in i915_debugfs.c
Date: Fri, 3 Jan 2020 09:12:37 +0800
Message-ID: <1578013959-31486-2-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1578013959-31486-1-git-send-email-mafeng.ma@huawei.com>
References: <1578013959-31486-1-git-send-email-mafeng.ma@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/i915/i915_debugfs.c:3078:4-36: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/i915/i915_debugfs.c:3078:4-36: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/i915/i915_debugfs.c:3080:4-36: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/i915/i915_debugfs.c:3080:4-36: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index d28468e..4ead86a 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -3075,9 +3075,9 @@ static ssize_t i915_displayport_test_active_write(struct file *file,
 			 * testing code, only accept an actual value of 1 here
 			 */
 			if (val == 1)
-				intel_dp->compliance.test_active = 1;
+				intel_dp->compliance.test_active = true;
 			else
-				intel_dp->compliance.test_active = 0;
+				intel_dp->compliance.test_active = false;
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
--
2.6.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
