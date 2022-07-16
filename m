Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7CA57B16F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2BA1137BC;
	Wed, 20 Jul 2022 07:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716B1120AB;
 Tue, 19 Jul 2022 12:07:42 +0000 (UTC)
X-QQ-mid: bizesmtp65t1658232442ts1nmbp7
Received: from localhost.localdomain ( [171.223.96.21])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 19 Jul 2022 20:07:20 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: 3auutXC5AV+cOmKb/kyVFRYpEkBj9pk0YN38xAWBRX2vjduB3o0pX5BXL9f11
 iio/MpUwcAHR4nVFKa6lCgXdpC0GQzr6oCENhz/8zFiVEUDtO6xiHb92QdWnWjTrrgPoxBq
 44WwVHrvoasWDuB5uVCcLdZizf88muRTpgM2ZUVrS05HfV5KcRS72DdlCtEyG/+MUV23CBY
 /43Z9gwgmTHDGT6TacYkq7x7mdAvIW6RwYsiyljEqQIotnQOJBzs13RP2/6fmPVM96fV5hZ
 DHiw1d2pOtOs8HWLman7e4HjANUPJyk8GRpgGy0jyn13NIHrm95pzWfEfs/aVIzkimxuQLG
 jfXztTDBkec51/GzuAg6Xc1fwSZYTrxqaWU9561ZHNEOHfj66byjgNKYBJ2RCuKOgSJtoIH
 Ev8G9mlWhfo=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/i915/selftests: Fix comment typo
Date: Sat, 16 Jul 2022 12:05:20 +0800
Message-Id: <20220716040520.31676-1-wangborong@cdjrlc.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com,
 Jason Wang <wangborong@cdjrlc.com>, michal.winiarski@intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com, rodrigo.vivi@intel.com, zhou1615@umn.edu,
 John.C.Harrison@Intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the double `wait' typo in comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index c56a0c2cd2f7..ec05f578a698 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -971,7 +971,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 	if (err)
 		goto err;
 
-	/* Force the wait wait now to avoid including it in the benchmark */
+	/* Force the wait now to avoid including it in the benchmark */
 	err = i915_vma_sync(vma);
 	if (err)
 		goto err_pin;
-- 
2.35.1

