Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F255E97EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 04:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5410E4BA;
	Mon, 26 Sep 2022 02:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18F610E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:36:48 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbRbg5KSYzHtm4;
 Mon, 26 Sep 2022 10:31:59 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 10:36:45 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/ast: make ast_modeset static
Date: Mon, 26 Sep 2022 10:32:53 +0800
Message-ID: <20220926023253.739699-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The symbol is not used outside of the file, so mark it static.

Fixes the following warning:

drivers/gpu/drm/ast/ast_drv.c:42:5: warning: symbol 'ast_modeset'
was not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 760b27971557..b9392f31e629 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -39,7 +39,7 @@
 
 #include "ast_drv.h"
 
-int ast_modeset = -1;
+static int ast_modeset = -1;
 
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
-- 
2.25.1

