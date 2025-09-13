Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC4B55A9D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 02:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3261510E055;
	Sat, 13 Sep 2025 00:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZKSAubAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EAD10E055
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 00:21:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-26058a9e3b5so2435645ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757722919; x=1758327719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
 b=ZKSAubARvhp5qrRZoLfhVbiBJ8YfcRUt9iHd5kelje+H4CG1I3JMDBy1JURj7jxh9f
 QeOsfVVl4Qa26ohH9q3K2SbL3K2sFFsZjyW/3TMCGS+KckL1BUJtbEqlkyr1JFfCaAhh
 eksmLZGvt0rWPBNSaDbmEALIenA4PAFXHRqoIkANdfZVwwlQD4pAOpErB71PcC6SNDup
 t+8Nk8OWNluc+XoDGsHGOQfQwluEjEzhd9gfnV+dQ1ycFpqP+QahZiXll58MP4N4F3pe
 JLqWBt4bLS9VKZXJZ1LOFhpm6bsE3N4QKDcPsqwu32v7QU/q/BlRxEYnN8lh5HD+KTyS
 TuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757722919; x=1758327719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
 b=SRtvx4EUeAGAeWLfANQdFdl7QGqSsdD2liRx/Vv0EcvvPhU+JOSRlP2iPQ4GEGYoTK
 Vq/UuDtqhs9GLTgtUcwcmP7E5bf6Qi6fdOcVZfo0IbMxrovbsqyYI0lo9Y+9U6Hu7gFD
 WNqdwzuJ1taXx3uJNI7wxMmjzneM1CFkcMA6Wbz9UBvJkc0bgGLBflpKVOs1yvoqpRvp
 o0uH0tXdFVEGWnnrRgLO/H7nD7y196Tn0fXZsOCtyi+gTCx64MGI360dGQkTlmgn22vO
 QKqsfRUK8ysGCwwGP9Q4TFDb/bdtEYSzieCdGVcV2UpCdYkgDenQyN8rhGuhJC+pTnMF
 T6KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV++VHUrWB7EUzEAaJCbUmVRqrVJwtllt4H4V8OkW3fsJ4CT5sPsZFJzbybtmI7UrjAV2e5EeSvN0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9yz/8Qt9e8C1YrV6O1uD4OZUr9wGMEXDsHSZbrql/bHLSW1ub
 fpbksDSytWFdVO1y7Il8sKJ3OCl3cHixTM6qIdwtUEFSw5vPnsoMjq3h
X-Gm-Gg: ASbGncsjPWsKDxKRY2edWqXHB9358hBrswAAHJW/jMBXA/SoIcDjlSnn9R47QmotDpp
 ZbHpvZ+re9xKbCV++1Dqz6v+GaQ4vuUXRfd5tzRirSZFhX2bB9YRfvScZNu5lDdVNJ1zcV5LOTu
 IQEv28Si7/clUm/HNgoWSqixJIvezJW3/yHyjTP8KW70mXkbdSX8+LyQdbUeJZo8vpfY9hgOigz
 7JnLJ6J2dJTR+KCJhpkyV6w0vYt56OxL0SumSsGVNMMpY5+yK7SKsPzzDMqvPc5JxxXZ/GNtm0D
 LqGEXroOURRau2H13XfjTkDim9036f5xeMa6nucz0vdPASFErPWj6aRXYE0u2xYlfxOt8vpVrY9
 0qaYVrdoGe2994j8xd+E3EWX9AZCsLO3g8dlZfXRrriIqLeUGZsnJ+6TL14SjVSyedcGi0f0Yc2
 SrLKhxyIf24w==
X-Google-Smtp-Source: AGHT+IFohPP4U81t22Ynet3qFVaqgBlL6dIfvElA14+ZZZffQX0/DiVAU8HTvR3Y0I/KjtcyFh/Pdg==
X-Received: by 2002:a17:902:f54f:b0:249:308:353 with SMTP id
 d9443c01a7336-25d26d4ca85mr45666985ad.41.1757722919083; 
 Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-32e0c2863e6sm406490a91.28.2025.09.12.17.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 17:21:58 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] drm/panthor: initial mt8196 support
Date: Fri, 12 Sep 2025 17:21:53 -0700
Message-ID: <20250913002155.1163908-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
support recently. But the soc also requires custom ASN hash to be
enabled. This series introduces panthor_soc_data for per-soc data and
uses it to enable custom ASN hash on MT8196.

The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
be cleaned up and upstreamed separately.

This initial support also lacks support for some hw configs. On some
configs, panthor is expected to query a mask from efuse to mask out
unavailable shader cores from ptdev->gpu_info.shader_present. This
requires extending panthor_soc_data with a callback to read the mask.

This is an RFC because the dependent drivers are not ready yet. But I
would like to gather opinions on having panthor_soc_data for
soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
soc-specific code.

[1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

---
v2:

- drop RFC as this series works with the downstream GPUEB driver, and
  should work with Nicolas's GPUEB driver posted to
  https://lore.kernel.org/lkml/20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com/
  with no change.
- remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch], as this
  initial support is just about ASN hash.

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
  drm/panthor: add custom ASN_HASH support for mt8196

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
 drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h      | 14 +++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c         |  6 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 25 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 6 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.51.0.384.g4c02a37b29-goog

