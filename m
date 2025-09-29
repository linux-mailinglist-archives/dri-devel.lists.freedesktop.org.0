Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657AFBA9893
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D448010E23A;
	Mon, 29 Sep 2025 14:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5OTieoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0AE10E428
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:20 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-36bf096b092so65658971fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155919; x=1759760719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DPPg9TIoZPnzthQd8E1VwdjwIEaEjaVDMMssW2mg+cY=;
 b=W5OTieoG3XxI1HGN63JBcrXIjaeM451EPnAuGDGbI13w4IXMBoOqUMBOcTm3MxK+FQ
 vbMQ/7MV50564ORcwp/MYdHX1Ryhm4Jnra9cTaemkuW0XC1NFq+QSOlvg8SShcN1f2Lo
 5UFWGBw9HggSDf+hvPLr9c8RXWrIZB8qtZiLu+j/rY5yBPL2xJ2qxQuK9KAJE2Mo/2P/
 nxihBcYk032cpzhh8c6CiIHpOkR1YP3O2dAkFbdsP9RVX8gyZfjYF8afPKnSsHCqVOsz
 yujrcowISVUVFVnSMRjVfuLLWzI72KLbxrBGW52av46DAs12IF/F3K4BDFr8kZpDHIe6
 kQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155919; x=1759760719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPPg9TIoZPnzthQd8E1VwdjwIEaEjaVDMMssW2mg+cY=;
 b=boh9uMff4OfXuxb9zDeYhtQqH7x6y0WcZrZsbnrM5GeILdXt1r4ArMC1zDBqIl5lO0
 +nrXV5K67Sx4IKUPFRXt2T4+8PsQppKwRFFZRCYnyc3jciqJ+CX7D86ZoI2QH5RCqmPf
 s1jjuPAV7QPcMRy336fI/j0q6cWYlZNU2p2ws88nDY9IypZSorg+wlyliwqthfFCEEeV
 O3Ivk2SSlXZ53FL5Dkn9rnPP2g2j9oPm+82IksWqjCQv2pxl2TL2dDujG+n5ldyNN0TI
 +tfH3ZEylUGRec3HsgX0G6dQiM+HjEtYd0ndDGYMjOaYVpr/nOcDTvB0cg3+nOlVYTeG
 t7aw==
X-Gm-Message-State: AOJu0YzKHnB22CsngqRrDoHEgrMHW7BU0D/q150IAMcA24wF5oY0g1Ny
 6O3BfR8L548/Sb1f7pN2tueJ/FvkFPwwDZUJtjxDTDlRBA+eXG/kLfZA
X-Gm-Gg: ASbGncvmWutiRAXJwysuU4BYNeBFMkFILVTgDjI6fkW2KaOrlIEWQmzuaSQk9rtQr1H
 zvM8tFmV9B6YKP0wT3xMw/HLmJ7CKmWlnqZBBntrC0A9R7VH8/1KY4coBJlZkCvavOSmzBPtIiM
 PCtPC7QHuZ+ZRq0OnHG44bT3ygPNP0k7XJx1jBhA5J8aFhwplaRn2XLPOkdZvM3o4WJ+JJ6YsKN
 Dxw+JrOMKHgK+k2Sl5GxZJzlr/3GA7mrMzgksws+nMI9JirZGRpNUir01DmK7DAzEhx2KN4XRv4
 tIQh/SprF5aHyHwmuVWfkLGwEBMHFpNJkCwkfSGn7Fwelh3OyFpTm/lDpUMYwCWYGDbMieyl9Dw
 3+1JDfO5Y3dWJ5EhUXUn3lBXi8N9pfbGYKqc=
X-Google-Smtp-Source: AGHT+IHxDGpQBwuQkWcBRlcxN2mP+i2I0/l8+XNF8RRMmqOhDyFCD+mEDRiLnbhKmmlYr8NSnFokUA==
X-Received: by 2002:a05:651c:1986:b0:36d:755f:a6d8 with SMTP id
 38308e7fff4ca-36f7d2cb85cmr46262991fa.14.1759155918449; 
 Mon, 29 Sep 2025 07:25:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/8] Add support for panels found in various Tegra devices
Date: Mon, 29 Sep 2025 17:24:46 +0300
Message-ID: <20250929142455.24883-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Add support for panels found in various Tegra30 and Tegra114 devices,
including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
Yoga 11 T30.

Anton Bambura (1):
  gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Svyatoslav Ryhel (7):
  dt-bindings: display: panel: properly document LG LD070WX3 panel
  gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
  ARM: tn7: adjust panel node
  dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
  gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel
    support
  dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI
    panel
  gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry

 .../bindings/display/panel/lg,ld070wx3.yaml   |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-edp.c             |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 182 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 10 files changed, 495 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

