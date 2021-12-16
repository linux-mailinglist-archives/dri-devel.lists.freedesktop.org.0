Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5744779DD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2510E4EC;
	Thu, 16 Dec 2021 17:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356D610E4FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:02:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so18539928wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHIbexvgyxYJ1k2n4EF0wOhYX1hcCGRht3QxBaZ21nc=;
 b=Mny18kM8HNgLVeESO+lTUDXQlg6tWo66tNrwSssq4emBapLqAgY6GbjofxwTEWF/0T
 drkxtwQxoY/QQA42ZSI1HoqU1WjjZDk10dUOLwh0awplFkCP8nHeFkGAQiRNqnWOtxOH
 LiB77mhaLbJl9V4R2kvPDVnQ+VR1sm8vUuJQEqXAFNwJH5wl81LyXWlmvxb42kjT1hdT
 IYWTEEf17o3L/Yhc6849lQ+Cq+LV80YOyzA60QJUuVm5vuNYfv5/tyVJhzYza39HuXYf
 NGCqLScJYQKE2fL/7kevudbUli3VFoNjdjumVZAp1C3bfitQO8ZeRdpinhAz5ONMcjhR
 jotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHIbexvgyxYJ1k2n4EF0wOhYX1hcCGRht3QxBaZ21nc=;
 b=tadlZfx3J5jmFuWguk/Z7SUHm66TUn+8huGv3EAVEL9qDwFw4ucQkyf4pqbO/pBRfr
 Uk0bMjL+85mjNGm7uWkJB7U5tL1GENdppsGq9a4GRqFB/DJgo37H2okNifGPkM8EtFMm
 RdQ9aHzqEhmLBoFouBK8idkOlZ+a1aZ2aOHajlaArKFlfMkUK30FbbLo3yqsDokSu87y
 tP8QSLOgbCdqlHrnkFlotcDK0hArYB8+oATIHIiakCc2VpqXMual5uaPbRGW8lkzDFZx
 Bks3uuDUhFNDBNqnC9jTexm2iKJqiMI7nOmaX+HxrKEm7UMTk0EoG4RNimUDvCplrEDC
 dI8Q==
X-Gm-Message-State: AOAM532JitzkYoW0CEj3U//3/Gp9zftd4ee4/+56zEzJocvCBe5eOddu
 Q+K5rOfNex947kMeq3v7knY=
X-Google-Smtp-Source: ABdhPJytLEeaQza+C4ISdN62zhwLhTua7exk5e1Pc1JpDVRvTsi2wpmFBiglcvYzGnBhS1qFlcckEQ==
X-Received: by 2002:a05:600c:4e56:: with SMTP id
 e22mr5615636wmq.39.1639674123673; 
 Thu, 16 Dec 2021 09:02:03 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id n10sm5452472wri.67.2021.12.16.09.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:02:03 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH v2 2/2] drm/vkms: set plane modifiers
Date: Thu, 16 Dec 2021 18:01:40 +0100
Message-Id: <20211216170140.15803-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216170140.15803-1-jose.exposito89@gmail.com>
References: <20211216170140.15803-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
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

v2: Implement format_mod_supported (Simon Ser)
---
 drivers/gpu/drm/vkms/vkms_plane.c | 34 ++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 76a06dd92ac1..7e0d021494c3 100644
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
@@ -100,12 +105,39 @@ static void vkms_formats_for_plane_type(enum drm_plane_type type,
 	}
 }
 
+static bool vkms_format_mod_supported(struct drm_plane *plane, u32 format,
+				      u64 modifier)
+{
+	bool modifier_found = false;
+	unsigned int i;
+	const u32 *formats;
+	int nformats;
+
+	for (i = 0; i < ARRAY_SIZE(vkms_plane_modifiers) - 1; i++) {
+		if (vkms_plane_modifiers[i] == modifier)
+			modifier_found = true;
+	}
+
+	if (!modifier_found)
+		return false;
+
+	vkms_formats_for_plane_type(plane->type, &formats, &nformats);
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i] == format)
+			return true;
+	}
+
+	return false;
+}
+
 static const struct drm_plane_funcs vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= vkms_plane_reset,
 	.atomic_duplicate_state = vkms_plane_duplicate_state,
 	.atomic_destroy_state	= vkms_plane_destroy_state,
+	.format_mod_supported	= vkms_format_mod_supported,
 };
 
 static void vkms_plane_atomic_update(struct drm_plane *plane,
@@ -190,7 +222,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
 					   &vkms_plane_funcs,
 					   formats, nformats,
-					   NULL, type, NULL);
+					   vkms_plane_modifiers, type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 
-- 
2.25.1

