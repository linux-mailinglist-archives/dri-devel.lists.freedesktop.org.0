Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3303B912974
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A4910F202;
	Fri, 21 Jun 2024 15:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hCgd5GKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f227.google.com (mail-lj1-f227.google.com
 [209.85.208.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4CD10F1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:34 +0000 (UTC)
Received: by mail-lj1-f227.google.com with SMTP id
 38308e7fff4ca-2ec4a11a297so16773781fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983293; x=1719588093;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JulZM8xWFSfYHM/MEzO/elgJAdDzRmvnJFsqBgLN6QA=;
 b=hCgd5GKLTz9haMaOtYFSspygFd7IqGdwtsR0cxdwC+PPPeHmvQDLleOYWeC4SC8jn1
 I+boanB6Mte1Kq7NTrVo8N3MN7gnwFa/BQGCfTNw66djO7UBTQqcumkPYwyyEev4sz59
 T/NzTZxkR5ui5PXSoYV0WcoBFa+LvZyQnLDj5SpsZKXfw2XZ2lKHHi8W/ddkoN4Y4wxQ
 lj8ddfLIZED5cyGuS43PJywGQJnqX2H4hgul3odes5NPrNBAetcGHTCJja3s5yVA42E0
 t13aMSxBS0tcPpEKhsqrMYhRmNR2CQlmO1tlyGPM6n95MP9exAbVp85iI5UviuSMeoiL
 0YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983293; x=1719588093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JulZM8xWFSfYHM/MEzO/elgJAdDzRmvnJFsqBgLN6QA=;
 b=eD7wGDHZ+Pzw/W5G5K6cV7973mxLIlhmjjzhF0G1jozx3hN9l6LiJ7xCywGI/H7aap
 ef77OD6VZfGvaUDv77e492AESF2rjjveSH1YM0wDkC+wBoxIl5jXIyziA5EMiWt80VHn
 ghJB/E8fBlvzCNhGm8VKwRorGOsUMTikqd+AcwFUrKUOE0aI3URE9tiOUzha3Kli1BUj
 OPvqxybb9UpnhFKrbMa/h7WcXZjhGW+W2KXuNFlxR+pbDdjYDmopqk7uvw3QjXOU9ntx
 noizKz06mubSy1aLH5q9rqXOHhCuK5CumYuxWJIPG8RHhGinfXrFXAd3gWK3jHqxtSK3
 SQrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqkiSAYB1C4Ty+JKVd+PR8t+OhRFYeRYHOpPyL9CpjAxQlmu3OWlIIUjEr4JFVDSVndWLIYDCrmuMbxPTUvH0wC8XL1AqP4OZ60APWITe3
X-Gm-Message-State: AOJu0Yy+JeXkBzgqvFQhWdTrVKPKQx3AjVzcuBWEQymmcvcTDDEVl6ga
 5O8g9ICO8rAVpTHNS7DOhDPaF95T9z1YvpbKIwyb2oo58oHMV2v6Sha1sztKvleMpaNgOm39JGU
 6ZsRE5jPx1hjoIJvMqe09M2f+mxplqXDt
X-Google-Smtp-Source: AGHT+IFiyMLjw7Z3rR0kgoZQfdWHHNF7az0Ob4pHt00phu/8KuJZ2Juw6+LOlzDcbBF8G8EDCGeITi2qq8vq
X-Received: by 2002:a2e:90cd:0:b0:2e9:8a0a:ea05 with SMTP id
 38308e7fff4ca-2ec3cec0e10mr57069521fa.17.1718983292758; 
 Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d212247sm4677945e9.50.2024.06.21.08.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 04/31] drm/vc4: hdmi: Avoid log spam for audio start failure
Date: Fri, 21 Jun 2024 16:20:28 +0100
Message-Id: <20240621152055.4180873-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

