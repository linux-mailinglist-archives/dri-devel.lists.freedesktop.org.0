Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB713486DE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 03:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75616EB82;
	Thu, 25 Mar 2021 02:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6766EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:19:48 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id F416C9802FC;
 Thu, 25 Mar 2021 10:19:44 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] include: linux: host1x: Remove duplicate declaration
Date: Thu, 25 Mar 2021 10:19:36 +0800
Message-Id: <20210325021936.839782-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUsZTU0eS0hPH0NKVkpNSk1NSENMQ05JTE9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MEk6OTo5GD8QEj8sNE5IPA4p
 VkJPCzZVSlVKTUpNTUhDTENNSUpIVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTkhJNwY+
X-HM-Tid: 0a78672e3693d992kuwsf416c9802fc
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

struct host1x is declared at 20th line. Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 include/linux/host1x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index ce59a6a6a008..462f0bc7a703 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -140,7 +140,6 @@ static inline void host1x_bo_munmap(struct host1x_bo *bo, void *addr)
 
 struct host1x_syncpt_base;
 struct host1x_syncpt;
-struct host1x;
 
 struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, u32 id);
 u32 host1x_syncpt_id(struct host1x_syncpt *sp);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
