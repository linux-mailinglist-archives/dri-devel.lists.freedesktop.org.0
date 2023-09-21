Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75D7A93BB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619F10E5BD;
	Thu, 21 Sep 2023 11:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903C510E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:00:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4E761CE21BC;
 Thu, 21 Sep 2023 11:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1842FC4AF70;
 Thu, 21 Sep 2023 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695294042;
 bh=CXVMGgQjUK0AqnRsr4n/2gM4wmeCeFP94fXow1pAfno=;
 h=From:To:Cc:Subject:Date:From;
 b=EOjq6PXjAAfVDgx9T74+J+QH99K3xCnCFvtdBx3Huzcvirj15SLQnTF9/g5qBHxvZ
 Kcw83VsBJASEREpQ9mEZuH7KRefZhpTnAd+7RQZfLahUm2ObsFZ3nuX3UFPrQVqPMF
 DnrCelyns/y0gJFeJpHkaNxFrT9wY+MhfrWxGDt+1yWoq1r9nUn3Y+cqocCMQvIEO7
 4Fvn25OAe6j8qFVTTYkUxDZPVzUARwcUrbVR6ER/dYpdeTIcL73tybIPaA7cloNfID
 cPiXWvZl1KxyXRFx05LoW0/j1qEiVXtyCKHcnODAdyV2eBs4ZBPyHx/IsEuso4kKrg
 OP644A6A1FSNg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] MAINTAINERS: Update gma500 git repo
Date: Thu, 21 Sep 2023 13:00:38 +0200
Message-ID: <20230921110038.2613604-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMA500 driver has been handled through drm-misc for a while but the
git repo hasn't been updated. Make sure it points to the right place.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1012402dada5..5ebcf85bcbdb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6970,7 +6970,7 @@ DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://github.com/patjak/drm-gma500
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/gma500/
 
 DRM DRIVERS FOR HISILICON
-- 
2.41.0

