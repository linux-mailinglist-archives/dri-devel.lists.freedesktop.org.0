Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F3CAB30C4
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FA910E2EC;
	Mon, 12 May 2025 07:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0Y41zbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD310E049
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 19:20:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-476b89782c3so43171791cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746991230; x=1747596030; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
 b=L0Y41zbw6Ol9pgie1KThm5jUTj6Z6qNFkwbeP92TnmZWPrd+VNmPCOAfDGgoncP1/S
 7OT0RyTsjXxHFgaHGgWQ5kc/oC/yJ5O6Gp37z/P1XLKIv0rjvZJKi9D6tI9qAD3+c/WC
 VLsXxgd5eWR+QI3E3VrCz9IzCA17yWRfEkBCRGtca0yIZ+SIRZsbqdgwNNmJZpgav8IY
 wy14vVsyFau5HgfYcH9bqeG+jeNESJ5IHWjP+WJIbuaEzkVemyr1NHekR28PEGzPhfai
 kuO+nqSggvVbBdfdMiIeEHeUpjNROnw7lJ/QGVnOJZ9enlu1F4jg9/rlDHlHoLXlAz/E
 HhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746991230; x=1747596030;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
 b=un0R4IX69Fmdy5tsjI78Zte/VtfwNPooReQpS7uettpaxSwQ/Fk/otWhcx0BkHDjJL
 XDHy58Nd9peV/88Nd8peRVJHDwnTj0HIuF3kmeZsMCqHvqLUMRVXw9pXSj1njww4x1lt
 zHTi9uTSaEEsoXhuikWNOxKGUpPLpGeIkZqQbDbyiEkc+Op1Y2x+6H+VU0g35L2QVFga
 P2MAEMV8rE9lzxLEC9j5x9mGoLpr+bQM0n//F9Z+4JG6MzdXyK0FKFNVpOKJKwghZy33
 ZswSnkLPOj12RAiION1PEkY6YrgzxidbXbNeNeP9Eno0hzXNY9pAwWinmY/tAv2aolQo
 tFsw==
X-Gm-Message-State: AOJu0YyT4F6jbFZFhMyvvMBaSjBY+Fs09X/io94X0o+5ZvHrUF1UnzOB
 vVJOMDROgY45eztxrZzrcFwSD3sAEZkJf3K/hfQExPSrp7zqmiGO
X-Gm-Gg: ASbGnctfFcdZNpv1DR505ABTd9OgwqxIi1MkjkgruiKdBKkwU5PD33KxO7JzsBCnlKL
 j1vdIr9GtBA01V+RUT82EuEcsa3GZT4G7jF67GcAPQPI3cTibTA45DG9yXpUSUeAtjVwiI4zC1k
 fhtRvACMdKh43emTWGcNp+LuGEjeu1ih9jo2lYXmDZl5s5WM9HteGTd2pnU4xbwEDQoUJFOVVDp
 xT1KYNjDaE2QWMI6cS32dZTjkCeqReCqocJ56Z0OtlPqMU1uBzs/FrKSQHsPS+hT+Vg3R6MF2NS
 ILfXa6iqs2y3ZPPHk9qs0qLJ8l/t24nknVYWeF7e2lk6NNhk9rDTw/RSzNBrz13hKA2qXU01nmU
 DRso=
X-Google-Smtp-Source: AGHT+IHxHdhbMecqAlIJ9BFR5VTyTebEcJ68Sdc+9LQ5gw9CxqdT+Vni7AuYp84juCmiEvqZ7p8faw==
X-Received: by 2002:a05:622a:cf:b0:472:1225:bd98 with SMTP id
 d75a77b69052e-494527f3b77mr199481001cf.50.1746991230162; 
 Sun, 11 May 2025 12:20:30 -0700 (PDT)
Received: from DESKTOP-IH04BR9. ([142.181.68.189])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4945246ca09sm39393991cf.15.2025.05.11.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 12:20:29 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sun, 11 May 2025 15:19:53 -0400
Subject: [PATCH v2] drm/vc4: fix infinite EPROBE_DEFER loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-vc4-audio-inf-probe-v2-1-ac204c961db4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFj4IGgC/32NQQqDMBBFryKz7pQkqJGueg9xMcZEB6qRpA0tk
 rs39QBdvgf//QOiDWwj3KoDgk0c2W8F1KUCs9A2W+SpMCihGlGrFpOpkV4Te+TN4R78aNG1mjo
 iRbITUJZ7sI7fZ7UfCi8cnz58zpMkf/Z/L0mUSI0QumtGLSd3n1fix9X4FYac8xdcQTSItgAAA
 A==
X-Change-ID: 20250426-vc4-audio-inf-probe-f67a8aa2a180
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746991229; l=3254;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=t5dVTCp32WYZx9iv5cpagryELVCp3Jre7TvwO5v+zq4=;
 b=xZRAlewdC/XbXWZt7fKdwPsCS1a1+CxfP4Oc/+74mXNFfHKzPzY95a/SUMCfmTW7DFykxP6eO
 UF8NczwHBP+Dg9q27N2Qg3bYC8Nx6LQu7LPVEkcx110RW6/9INBFoZj
X-Developer-Key: i=gabriel.dalimonte@gmail.com; a=ed25519;
 pk=y2QfWJ6TJVcd8RyB6C0zTc7+AqnN6+9cOX7TxbshPMQ=
X-Mailman-Approved-At: Mon, 12 May 2025 07:49:43 +0000
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

`vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
child device. The driver model docs[1] state that adding a child device
prior to returning EPROBE_DEFER may result in an infinite loop.

[1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html

Fixes: 9640f1437a ("drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure")
Signed-off-by: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
---
Starting with v6.14, my Raspberry Pi 4B on the mainline kernel started seeing
the vc4 driver looping during probe with:

vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
Registered IR keymap rc-cec
rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input3503
vc4_hdmi fef00700.hdmi: Could not register PCM component: -517

repeating several times per second.

From my understanding, this happens when the sound subsystem can't create a
device, thus returning -517 (EPROBE_DEFER). All of this is consistent with
what I experienced prior to 6.14 as well. However, prior to 6.14 it did not
try to probe infinitely.

Bisecting 6.13 -> 6.14, it looks like
9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
initialization from vc4 audio initialization to vc4 connector initialization.
If my understanding is correct, this change causes a child device to be added
before EPROBE_DEFER is returned and queues the device probe to happen when a
new device is added, which happens immediately because the audio child device
was added earlier in the probe. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
---
Changes in v2:
- Add Fixes: tag
- Link to v1: https://lore.kernel.org/r/20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..163d092bd973bb3dfc5ea61187ec5fdf4f4f6029 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -560,12 +560,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
-					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
-	if (ret)
-		return ret;
-
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -2291,6 +2285,12 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
+	ret = drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
+					    &vc4_hdmi_audio_funcs, 8, false,
+					    -1);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;

---
base-commit: b60301774a8fe6c30b14a95104ec099290a2e904
change-id: 20250426-vc4-audio-inf-probe-f67a8aa2a180

Best regards,
-- 
Gabriel Dalimonte <gabriel.dalimonte@gmail.com>

