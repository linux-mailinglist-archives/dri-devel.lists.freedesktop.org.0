Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2A138672
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788376E52E;
	Sun, 12 Jan 2020 12:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEB96E207
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 07:46:30 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 58AB45A5CF57F5601BCD;
 Sat, 11 Jan 2020 15:46:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Sat, 11 Jan 2020 15:46:20 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Sam Ravnborg" <sam@ravnborg.org>, Kate Stewart
 <kstewart@linuxfoundation.org>, "Dan Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH -next v2] drm/mgag200: Fix typo in module parameter description
Date: Sat, 11 Jan 2020 07:42:06 +0000
Message-ID: <20200111074206.68290-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was a typo in the MODULE_PARM_DESC(). It said that the
module parameter was "modeset" but it's actually the description
for "hw_bug_no_startadd".

Fixes: 3cacb2086e41 ("drm/mgag200: Add module parameter to pin all buffers at offset 0")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: Fix the description
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 7a5bad2f57d7..2236f8ef20a4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -28,7 +28,7 @@ MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
 int mgag200_hw_bug_no_startadd = -1;
-MODULE_PARM_DESC(modeset, "HW does not interpret scanout-buffer start address correctly");
+MODULE_PARM_DESC(hw_bug_no_startadd, "HW does not interpret scanout-buffer start address correctly");
 module_param_named(hw_bug_no_startadd, mgag200_hw_bug_no_startadd, int, 0400);
 
 static struct drm_driver driver;



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
