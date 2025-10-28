Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E361DC1389A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E76C10E5AD;
	Tue, 28 Oct 2025 08:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iia9Aupa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9D10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 02:55:41 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-793021f348fso4721210b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 19:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761620141; x=1762224941; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuA4KWO6Edrrb6J6eT/hSkUwiiht8zwyxLZmkW65ivo=;
 b=Iia9Aupa8DnE/g6i9V3/Pl+8+yxRwfuCDE3k8akJRRwCLHSaK2AkdP4O2wu9untNwV
 K0diK2DVDdhLhJk8sOuabvXlPO0Gv1c9nu2RfziGc31CKlE15YrfTtOz/COFnCSO5f62
 ScJ86arwnS4Rp6I6/+VEt+2U1UN3nDrWYB/N/xYyBhpOLc4DA0owHY8A7qy1XcS43mwT
 h8mMtgE5eaLIlRgw+unmbjB1XvHotQyubtiGDrBWwwWVQzflg9TfTxMrZadxgbg+Eift
 EIjnKUtpPVKODXcrmU/GjaOBcKRUTiYQnknJR4XiX9ZVGK82ivNigaIBSbJLuTbu84cy
 aR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761620141; x=1762224941;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuA4KWO6Edrrb6J6eT/hSkUwiiht8zwyxLZmkW65ivo=;
 b=lR6oNMdS6LnV3c5fyIOfdwiV91kfBMz7/SFMZ6Y6qJPdJd1oisM7TgLNpVLUfgR8Zt
 Ub+hXpbsgwxBgHb8l+MSLZBdiFwb703kmQKlpBnLHVCF/D063S/6pQyK3ufHIlE/MfXM
 o0OlA3zn9yNbJxOAC9qgkidvArp56mym5kAKCwU2KGYCYV7nZXvg9RrvCSfBehZQ2wqB
 jwvr5fzsm6vUfyEAWDAtuMikS18L8soav8q1S7NQHlC9dzWNvX2/3vLSLcT8gAeQNj20
 zwZY0KHXp5/ztl0xmjGR7thIjxJ3+o2uFxW1A8v7uvK0ufOP25lbZbbaKVDdZO8/VPbK
 Y0tw==
X-Gm-Message-State: AOJu0Yw8bddFLKkqpKricPi8wc/JTTQjjmVkIGUK3rRYvhQORFk3kRHQ
 AMv4Ov1kJGzC1MzW/2AjfYYU8aulkP9dqRBPDWi05cmxtjpgKTFEyI+5
X-Gm-Gg: ASbGnctNq/AWTzYkjZrOhpyXTECsD0aTTAxOOL6x5inTkn8heT+WXPHmHIDAiPgiYTX
 hx3pHZuZ2Kzv6Lu776DgEsOoO0/DQI0QtWi4Su5d6LzVh6o1xzNzKgzkEIshHbWY2LoL0sxiuAH
 c14dvhv/S9ImvRhiCNQFcBUFeUDCLRZLMrRBdEqePDPeJZBh1qJqLKfm3PHV8omgeEjuQ6CJ9mw
 XbdeJk/033gkxvN2CYQn2UYX0GqVwrdatQBA+nvDL9aKZw965J5RcLmhubrDoKQoQfR8hT/ogyV
 0i+Xw3Xu+RbZKW1ThltV3P4m0XdKZ63xo6CQ78pSZo5a480z0kMbCWtS5fMAqt+uCCLlY7ockqO
 VzA5r+eGmfv9sumH0S8+K7huQMvAiFBEBtY31FNzzlMeiKlGbjKOUtyFa37hed3TOGaEnBc+Qmo
 5Z/dr5s4gUBdP32zycj8WAu5jsCLWZXiwFDcEVraw=
X-Google-Smtp-Source: AGHT+IFiOKx69C8wJ8fec7v6/uMOAzhY+T9bwF3wNtNS/WP44BQb7b5nEI8GbxT+f57A+QJG5AIjKg==
X-Received: by 2002:a05:6a20:5493:b0:324:b245:bb8e with SMTP id
 adf61e73a8af0-344d2973e71mr2314026637.26.1761620141451; 
 Mon, 27 Oct 2025 19:55:41 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414032c71sm9927580b3a.25.2025.10.27.19.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 19:55:40 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 28 Oct 2025 10:55:38 +0800
Subject: [PATCH] drm/tiny: pixpaper: add explicit dependency on MMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-bar-v1-1-edfbd13fafff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKkwAGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3aTEIt3EVIMUC9MkQ7M0Q2MloMqCotS0zAqwKdGxtbUAq5RPf1U
 AAAA=
X-Change-ID: 20251028-bar-ae0d85b16f13
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 LiangCheng Wang <zaq14760@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761620139; l=2722;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=bZOhK5HCh3vlm4RKXz4yQ3BpYGs2VtaetnFAD3Q+3ts=;
 b=CcuQCNl2THLCANzvmTYJ5l+sPZCXMOHNgam9/fft79MOXtY7+R2haFDcJ6BdJCPTeKWVhwEU6
 eFEnBYalrizD1uIo0829Kc2ES4WL6rKT5VZXnpUemvOpjCh/bO2KC//
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 28 Oct 2025 08:28:06 +0000
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

The DRM_GEM_SHMEM_HELPER helper requires MMU enabled because it uses
vmf_insert_pfn() in its mmap implementation. On NOMMU configurations
(e.g. some RISC-V randconfig builds), this symbol is unavailable and
selecting DRM_GEM_SHMEM_HELPER causes a modpost undefined reference:

    ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!

Normally, Kconfig prevents this helper from being selected when
CONFIG_MMU=n. However, in some randconfig builds (such as those used by
0day CI), select statements can override unmet dependencies, triggering
the issue.

Add an explicit dependency on MMU to DRM_PIXPAPER to prevent this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510280213.0rlYA4T3-lkp@intel.com/
Fixes: 0c4932f6ddf8 ("drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes a build issue reported by the kernel test robot when
building with CONFIG_MMU=n on RISC-V randconfig.

In such configurations, the DRM_GEM_SHMEM_HELPER helper uses
vmf_insert_pfn(), which is unavailable without MMU support. Although
normal Kconfig rules prevent DRM_GEM_SHMEM_HELPER from being selected
in this case, randconfig builds may forcibly enable it via select,
leading to the following modpost error:

    ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!

The fix is to add an explicit `depends on MMU` to the DRM_PIXPAPER
driver, ensuring it cannot be built for NOMMU systems.

This issue cannot always be reproduced locally because typical builds
do not violate Kconfig dependencies, but it was confirmed that the fix
prevents the reported 0day failure.
---
LiangCheng Wang (1):
  drm/tiny: pixpaper: add explicit dependency on MMU

 drivers/gpu/drm/tiny/Kconfig

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 7d9e85e932d7fd7bdb6ad7a4c6ba0f835841f623..f0e72d4b6a4709564e63c758e857bdb4a320dbe7 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -85,6 +85,7 @@ config DRM_PANEL_MIPI_DBI
 config DRM_PIXPAPER
         tristate "DRM support for PIXPAPER display panels"
         depends on DRM && SPI
+        depends on MMU
         select DRM_CLIENT_SELECTION
         select DRM_GEM_SHMEM_HELPER
         select DRM_KMS_HELPER

---
base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
change-id: 20251028-bar-ae0d85b16f13

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

