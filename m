Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4595C9F7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 12:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBAB10E481;
	Fri, 23 Aug 2024 10:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 10:08:49 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA80310E481
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 10:08:49 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WqwHt1ZZBzQqQJ;
 Fri, 23 Aug 2024 17:48:42 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
 by mail.maildlp.com (Postfix) with ESMTPS id 76E6B1800CD;
 Fri, 23 Aug 2024 17:53:26 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 17:53:26 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] char/agp: Remove unused declaration compat_agp_ioctl()
Date: Fri, 23 Aug 2024 17:50:25 +0800
Message-ID: <20240823095025.3147585-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 87be41f09ac9 ("char/agp: Remove frontend code") removed the
implementation but leave declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/char/agp/agp.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index 67d7be800a7c..93689bfdda34 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -239,8 +239,6 @@ extern const struct aper_size_info_16 agp3_generic_sizes[];
 extern int agp_off;
 extern int agp_try_unsupported_boot;
 
-long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
-
 /* Chipset independent registers (from AGP Spec) */
 #define AGP_APBASE	0x10
 #define AGP_APERTURE_BAR	0
-- 
2.34.1

