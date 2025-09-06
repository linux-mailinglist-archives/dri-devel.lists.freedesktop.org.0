Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05692B46DA8
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F7B10E0F9;
	Sat,  6 Sep 2025 13:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="madZrHjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B63610E0F9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:17:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-55f76454f69so2828183e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757164634; x=1757769434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
 b=madZrHjl9rBEDihNi6nEzAI7mvQyuHbJydk261LmM3WG0j9RMUSZb4OrhhdaQuId9B
 vcZQq/Uqp3dvPGoH2Ye40zz2d+RlLDDpP3GdlHlBYrJ503VrX0sVIiZYaJ7Ziwv0dOgE
 4UgX53uOvwlJlfbgz48tzn3TAsj5PBP8Y+a62FrBQdMX9r0D+5nZ6/mN/603keT5d66C
 wFyF9s/rOeJQajwrTgCIj7EiKxAI9/SUxrIbcoY8M+SHlIFBh2zDNFA3xod6gPEv1nq6
 nSAw9RW7Spi/cU55QYZ+ckH5aSgEv+ghcKcyXCvyz0pkmX6t7gOTvWDf29tE1pknBVYF
 4TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757164634; x=1757769434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
 b=aHNgDebyplK+YCGTT1+Mh4WZN5+wdW/QTdpmASxx2eypgsDBmk0Sw3NQa5WeavyhHB
 ncUTBg7koWY+3XZ05P+b6ekrhBv11xo7KfmoG/QFVVkGTw1Spb0ZT9Xdvw9gi9GMKO6x
 /Ss9p75xcb5sc/xc50xYdgPFVdP91dA4C9JUP4a1zP9pFatRL22SejudkxKgywL0KzZq
 mXriAaFT56YzGfiyxnS8J9za/HNdmvCFetmhdok5cQOFXNPM8V07weFXcwbyg30qokrZ
 7+0ESbQuHIit4xzVc5qCVhDfbMy1AphMPOU6Wk/M0E8r5C10IHOcYRxl5EOTR41Jp9JN
 t/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjGrVD5VDyEuk1Ag1RIz8HEa5jkzRrEBTDS4znRs8RYbumPbQmKPsi4Jaj4gTbFxK5impcslIBPho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbgHQfMVzb+LNvEnbtoDw3aJpSOEEiqd39c9cCndirZ9cStysI
 wP+KuP3PciI0f3jqmfncC9FRmwP0Q+mXB8oSSIBaQxpIZ4Rii6SwIE4d
X-Gm-Gg: ASbGnct1H5x6fUWIEIj5HaPrnUTiyizxTDQ6Esyc1epclmtm85sp+qh2VyPkG3iXz0b
 XHJIJnMBdYWafD9Y88rUhZwkF24bk7Fo033wm0mHycxS+mZXiywgAqEAhP7WemDnzXj4QYEF7Rj
 ALvhfg+aVCeGAIvdNzJnev8ywUaabzA6RtbJUttfYUMhfOVU4ZmVPfoiosIiwwTZu3SzAf56QC0
 tVF5UfmxKtRlITV+1hPcRdLTSVZTRtyDXV9wAQCGlZqWFOH/Lj4MZ9PKfTG4HfnQAA+0ZbroTsJ
 j4pCAQAB3oSSZRbIolquB6DWP3W7FxKpNhy0k7nUlz8PuxuOZSBpOQcrAACDe0fQZ3ofYgY+UfB
 V49URY4b9VmfnwLL8PHdlwbo0
X-Google-Smtp-Source: AGHT+IGemkowJ9DUUuzY2mYnlqSwBPTYFfnUHammCbEHEEG+j0HPGbQknwWy53AHiTbfVkzNhph45A==
X-Received: by 2002:ac2:51ca:0:b0:560:8b86:75ba with SMTP id
 2adb3069b0e04-56261db5e31mr599542e87.52.1757164634145; 
 Sat, 06 Sep 2025 06:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:17:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:51 +0300
Message-ID: <20250906131655.239340-1-clamor95@gmail.com>
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

This patchset depends on Tegra20/Tegra30 CSI bringup since both share
MIPI calibration logic. Ideally these patches should be picked after
CSI bringup but they will not break anything even if picked before
CSI patches.

---
Changes in v2:
- removed all MIPI calibration, it is handled within CSI bringup
- added per-soc structures into of_match
- added fix for hang caused by register access with uninited hw
---

Svyatoslav Ryhel (4):
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi |   4 ++
 arch/arm/boot/dts/nvidia/tegra30.dtsi |   8 +++
 drivers/clk/tegra/clk-tegra20.c       |   6 +-
 drivers/gpu/drm/tegra/drm.c           |   2 +
 drivers/gpu/drm/tegra/dsi.c           | 100 ++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h           |  15 ++++
 6 files changed, 95 insertions(+), 40 deletions(-)

-- 
2.48.1

