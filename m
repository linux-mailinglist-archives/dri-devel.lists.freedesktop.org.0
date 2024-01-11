Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205AC82AA96
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C110E838;
	Thu, 11 Jan 2024 09:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6510E838;
 Thu, 11 Jan 2024 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ANEG89gYRf51+rapw8
 sx8ynu43x7AerI7oBF9GRbLlo=; b=ex1NxR6CodTaMLVBzT71AwNPP2j+61Geuv
 +OLrDfKpBTyt47SmaCsN8CsI39tgY/9icXG2b2+ZdobnyyuKbg/U/EdUTO/Ou0I8
 /2uhPkKvIm8OhvvYOFq3gjHBKnjPatCSKYbA4RcuWt1+m96nQP2BVBZf0tB1QlY1
 nka3V5kEg=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDX36rgsJ9lRz+lAA--.34645S2;
 Thu, 11 Jan 2024 17:12:00 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/kms: Clean up errors in radeon_pm.c
Date: Thu, 11 Jan 2024 09:11:59 +0000
Message-Id: <20240111091159.13564-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDX36rgsJ9lRz+lAA--.34645S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur48GrWrKF15Gr1xZw4fXwb_yoWkGFX_uF
 W8uFyUX34qv34kuF1a9a90yr9Igr4kur4UZw4ft3WfJry5ZF18XFy8ZFnrXr4UXF4rJFn8
 Jw4kWa43AFsF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUj2NtUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQJixWVLYUQm5AAAs1
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
Cc: XueBing Chen <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space required before the open parenthesis '('

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index b73fd9ab0252..4482c8c5f5ce 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -587,7 +587,7 @@ static ssize_t radeon_hwmon_set_pwm1_enable(struct device *dev,
 	int err;
 	int value;
 
-	if(!rdev->asic->dpm.fan_ctrl_set_mode)
+	if (!rdev->asic->dpm.fan_ctrl_set_mode)
 		return -EINVAL;
 
 	err = kstrtoint(buf, 10, &value);
@@ -789,7 +789,7 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 		return 0;
 
 	/* Skip vddc attribute if get_current_vddc is not implemented */
-	if(attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
+	if (attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
 		!rdev->asic->dpm.get_current_vddc)
 		return 0;
 
-- 
2.17.1

