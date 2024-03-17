Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2287DF1B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405E10E238;
	Sun, 17 Mar 2024 18:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3YnJCWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF3C10E226;
 Sun, 17 Mar 2024 18:02:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so3991833e87.1; 
 Sun, 17 Mar 2024 11:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698531; x=1711303331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MzKqTULejlRdhOCK57EtCsKlcFoP0JMCOwXzk5JnzwA=;
 b=X3YnJCWOMmjh0Ff3o2WvC5F+IghIRHflSYfbuhbI1h4ZNixfsGppu8vprIimSkb1lY
 3uo/g/02OCprUJzJ2e4sayt4aT6xLmngZ11PmLfrpx8zgYc7kydNrHsAJi7PM3A0B550
 alkLHGrO6MXQvPAsd39P1swF5tGIPJTD3K9wfTQxCVGfQH9zrElRfNYPuS/1YKbuIYsl
 8Pj4Y5v3pX6UEBc6Z2Iy2av0WtFzikZ16hDqSZo+1PAZG+k7WP7z9nrEr0BmBrpoct+P
 PcfmA1ytyzSzYRvNy5U81gcDoUruGWrm0jvXGD+utblWBZCTVj5xHaiOREmnNlFLAWPX
 yo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698531; x=1711303331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzKqTULejlRdhOCK57EtCsKlcFoP0JMCOwXzk5JnzwA=;
 b=FqX7Ref4oMfAJlsnmzXdAByLgg0Du+/nMy/D0lF67xQUCa96NtIFxdB+YhLT71/ToQ
 Po5aHPZnhbg3CfnEt+27ScYuNIsG8bnrw1GXhIbALnx+JTkHsxoADGEyRKsHx8lZoIbb
 fN9LLTnllOrRJcV+329gp+oLnFifdE8ya2tAhh8ZoCEve8SP1ldlySDOy8ElQ6M/vE8b
 hTV8DCLqASlXHvCdrjZqNrzpwg1cn6sz9uhF92GFhEmFUCuX8NxCuFuhsPXJwXthxKdT
 iZkTwJ4E/8eNiEsReveJAyMeJGAd1tG5DJLhR90uXHb+ebiyF4NvyrGwRQLfHGlvF8Dk
 CgCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+GVKJWYTwgv3dZ3hMFBKbNB/JQVpyLDhvZLZ0d6AbpoZyj0hVdc+6RtdBgoRyKlhLyAUhG5Mleti0d5YrreZAEk3Mayxyg32Byw7tVHEDNTtKlapYTV89AZNxVQc2LO5d4r1UY+Hwv1totd8c7G7NGKI7joiDEzlcljGRiN8Ly78IAkA10UJkjZ4xX95CRYUuQBHmDGOmXryDbD2YojBopmVNyxHmLRnuWPIcHydo
X-Gm-Message-State: AOJu0Yw/fzAL36knyTFNHce8eja9hbzbR0RS3mK22h2+852xeJoqudGC
 d1mDiWmMDkuDFEJweavXmr1gksH54I4qxSewKCan9R/utjTaKUUnYbRucCsedb4=
X-Google-Smtp-Source: AGHT+IFCus1zUTDDRuMKlHSuX7mZxcmUN2oBoDJZChg/lN8tzdLoS7uVD3wjUYqAFNQG1yYzEapq8A==
X-Received: by 2002:a05:6512:3294:b0:513:c95c:4dc4 with SMTP id
 p20-20020a056512329400b00513c95c4dc4mr7747510lfe.7.1710698530912; 
 Sun, 17 Mar 2024 11:02:10 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 g21-20020ac24d95000000b00513cdde18efsm1318346lfe.75.2024.03.17.11.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:10 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rlupl-000000005e0-3xex; Sun, 17 Mar 2024 19:02:10 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Sean Paul <sean@poorly.run>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 00/11] drm: Only try to set formats supported by the hardware
Date: Sun, 17 Mar 2024 19:01:25 +0100
Message-ID: <cover.1710698386.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When userland uses DRM_IOCTL_MODE_ADDFB to add a framebuffer, the DRM
subsystem tries to find a pixel format from the supplied depth and
bpp-values. It does this by calling drm_driver_legacy_fb_format().
Unfortunately drm_driver_legacy_fb_format() can return formats not
supported by the underlying hardware. This series of patches remedies
this problem in patch 1.

In order to use the same logic for determining the pixel format, when
a fbdev adds a framebuffer as userland does, patches 2 to 11 migrates
fbdev users of drm_mode_legacy_fb_format() to
drm_driver_legacy_fb_format().

This series has been tested with the nouveau and modesetting drivers
on a NVIDIA NV96, the modesetting driver on Beagleboard Black, and
with the Intel and modesetting drivers on an Intel HD Graphics 4000
chipset.

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sean Paul <sean@poorly.run>
Cc: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/

Frej Drejhammar (11):
  drm: Only return supported formats from drm_driver_legacy_fb_format
  drm/fbdev_generic: Use drm_driver_legacy_fb_format() for fbdev
  drm/armada: Use drm_driver_legacy_fb_format() for fbdev
  drm/exynos: Use drm_driver_legacy_fb_format() for fbdev
  drm/gma500: Use drm_driver_legacy_fb_format() for fbdev
  drm/i915: Use drm_driver_legacy_fb_format() for fbdev
  drm/msm: Use drm_driver_legacy_fb_format() for fbdev
  drm/omapdrm: Use drm_driver_legacy_fb_format() for fbdev
  drm/radeon: Use drm_driver_legacy_fb_format() for fbdev
  drm/tegra: Use drm_driver_legacy_fb_format() for fbdev
  drm/xe: Use drm_driver_legacy_fb_format() for fbdev

 drivers/gpu/drm/armada/armada_fbdev.c         |  5 +-
 drivers/gpu/drm/drm_fb_helper.c               |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c               |  4 +-
 drivers/gpu/drm/drm_fbdev_generic.c           |  4 +-
 drivers/gpu/drm/drm_fourcc.c                  | 83 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  6 +-
 drivers/gpu/drm/gma500/fbdev.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  6 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  6 +-
 drivers/gpu/drm/tegra/fbdev.c                 |  5 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  5 +-
 13 files changed, 119 insertions(+), 19 deletions(-)


base-commit: 119b225f01e4d3ce974cd3b4d982c76a380c796d
-- 
2.44.0

