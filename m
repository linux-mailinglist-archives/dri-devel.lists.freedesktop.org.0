Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32F2C6388
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 12:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19016EBB7;
	Fri, 27 Nov 2020 11:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A0BA6EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:00:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BCC731B;
 Fri, 27 Nov 2020 03:00:37 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A690A3F71F;
 Fri, 27 Nov 2020 03:00:36 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Remove useless variable assignment
Date: Fri, 27 Nov 2020 11:00:27 +0000
Message-Id: <20201127110027.133569-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: liviu.dudau@arm.com, Carsten Haitzler <carsten.haitzler@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

ret is not actually read after this (only written in one case then
returned), so this assign line is useless. This removes that assignment.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 1d767473ba8a..eea76f51f662 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -163,7 +163,6 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	ret = of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
-	ret = 0;
 
 	for_each_available_child_of_node(np, child) {
 		if (of_node_name_eq(child, "pipeline")) {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
