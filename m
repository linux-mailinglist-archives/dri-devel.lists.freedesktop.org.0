Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15539344947
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DC66E145;
	Mon, 22 Mar 2021 15:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Mon, 22 Mar 2021 12:45:28 UTC
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8A06E0D9;
 Mon, 22 Mar 2021 12:45:28 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id E7F81980912;
 Mon, 22 Mar 2021 20:45:25 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Wan Jiabing <wanjiabing@vivo.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: priv.h is included twice
Date: Mon, 22 Mar 2021 20:45:10 +0800
Message-Id: <20210322124513.130470-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHkJDGElOQktNGkxMVkpNSk1PSkxKSU1JQ0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Nzo4AT8LKUIOTjoMTS8o
 HBwwCgpVSlVKTUpNT0pMSklNTUpCVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTEtPNwY+
X-HM-Tid: 0a7859f7f730d992kuwse7f81980912
X-Mailman-Approved-At: Mon, 22 Mar 2021 15:33:56 +0000
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
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

priv.h has been included at line 22, so remove
the duplicate include at line 24.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index c39e797dc7c9..09524168431c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -20,8 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
-
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
