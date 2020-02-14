Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D415E089
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E36FAB4;
	Fri, 14 Feb 2020 16:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56866FA9A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:14:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C15CD246E0;
 Fri, 14 Feb 2020 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696881;
 bh=IBGB+xDX7Tk9f82+ViaLQcfskmpjmicN/oxDPAoTq6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wPkprbZUFyqb/JA39AE1UgbnlLJCK5xvJEMM0/pcxJTPiKSCcU1AF5KIXq5kkwaie
 CoddkStmsHI4ZcDTGubJV5DdUXqpJsGLxwDLmW91bM8HQneK25rPjur21ftHP2cMLk
 8UFgg3zFe1yu/qHv0JxfN0KZlb1CTaNMH+yHN8cI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 136/252] drm/gma500: remove set but not used
 variables 'hist_reg'
Date: Fri, 14 Feb 2020 11:09:51 -0500
Message-Id: <20200214161147.15842-136-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Chen Zhou <chenzhou10@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Zhou <chenzhou10@huawei.com>

[ Upstream commit 72f775611daf3ce20358388facbaf11f22899fa2 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/gma500/psb_irq.c: In function psb_irq_turn_off_dpst:
drivers/gpu/drm/gma500/psb_irq.c:473:6:
	warning: variable hist_reg set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191227114811.14907-1-chenzhou10@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/psb_irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index f75f199c84311..518d7b4456bf1 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -471,12 +471,11 @@ void psb_irq_turn_off_dpst(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv =
 	    (struct drm_psb_private *) dev->dev_private;
-	u32 hist_reg;
 	u32 pwm_reg;
 
 	if (gma_power_begin(dev, false)) {
 		PSB_WVDC32(0x00000000, HISTOGRAM_INT_CONTROL);
-		hist_reg = PSB_RVDC32(HISTOGRAM_INT_CONTROL);
+		PSB_RVDC32(HISTOGRAM_INT_CONTROL);
 
 		psb_disable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
