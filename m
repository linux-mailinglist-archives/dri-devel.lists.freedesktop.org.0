Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DD82A97E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B210E847;
	Thu, 11 Jan 2024 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B2EE10E7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=8s5k7ubzwbT6PFJHXm
 88W+KosJBhdpcR2bre8+/8h2g=; b=bZZ1Xj+bRibNpccFl0TfkL/IQOtFhmCEfL
 cJyDpYfd1PuCdy0o+7NE5yseoGaLv65heCqpbrVH6seHvbK9GBU0EVkbysp656wE
 az4PVMjv5OjJbQtkitqct2WrT3Kv72MsrFKm6ou+KHjw4UygDhiuV6oCpGNuF24s
 JEJnlBSnk=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDXP6Qkk59lJtqPAA--.16725S2;
 Thu, 11 Jan 2024 15:05:08 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: Clean up errors in opregion.h
Date: Thu, 11 Jan 2024 07:05:06 +0000
Message-Id: <20240111070506.9516-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXP6Qkk59lJtqPAA--.16725S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15uF48ZF18tryUZF1DKFg_yoWDJrXEkF
 1UZrs5urWku3ZYkFW3AFWYvry2yF4avF4rGa1Iqay3Jr47Zr1Uu3yqgF93Zr18Xa47Ga98
 Aa4qqFy7AFy7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S3UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhhi1mVOBk3MMwAAsh
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/opregion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index 0c271072af63..ff6632826376 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -211,7 +211,7 @@ void psb_intel_opregion_enable_asle(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct opregion_asle *asle = dev_priv->opregion.asle;
 
-	if (asle && system_opregion ) {
+	if (asle && system_opregion) {
 		/* Don't do this on Medfield or other non PC like devices, they
 		   use the bit for something different altogether */
 		gma_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_ENABLE);
-- 
2.17.1

