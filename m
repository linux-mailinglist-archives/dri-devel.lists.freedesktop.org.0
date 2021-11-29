Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCA460EFE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 07:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5626E903;
	Mon, 29 Nov 2021 06:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1005 seconds by postgrey-1.36 at gabe;
 Mon, 29 Nov 2021 06:50:54 UTC
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id C72066E903
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 06:50:54 +0000 (UTC)
Received: from BC-Mail-EX04.internal.baidu.com (unknown [172.31.51.44])
 by Forcepoint Email with ESMTPS id AD0D8A1E29CE0D499B80;
 Mon, 29 Nov 2021 14:33:44 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX04.internal.baidu.com (172.31.51.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Mon, 29 Nov 2021 14:33:44 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Mon, 29 Nov 2021 14:33:44 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Subject: [PATCH] drm/tidss: Fix warning: unused variable 'tidss_pm_ops'
Date: Mon, 29 Nov 2021 14:33:46 +0800
Message-ID: <20211129063347.404-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark 'tidss_pm_ops' as __maybe_unused to avoid
the warning: unused variable 'tidss_pm_ops'

Fixes: 6e120594631f ("drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()")
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 4366b5c798e0..7c784e90e40e 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -88,7 +88,7 @@ static int __maybe_unused tidss_resume(struct device *dev)
 	return drm_mode_config_helper_resume(&tidss->ddev);
 }
 
-static const struct dev_pm_ops tidss_pm_ops = {
+static __maybe_unused const struct dev_pm_ops tidss_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
 	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
 };
-- 
2.25.1

