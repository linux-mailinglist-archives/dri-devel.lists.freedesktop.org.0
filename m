Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C3AA8EB3
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249110E374;
	Mon,  5 May 2025 09:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VmWLvjUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E1A10E291
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 08:59:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso16986045e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746435597; x=1747040397; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6RkMkpBzcyjYKHLAajmFVhljeyOe8/zIRKVfPqj3cNg=;
 b=VmWLvjUiOyVZhIsp4wgZI+fGNtmIRs3xIxwRGMESDgahfCkmCg/QleRXFQqiq4dsI9
 4PIavHSAVwqfJo4+Gi74R3qF6j9+zRy0MAzPh7EImbYjPBfgtzahzVBHN2OEdexiUllI
 pnwPHjuOLpIw02CIyJbfUo1JSOL/IKE+agJP47y3w41ZpdvF2dCvUH5rrpmHnh31O8hv
 q3eNORLS8mw7DqDz6Fw+ngSn6gjp0gu0NvagSeB/wPcjM3xvhegyseguz9OvMJnSmSpf
 2lteRKGZ+SU9Pz+QQo/1T/BHxoxlFqih3UyFM23epiiH9mqSw+k9Wuj7lAt3DJ9ZIZiS
 MsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435597; x=1747040397;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6RkMkpBzcyjYKHLAajmFVhljeyOe8/zIRKVfPqj3cNg=;
 b=My4eKroD6AczwY1b00xA+l9np7FF86jn+Aj4XrvH8vwXl7alCE+ZFOsDyoYFoF6W0+
 7GMseO5D1j5mb4pkagKl9fpGObjIzrTv76l0rqh1YK9qV+DoUbLVvdu3yspGqGRbeYJA
 eKNej3MB4MgEDS+KR5yRC9ageGpIHgGgfR67sHhXQE0CorThZVlRPsHP6k3vvs26mq/K
 vMBPrpjOZVeennpGEH4qHcMxfhj7PVSfbgm9SlxEG8PtKQQ1xIyd83T8ypisWu5dOaog
 85jd166ayb8dmsnj8fblJBu2zSrhrT6ddqccCsVA+W3QMh6mndLH1l/+UCqg414ht7zX
 oXqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr4Yv4+fXaUiNtT29GFzvnWMu9W3gKgJ3yKOG5b0s2FZDhRMO6EeZHm8AESDdMghS30jElbXG4/us=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfJ6kmnv+ULZbWQxTMJ1uUnsRx29Jzr6WI2trqXSEEAaOFPaif
 U4ccnrkPspLP3E6IDXhBYTj2SKnnMNjF9wHrAvtDnK/PYRMumIR8M9liaugzr9c=
X-Gm-Gg: ASbGncsEsiL0cudxt7cKhZ4MevA9leqCStKvbIhK54z0hEwWoRTPlSG2WR5KYgeswZC
 2Hw3NIpDRhhVJmEj1+gdQSMadnh8w3az4jgCzdapREGGSuOXKL5PwwVA9rujv+6D+SMpe2ITPcd
 gTm47yVxOYzGnI2lul1BssnmYbVR1AsP0HHOUbfL0XimgIhA0yjuqMsi812IsxMmf19zdQDrqJB
 iO0bSU3ncJ/27pQaAeM81iy7D2YB5LlnjhA/6nyd/wXqIHSSSOkae0UiEIzrpfxmHJmSPSo6dan
 LERM/YcRKtGxmPCBLYMj7APO4WVlVPlY32feGfhxf/HDHGLi6KZ0GPl7CTcSNYj+7Vjpnj97zQg
 M+8Z0
X-Google-Smtp-Source: AGHT+IGz03kxWiSqV9ePHTaEbXPJFvgSx8RYWlEikxqBVx5QFRHF98Oz1fX+szduVQOs2J05BoLuWw==
X-Received: by 2002:a05:600c:1987:b0:43d:49eb:963f with SMTP id
 5b1f17b1804b1-441bbf33b31mr92931135e9.24.1746435597433; 
 Mon, 05 May 2025 01:59:57 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 01:59:57 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 0/3] virtgpu: fix memory leak on device removal
Date: Mon, 05 May 2025 11:59:13 +0300
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOF9GGgC/x2MQQqAIBAAvyJ7biEND/aV6GC21UKYaUoQ/T2JO
 c1h5oFEkSlBLx6IVDjx4avIRoDbrF8Jea4OqlW6rWDheK0h45kpE7qdrM8Bi8SuM8oY7eykF6h
 5iLTw/a+H8X0/UBzqqWoAAAA=
X-Change-ID: 20250505-virtgpu-queue-cleanup-v1-3392995cab5f
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=sjhErN8ONkfCqIGOTbBvg7YELbUIF3vZ82Dti970nCg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMNVJZZVc0VW84d0ZUemw5MXpVb3UwRGxLCk5JT21sQmpCc1p4aGJUdU01
 Z2VKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowSGkzRC85aHdCZ2NOR3RsNHJGVDFPa0NxMDlLRDc0aU1FYW5Ec0J0eUlaMQ
 p0OTVJK2hVVmFsL3UyZDYydTgwZUFObzRYMmdKb3V6enRPSjRtMUUyYW9JWWt5Mzl5cW82QTJqV
 XJKQXBCQ21WCm1ld1cwQ2NmNVpaS0VaYy9jUU8raFExalgxbC9xclA0MGRERDBWdWhHY2NEQkpl
 QkJ5QTRIZFlqS1RIZDUzYlMKVHBKZ256ZFFBWVlkT214U2J3em5RT0FhbEV0RmJqUk1SU01QZjB
 LWkJ2T09wTGprOEhUQktMQURRVTVqMW93dQpTYzlXRFU4dy9uS3hCTU90ZmdraElTUTc0emlKRW
 ZGdjRTd29BMVFsM0NaZ213TTRDdkg0dXZFZ25nQnIxakVFCm96WGVlRFZHcFdJaURCT1ZUdnRud
 zM2YUdPOTl4SUFrVmMwV1BFV3lKVk1QcUlCd0FXRWF3Vlh0SFVMY25jb0oKWUJ5YXVCUS9JdEd0
 R2hBNzhvcDFpZXNkRTZXajJHbUtYd3pRNjFNeG4rWTlOWHordE4wNE0xK3V3UmJ3bkFUUgo0RjF
 tRGF1MnRUa3ZCcld0NXR4L2VpMGtwRGJka3Z4bXllWVRMaWFHQm9CUEY1QmJQckxmbW00d3FVcl
 VqY0x3CnNnVGR5emZGRzBsYlhSS1RGcm9OUUZtWmVGNkJzemJJQmZtSWFGUndBNVNYTnVURXdze
 ExlakhsSFFia0dheWwKRjg5RHNabG5JZG1hNU1XTWNnNWJtMXR4dG05NGNyejhLbElERXorSXZG
 Y3JwK1UwVXYyK3ZramMvWlpXS1AwTwp5c2xVVWs5SG9DbWpVODJhd0s0NEdGaW00SEcxVTZON3J
 kcWtGZ2RtUS8zcGJtQmlUaVVuc0xMM1FCZWdvVS9RCjk2STlOZz09Cj04MU4vCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
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

When a VIRTIO GPU device is removed, it cleans up any command buffers
that the VIRTIO frontend has responded to. It however ignores commands
that have yet to be replied to, which still reside in the avail rings of
the virt queues. This leaks two type of objects:

- VIRTIO command buffers
- Fences

Furthermore, if the virtio config has num_capsets > 0, the capsets field
of the device is also leaked.

These memory leaks are reported by:

- /sys/kernel/debug/kmemleak
- slab debug options "BUG virtio-gpu-vbufs: Objects remaining in
  virtio-gpu-vbufs on __kmem_cache_shutdown()"
- drm:drm_mm_takedown "Memory manager not clean during takedown."

This patch series adds cleanup logic in virtio_gpu_deinit(), after
calling virtio_reset_device(), to free any such allocations.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (3):
      virtgpu: add virtio_gpu_queue_cleanup()
      virtgpu: add virtio_gpu_fence_cleanup()
      virtgpu: deallocate capsets on device deinit

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  6 ++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
---
base-commit: ad10b82c2bcac7f87ac6eaecfca33378b43425ee
change-id: 20250505-virtgpu-queue-cleanup-v1-3392995cab5f

--
γαῖα πυρί μιχθήτω

