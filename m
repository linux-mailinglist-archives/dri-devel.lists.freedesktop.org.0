Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E04DAC02
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 08:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1A710E814;
	Wed, 16 Mar 2022 07:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38CA10E814
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 07:46:51 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id 17so2015784lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z66Cljv4V2zq9A+9OGDIln4MBPhAg0rVku5PNVv7swc=;
 b=Vy6mZVhh6bXhB3RrZGRtlQ8w+xoIQQTYUqS9iPluFzffcTy+VUYLgn59YxLDWNNX1N
 5qdXIWKjIYy2tcMdhV7JevVV0lEA2NHScVUVn+7/17GJy4XWuzsNxQNbUN5n4f3hj6X8
 HC/qARosqBHxfNANUjkWuXjfQzw5uXKVwlpKvV5jQjPHffBERHrznvJobgqazrylrv0q
 +MNwdavt8tTL+oMFz+x6E6Pywr1eajiEAL5NaZu9SvR7gnR+FKqlPbRETPAkp8UjHAKZ
 PfMCBkfE2KlFxRdKJ6yryvLbi56mKrB2CH23qTMpf8NHn0xm/f5OofMl0kbgp8y4m2cC
 yM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z66Cljv4V2zq9A+9OGDIln4MBPhAg0rVku5PNVv7swc=;
 b=AslKc9lnHf756ai74dHW5SF6W7Kg5IUcB/cDNLqlUd6OAZq+NgKY2UUuCt5RNAUKDM
 mzM8SrOZ4/ib0uDlJAwU0b1IBnPXxgEzSsrDdnO8j6jYg9Yxc5g0m9qAXEz0FWw5M7gn
 nclyzWaMub27NUrPyDvh+W8IbF3T1VXpPsOPiGrx9ffDeQfqyA/r9uKPZ7pPz9nmeJW3
 LhU4I719Ng7LCi6gv4oIILQiRHCuqZNDlcCdVleXLoLQjwFmmNsl4QxQvp0OLOxw39dC
 37CEXDy1IOfxScb+Q+pHNznyXj/ggrrsjQsqYCf+CUrtgvfFDugaH5aXLXyj8LmPjfkd
 02Pg==
X-Gm-Message-State: AOAM533P3ZNBSs81zyCrdaldGcbZLGq4pSlASk0WV3DL9u+aLcKhNLaq
 siwygQbK/s9YwXzE3bo8SXTlNxbUZmJIcQ==
X-Google-Smtp-Source: ABdhPJyCmaQN65RnTGN6KrL0oPuW8yqJXzNdpLUQLap1ndt/+FiaP3l5Ldw6tX/g2LDL4uZUrmNIpw==
X-Received: by 2002:a2e:8752:0:b0:23e:d951:4184 with SMTP id
 q18-20020a2e8752000000b0023ed9514184mr19847043ljj.410.1647416809951; 
 Wed, 16 Mar 2022 00:46:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x23-20020a056512131700b004486c863c8esm108526lfu.257.2022.03.16.00.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 00:46:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/blend: fix typo in the comment
Date: Wed, 16 Mar 2022 10:46:48 +0300
Message-Id: <20220316074648.7009-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for drm_rotation_simplify() uses DRM_MODE_ROTATE_X,
while it's clear the the comment should mention DRM_MODE_REFLECT_X
instead. The example passes all flags except the DRM_MODE_REFLECT_X as
supported and expects to eliminate this flag.

Fixes: c2c446ad2943 ("drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to UAPI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..46ee5d5df6b4 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -317,7 +317,7 @@ EXPORT_SYMBOL(drm_plane_create_rotation_property);
  *                       DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
  *                       DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_Y);
  *
- * to eliminate the DRM_MODE_ROTATE_X flag. Depending on what kind of
+ * to eliminate the DRM_MODE_REFLECT_X flag. Depending on what kind of
  * transforms the hardware supports, this function may not
  * be able to produce a supported transform, so the caller should
  * check the result afterwards.
-- 
2.35.1

