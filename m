Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6147CF4A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4901127FD;
	Wed, 22 Dec 2021 09:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7900311271D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 09:32:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g132so1147272wmg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 01:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvzzcJBBRe/pXCF+v6jb3YyzpE8towMbOfGTpdBZYQ4=;
 b=BnJrEYeQ9lRholCvNdZWMI8IPEl4yNEEZY2A/PVkCw5OMabI0C155EKBZQeI175HHe
 JeBMsTC69yUVwaV8u0jBcZ6smXmT+Gq6vzeTLfqfCda11RI+1N2B9clIqOUusDdE9Z0M
 5/8kxne+Igj43u/I7DHNKXRMK4mJnzAGWErsqtvKsOOoets9aHa/wHbBxnBE61QIXFrf
 r4hN5nZud57HCFtIq2I7oxeCzYQMrB+dR5XAhGCr/2TCQiirARYqDbHYsztgceuMSA7r
 VmCNeiQq4xrilp1r3YmsRAtVQhT6us7BF9NTA2Egcw4oDKVubpeJfOCnfatEMjQwA5ri
 Daow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvzzcJBBRe/pXCF+v6jb3YyzpE8towMbOfGTpdBZYQ4=;
 b=5kwGLCcD1FNrHxKCdlkVwOJTmCv0cJnI7sXUyLhlbi+1pj8MSZcqADIWPI+5LabiAl
 +r/TH1F6+/q9fMfI4jY9gnurH+xUTB694UKExaEYXZ69p+q86ftQm5+SdMxi7q1lMhCU
 HGn9TCvlEu88eBItHEyXFTqov8mIAEUA2BEZv4H0/fB9mu/LHaIyDTHYttFWRHYiDEoJ
 ViGapHqWHfMKf44W9d6NhIUHj/nqQZP+Kwt9Q5NBhLEdPf9h17Jk6yUHjCRS+pg5u5gi
 VfFgaEz2hrgogqik3ZR8qWyVR70fwTOc6GwIyNoOEMyuaWdyjzFNzyVI9Z4QK1wtrPbs
 +KFw==
X-Gm-Message-State: AOAM530NomV2qJtMi7p0HunMLVydy2O8B1O+dv8q0LSyljfefFSZpWTc
 NQ8I9xbS4I8D83na7Nv7hB4=
X-Google-Smtp-Source: ABdhPJwuweZgDrINU/dFrD8OKnXvbWpbMi/js5Tbd9cPQC331MDu3TsrNa36aLhoGKKijYM4EcE/Zg==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr301245wmc.82.1640165531995;
 Wed, 22 Dec 2021 01:32:11 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id k7sm1376187wrg.105.2021.12.22.01.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:32:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 1/1] drm/vkms: set plane modifiers
Date: Wed, 22 Dec 2021 10:32:07 +0100
Message-Id: <20211222093207.29342-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222093207.29342-1-jose.exposito89@gmail.com>
References: <20211222093207.29342-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Where no modifiers are exposed, usually linear modifier is assumed.
However, userspace code is starting to expect IN_FORMATS even when the
only supported modifiers are linear [1].

To avoid possible issues, explicitly set the DRM_FORMAT_MOD_LINEAR
modifier.

[1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/599/diffs?commit_id=5aea1bc522f0874e6cc07f5120fbcf1736706536

Suggested-by: Chris Healy <cphealy@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..1666fa59189b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -20,6 +20,11 @@ static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_XRGB8888
 };
 
+static const u64 vkms_plane_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -189,7 +194,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
 					   &vkms_plane_funcs,
 					   formats, nformats,
-					   NULL, type, NULL);
+					   vkms_plane_modifiers, type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 
-- 
2.25.1

