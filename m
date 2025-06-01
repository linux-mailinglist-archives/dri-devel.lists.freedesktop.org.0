Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E6ACA00C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 20:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1344710E01F;
	Sun,  1 Jun 2025 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxxi4JIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303A310E181
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 16:47:41 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7d0a0bcd3f3so320139885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748796460; x=1749401260; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
 b=dxxi4JIxwQoqFQgb6Z5S8e0p7A4zvwcpRolp2wORMYKeEqpTmWSGBf9fZeLk3x3kvo
 4keJPGrgAHeMn7xpImKud0I5eV9YsJQc/5H3sIddyDjqjTdew1125IJE4q30P60F4GmH
 RBF1yWzIuZDAT7G1ZgHfupG4YcyX5zJoXcGBm0CsTCXt+ykF4kgKY4vE6oXVwBvyLzIW
 TJm7jGX3dtiZOInRWVg/Keueeye506NiUw+d2SyLawXGVbrGpKk2ZIyMhu4MeYawZmgc
 cbLTf1jbRdSdogtTV+kWzQU8xqgWgz5r5R3ijEqTNmWvw2/AlrqWvNdI58djfBeOJf8N
 slRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748796460; x=1749401260;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
 b=StNvAETciandVQseJ9mVALQSXHguLqufyv38owIA9v4OTcB8/9GVNWIeYmX8Wz5KQT
 h2vKrgdstHzwx1zwuLCcSmfTXZ+L2Dza/B9o27JiN1hN7FtJPXc0pvp0HpMU6EoA38MJ
 zpNcmvJxrOqNXAJUOsHcNUbLAV2reH5CnzdJq4lGe2kqrj99ELGkr4MgiIOVg5iNSbKz
 XB3PXv8YF85i0XHaUgTB2AzEPgfdAyTEpCZzpDijoAmB5lZrcgk8LVTQT9U8zhcAktbm
 1VHgcWP0RbsDQQDp/SxFHg0Jl5FHTUctFWe8iakdlbu2IZiUgGOhdzBWofI0/5z94AWY
 hipQ==
X-Gm-Message-State: AOJu0YyOlzorynbieKcwf1ZED2YYPtg3r4VavxhnklcJ/ulm5XNjUCdA
 gBd37ATtwAydgk/lZG0BV5SuyLyBPVbk6Xms7GgSYjnb53YfEUT00TUJ
X-Gm-Gg: ASbGncuznC2MLcbsCfW7A9b4P5/XfR5QII6Q50TlGukW5zLhY8wsw4GcWQ+luD1jFVr
 pwYjEmBVhuw7HY2PtMXIEvGW71kRS9jfHn5m1PjYj0Uk+9vSEhvodSbSJaktiaGw+sYXuCRD1iv
 4hzDCITzrjfjC5FEURMhjxUubh5EONUWiho+nC/pDK1aYoyVRQObWup2//4TXOdTlOZ2XJeV/dE
 X6hg79skjJmDqWHYaX29yv/ajsB94IDcC0PO96eeE1qT2dvCW92zQtvgHKiZPVLyvY+OMVmgZYR
 siNCpzEJYh1CJqBTfDdlaXNHhVzF9dWyG7DTeiSZWuTGfNQTXqyJqX1kX3ZlRA4ZNYUxGQO2yj7
 AXU6IujPhFuwgsX/ZPQ==
X-Google-Smtp-Source: AGHT+IG8CQDqpXHerlK5xLSeoU2tM8NPyLgN6r+TOGeCSx3gwnZH5FLkLpiCdrK4cHRpMnW1Hsv64A==
X-Received: by 2002:a05:620a:4390:b0:7ce:ea46:94e9 with SMTP id
 af79cd13be357-7d09878b60cmr2258334085a.11.1748796459994; 
 Sun, 01 Jun 2025 09:47:39 -0700 (PDT)
Received: from DESKTOP-IH04BR9.localdomain ([142.181.68.189])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a195573sm507438585a.89.2025.06.01.09.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 09:47:39 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sun, 01 Jun 2025 12:45:36 -0400
Subject: [PATCH RESEND v2] drm/vc4: fix infinite EPROBE_DEFER loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748796457; l=3253;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=j0cfU8xaqZBog20Rd/wcr/QwRfbqkqChpxCEWTplL74=;
 b=Gh72AQoyXv7PCjiHkqfZK1jlJHR9ImWecDSXQ+EofSqxEYRLtrdxpptXDMM/iImnxhnruf/lr
 y+b9mvVAxKdDUuVkDysQcgIoPENmoNmc8NeOgoAZ5DWfnC8TlxZDM3S
X-Developer-Key: i=gabriel.dalimonte@gmail.com; a=ed25519;
 pk=y2QfWJ6TJVcd8RyB6C0zTc7+AqnN6+9cOX7TxbshPMQ=
X-Mailman-Approved-At: Sun, 01 Jun 2025 18:06:20 +0000
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

