Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D8910A6B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A19F10EAA0;
	Thu, 20 Jun 2024 15:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Jp1fYBf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515010EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:42 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-421eab59723so8113535e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898401; x=1719503201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JulZM8xWFSfYHM/MEzO/elgJAdDzRmvnJFsqBgLN6QA=;
 b=Jp1fYBf27x9NKI1fkUke/MD8L3iKzzIFbzJcPuVNvi9tGL50UjgAbFY/tNLQ38aZcr
 Do8LckV7+iXJR5R7HT+cJbN2KbFy0uEuckqKAiTF6Hi/Y0qe9uKOgkpnB9Otz8/e33/l
 /0N6KHXifKVrQt/Y4dsX026qOr0gHLjDNX+3dMsJPKBPa+E5Q/nPHCnvfqvWwHz+Rjzd
 gvnSrkWM1i9kCpmdZGe3EyPvnxez98kDSQv8XAmYoh0BOng2zwkj31KZ4dpi0MdCWJTq
 YEeVGrCL0NeAnDlqr42oKiRuU8WfrmDBdke+/r9p2S9oPx2s10X3LiaJbBR3x/rFWBa1
 ahXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898401; x=1719503201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JulZM8xWFSfYHM/MEzO/elgJAdDzRmvnJFsqBgLN6QA=;
 b=KydxAbBvQJIQiUcgx08CgbNL8Te3NucmNWZD0DOAqM9agwh+cB2kjsl1yu9RW1kYjB
 sbBQ4nioCwl+X0VKl5TmoSdNj+X6xWGQYeYZNHjpxyG1GCE2EZKKWnq9A2R8FR/SMfBw
 G1aMSmkM9hWmbKyJRjSuS6UoUz1yLUgFPZPtgHj6kWY6R/sac+i4PXchhNx6wNN36nv1
 yG54YkpxANdLIMgHdxTgJ+9fYzIM1UoPjxPxJj5Qf5mIMn6mzUQLqfUebDEuKNLvG4gu
 nxX7BiPBFW3J/RNvUZrmrB3jzjJNaMkQZG3C2m3Oe4/eREe+KkzOnNoGfKw6Wj9KJjwn
 G7ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfZe0f925Cztz1R3mjV87ltswbTOwsaFpEkiT67zfmHl6eaXUeSCaqOu3lDtWOThqJjDHYGlrAk98oNBDk+V+0IwhLDIm5P1YiTpCDmH/E
X-Gm-Message-State: AOJu0YwURLNaj0x7vhh/cie/nTIytDAuD8f5also7Avu0ToksjGjLM82
 cLc17Hx/JB2Bi2yLzNF1bgs/7OSLeD/EljwudexswM8/IDY3q0GV/QtxR8Q0tYuk42ikvSyA0dU
 7+b8qH+DyVmH550YBH66FMhPr7q9c8/21
X-Google-Smtp-Source: AGHT+IG0tnHPN3/qGGL2wnFr3ncbYkw9YOASOZ3hdnNP0TAHhnTkHWRbp6eFivER+bQZkVaGxdA0pBQN6qTJ
X-Received: by 2002:adf:f48a:0:b0:360:96c5:fdfd with SMTP id
 ffacd0b85a97d-36317c7ee07mr4092806f8f.30.1718898400804; 
 Thu, 20 Jun 2024 08:46:40 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-360750c501esm855481f8f.35.2024.06.20.08.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:40 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 04/31] drm/vc4: hdmi: Avoid log spam for audio start failure
Date: Thu, 20 Jun 2024 16:46:05 +0100
Message-Id: <20240620154632.4125308-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

We regularly get dmesg error reports of:
[   18.184066] hdmi-audio-codec hdmi-audio-codec.3.auto: ASoC: error at snd_soc_dai_startup on i2s-hifi: -19
[   18.184098]  MAI: soc_pcm_open() failed (-19)

These are generated for any disconnected hdmi interface when pulseaudio
attempts to open the associated ALSA device (numerous times). Each open
generates a kernel error message, generating general log spam.

The error messages all come from _soc_pcm_ret in sound/soc/soc-pcm.c#L39
which suggests returning ENOTSUPP, rather that ENODEV will be quiet.
And indeed it is.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d57c4a5948c8..04d32dc3e98c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1914,7 +1914,7 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	}
 
 	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
-		ret = -ENODEV;
+		ret = -ENOTSUPP;
 		goto out_dev_exit;
 	}
 
-- 
2.34.1

