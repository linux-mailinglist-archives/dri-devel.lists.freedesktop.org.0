Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C59389FB7
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 10:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B766E1D6;
	Thu, 20 May 2021 08:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 08:22:54 UTC
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E272F6E1D6;
 Thu, 20 May 2021 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=WduaGUDQfJqAn/2CdZ
 sXiEbdQawNCPzecMhloNG8VdQ=; b=IANSKRb4bj0JWgUq2zAC+lh8bKmR2MagiJ
 m3gswqekqiF8x/lk5INrlon8iD2mXC1xFKfu9Amy98EtV8v8ebCt/Kd5W000KHRe
 lTpnXD/ePWN1BVQxmDeyE6t1B+nD+Mz0Y8+cEp+RMeRBlgZ8B9S5cfiGDmdhjM+T
 avXERQzlc=
Received: from wengjianfeng.ccdomain.com (unknown [218.17.89.92])
 by smtp12 (Coremail) with SMTP id EMCowADnJVKQGKZgPukHsQ--.30342S2;
 Thu, 20 May 2021 16:06:43 +0800 (CST)
From: samirweng1979 <samirweng1979@163.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 sudeep.holla@arm.com, maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/i915/gt: fix typo issue
Date: Thu, 20 May 2021 16:06:46 +0800
Message-Id: <20210520080646.24132-1-samirweng1979@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: EMCowADnJVKQGKZgPukHsQ--.30342S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW7Cw47CFWkAF1kKF4DArb_yoWkuFX_Ca
 yUAry3Ja42qFn0kFy7ArnxZFy2y3ZxCr48G3W2qry7try7Aw4qgwsYvry5WF13WF43t3yD
 Zas5ZasY9w13GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU50jg3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: pvdpx25zhqwiqzxzqiywtou0bp/1tbiHROYsVSIqyRUwQAAsh
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wengjianfeng <wengjianfeng@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: wengjianfeng <wengjianfeng@yulong.com>

change 'freqency' to 'frequency'.

Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
---
 drivers/gpu/drm/i915/gt/selftest_rps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index 967641f..71e6658 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -606,7 +606,7 @@ int live_rps_frequency_cs(void *arg)
 	int err = 0;
 
 	/*
-	 * The premise is that the GPU does change freqency at our behest.
+	 * The premise is that the GPU does change frequency at our behest.
 	 * Let's check there is a correspondence between the requested
 	 * frequency, the actual frequency, and the observed clock rate.
 	 */
@@ -747,7 +747,7 @@ int live_rps_frequency_srm(void *arg)
 	int err = 0;
 
 	/*
-	 * The premise is that the GPU does change freqency at our behest.
+	 * The premise is that the GPU does change frequency at our behest.
 	 * Let's check there is a correspondence between the requested
 	 * frequency, the actual frequency, and the observed clock rate.
 	 */
-- 
1.9.1


