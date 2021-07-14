Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88063C9ACF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BD36E5A0;
	Thu, 15 Jul 2021 08:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jul 2021 20:41:56 UTC
Received: from st43p00im-zteg10063401.me.com (st43p00im-zteg10063401.me.com
 [17.58.63.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3736E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1626294927;
 bh=7DwUPoV9IztFfSwlvH+mW8SDazur3k/YH6VaR6m3ZKk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=zOJ1t7Ok2BF0GgxbtBr9hUbdB8ijS9AdjtyTaeP8NP6/xBm2Q56USCMBL2rXWTWTv
 Aq2h0iPfL4TyB3PKE4sGf55CC696mTXWhAZWNjxFrfCOqXNBtJ+TwYj1rn2ij0XrS5
 ZklsGn7aIT6W+G+fXAYyYV4OatpJlh5B1DDu6OLTMIyOc8OTY0hOrWS68cLu8kWnbA
 qpQPk+E8GCW3bcIyjRQ91dUINgzTbYioZkIJ/8loOC5f3a6P9OeC7SUemuHOfqyT6W
 yyF3WFChg6T3iJz5umuPRRbOEdrh9ohJ9bsA3yaeIhAUP8BS9RfURaSCFA6L55lso6
 O3O+tfh84MFrA==
Received: from localhost.localdomain (dyn-72-33-2-114.uwnet.wisc.edu
 [72.33.2.114])
 by st43p00im-zteg10063401.me.com (Postfix) with ESMTPSA id E8F874A047D;
 Wed, 14 Jul 2021 20:35:25 +0000 (UTC)
From: Marco Kurzynski <marcokurzynski@icloud.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drivers/gpu/drm/i915/display: remove boilerplate code using
 LOCK_ALL macros
Date: Wed, 14 Jul 2021 15:33:25 -0500
Message-Id: <20210714203324.146783-1-marcokurzynski@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2107140122
X-Mailman-Approved-At: Thu, 15 Jul 2021 08:44:52 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Marco Kurzynski <marcokurzynski@icloud.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replaced the boilerplate code for intel_display.c with
DRM_MODESET_LOCK_ALL macros per the TODO in gpu

(I apologize if I did something wrong, this is my first contribution of
hopefully many, so excited!!!)

Signed-off-by: Marco Kurzynski <marcokurzynski@icloud.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3bad4e00f7be..4a46d63b4d39 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13307,22 +13307,12 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
-
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	if (!ret)
 		ret = __intel_display_resume(dev, state, &ctx);
 
 	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
2.25.1

