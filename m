Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D43FFFC0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590AE6E885;
	Fri,  3 Sep 2021 12:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0B6E889
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:31:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b6so8000206wrh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cY7NtM+SRTLS7C7nADWI7MDkvM2i2jB3+VLbOPI5Dow=;
 b=h1LK6EM81AbFZ922IpS8CBOllXK7C449+Ci/wPvSiFM3deCI/JyR65FXu679EJcq1l
 iLzGaFDEX/xABdq+C9wo546q7j2YV2UoFyYeKhE7fCJR8j5/F3A9ex/ue50GcnNMfwIU
 yr8u/jDOauNzOtfdwRw0u0UgwiRhMSCo1595nDgAb4df1mMhdjHSqG2OdPQRdPvI9Rwn
 ZRCMxc0m793TaMQE8omCrK2xT9Rtbqn22l4TC+rWh+LrzvcCrGBTA6NP3XvWO3E4tXPs
 Kf4L/SAXyBuHjgmZgByq/Gwzp1HtzNTG1DkUGehj3h6wMHlQiKoayQjCrxC+tAoGWiGt
 WGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cY7NtM+SRTLS7C7nADWI7MDkvM2i2jB3+VLbOPI5Dow=;
 b=hCG7xWjV4XcF+yZUV45l23YuS/8O/Dj1HbgU2dzzjHquqb5BOTtj/mUSlUeW5jnmY3
 Ej7/ONvTzodnZqZm0YpStYpcOZo/C8Qjh79shsDq2fj1IRzT9+SHDWbkxYSNfYPj0VTB
 ds0a/ZWlqEzeqa7Ged6C5B5wYL6sQvqi3hpxHOsgI8KMnoPbLqesKtRITdVvTOYDcqpg
 8TPI59I1Z9w56WzPtOrlyzdkR47pdnfvPxdO5S3UVDM4VudGTr7skXTdmyU/kqJxz99d
 +3/23DmmOrlE3MZSXYLHOg0RYJGbak4jajcyKpFtwKHCW8+KJJMeGJXKWxeQ2cKgHqzh
 rrpg==
X-Gm-Message-State: AOAM5330Hm2kOnIIN5YMYtynfhmBlUs12/cdf8rPKxx6mkgogWGW6L8u
 Ia9POJUZ857jFiHxhmFypkQJd1MEN20z7gFR
X-Google-Smtp-Source: ABdhPJz5IwHmCuevkcXwP5Wmmln+NTW4e2Rr6Gio23aQ67BBzch/CnwQ34hKMLxITt0EYVge/k7nHA==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr3814105wrw.403.1630672294660; 
 Fri, 03 Sep 2021 05:31:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 x11sm4564873wro.83.2021.09.03.05.31.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:31:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/ttm: enable TTM resource object kerneldoc
Date: Fri,  3 Sep 2021 14:31:21 +0200
Message-Id: <20210903123123.116575-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903123123.116575-1-christian.koenig@amd.com>
References: <20210903123123.116575-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the last two remaining warnings and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst   | 9 +++++++++
 include/drm/ttm/ttm_resource.h | 6 ++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 56b7b581567d..094e367130db 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -39,6 +39,15 @@ TTM device object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
    :export:
 
+TTM resource object reference
+-----------------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_resource.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 32c5edd9e8b5..255fc8169d9a 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -103,10 +103,7 @@ struct ttm_resource_manager_func {
  * struct ttm_resource_manager
  *
  * @use_type: The memory type is enabled.
- * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
- * managed by this memory type.
- * @gpu_offset: If used, the GPU offset of the first managed page of
- * fixed memory or the first managed location in an aperture.
+ * @use_tt: If a TT object should be used for the backing store.
  * @size: Size of the managed region.
  * @func: structure pointer implementing the range manager. See above
  * @move_lock: lock for move fence
@@ -144,6 +141,7 @@ struct ttm_resource_manager {
  * @addr:		mapped virtual address
  * @offset:		physical addr
  * @is_iomem:		is this io memory ?
+ * @caching:		What CPU caching should be used
  *
  * Structure indicating the bus placement of an object.
  */
-- 
2.25.1

