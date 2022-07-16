Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C557B169
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA210E356;
	Wed, 20 Jul 2022 07:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32BF10F49E;
 Tue, 19 Jul 2022 12:11:03 +0000 (UTC)
X-QQ-mid: bizesmtp71t1658232648tu95v5nq
Received: from localhost.localdomain ( [171.223.96.21])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 19 Jul 2022 20:10:46 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: WKaXkSLX6oOMxAmviYlNwWMv0TGdduPbzjHTO13LpUEcMocSaLByA3yu89Ts0
 n+ccWHkn7zegKCtYtTWm5WfhHBFSmYdhZc7sgYjIHla9C5H17pGbCG7xu0sW12+8M/JGNy2
 gCQvXAjwbl+GEXJWWF9AWXe75EwPDyEFq2C8IZSAoZkbCpiwMbFkwryekJndBs7vs6iCEgr
 L02r5aiDNchyx/HpFMJx4Ks8Xsc/7qo7IJsw8k6qjAQr5xrZoCDpaouqH65tPn75su0Wg1u
 5FeeDWlURjKll6ONUT+pbywPeT3mrdTjcxnF5BJKop6vvUqRyO9kRs6jkb3BL962brhPto3
 bsCZZaBE+44mwQWPY20ItApVIWfY3vR/HvmRTtMXL8r1+OcRMIQA7EFCcoWJ32uKHBk8efh
 TfmRjq4Y++Q=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/i915/gt: Remove unneeded semicolon
Date: Sat, 16 Jul 2022 12:08:45 +0800
Message-Id: <20220716040845.32045-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Wed, 20 Jul 2022 07:11:29 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 matthew.auld@intel.com, Jason Wang <wangborong@cdjrlc.com>,
 rodrigo.vivi@intel.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The semicolon after a code block end symbol `}' is unneeded, remove
it.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 2c35324b5f68..a69b244f14d0 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -645,7 +645,7 @@ static int scatter_list_length(struct scatterlist *sg)
 	while (sg && sg_dma_len(sg)) {
 		len += sg_dma_len(sg);
 		sg = sg_next(sg);
-	};
+	}
 
 	return len;
 }
-- 
2.35.1

