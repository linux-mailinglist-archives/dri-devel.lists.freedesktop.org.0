Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0CB08EF7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2963010E823;
	Thu, 17 Jul 2025 14:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VAHmzZVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298A110E823
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:22:03 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55516abe02cso1052001e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752762121; x=1753366921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
 b=VAHmzZVb2ceGfJTxshDDNu7h8QkH6gDLAtnwqoDVByKANo5vdEmp56+wsP4GxYLA8b
 Vg4+6aHTMQ4JIYLgf/xjpFYqNZ6OPUi5jqtDhdKUIyQvjOr9srAe8pcl3SpzAXhXhHxb
 tyI9/GBHTYSAeiDb4lYkDFws3rIYR5AviUZAy6IaFXwe2E+0Wi7WAHnS7FlJcDSxCame
 TxrXfJxCiFCdzhDhdom+4bKoR/wMFBL+Uvk/fVt78PPk2Thl8RqmR+IElgh8PKqoIfld
 UkXCeX3Q22W65tLoW2Umy+sxY5mKv3Oq2U7bOj4KNp26MeORe1lNds0Muh9SrfBi/E4R
 T5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752762121; x=1753366921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
 b=mxbcPEM8L0ss6tZqyJWxTUvxw97YGRVv0DBeS7ZPbeZKqqncPeL06R/WFexQOOtlim
 nHocDao2h0bi0gSInNlvLEQ9pJYWN9OQMFkGZpgDG6EkC9bqT/FGAOHMyjjHD3NVtcfd
 m2yQ/FJ/mFIQYHBnysVq5B7+yeKh354TaCl/5E0yjSUOLBfnNw0GLaA0UHAhac7Asg0z
 3/ltWGDN3N1LwgDq8H5KzoSTyCNpe3c/qL4VtyjnE4rJopWHGboC3z1Vi0XC8miLQCHK
 jXGQtbkzyOoEA2TbG5msCwD71H2r71Xi+rQkFH+4/VRyRbrsksqJvqrdO8SkqZjayyAd
 ldeA==
X-Gm-Message-State: AOJu0Yy10e8EF94L+Xchmy/XcXnq6UgeOxCWv/uIlog1BqrtdcDr7SoW
 3O82mQWhA6BltYAl4+QwvJ8h8IYL3d46GEXs2rz7MR1AD7WKKHrFxKk7
X-Gm-Gg: ASbGnctE6HYBDKgD4SMJCqp4aPmN6awEdTIaruG6w2xHRebRk+rvCHHbtDj6l9DJbVJ
 IpHMJGDHHjP2w/ota+bfSSzbSj/YVex7QkiMPgZ0Iyu+zPvNaZk5r9xwc+DR9TvDxXF2sFPt9Q9
 7jY83T+DpnM6JK8+8igGNHktDi5ZZpjxK6xJChp6trBojOaZL3ybrdlyBR+O5UReYc3vdmQQ/57
 8IPBlvqQj1q+zzAGVTbi+qxYhetqd5V2HiGpcG5/33K+p/Zmt3oF7zQhUnIzF2gNqum77IxnA4G
 aiLRQrVYrbWZ9gwGLkQfaqerEzkvNBcAm/pX4hB22XYbHCbeHa7Wy48q4NqSVlFXMFbXH32p1dV
 hGFj3pYWCat1ABg==
X-Google-Smtp-Source: AGHT+IETVuaIe0yIblxMsrahFaAnGTb5KS0kw9IE1R3XPGpMq4J2+RHE3rnYN8FwOfpJSG6kzmwHbw==
X-Received: by 2002:a05:6512:124d:b0:553:2308:1ac5 with SMTP id
 2adb3069b0e04-55a28c92645mr908636e87.4.1752762120941; 
 Thu, 17 Jul 2025 07:22:00 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 07:22:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 0/5] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:34 +0300
Message-ID: <20250717142139.57621-1-clamor95@gmail.com>
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

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

Svyatoslav Ryhel (5):
  dt-bindings: display: tegra: document MIPI calibration for
    Tegra20/Tegra30
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++--
 arch/arm/boot/dts/nvidia/tegra20.dtsi         | 14 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi         | 18 ++++
 drivers/clk/tegra/clk-tegra20.c               |  5 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +
 drivers/gpu/drm/tegra/dsi.c                   | 69 ++++++++++------
 drivers/gpu/drm/tegra/dsi.h                   | 10 +++
 drivers/gpu/host1x/mipi.c                     | 82 +++++++++++++++++++
 8 files changed, 206 insertions(+), 35 deletions(-)

-- 
2.48.1

