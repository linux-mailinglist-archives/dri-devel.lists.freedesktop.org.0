Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3860E54DA5A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725F11A0D5;
	Thu, 16 Jun 2022 06:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-251-66.mail.qq.com (out203-205-251-66.mail.qq.com
 [203.205.251.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31B113EA2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1655360027; bh=VgYCARJCxZ73I3FQzoEKx0mY8qF/+EnWnCaE7wWATmo=;
 h=From:To:Cc:Subject:Date;
 b=HDYY7TNj0NwxGmpGOsOvw5gsXhsQ2NkJ8K3rNJRmfhPbXmp3tr7tZ9Z1oF/EjhoeD
 TX7lSMiNtaNKDfun6ypifnIIcdDyomIwMDxHz32B3qkmu3mEm3Ka5u6miBVlG/k4NE
 QLgUYBoqTHj7p6bZc4KSWX5qZ8FxOqtGYuha542A=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
 id 36B3329D; Thu, 16 Jun 2022 14:13:43 +0800
X-QQ-mid: xmsmtpt1655360023t3951dpdc
Message-ID: <tencent_B2EC075C02629C40328A2F9BABA61DAD7008@qq.com>
X-QQ-XMAILINFO: MqN/FiDJuNHij72sLWQib2O0QRuzqM+vDH+VPcWaMPqd38JPijAk/pk7urWv9G
 LmHosQN5oKaVuS6NKCREfnEaTkoN/8fwnNkUV57HUaKIRTkqyRnTOgR8TVbG7URvFgqJ69D2XwM1
 T59v0QrQjXveq99kbJiojzMVXhYIb/3jLbpA0wpDx8he2YVCjmqN07VNesDg5xolusmatEURPopG
 eU/FgyWrOiOpWoieoBhrKkP4cYMCkMq0VFt5A5IiGhULplLP8agGT0HRagSwjfO58qsuaM+8IwqM
 GVUy6jS5wXeeRL3/oVgVw8rqmeEjjrLPsj16LMJYbGaWMS7NM0oVzdVqDIiVmacrGWY83LM+QouF
 tid5abx01XSY1q60c/WTPESpnRbD5OaEH9lVq8h20X9wPEkbbNhmNwFSEg68n0nA5z2X541mqIUj
 gSCIlVR/z4RnYcKBj6K0P0zaIsGA/7yTjtFtL48oYkbI7bjPLjFX3mUMCtSJWwJxylTXKjAyCTa9
 9ZaEZg0VMtderchsGJ/3CTckMBOUqVA4cTlq482VfNkK23om1bTgzByWbapsEDLmy+4YP0xB8Omy
 xPcf/eP1hg/ENLXFxagMGJaUUcOFJ9BcgECRfWUwp2F2wqB/SXTIxs6l7ZBovFIuODGGzYIYbXTj
 lljM+fQBBDa0ZkZo/psKBHNzF0C+eykvbOyhGDZgIhj7dFr+GhVjkd5jghnU/aEey7rRDLp78ynu
 iMcjf2p8XyOjPtIbAr0EHm21ejUx66HscYysJxH5AsjHdRP2g8PzZCjK5mZeii/FTfohmH1qCG4s
 ipAuydTwi+OmdBP6sEV557tIBkL/TWUPMbrcEyLeW1TQk5V0TQLN9Cq1BLf3AdBOat1ZlJjiCtEg
 ==
From: 1064094935@qq.com
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH] drm/arm: Fix spelling typo in comments
Date: Thu, 16 Jun 2022 14:13:31 +0800
X-OQ-MSGID: <20220616061331.102272-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 james.qian.wang@arm.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
 drivers/gpu/drm/arm/malidp_regs.h                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index e672b9cffee3..3276a3e82c62 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -1271,7 +1271,7 @@ int komeda_release_unclaimed_resources(struct komeda_pipeline *pipe,
 	return 0;
 }
 
-/* Since standalong disabled components must be disabled separately and in the
+/* Since standalone disabled components must be disabled separately and in the
  * last, So a complete disable operation may needs to call pipeline_disable
  * twice (two phase disabling).
  * Phase 1: disable the common components, flush it.
diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/malidp_regs.h
index 514c50dcb74d..59f63cc2b304 100644
--- a/drivers/gpu/drm/arm/malidp_regs.h
+++ b/drivers/gpu/drm/arm/malidp_regs.h
@@ -145,7 +145,7 @@
 #define     MALIDP_SE_COEFFTAB_DATA_MASK	0x3fff
 #define     MALIDP_SE_SET_COEFFTAB_DATA(x) \
 		((x) & MALIDP_SE_COEFFTAB_DATA_MASK)
-/* Enhance coeffents reigster offset */
+/* Enhance coeffents register offset */
 #define MALIDP_SE_IMAGE_ENH			0x3C
 /* ENH_LIMITS offset 0x0 */
 #define     MALIDP_SE_ENH_LOW_LEVEL		24
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
