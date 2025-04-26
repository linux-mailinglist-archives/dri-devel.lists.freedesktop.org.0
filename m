Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA8A9E246
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1E210E18F;
	Sun, 27 Apr 2025 09:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mFmtwF/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B110E29B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 06:23:20 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7be49f6b331so367192685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745648599; x=1746253399; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yYjPYlG/aOt+7muqnNSQUYn87RZuOsFelShjtJk3VdA=;
 b=mFmtwF/+jOyjZ8ykC4YbYSJci1ZIWLbS3XWJ/cAMB1vkn5c5BUK93eoaMDHiSItOzw
 ZW8oCCfbSnAeaRYszG5XM4pGBScMp7CP99J4jT4vewVzrCn2Ds5jk78MKRVLNh3IHnP8
 gdWBAGv+VkxKfPTBadp5lktbPUyYQxhC09s9HktpoxqynPpziKw+ZnpklMLVFAaKOh6p
 Ya/5PXjaHlTLwuHAa4Ulg7DUHsFq+zpR673lIjOU6e101zTxOaD/YFTGWN/6q/jR/Idt
 Huut9pOTREp2o4Lh8LNA8WARgflXdmqnl3a/s4fKsRQOQsmoy5+ChqqmhoA8yaLsoRn0
 qhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745648599; x=1746253399;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yYjPYlG/aOt+7muqnNSQUYn87RZuOsFelShjtJk3VdA=;
 b=GdqESfS6euecKuSBeaiowMv22WFpcDZf0WhQctAeg+2Z7f9BWK5yvX9rJYLyXPdgMl
 6naZsu1jljGINrHi2pt2JljOcnKmVmL+SgqclKkca/cNdPofJFoWDJRFUBbN6OpTtFEA
 8/9BZ/Cd+8jAUCbLGMQCD7yTXv/XIXoM8UqMekq4SVe1H80pilAnu2TvVN1Mc0mpT8qb
 KUT3UfxRtXYKI/kLH9bWpzjbDiM6m6rVRaZUaQK3KIeqRrp/X8d2iZESTPAoMBNQhw1+
 F1BkaHDGf4iHvGZ5bZb3GaS5Tj/qWd3ZrRHYPPZpzjvE2FIrgIXdZbeMDAsWTejVlM95
 nfUg==
X-Gm-Message-State: AOJu0YzY3vAA/IXeNEhbmIFIvq6rivgKY7pIQHZ5lKQhxzVNcQ/ppE7k
 yIuuVed2cQhe3TRBFUk4mA/45wbf+nugg5Ggx394jr+kRN0f1NsM
X-Gm-Gg: ASbGncsUu+TFaCslyk4r2c81YX7PVjYKVJKF1K/iBbgxCvWB33YQ0XukER6qZcHXmMi
 8Bc3hFFKQ+RRezULVB1IYpDXju4SAKL6nXjQZjdnW7xXlKibKJ46ZgDcFmqLAh4ft1qUnDr70nK
 hp8enBxw95pzShxtKTTBCiUpl6KhLdrQP9ByNHy7rNNdh6sObeC1S1IfmKnxW88gnyViPGGnRRk
 Wojl2LTnyeT/z+y0VsFaAqJY8W2ymVf0Qx1ajRsamIOf08URVj5wy+llGjffhSZ81NmCA8P612T
 4Lunrk0n7oe8O+jw892XVGdCv01E9KC25utOt4iUGZnp+XFLo0KNmYC3
X-Google-Smtp-Source: AGHT+IHFkpV0m/2kCRCnG4UBJMY+2A70QyJWPMyvnAmt2xVVw7MRyayQRC2/jvS7+UjWFurLbcUqvg==
X-Received: by 2002:a05:620a:390c:b0:7c5:79c6:645d with SMTP id
 af79cd13be357-7c9606ac6e6mr672821185a.11.1745648599506; 
 Fri, 25 Apr 2025 23:23:19 -0700 (PDT)
Received: from DESKTOP-IH04BR9. ([174.88.143.14])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958e7c035sm313919785a.78.2025.04.25.23.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 23:23:19 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sat, 26 Apr 2025 02:22:58 -0400
Subject: [PATCH] drm/vc4: fix infinite EPROBE_DEFER loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMF7DGgC/x3MTQqAIBBA4avErBtQ6Ue6SrSYaqzZqChJEN09a
 fkt3nsgcxLOMDUPJC6SJfgK3TawneQPRtmrwSjTq84MWLYO6doloHiHMYWV0Q0jWSJD2iqoZUz
 s5P6v8/K+H+bGmFZlAAAA
X-Change-ID: 20250426-vc4-audio-inf-probe-f67a8aa2a180
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745648599; l=3157;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=bTFlO0TwF8sw3rIs76AU9tYPoYlXU0yDlOFLlIGtuJY=;
 b=Ykw0DUw1uI7iXb4HJ2AglC6VizvnISjek0BPMA82rTon2tQZWXXn5RsBR2FPwM2X62PNKTyOY
 WpSGRjVyO6MCYcawa4mCl0NVSuUAg7R2z6UqHDH+yAexCuWZFthUklW
X-Developer-Key: i=gabriel.dalimonte@gmail.com; a=ed25519;
 pk=y2QfWJ6TJVcd8RyB6C0zTc7+AqnN6+9cOX7TxbshPMQ=
X-Mailman-Approved-At: Sun, 27 Apr 2025 09:51:56 +0000
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

From my understanding, this happens due to the mainline kernel missing the
patches to support audio portion of the HDMI interface. In this case, or
other cases where the sound subsystem can't create a device, it returns
-517 (EPROBE_DEFER). All of this is consistent with what I experienced prior
to 6.14 as well. However, prior to 6.14 it did not try to probe infinitely.

Bisecting 6.13 -> 6.14, it looks like
9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
initialization from audio vc4 audio initialization to vc4 connector
initialization. If my understanding is correct, this change causes a child
device to be added before EPROBE_DEFER is returned and queues the device probe
to happen when a new device is added, which happens immediately because the
audio child device was added earlier in the probe. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
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

