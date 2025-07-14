Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DAB037F1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BF010E40F;
	Mon, 14 Jul 2025 07:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="VHuVSOSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw
 (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F110E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=JheWIDHIdbrvdyO0uPqpYMdJM2l3R91ufTMCbA3iLjA=;
 b=VHuVSOSQoyUjexkOYs+mzSa6izSPhKszu8i4MxAWLOCT3YRqU5rOLhAp
 uisd2+o/Q1u6MskutYHJY3Onrtmq7++EATXDtRLRv6nqq6xkPXzSRarzZ
 rZY8kJQjz+BENcxBqsy+sxqU0dla4172rPdhatCjk8hxvZSx/NvGWz4Ix
 zUI0auWuUitzXTfAHsnVg1FSdOnYRi1O3bkNNf+KanAo1CRXQhuK6fYTd
 dxeM0DTBirdCs+CMHh00w+TWVwikeNWStb38/ydEh25RR7cMzXB1/Ak18
 fcjxQ4T4ZBJKfg+A9klzT3pks79UHnX7W1yOoHKWnO+EfpufWvHA6dIVT g==;
X-CSE-ConnectionGUID: ylnzaLAARDyjdzQwehQXlA==
X-CSE-MsgGUID: AO9fcUdAQ9qOSRS+OwV8Ag==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 14 Jul 2025 11:15:21 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 56E3FI68091131;
 Mon, 14 Jul 2025 11:15:18 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.15) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 11:15:17 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Subject: [PATCH 0/3] Add ITE IT61620 MIPI DSI to HDMI bridge driver
Date: Mon, 14 Jul 2025 11:14:31 +0800
Message-ID: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABd2dGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0MT3cwSM0MzIwNdMCcxyQSIklPT0owslYBaCopS0zIrwMZFx9bWAgB
 8ztOxXgAAAA==
X-Change-ID: 20250714-it61620-0714-ab4ab4ceff29
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Pin-yen Lin
 <treapking@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462909; l=1272;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=bLdZ2iT5HrK1xUmvICUCwvnqZPjc3pp3vhcp1N01vwU=;
 b=B+qCwt6LxX9hGqkRPySzCyP5gaIelfr8frY8ki+tndu3FKAhaZvS0Bj+vvVE2YqulppM3BFpr
 szFQhw/txsSCgxTUamfpX8Q3xkTkmrCBYGUHzZAauMvGr1C4eVMAm4P
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.15]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 8967C04D54A19AADF3226EEF9A8E14DE4701A8E3367F93FBA41D1BB13CFA67FE2002:8
X-MAIL: mse.ite.com.tw 56E3FI68091131
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

This patch series adds support for the ITE IT61620 MIPI DSI to HDMI 
bridge chip.

The IT61620 is an I2C-controlled bridge that receives MIPI DSI input 
and outputs HDMI signals. A single-port MIPI DSI input is converted to 
an HDMI 1.4 output. This series introduces:
- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality
- A MAINTAINERS entry for the driver

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
---
Pet Weng (3):
      dt-binding: display: Add a device tree binding for the ITE IT61620 MIPI DSI to HDMI bridge
      drm/bridge: Add ITE IT61620 MIPI DSI to HDMI bridge driver
      MAINTAINERS: Add entry for ITE IT61620 MIPI to HDMI bridge driver

 .../bindings/display/bridge/ite,it61620.yaml       |  138 +
 MAINTAINERS                                        |    8 +
 drivers/gpu/drm/bridge/Kconfig                     |   19 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it61620.c               | 3004 ++++++++++++++++++++
 5 files changed, 3170 insertions(+)
---
base-commit: 9bc5f6fa631da7771f0e9ea360b31b9d2f98c95d
change-id: 20250714-it61620-0714-ab4ab4ceff29

Best regards,
-- 
Pet Weng <pet.weng@ite.com.tw>

