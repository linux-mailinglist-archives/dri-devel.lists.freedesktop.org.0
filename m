Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9760F2D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269B010E391;
	Thu, 27 Oct 2022 08:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E49010E391
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:46:42 +0000 (UTC)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id WKW00033;
 Thu, 27 Oct 2022 16:46:33 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.12; Thu, 27 Oct 2022 16:46:34 +0800
From: Bo Liu <liubo03@inspur.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm: Include missing header
Date: Thu, 27 Oct 2022 04:46:25 -0400
Message-ID: <20221027084625.2505-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.200.104.97]
tUid: 202210271646332f5d602ca8eb02dc5222562c63677094
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
Cc: Bo Liu <liubo03@inspur.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The file drm_nomodeset.c missed the header drm_drv.h, which
resulted on the following warning:

drivers/gpu/drm/drm_nomodeset.c:8:6:
warning: no previous prototype for 'drm_firmware_drivers_only'
[-Wmissing-prototypes]

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/gpu/drm/drm_nomodeset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
index f3978d5bd3a1..9402deb4985f 100644
--- a/drivers/gpu/drm/drm_nomodeset.c
+++ b/drivers/gpu/drm/drm_nomodeset.c
@@ -2,6 +2,7 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
+#include <drm/drm_drv.h>
 
 static bool drm_nomodeset;
 
-- 
2.27.0

