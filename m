Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC095A38587
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDED010E4CC;
	Mon, 17 Feb 2025 14:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KYdCVxW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750210E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:09:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-546202d633dso1104613e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739801363; x=1740406163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cfPSU2/dGADStin2gRTv/ZeULko+bgLPt/Ljxki/I/8=;
 b=KYdCVxW5PhAjptzAR6LnerQJ0BA3JsVAtX21RWih2nNPp0cjB46z3Le/8i5FNwCzqb
 DlbmWwoC/DnIakbgB3zLIF8K9Pf1j74cFO7cjPSRKwmORoTKaAjb54Mfx4Ny3Vk8L/U0
 JBP0dRKIpb3RhGARMukkSZlm2O5TsNfqt10floCx3C3J9wyOLeINId/SPEzKjUaHYNaN
 I0yVvEDxk8h5S1naQuo7F8ZQlwNP0rVxGrbo2VnMHlJrFb+G9sCpJDtPiPMTaNb5Yv18
 7J6Pj5CY0L2HWVk0WEdO/x/yPTeJ55Ps2tes0jz0yB3WskXijUpNL/8yzj61BJmlFU8X
 NsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801363; x=1740406163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfPSU2/dGADStin2gRTv/ZeULko+bgLPt/Ljxki/I/8=;
 b=FQpTh8zzrQOMuH+jkZ0o2iRwJJ7ljjjVyxbvDJyGw/VIAdnnhKNkPWdD3VtiVaHAt9
 JowUenNOGev2i4j3AVqWKcwHWb4/pHlNn91KLuelrC2hnf4Nd9oU2lwNAGWvguuRnHGw
 BeuxU8WiWMFs7gF1qpGp9gZv/aHB3gzzzFT2km/iaADptNPW+ty4yKbQ5HaPE/ZJG8MA
 UqoGbwUEFRMvQN3Bwn0SOxhU1BfIC78HAtEtaUswl5VaGD1qIKY07U+S9rsrFrIqNNAJ
 d/UNZqq+7GoN3j0kykxn9VuLJFdT+o53QykX0BmYe9fIs4GGvj0TdgfO+Ba68slW2ZIM
 Iq5Q==
X-Gm-Message-State: AOJu0YwaQ16Z56XdHRh4kDBqNMDbWrDF8rkcL69o9s746d0XL0SQvKSy
 8TYT6ptH8YtV/9a2fU5NlgJ3qoRAEfpLYlouW2tSnohkzCGzTRS9
X-Gm-Gg: ASbGncsoOqcb9Fe88oe+o4QWCI58dPQB9RCvdmkt5ezaRN0ICqhG550Gg+qyBtxNhpV
 agWeccW7dRCLUu5W3kbUqd7YRgTdqh0OMGoHUZvl+X2mqUDA1c1BXn/b+jYsNpcPz5OuevtMsI0
 3BA8dEtPDpL7HNvlZ8trT4wf1C3QqYq2N31vgJCLcAS2vyYgil+L3cConpxOXndjby1iJ/RS3jl
 yJ91cF8K/jB6JvjjDBn9uX92H59IatoSA0I5qeEFQLsK0xUGGB2bNcM6p18EZu4+bWNwZ7K7w7m
 3raPkA==
X-Google-Smtp-Source: AGHT+IHL20D/CRUyYe102zJ1QvdnfFZmYUOKh8czKdL3I1ESZ5y16nOXd+G+C3R9LKY3ImUEKcm6lw==
X-Received: by 2002:a05:6512:4020:b0:545:2fa9:8cf5 with SMTP id
 2adb3069b0e04-5452fe93333mr3398912e87.49.1739801362598; 
 Mon, 17 Feb 2025 06:09:22 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531b8ac1dsm866855e87.75.2025.02.17.06.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:09:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Mon, 17 Feb 2025 16:09:08 +0200
Message-ID: <20250217140910.108175-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 +++
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 824 ++++++++++++++++++
 4 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.43.0

