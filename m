Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B5511217
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E0B10E173;
	Wed, 27 Apr 2022 07:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC4810EAD0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 23:59:48 +0000 (UTC)
X-UUID: 94ed86d57b4144be883c883cc106c916-20220426
X-UUID: 94ed86d57b4144be883c883cc106c916-20220426
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1008163666; Tue, 26 Apr 2022 20:15:24 +0800
X-ns-mid: postfix-6267E2B3-6324438736
Received: from localhost.localdomain (unknown [172.20.4.120])
 by cs2c.com.cn (NSMail) with ESMTPA id 715B13848650;
 Tue, 26 Apr 2022 12:16:51 +0000 (UTC)
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH] drm/arm/mali-dp: Fix spelling typo in comment
Date: Tue, 26 Apr 2022 20:16:39 +0800
Message-Id: <20220426121639.39160-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling typo in comment.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/arm/malidp_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/malidp_regs.h
index 514c50dcb74d..3bc16db70ddb 100644
--- a/drivers/gpu/drm/arm/malidp_regs.h
+++ b/drivers/gpu/drm/arm/malidp_regs.h
@@ -145,7 +145,7 @@
 #define     MALIDP_SE_COEFFTAB_DATA_MASK	0x3fff
 #define     MALIDP_SE_SET_COEFFTAB_DATA(x) \
 		((x) & MALIDP_SE_COEFFTAB_DATA_MASK)
-/* Enhance coeffents reigster offset */
+/* Enhance coefficients register offset */
 #define MALIDP_SE_IMAGE_ENH			0x3C
 /* ENH_LIMITS offset 0x0 */
 #define     MALIDP_SE_ENH_LOW_LEVEL		24
-- 
2.25.1

