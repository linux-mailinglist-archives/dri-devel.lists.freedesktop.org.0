Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD9A3D5FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C2710E908;
	Thu, 20 Feb 2025 10:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BDHeK9fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561FE10E907
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:07 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fc0d44a876so1133778a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046087; x=1740650887; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/4TEs4cPoG1AcM4+yxLSv0REuXRrTGKT4YLCRC3ZSk=;
 b=BDHeK9fzCAXxnwb0lnFCc+XYtNZYLAJAQKQt7YuVfmY2kvl6/3oIlRZaLfg5ofnpz7
 LAlNCH0h+sLIxuUGucJLaHA49Z2Xt8X4G0mC0SUs9LD+rT5psQ0WVYC8xpyqcx3NU2JD
 RT7yGZNYJshBkGxLVcL/kUQq2aMVjxvqf6T+iVB1iY2Wv3kcyqz4HwxxknwQBMcdSe6N
 c4KiXblzgWeRXlOjRpnvrv58jSaPcKdGGtOE6YySrKFwhTKzISJvoLo2QKggqMLE3RZr
 3Hjv/Y1BShvrNR/kYNJadXWgLw7L8TifQH0lhYhL3pgwsVIVviIkvL97uUN+nbcRvUTV
 qawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046087; x=1740650887;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/4TEs4cPoG1AcM4+yxLSv0REuXRrTGKT4YLCRC3ZSk=;
 b=o6lZsjVnsEm8h4gzr4dMBDYqPXZTFfOxanZvcZ4Yj8dyPyyacpqujJkGwidhEIwsbH
 pMPoKpaCA/OnbYJwXYXWaFn3ix84cXQzDnNHpRkVHn4E95DXdK7juhgxJWHjCCteBuXJ
 ylK5P/qJ01vhUka3cF7mUDRdNseo4XwbFMYTKPkO6RaLV4UHsBU9TPxuDIqTm72faPyx
 Sa3dhgNJEkVKDAcQKG13UblkFXFfOETEh2SVMI+ECsWskN8kr9gl3fB9y6Dj83HFLd+I
 0LdVZeWj2hWFrKbN6Za9KrEdjs/cNWsuf0RFqMIUZmblxoQPAY9jH4F/qD3VHclX0jmF
 D8MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbq1Y9CgTjcjYklV5MphHRcSTRa2v+euHghMI9dl7VkfXBbC3jJ/PEaJtn+R6b2cyBhTGa9s1ZusI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1vSrryhlBp93H/CB7CLYWhOHuyKvIxWhp9Sy3OlpCfTJPkMCZ
 yYOQogBmvwjG7gcrt/amyX4IUb+WJTnjw1RJ/oqZdl9iv+y+2VEWlec+4BLwZ9c=
X-Gm-Gg: ASbGncsI36GYm/m9BX+EDE3jnkkChyRqzM+QV3XzXXq86D6bsX54uuKYM8TPp4Ei+db
 SJTX+SwMc43ZqIdavqUTFqCZJp+d26gRfJDX8JzbLBHNBMC/4+WlXZHAdzUiIL1C5ABDI2iIsGl
 hYG4msB93gpxkZ2REVNmVXX0XFta3uUBEFmR4Tg7NpPOrdFILsGMfz+qZdC1UHqyBX+AjgiG+0Q
 66uEL+bF4D8LqVhviRiWgXNslYXmmImk4Svk/+FbPq/oUcGsO332tkrxNVkg0yGlOoyMchF3aps
 xyFjY/c7Rlnz
X-Google-Smtp-Source: AGHT+IE4Hnx3iwIdTTQMv1etNjaKK2fbBl3p4LS+dGKDHiLfiUb9a4DuJMquOBV5Z9uPvqneJ57u1A==
X-Received: by 2002:a17:90b:3b92:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-2fc40f10763mr39959135a91.12.1740046086882; 
 Thu, 20 Feb 2025 02:08:06 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:06 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dsi: Add DSC support to 2 panels in dual
 DSI mode
Date: Thu, 20 Feb 2025 18:07:51 +0800
Message-Id: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPf+tmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3ZTSxBzdlOJM3WRTMzODZCOjRDMzQyWg8oKi1LTMCrBR0bG1tQA
 5/tdMWgAAAA==
X-Change-ID: 20250220-dual-dsi-c5660c22a661
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1838;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lZ+poUcsGaFUUbHXQn1jSPCAMiMLRg/1oYtrAb7t0FE=;
 b=gVYCs4tCVL63DS0T89O4NzqVIwKEcs/N4UZrpeCdVcmN6sQ+aapzx/p58uvsnYolbAvacke1A
 irHVh7r6j7bAoG48rVQuFuCWdkYRRk/RpT90O2QhyOagQh8LypEsFdG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

The 2 DSI interfaces may be connected to 2 independent panels in dual-DSI
mode. Device tree binging is added and frame width for DSC is changed to
support the usage case. Support to multiple slice per packet is added for
the device setup to test the usage case.

This patch set is split from the quad-pipe patch set v1. It is also dependent
on Marijn's patch: 
	https://lore.kernel.org/all/20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org/

The change vs v1:
    - Add device tree binding for dual panel case in handling frame width for
      DSC to avoid breaking existing dual-DSI case.
    - Leverage Marijn's patch to configure proper slice per interface in
      dsi_update_dsc_timing().
    - Polish commit comments.
    - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (5):
      drm/msm/dsi: add support VBIF_CTRL_PRIORITY to v2.8.0 controller
      drm/msm/dsi: check DSC width for the bonded DSI case
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      dt-bindings: display/msm: dsi-controller-main: Document dual panel property
      drm/msm/dsi: Support DSC for dual panel case

 .../bindings/display/msm/dsi-controller-main.yaml  |  8 +++-
 drivers/gpu/drm/msm/dsi/dsi.h                      |  6 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 54 ++++++++++++++--------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 12 +++--
 include/drm/drm_mipi_dsi.h                         |  2 +
 5 files changed, 56 insertions(+), 26 deletions(-)
---
base-commit: 53d2d43787aa9a7daf91d2421033528c2e186be8
change-id: 20250220-dual-dsi-c5660c22a661

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

