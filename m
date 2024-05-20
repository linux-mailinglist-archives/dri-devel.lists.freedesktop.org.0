Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DF8CA3CA
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CA410E8A6;
	Mon, 20 May 2024 21:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhFn0KxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1310E8CF;
 Mon, 20 May 2024 21:10:02 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e67dc957b7so2713831fa.3; 
 Mon, 20 May 2024 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716239400; x=1716844200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=53034YuVpVfciE/wvZdryAxloQYpHQ6ctFzAU7LweAw=;
 b=jhFn0KxQpHh2NGzuFfMhJh6AnPYHKe4Bm5In4Gj8D4um9XD8tP5go/lSowwJ8Kzvzf
 L+wyLvt6iUQ33TtEfei/0bk3DD3CRLllMYUw5eL7PdAFwsiqZsqseEsDnaf3gGx6k8o/
 5+5Gi0CEd2s3hYcdRa/DjnCqZHjIG7egRacYex3LB4+xzAsPuhqUabkrGLRXSEsf5nvk
 pJqiG/DWTAeb7crqXkG4mKLDJdz36iBcH+z7Y0fjTYJl+AKxaGk4Rs10ReJqmqYwVHF/
 OaHxe2Sh7lJvX+kc+tbMIqFUUf89ONh5blLK2r44Dt0UxGAs7/0DdUn+Kg9awE7nkKwY
 ht7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716239400; x=1716844200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53034YuVpVfciE/wvZdryAxloQYpHQ6ctFzAU7LweAw=;
 b=h499ww4hJeFJDoP7w5aYS56ahfWb/7KqirTe7nM1f5HfT04S3mcDpY8LjoZIwxvUxo
 7dvgwfyoFCT87oocrK3Rw5HlWXXmo/XAl670+e6sHhRJUISN7U/78DzqmXECoOkabGKE
 EsEGYdkcolx7F/qHhlPsNjt/XvqP9yI1VOPoHhSEsw+ccboQysvovhSWpvZZSRASHsvA
 n6/mTNGp2JX5LTA8cylvcWJYPoBHev9g/OMp0Zbr9LjVDX2eQWasiBmHJqMvp2sQ1dU2
 61yT4z7Yf7FBdl8j26mwzRA95efmgpCj0YftiHJwGxIeVByFwcVc0eUvFspNmr5oKdeI
 jM0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxeL5O3TOXIr3PKnGxMWgqEP5Kh70k+T8eaL9RQTYSRv6fIaE9/BVWLccCRg1Hgp0HI4X34RXbJbas0s6h3pjZvsJMi69aTqh4xZhV2aEYPKRk8HZeSSmcjx5/h1EV1fPhs3yTwfyKLST+/8pLzw==
X-Gm-Message-State: AOJu0YwpQxFwyXQPsFeYHgdQxjOdjyGvfmoW2eJUR/RebIIG+OOzvzoK
 ePZj/ydbkUxpPh7qgnH3c/JC8DfwEetpdetXX4hKzUE5ytTbs6Tw
X-Google-Smtp-Source: AGHT+IGuVINOVLSuTvcBYbUGI0Y+rtIxJJEd/lKhqREuXLWhoprXeoQAz5Txnnw7cn6iVWuH+a2Q0w==
X-Received: by 2002:a2e:b985:0:b0:2da:320a:6739 with SMTP id
 38308e7fff4ca-2e51fd2d098mr142671251fa.1.1716239400333; 
 Mon, 20 May 2024 14:10:00 -0700 (PDT)
Received: from workstation.localdomain ([2001:4647:930d:0:6cc8:8362:4e13:c7e4])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbcc5fsm34781781fa.20.2024.05.20.14.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:09:59 -0700 (PDT)
From: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
To: alexander.deucher@amd.com
Cc: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Add pixel encoding info to debugfs
Date: Mon, 20 May 2024 23:07:29 +0200
Message-ID: <20240520210817.9943-1-rinoandrejohnsen@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 May 2024 21:21:53 +0000
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

[Why]
For debugging and testing purposes.

[How]
Create amdgpu_current_pixelencoding debugfs entry.
Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding

Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 27d5c6077630..d275e5522335 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
 
+/*
+ * Returns the current pixelencoding for the crtc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pixelencoding
+ */
+static int amdgpu_current_pixelencoding_show(struct seq_file *m, void *data)
+{
+	struct drm_crtc *crtc = m->private;
+	struct drm_device *dev = crtc->dev;
+	struct dm_crtc_state *dm_crtc_state = NULL;
+	int res = -ENODEV;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock(&crtc->mutex, NULL);
+	if (crtc->state == NULL)
+		goto unlock;
+
+	dm_crtc_state = to_dm_crtc_state(crtc->state);
+	if (dm_crtc_state->stream == NULL)
+		goto unlock;
+
+	switch (dm_crtc_state->stream->timing.pixel_encoding) {
+	case PIXEL_ENCODING_RGB:
+		seq_puts(m, "RGB");
+		break;
+	case PIXEL_ENCODING_YCBCR422:
+		seq_puts(m, "YCBCR422");
+		break;
+	case PIXEL_ENCODING_YCBCR444:
+		seq_puts(m, "YCBCR444");
+		break;
+	case PIXEL_ENCODING_YCBCR420:
+		seq_puts(m, "YCBCR420");
+		break;
+	default:
+		goto unlock;
+	}
+	res = 0;
+
+unlock:
+	drm_modeset_unlock(&crtc->mutex);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return res;
+}
+DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
 
 /*
  * Example usage:
@@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 			    crtc, &amdgpu_current_bpc_fops);
 	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_colorspace_fops);
+	debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_pixelencoding_fops);
 }
 
 /*
-- 
2.45.1

