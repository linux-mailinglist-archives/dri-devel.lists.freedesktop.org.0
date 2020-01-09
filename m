Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B11351E7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 04:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0346E38A;
	Thu,  9 Jan 2020 03:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BEC6E384;
 Thu,  9 Jan 2020 03:24:21 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id 10so2191104ywv.5;
 Wed, 08 Jan 2020 19:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rFkSmOxXZdWIsdebp5JZgZ03dXIw1bet4Et7T7ieJk=;
 b=S8VVKK3nNG3Yor91b/6+VG000RMV9kR81ihY1ZFcHYVL74kFEV3o/pTnyMgatokZCJ
 rbpJvx9bYojc7tXAD++fHietN3mJMRiAh4L8hUhuue+brpyDtKJYvO+4+SCTt49dGZK9
 ++5+R07aQP9xGQFRCfklu+YvqvxUXvUPBNZHyQnpSGwcpHTSfdS8+dZCctr7j7zRQpIz
 ZS+47vhzpFjGrrSpK6E11cbfdgI1zQsGAWMIM+QnVuRfgqexPWWYA520AXArnT0r1cza
 AgUbX8obR1SMZ+x2bs6kyl9jw+Nho1SuWABqu8llHPN3kn2sCJ/9JSzp7+Ak4vCvDafK
 jwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rFkSmOxXZdWIsdebp5JZgZ03dXIw1bet4Et7T7ieJk=;
 b=pe4Ghjh29raqV/hMZDnONhuffhq3Z+O9sdTyzL10ILKu/5lSRZIsn6Ub0bTRcegIi9
 +kf3ChoYy/W6VYsisR/k8d9tKlQqn6bsIcxahcVp9WwzapzKsJPytwEmnHseRW1phzlT
 1KtV8/GcRFlZZkXZxswolXxocTIxDR2OQzmGQKe0YdNJscCxCTDyZZT4k0KZPpIdK1sH
 mchMRUhX95yAL06PowiqVKIkZcSc+39qiJGgM1fZC/Lj9yZ4lHNMgX6z0gQMFdMtz8pA
 RpP9KR0XmU2oigoqqO76NQnlnHEa/qoL9ii5pnLXLtscOAzASLaPZUg8V5KFil0nVnpr
 WaSA==
X-Gm-Message-State: APjAAAXFf5bMWbd9mLd4P7rzowqQhlXBbJVKVhyETAReJGtchOxpVM++
 9fz3QCDj5+yWxWyVmV8edYSridaj
X-Google-Smtp-Source: APXvYqz+E5dyc4OJKviT/Cums7aMCPgQY11GyEpvAIDfSHrDotxsbgKaGy+E2frwRg+6ELtrLUrdxA==
X-Received: by 2002:a81:9b41:: with SMTP id s62mr6001328ywg.309.1578540260991; 
 Wed, 08 Jan 2020 19:24:20 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l200sm2493213ywl.106.2020.01.08.19.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 19:24:20 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: fix documentation of
 drm_dp_mst_add_affected_dsc_crtcs
Date: Wed,  8 Jan 2020 22:24:12 -0500
Message-Id: <20200109032412.364214-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

the parameter is the mst manager, not the port.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7e9b9b7e50cf..a4be2f825899 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4781,7 +4781,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 /**
  * drm_dp_mst_add_affected_dsc_crtcs
  * @state: Pointer to the new struct drm_dp_mst_topology_state
- * @port: Port pointer of connector with new state
+ * @mgr: MST topology manager
  *
  * Whenever there is a change in mst topology
  * DSC configuration would have to be recalculated
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
