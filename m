Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A836F9CE9
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 02:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5610E02F;
	Mon,  8 May 2023 00:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E1F10E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 00:09:23 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24dea6d5ce8so3739232a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683504563; x=1686096563;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h7g8Xlgvko0+iMQ3bWpyLb30HaolKZPLVEsVOIfgeRQ=;
 b=kokcZ59vCwy7TBU565FUIYz499meBcO2w/NuTo5ZzhoESU5eMI5T3nDT7AI50TreIw
 eMrPBzXPu0RVuw7e4xNGfZiijESCNgZn6icf++VOIIUQ3k2WFQScIMyGPrJ9x3a/xt5U
 i6K0MUR81wUkGuFRjzhPhq0QqFXaaNb2gWidYS8KfCDp9kPDKDMNyr3nq8zcKE7F40tf
 QAQRrUFTbd/yW12VLALxyNgHoz5fTANAQ3lSGRyx37WJV/JAaPXnNtXH/RoU/Ib7jIyL
 BwiB4JOYT8Y29SG/i3H4JG00d3BKYREzfZyNc8lean3svYPxR8nWBipVXTXszrdeCvjf
 K8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683504563; x=1686096563;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7g8Xlgvko0+iMQ3bWpyLb30HaolKZPLVEsVOIfgeRQ=;
 b=gr4Ceax62EsNOmFKEMR3bw8xO7VLsun5BXrSJbQhC/lMDvlRseUCTGevpBSz7TO+4g
 zT/eW6R0f8wT8P5dnrr/TBHT243VBIRByht6s9JUodSXB87G8sU1Z7dvyE/px/+jN52o
 WXxNJRFRCBjVEYNk4sbtAQG1lJ7vpBjUnN12uPqCj7AlEYyjgrWUJxi2i6/K97A6LB13
 fVgVsbbNcZza7WGMxNV1YR/6myre7pZWnQqJq0uuNwGFcf9eAnxLV5/BLBxu5eylfZvV
 tmYXZdeHb7ABSZPUtKylVYDuveuFkh38stl4w+orpzR1bNYti85Y6SAJSBstWS11KT/t
 F+pA==
X-Gm-Message-State: AC+VfDxy7OmjJOVPrkAf343vZnrYZJOYMTWeDnOiRCQgyD7/SL5fhQVi
 smCZ9Nopq14RoFQ5mjd4bMoaFrH6XTCSEQ==
X-Google-Smtp-Source: ACHHUZ4dyHjvWnYvH4eG8Ywx4yDKmoglkqdID4t9Fpxz8r4RCtCm6eIC4SjcZB+wz0MhTMTAZmnQqg==
X-Received: by 2002:a17:90a:3841:b0:24e:14a4:9b93 with SMTP id
 l1-20020a17090a384100b0024e14a49b93mr8994180pjf.43.1683504562529; 
 Sun, 07 May 2023 17:09:22 -0700 (PDT)
Received: from sie-luc. ([124.89.8.225]) by smtp.gmail.com with ESMTPSA id
 bs2-20020a632802000000b0051b5d0fe708sm5071243pgb.43.2023.05.07.17.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 17:09:22 -0700 (PDT)
Message-ID: <64583db2.630a0220.eb75d.8f51@mx.google.com>
X-Google-Original-Message-ID: <20230508000916.GA11328@sie-luc.>
From: Luc Ma <onion0709@gmail.com>
X-Google-Original-From: Luc Ma <luc@sietium.com>
Date: Mon, 8 May 2023 08:09:16 +0800
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/vram-helper: fix function names in vram helper
 doc
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Luc Ma <luc@sietium.com>

Refer to drmm_vram_helper_init() instead of the non-existent
drmm_vram_helper_alloc_mm().

Fixes: a5f23a72355d ("drm/vram-helper: Managed vram helpers")
Signed-off-by: Luc Ma <luc@sietium.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..f1539d4448c6 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -45,7 +45,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * the frame's scanout buffer or the cursor image. If there's no more space
  * left in VRAM, inactive GEM objects can be moved to system memory.
  *
- * To initialize the VRAM helper library call drmm_vram_helper_alloc_mm().
+ * To initialize the VRAM helper library call drmm_vram_helper_init().
  * The function allocates and initializes an instance of &struct drm_vram_mm
  * in &struct drm_device.vram_mm . Use &DRM_GEM_VRAM_DRIVER to initialize
  * &struct drm_driver and  &DRM_VRAM_MM_FILE_OPERATIONS to initialize
@@ -73,7 +73,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  *		// setup device, vram base and size
  *		// ...
  *
- *		ret = drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
+ *		ret = drmm_vram_helper_init(dev, vram_base, vram_size);
  *		if (ret)
  *			return ret;
  *		return 0;
@@ -86,7 +86,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * to userspace.
  *
  * You don't have to clean up the instance of VRAM MM.
- * drmm_vram_helper_alloc_mm() is a managed interface that installs a
+ * drmm_vram_helper_init() is a managed interface that installs a
  * clean-up handler to run during the DRM device's release.
  *
  * For drawing or scanout operations, rsp. buffer objects have to be pinned
-- 
2.25.1

