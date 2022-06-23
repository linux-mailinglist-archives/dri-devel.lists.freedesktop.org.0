Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56855778A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5D113D97;
	Thu, 23 Jun 2022 10:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg123.qq.com [175.27.65.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51CC10ED83;
 Thu, 23 Jun 2022 10:11:31 +0000 (UTC)
X-QQ-mid: bizesmtp86t1655979080tmae7bvk
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Jun 2022 18:11:15 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: eTtJes0duVuwo973AxPJ44nNgZK3VipdwRJZACVeW0Ma4a7QjAtNIY77AxfN1
 yVaANgSxeuFDkkDa3lumdkOgkd3ZyKvtmtgpr8q2Vq8+mV+RscW8g9fpkTuUKI5guviJZe4
 ZgTheEIsN/wh2aZBerfxSO9TccQB1va3TxqwKiVD3Wdju8I1+jcqYZVfpPuNx5gIrNndb8s
 Ry/nu3rCoy97BIBRB3TiFxfv0sudoMSSo1bphwUjfW8yuppyl1rdgBKrWBXlFdlJ/JB5/VF
 0BR/Tfde5SapnWrUQ8ZcBGneepDo4ijB5pJC0Pl26b5w2Qm6pXkvDIHoCZhNifyIz+5Kz24
 AJmKKvIdyTPN1WXXj9+pPskSDqn3Q==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] GPU: drm: i915: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 18:11:13 +0800
Message-Id: <20220623101113.28470-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - drivers/gpu/drm/i915/i915_reg.h
line - 2537

 * Please check the detailed lore in the commit message for for experimental

changed to:

 * Please check the detailed lore in the commit message for experimental

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 616164fa2e32..738c020396af 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2534,7 +2534,7 @@
  * HDMI/DP bits are g4x+
  *
  * WARNING: Bspec for hpd status bits on gen4 seems to be completely confused.
- * Please check the detailed lore in the commit message for for experimental
+ * Please check the detailed lore in the commit message for experimental
  * evidence.
  */
 /* Bspec says GM45 should match G4X/VLV/CHV, but reality disagrees */
-- 
2.17.1

