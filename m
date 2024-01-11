Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FC82A98F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C3810E852;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 673 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jan 2024 07:19:09 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCF5E10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=S/f2vyfPnwoS0WzdX3
 JNLT4HQzDSAla6k7Zu1R5fNKU=; b=VJmoc6MSB/ECxs9GhEKm5x1b/1LKRYgmHG
 Agik00T+6PRgE5+nMWX7zcPFARiRtG8OtBGizepRCElf8lexCvOBcM+KBDn0oOwt
 4KJCAJpB8UC9LT8DgAho1iCY845dq5H4v9fK9/55szQAlrRfapy1c2b+xqVFB3gp
 32IZGsRqc=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3X+1Alp9ljIeRAA--.17433S2;
 Thu, 11 Jan 2024 15:18:24 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: alain.volmat@foss.st.com, airlied@gmail.com, daniel@ffwll.ch,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: [PATCH] drm/sti: Clean up errors in sti_mixer.c
Date: Thu, 11 Jan 2024 07:18:23 +0000
Message-Id: <20240111071823.10142-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X+1Alp9ljIeRAA--.17433S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3XryfZF43Zr1kuF4Durg_yoW3Cwb_CF
 47trs5Ww4YyrnrGr12ka13ZFsavr43uan5Za48tas3JrWDXr45X34kWryDXw18WFW3JFnF
 ya97XFy3Cr9agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjT7KDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEh5i1mVOBk4eZgAAsj
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: do not initialise statics to 0x000000

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/sti/sti_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 7e5f14646625..6628c7f78868 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -16,7 +16,7 @@
 #include "sti_vtg.h"
 
 /* Module parameter to set the background color of the mixer */
-static unsigned int bkg_color = 0x000000;
+static unsigned int bkg_color;
 MODULE_PARM_DESC(bkgcolor, "Value of the background color 0xRRGGBB");
 module_param_named(bkgcolor, bkg_color, int, 0644);
 
-- 
2.17.1

