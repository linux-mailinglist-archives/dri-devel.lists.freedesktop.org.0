Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E78CA790
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 07:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E27110EAF1;
	Tue, 21 May 2024 05:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7/SkQPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2BD10EAF1;
 Tue, 21 May 2024 05:12:27 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e1e8c880ffso8693401fa.2; 
 Mon, 20 May 2024 22:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716268346; x=1716873146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUapn7dPFkmrdlk6ElpkaCznwDwGsC/allixWXQKesY=;
 b=m7/SkQPlGeT8Q0Xrq6E/EmDpzy+66YeU3OEY5TDv5rUeHX4odJoUD6Vdjvp4MiCnos
 LPjfVw2IPbn+ByIyp6eT+xPVB5Y1Tm69J11SfMvmmIR0MITlQGitarjxm63LQaVH6alD
 HX0AzeGRclaHLvvpapAQyjbKwJoWwLsuIaXq9lIdrJDH21tuPyPP0vFiFtFZdf/LdCwG
 1ul6sZZb6b3RtZWI1kHN3ox37yppQwINH5n9EyqyDg5G98LBaIsHpb5/6iy8Vkqz2uqI
 8NRPR6FjUtGKUYOwCn9TZtoa8xXSvqAZZ689Kx2LHM+PB+TNH8WdlKutJL79OuAh3I3v
 JdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716268346; x=1716873146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUapn7dPFkmrdlk6ElpkaCznwDwGsC/allixWXQKesY=;
 b=s5Tty5ymkZ3PLvqGgNKX1hpTPMX3YmIqMsqu9GiDW0KtVawKaiKn3kggsaJVT+TuJn
 PVPN8SOw6kaTDCHKrAHTN2KkXdlXnWvprtARlmb0lR+u92w9/Ow213wYxCAVsZWoBqvn
 aTzGR7akll8sUQWPfkYNi8qZ5WC44Cb/ToOOncdhQmPTnYpX0XUTOtMOQUkPCUR+omA7
 LaG+uy9hlxNYQrxnxOG5Y+5DghYpGOF7DQekjW+YS22L9OQXCxvaKwDBZDfmhvZCcwyJ
 RAStiJqf3dLz8bf76YCwdWLYWJavY+A1H4FCsMgDCDeGGuyAMzgWwlVDK0O2LnvdfUkA
 uARA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWziIJ0DdzXlj0FJTp5Y/QPG1XospAqTeWtwBjOrGM9JEE4fsc8H+4QgxfZ35z96a3gFOLt3gA+VtUpMXWX2bUX/ZgggKv/EgCCEjE/3MYi8d0qMR5uDkAQ6B/xXCc+9EZeEvNs43NOfV7kwB0iyA==
X-Gm-Message-State: AOJu0YyI5plJi9dRJB1NGpBIa3LvzvfgHPGhC32SOrl8yHYoYhvdXDZa
 zJp7R9jCJdDZio1K9NVY7w/BlHpTcQCHMmyrVG4WKnTrntOs7vUB
X-Google-Smtp-Source: AGHT+IE2K6Julfu2AI4B9GNwgJRleFux2hV74ux3F8eePubIgAX73mqeQXyDMoHW0hxgc0awiuq59g==
X-Received: by 2002:a2e:a1ca:0:b0:2e5:67a7:dda7 with SMTP id
 38308e7fff4ca-2e567a7df67mr201821891fa.3.1716268345399; 
 Mon, 20 May 2024 22:12:25 -0700 (PDT)
Received: from workstation.localdomain ([2001:4647:930d:0:6cc8:8362:4e13:c7e4])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ef09ffsm35540931fa.59.2024.05.20.22.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 22:12:24 -0700 (PDT)
From: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
To: alexander.deucher@amd.com
Cc: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <wayne.lin@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
Date: Tue, 21 May 2024 07:11:23 +0200
Message-ID: <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
For debugging and testing purposes.

[How]
Create amdgpu_current_pixelencoding debugfs entry.
Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding

Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
---

Changes in v2:
1. Do not initialize dm_crtc_state to NULL.
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 27d5c6077630..4254d4a4b56b 100644
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
+	struct dm_crtc_state *dm_crtc_state;
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

