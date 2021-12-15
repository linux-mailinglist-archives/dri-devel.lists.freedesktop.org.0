Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D1475D36
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E7710EF20;
	Wed, 15 Dec 2021 16:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AF10EF20
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:18:26 +0000 (UTC)
X-QQ-mid: bizesmtp39t1639585092tzk1ch7u
Received: from wangx.lan (unknown [171.221.148.2])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 16 Dec 2021 00:18:04 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: TMbHAYExFrnCiy5Sipe7jG7PBJl0MFknZtWaCapYqBY7aJtaR1CDHRlTgtsxH
 wO0uRCiatUczPqLnqfOmc5dyPtbc7cCmPt1MN+FTBOaYVA15KCAhkBzb6AqJ0h3eZDNo3n4
 b2MXKDzxcc3x1txptQtMvKRXrnK9Sain0b+UNapWof5CiekKePwemnd2QvmvgsxwYx7GzoR
 9oSEbqbxa9YvP9GgNIEc+1oVFQfXKBQs9EWLrrui19UqT+yp/x2Z3pM4h5wLqaTMM7qvjMH
 Cyosjbsjc3Iwn6q95+B+kve7z8GSUFHZlT3/vQPMFW++EjYa4/qetLOdhG2ubCd0oxxg==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: jyri.sarha@iki.fi
Subject: [PATCH] drm/tilcdc: add const to of_device_id
Date: Thu, 16 Dec 2021 00:18:03 +0800
Message-Id: <20211215161803.5900-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam3
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct of_device_id should normally be const.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3ddb7c710a3d..d23ed0e2e87b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -587,7 +587,7 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id tilcdc_of_match[] = {
+static const struct of_device_id tilcdc_of_match[] = {
 		{ .compatible = "ti,am33xx-tilcdc", },
 		{ .compatible = "ti,da850-tilcdc", },
 		{ },
-- 
2.20.1

