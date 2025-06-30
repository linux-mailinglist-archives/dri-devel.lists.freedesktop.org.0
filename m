Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3644AEE128
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A610E476;
	Mon, 30 Jun 2025 14:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BGEqDHh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19E10E476
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751294532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WSmEPnYFlo3nEKMgNzDLaZnUOSU1hoz+IcjIPvr6Ofs=;
 b=BGEqDHh6/3MY6UKtnxHayGXGOFmUMry2xb3LLjWApksgGLWt+KfVQenLWH1vU/pV4jSDyf
 prTEJnMkY6RWFirIVobbO4PpWljemr21cfnSh4reGW0PqQqg98Xvm9IxmJv40FOdZQ3arA
 3X0pp/9Zr8HFnrz8FUI4H9W2fR+POgo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-8ST2s3RlM9mDsD8Auc01bg-1; Mon,
 30 Jun 2025 10:42:08 -0400
X-MC-Unique: 8ST2s3RlM9mDsD8Auc01bg-1
X-Mimecast-MFC-AGG-ID: 8ST2s3RlM9mDsD8Auc01bg_1751294526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 919F71955ED4; Mon, 30 Jun 2025 14:42:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.121])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5F33319560AB; Mon, 30 Jun 2025 14:41:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/ttm: Remove unneeded blank line in comment
Date: Mon, 30 Jun 2025 16:41:08 +0200
Message-ID: <20250630144154.44661-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is an unneeded blank line in the documentation of the function
ttm_bo_kmap_try_from_panic().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506290453.NeTXAb7S-lkp@intel.com/
Fixes: 718370ff28328 ("drm/ttm: Add ttm_bo_kmap_try_from_panic()")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

Can this be merged through the drm-intel-next, as this is were the
offending commit was merged.

 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ad95e8b9852b..16cb4065214d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -382,7 +382,6 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 }
 
 /**
- *
  * ttm_bo_kmap_try_from_panic
  *
  * @bo: The buffer object

base-commit: d5bafb1c294cf99cc5991f7fdecc79898f9b8d0e
-- 
2.49.0

