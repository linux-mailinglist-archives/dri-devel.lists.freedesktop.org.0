Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A1535815
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 05:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C4910F080;
	Fri, 27 May 2022 03:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2214D10F080
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653622767; bh=VgYCARJCxZ73I3FQzoEKx0mY8qF/+EnWnCaE7wWATmo=;
 h=From:To:Cc:Subject:Date;
 b=TAP2w7BTx04xGKL+2y4L6/SMGGvLjceNoJLU+bN1lZuT+qLKYaUeaQglEToewAsvJ
 +J1SPbMjIIh2lOWrZn+DIjLmxzxgC45Cf9OBhD8CfqJhxmDXXKcfWZUC3ltge80wUY
 ui/lbaOpN6MLn0CSiRz3VGNYPRcys7drT91xmTSM=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 9D8B2C65; Fri, 27 May 2022 11:39:24 +0800
X-QQ-mid: xmsmtpt1653622764tvua4nhxo
Message-ID: <tencent_3F6C6B27BB06D7A05825908262DBE693E906@qq.com>
X-QQ-XMAILINFO: NnBlO8MsmACrj+nUmOY9ByB4oR0mQf7Dia0yKDkARyALSSm3N2z0WJoEzqZ6HT
 Z0Ukhc460xxdCzuWq/Yvi6FX3ykXNiCF6l7yY1wWhM3zMpFcnPWHzKywSImf6elflyuJzK0WSovt
 eYnBXYpAvUG4D4tsBeK+zLxl8m865Wk5L+rQE0idWJTktJ+ONqQNY94MgRvs0rhU7P0TfhSoWWWK
 0/EDduAstGiXl7tn4fGQh0JOFwq7DkR4Wxg+9B/bcZQhQyGivNruMql/bHpwSVsURmD2i0Yfd/4t
 QUYW0tCVCiGVTCq7WBNEE4CBmwEqs98yBPDmsJYz+CV9fIR7PkMSQDW2IenxdX3eJVAqRc37aHr+
 qtko4riFAP0GdyaRdQruz5TUf3hfmoGriCK+hWO6+ZjjNFCQZRO/tsIPXwYQxBoQOvlRYsRIbmdh
 mBjIwY5D7Ov7loI76iLMo4ooDjA2b27RAaHX21VkF6167gG5UYthOZZOSRqOhpYwFWBcvuI+RWJR
 /Rb9ofUY5zoVV3HlqT+rBP1yNdlnHawiH2p/4FDjVnR32HMgl4XBCWF2dBTuWXbEa/cZs5PZa3AW
 yYA72uMS6JNqtyZCWLBlMHJEY8YdFixhYXdQ9CH/NkOAZOHdfSrguuj5Ho6lo76v+aDwLxlqXrmu
 GmmJLhrnJd6XLdktmfZQpQsNQw6MSZGctNhuE8FfCG0vDwzkGj6hmQguYrUDkjE3rGslh66AV2u3
 u+S8c2DR3tROTGG+DRA5y2rX6ccHMk/zGuK14uqghxaKrHFNkv2SnTsqjDWmSZN4xEcLuIGfLGtZ
 SxJdYKwMaJZJqa6lLvL0eW1faByIywk0jrmrmUohPTPgsaLckuRK9bNpCCXz7eCzCkzpEvKwLhBA
 ==
From: 1064094935@qq.com
To: James Wang <james.qian.wang@arm.com>
Subject: [PATCH 1/5] drm/arm: Fix spelling typo in comments
Date: Fri, 27 May 2022 11:39:03 +0800
X-OQ-MSGID: <20220527033903.1203791-1-1064094935@qq.com>
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pengfuyuan <pengfuyuan@kylinos.cn>,
 Mihail Atanassov <mihail.atanassov@arm.com>, k2ci <kernel-bot@kylinos.cn>
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
