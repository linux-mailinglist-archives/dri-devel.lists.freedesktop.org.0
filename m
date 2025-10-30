Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B298C229F7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 00:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BE410EA5F;
	Thu, 30 Oct 2025 23:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lzq1LTDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2131D10EA5F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso12044405e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865452; x=1762470252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=spTnbkYHkS5sFJlII3J1Det01f4GO/gKWkvcwEWUpZ8=;
 b=Lzq1LTDUTHNZJsLH6RHj0gDUMeIVCqZ1oujYjEhPJxI1pVzodx4LorUZZ0WVgrHoXQ
 189//UqxkTGIcPGs2fR4VCGmHng+7jXytEAtLWQ1I2p0V3jytAVAOvjtWziVHkQRiqa2
 z//V7rPvC64ynlBi7xSfJSqpi4t8Spgu5VU4MP3LORul42FUiX2Z/daiIYC0x6x3V0NL
 0GaxPCaDsVZVN2eA8MhfbCqJLIWqWuyT6e/hfiS5gvzyesejp/yJF051nE7l9x4B/tN0
 +H+yfhiUanlkv31M7sjB8djtVeqDH1CN9nI3ReffF6lgUongiQOJPTJV8xoWpxWLoveG
 8dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865452; x=1762470252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spTnbkYHkS5sFJlII3J1Det01f4GO/gKWkvcwEWUpZ8=;
 b=Bja+2B9wFlOgVp0OVz7jJWwedLqSFl6tn3lJhlMVrXsMTgBn/spEIThBRIv9+PeuQG
 ZHPMtk4dYOeDGvOIylWcDW719UuzPRBlNEWZAM80d6P9qNgiwME0sxprRPKLJ4rBIwAh
 iu9vnPC6ysJNQ09d6RFo4jFBO5HwuHcf1F9w0XBhidb75Sf2xqCq/r065p/O9Da5Zw5G
 +rT0iOH1rsG0vsg6G+QY8oHIeRgMfpbCYlutsn6vuRbfjqJ6xtf0rfAsPJKFRBaQE9hi
 fWTUYg/xsFexuLhbZx+YgNNfg9auC5sU74293daCEfaV8leYOmhG5p9Gi1A3ZjaIKK0n
 ppgg==
X-Gm-Message-State: AOJu0YyiX9xE87gVjVeuJD6Bzb/jZR2tstWk9CTHULq7yLEoD42Fe0vL
 d0NzbwLydhp+nZkYI40nbLy2+JWj8nQxfADwvhpGP30pX/K2PS84Y3hy
X-Gm-Gg: ASbGnctSAvlz+W8xn3v6klsNt/hQmTw8jpirzsTpn0uqLqKWPzew0TkWp5MMus8g0lR
 DkYVHnsVbCM0vqrZzYxginbRECdhRp+ZUG3x2f9NVqsE9+ja5WRqDRHqhfSJDOr+4RtOMKvD8Hw
 GCUpSpMDrlRllbcpqKNolKIj6vlWnregZv0MVRf1C5NfQ3FWdYvor5l4M/RmIBDIWSnZfxGPFe2
 FqCjFtTYfsGJ0Y6L0LBCrRKdmFuK57zJ3GIJPj+2hRqgX8ShHhytLpKBpg0fIWEekhJ1DcR1KyL
 Rilh4cVL/+aBf20GyLVhzcO4lRaKdZ3WcnFy+8GVBxUoi6efUaE2EibfuySFp3tB7T3EiawttbR
 IFl1MQXgZB26yq+6rTwsLraBPOBud7bcPxY7bqpTQFz5YxMWRrqVrjH5j49RsYuYzJS+BgLGUCh
 McfxjZZypL5aU=
X-Google-Smtp-Source: AGHT+IFC7JbgK0f+mgKIcbZcySjz0mcvo7VVc4C2hDfzVb829xeoqBnvTAh+hZXl4KB+Y0uGYyJg1A==
X-Received: by 2002:a05:600c:538e:b0:477:214f:bd95 with SMTP id
 5b1f17b1804b1-4773087b183mr13255895e9.23.1761865450511; 
 Thu, 30 Oct 2025 16:04:10 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:09 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v3 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 31 Oct 2025 01:03:52 +0200
Message-ID: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
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

The new VM_BIND interface only supported 4K pages. This was problematic as
it left performance on the table because GPUs don't have sophisticated TLB
and page walker hardware. 

Additionally, the HW can only do compression on large (64K) and huge (2M)
pages, which is a major performance booster (>50% in some cases).

This patchset sets out to add support for larger page sizes and also
enable compression and set the compression tags when userspace binds with
the corresponding PTE kinds and alignment. It also increments the nouveau
version number which allows userspace to use compression only when the
kernel actually supports both features and avoid breaking the system if a
newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

- v3: Add reviewed-by tags, revert page selection logic to v1 behavior.
- v2: Implement review comments, change page selection logic.
- v1: Initial implementation.

Ben Skeggs (2):
  drm/nouveau/mmu/gp100: Remove unused/broken support for compression
  drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
  drm/nouveau/uvmm: Prepare for larger pages
  drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
  drm/nouveau/drm: Bump the driver version to 1.4.1 to report new
    features

 drivers/gpu/drm/nouveau/nouveau_drv.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 102 +++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  69 +++++++-----
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   4 +-
 5 files changed, 131 insertions(+), 49 deletions(-)

-- 
2.51.1

