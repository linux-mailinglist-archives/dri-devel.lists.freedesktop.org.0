Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1CC3488F9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 07:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20046EB1C;
	Thu, 25 Mar 2021 06:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9176EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 06:20:44 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 5360C980378;
 Thu, 25 Mar 2021 14:20:41 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared twice
Date: Thu, 25 Mar 2021 14:19:01 +0800
Message-Id: <20210325061901.851273-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTR4fTE1IQkofTk8fVkpNSk1NTkhJT0pOTk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Hgw6LD8OGj4eLUMtGTIL
 HTQaFBxVSlVKTUpNTU5ISU9JT0tMVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTE1INwY+
X-HM-Tid: 0a78680acc88d992kuws5360c980378
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct xen_drm_front_drm_info has been declared. 
Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
index 3adacba9a23b..e5f4314899ee 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
@@ -16,7 +16,6 @@
 struct drm_connector;
 struct xen_drm_front_drm_info;
 
-struct xen_drm_front_drm_info;
 
 int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
 			    struct drm_connector *connector);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
