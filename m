Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0FE46FFE8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F93188401;
	Fri, 10 Dec 2021 11:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 10 Dec 2021 10:35:42 UTC
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D7A10E5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 10:35:42 +0000 (UTC)
X-QQ-mid: bizesmtp41t1639132106te84a0qj
Received: from localhost.localdomain (unknown [182.148.15.171])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 10 Dec 2021 18:28:22 +0800 (CST)
X-QQ-SSF: 01000000002000905000B00A0000000
X-QQ-FEAT: 2YircyAZcttVhO3fNgRwuEXtz87LTwFhcBlCiG1QLK3XgbXoBrgSmwW3KZlln
 ClgP9V7qQ+F75WRCB1RUIwPgBENsseluzGqw03+lzOpbJvLsS5UksoEO1map0Kxx4g0QVuW
 wtcfC6FcMQHIvQzqM2/5kDwHlAdNdg9eECDrvtNEOPN+UNR6M1I50ZkJGx0r57ztQxqVqNi
 RZDCTqr4j4Axjk0KtOertRlyuRinAhpTXVrBWgqfkDgEFNijbKM+CK2zwSCKcoVmNuS9J1n
 gFRnT79e96iHkEFbjdX+XTjMfVdsp10FiYKZmoCQFVj1zF1gpa6UfMiVwnKXyHvA5QIg==
X-QQ-GoodBg: 0
From: Chunyang Zhong <zhongchunyang@cdjrlc.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] =?UTF-8?q?video:=20ocfb:=20add=20const=20to=20of=5Fdevice?=
 =?UTF-8?q?=5Fid=C2=A0?=
Date: Fri, 10 Dec 2021 18:28:16 +0800
Message-Id: <20211210102816.9187-1-zhongchunyang@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
X-Mailman-Approved-At: Fri, 10 Dec 2021 11:31:28 +0000
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
Cc: linux-fbdev@vger.kernel.org, Chunyang Zhong <zhongchunyang@cdjrlc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct of_device_id should normally be const.

Signed-off-by: Chunyang Zhong <zhongchunyang@cdjrlc.com>
---
 drivers/video/fbdev/ocfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index bfa4ed421148..da7e1457e58f 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -387,7 +387,7 @@ static int ocfb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id ocfb_match[] = {
+static const struct of_device_id ocfb_match[] = {
 	{ .compatible = "opencores,ocfb", },
 	{},
 };
-- 
2.34.1

