Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8D2A3EAC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D0F6EC5C;
	Tue,  3 Nov 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C8C6E41A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 03:49:12 +0000 (UTC)
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kZnJm-0002Ss-Tt
 for dri-devel@lists.freedesktop.org; Tue, 03 Nov 2020 03:49:11 +0000
Received: by mail-pg1-f198.google.com with SMTP id c9so7638282pgk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 19:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RliCu92b3IQig0c2jWKF3VuVRgf8DqyL8AZCCs07qII=;
 b=ZY9wufSsq+xrZ8R8Q4Fvemn+h3cnFyRY2PGlfXG7SrQkB7KkNDVomF2dHNRTPxolKE
 QynepUfa/Iy7uCpyZVY7sKtVN4MbEzGXSSF6DWYNQtclcsq/3xOfqFLfEy+bS0BBgqh4
 I0PUZFfR/CCF6OuPBJMpa9iHqxGGqTPa8ze42WG1dF3xCMxiGTySwBCIm+zxT9++bDKa
 uIfbVbBIQ/AgYM2GNs7VbWaJrFbvLug+KfK/KY+qwLJ4YPk84vhC3o3Dly5KXGuEI9Hf
 I9t6bWCiAbQB1SsjUPfjlfKy0saPfKCiDO5Wlo7lUAKMrpZfy0+0FdJujtz5NWPDm81r
 CSbw==
X-Gm-Message-State: AOAM530uGQnAgd0PiroCZQ3N9/LfX0QORMl2sPTbakU8bvI/pi840eAr
 rdJppkIR8c3cENan/6KtMCnFtbLcVRxuIAMvC5PyRU6vruNnV8j5pJP1RsSYS/scawPVIld5DZf
 e4VJSxtynQAg4VVlJ0Pd6MJKO+uUB9y9b8BmDh1Zn+6G6+A==
X-Received: by 2002:a17:90a:9dcb:: with SMTP id
 x11mr1573630pjv.132.1604375349510; 
 Mon, 02 Nov 2020 19:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxMUJNCcKeQ5cbFEtLT37uvAni0nkfgOfDYBkeExp0+DP5RBRtEs3L8WFEYJXQpLDtt7bPZA==
X-Received: by 2002:a17:90a:9dcb:: with SMTP id
 x11mr1573609pjv.132.1604375349231; 
 Mon, 02 Nov 2020 19:49:09 -0800 (PST)
Received: from canonical.com (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id jy19sm1072088pjb.9.2020.11.02.19.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 19:49:08 -0800 (PST)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/dp_mst: Retrieve extended DPCD caps for topology
 manager"
Date: Tue,  3 Nov 2020 11:49:07 +0800
Message-Id: <20201103034907.72129-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ad44c03208e46b83e4ae3269e32c9e524aa71cf8.

Currently DRM driver assume the source device caps is higher than the MST device
caps. With this commit, this statement would be broken.

e.g. the source device only support DP1.2 and the mst device support DP1.4.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 153b6065ba29..e87542533640 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3686,10 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		WARN_ON(mgr->mst_primary);
 
 		/* get dpcd info */
-		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
-		if (ret < 0) {
-			drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
-				    mgr->aux->name, ret);
+		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
+		if (ret != DP_RECEIVER_CAP_SIZE) {
+			DRM_DEBUG_KMS("failed to read DPCD\n");
 			goto out_unlock;
 		}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
