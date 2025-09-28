Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9CEBA694B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 08:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7466910E16F;
	Sun, 28 Sep 2025 06:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PZgmoBl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B905C10E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 06:41:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-57d8ff3944dso1334009e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759041693; x=1759646493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+l4n0MONZz4a0slWD0pvYSfJJ9WeP67vg+P79m1fQ4=;
 b=PZgmoBl2ZKKYnEUPfj+DbKxwLaWSRAY1UbNY9P/bZl78RVjjNAFE9iz88fI+h+oACz
 pdh8vr+kyo/wYyjipt7DTkDUjCbaBZuqVp5j6CBxR6I66JImLeLzUC6E/InNXGNPWFOC
 7uiz00WjjQaLjxNvbhxAdsyL8ORh/VZ0E83Iw4BW1kl5wEFh300jRK7GDExjunZfN4wB
 CX16gfyVWkiqOkzg4xtKBVOD2/ssGpLU0wf0bACnhaxduQ0ulwPoIKnZHPk6xxA2EGvj
 DE0vo3wjKwvGrSejYWJavcPOLpuI+1EZHTrPq12WOLawJrSsbIA+BONKmYGgBZ2yp9bS
 g3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759041693; x=1759646493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+l4n0MONZz4a0slWD0pvYSfJJ9WeP67vg+P79m1fQ4=;
 b=xL6g7vzJ1YiXwVHN2SBltjcZqAc0rUmc+5kJFW+I8LnZalazTm0FvNVV5wx3diUaGc
 3Ac8zoG3D0N79elvMpZnOVPITAnwpkWdrOc+S+5XFwhWdI6AzzpI17Zs68DEcZH6aDLK
 IMtdpOZqZ5nLhFxojiEVwKgmAaeXBw2oJMiioqTp4T8uKJtNURK5k4XbWYCz0a4b7b/T
 uo1tuy5Xc2pAx6cHX+bMyFQiq12QV68f8jezrVKUBNgPhx7ImIHKj7txD4343X7noXdp
 6MTmBSwbWbdrJCoAKetWG8y4VMifMduuEyGPk3KnmPvHOJ2us+Y8jne+MYLEHFw/4W3l
 Hy9Q==
X-Gm-Message-State: AOJu0Yz9ha2V4O75VyJwOWm/Kbi57x9f9fAQfuuvGX7JkfYq/tRUksrT
 TS1/ahyWCqQQ105iB+2Dr5u0dfVDwOXEFp2dfzndr94bqgbDhW6Cvc0j
X-Gm-Gg: ASbGnctqQ7W7OoDjzo0Q9XKT1QLcFs4DFBy3EQQSTnp1zCnPFZxeYnIHx1bNMwohdUE
 GpREj+wGNbXBhraCvY0im8srbU9H8yXmvg8qg4xqLMHVRWXmoKsKeSpxk22JanPCydHDukkKM/v
 QTBR61HYX3pif/csBqMctX7uhc+l/o8RrA5V8TaVB4jsYsYLZ2pVEmr0B3OYihAAWKR4VRmZVDP
 wcc2rWSwuOlZgLzsg1YzlzufcpaK9Z819rDTnrdDR7ktKEcxNz19e6MMxkYnCNtr/NhCRAJIckj
 olDK9PCm+SBZKTsp2Cz5J6aBBFMAHCyCbzbzR/rXbbYtabg/g1UGbld879RAsDDZYvjpo1TazdZ
 6ajTlxxkkGyZAVhNcPGOaW9Lw
X-Google-Smtp-Source: AGHT+IEcgaLatwY7/VhpRV9y6ZVjBLs8icf5KFY4Z30Ha7VQ5Kg2Dymj6dhwUPoRS5QtGAxYVuOHYQ==
X-Received: by 2002:a05:6512:3d0d:b0:55f:6cec:2890 with SMTP id
 2adb3069b0e04-582d3300904mr3995446e87.38.1759041692491; 
 Sat, 27 Sep 2025 23:41:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58600043386sm973735e87.86.2025.09.27.23.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 23:41:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] DRM: panel: add support for Sharp LQ079L1SX01 panel
Date: Sun, 28 Sep 2025 09:41:04 +0300
Message-ID: <20250928064106.46756-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Sharp LQ079L1SX01 panel is a LCD panel working in dual video mode found in
Xiaomi Mi Pad (A0101).

---
Changes in v2:
- adjusted schema with ">" and dsi0 > dsi
- fixed copyright from Nvidia to Xiaomi since sconfiguration equence is
  based on the downstream Xiaomi code.
- adjusted commit name of second commit

Changes in v3:
- tested with drm-misc-next
- switched to mipi_dsi_dual* macros

Changes in v4:
- removed unused struct drm_display_mode pointer from driver struct
- adjusted resolution in Kconfig description
- rebased onto drm-misc-next
---

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
  gpu/drm: panel: Add Sharp LQ079L1SX01 panel support

 .../display/panel/sharp,lq079l1sx01.yaml      |  99 ++++++++
 drivers/gpu/drm/panel/Kconfig                 |  15 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 223 ++++++++++++++++++
 4 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c

-- 
2.48.1

