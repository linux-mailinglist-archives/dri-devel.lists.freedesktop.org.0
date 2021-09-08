Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD428403A9B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578796E0EC;
	Wed,  8 Sep 2021 13:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29006E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1620359wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvOobenAM0Q/LnklwaxbdZzBpI86mvBzkX2gSnk+Ttc=;
 b=hI3EkOlivyMU/ivRQ159lmEQHyfWuaqR9MhBLhz/wILN0WRJIN0Mkt+HRoz0TGSdB6
 wGki2fVatdLkgrcha1Upj7O1TNGCvvSvtBTg6mrwzrQwr+coZ1jEka60VtDgYZm8BYPU
 B6EuUXGmYoSIpvjF0WdInsdG3xFNeheoNOU3BPRkGSebVwh2EUNIq1BOzLPcWm97Pyn8
 rg/at4nMT+LSGIGWsyYMtdEHvvEcAcHeyJa2UlW5ba4TH/GwQjk1/mKOD93oNZM+Qh7c
 6iocejzrhJizbsQTMt9PJGtXxneP2JwVeGMrqMVpsTiPXmLYGuONI6ue77K2sKMxOVgp
 eabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvOobenAM0Q/LnklwaxbdZzBpI86mvBzkX2gSnk+Ttc=;
 b=iuXH9IsJptGCgxnppDfr7VNMSiTjV2sOmctpcPrUc90nwZp03+hjgGr5ZpkVhNIryX
 cJT60ytdB9lv9bn+v7mN6XVm2TidUtmwbaQ5IcFif0BDyNn4zAS94UTsNkitmm80mami
 lZdfmTRxF0E+RjvXVVkSUcF/PbHb+sx7C3lbAA1lXt5giBVJPbyrJD64a8myyNvZXgNj
 dOSDfW9bHZiELZJbhHwbWYuDuIEYazV547Ne9hki5evIRITrjszVsxvXM5dHBTYzpCE1
 KhSUu7jv2mj9DboRnzBXXt+U00jsSM2p6QLlhN9gsVyLx8m8miDpPTXuLrByKQYrIwgZ
 4lGg==
X-Gm-Message-State: AOAM532ImalPjPD0c34AoSJyiiJ08/dvKR9q3eMbqQPeHvHEveMGQHJK
 pa1QEVa6DojgyTpSEC/Z0uoZNSNaw1/v0etY
X-Google-Smtp-Source: ABdhPJxA4rMPOCpAhs+qRz/YTpAULTWyBGSO9/CmvlYin+3Nak5xAHAt4Ksj0mmNn9yLnmcyEqyUHA==
X-Received: by 2002:a1c:2254:: with SMTP id i81mr3631114wmi.92.1631107781534; 
 Wed, 08 Sep 2021 06:29:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 5/8] drm/ttm: enable TTM resource object kerneldoc v2
Date: Wed,  8 Sep 2021 15:29:30 +0200
Message-Id: <20210908132933.3269-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908132933.3269-1-christian.koenig@amd.com>
References: <20210908132933.3269-1-christian.koenig@amd.com>
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

v2: add caching enum link

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/drm-mm.rst   | 9 +++++++++
 include/drm/ttm/ttm_resource.h | 6 ++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 3da81b7b4e71..66d24b745c62 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -43,6 +43,15 @@ TTM device object reference
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
index 32c5edd9e8b5..5952051091cd 100644
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
+ * @caching:		See enum ttm_caching
  *
  * Structure indicating the bus placement of an object.
  */
-- 
2.25.1

