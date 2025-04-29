Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F4AA396C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3D10E457;
	Tue, 29 Apr 2025 21:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="HVsVEVbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011EC10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 21:33:36 +0000 (UTC)
Received: from [192.168.78.162] (254C2A1C.nat.pool.telekom.hu [37.76.42.28])
 by mail.mainlining.org (Postfix) with ESMTPSA id 017D9BBAC4;
 Tue, 29 Apr 2025 21:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745962397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DDRn7GcBEW5dpfpzcCixhvbd6tvodBDZfkreM1u/2+I=;
 b=HVsVEVbTQLA5Hyp+VxD8bJXGuXBQ+qXFWMLvfFPLCSEg8TJ+Jr5u89KaZwbPUFjXb2GLPR
 8QNX+pIgWB9eul9tOsNNEq/20rQikLKC6mJUvqRJ1rbpZ04L1ehXMuOeYDnsHxSgpqPVfM
 YYpPAAjYgKRwObyIcYr6UDb8N7BAmRmF+qpbCw3hzbNvQFw4zBlUT68ILpQ86rpNgV2Ivt
 FiO1u1wu+BEMKKF/Fu4Lgb/IHvHa1AT4DkEdMNQcfXc1gr7MgzTWU4lS17VVvlMWdLC8mC
 Hjzo6mTCT8BKq2UaiSi3fqoj71N5UQpJtEXgp+I3V5CgczTEH/7AUvQjL1O5cA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/2] BOE TD4320 panel
Date: Tue, 29 Apr 2025 23:33:13 +0200
Message-Id: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJlFEWgC/13MQQrCMBCF4auUWRvpDDFFV95DukjTaTtQp5JIU
 Ervbiy4cfk/eN8KiaNwgku1QuQsSRYtQYcKwuR1ZCN9aaCaTrUlZ2afWXuO5uGVZ0MDWmvpHAJ
 2UE6PyIO8dvDWlp4kPZf43v2M3/VHNf9URlObjhyiayw6F653LzqLio7HJY7Qbtv2AbvVVnaxA
 AAA
X-Change-ID: 20250426-lavender-panel-2f144429cc1b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962395; l=908;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=icO+vdIcIqooSnAuXY5FHPvUGyW1ryWr61SyzqiLtdM=;
 b=LydUN7RjdNXz5NX+VcdWucsEMk0GJLbpnicFy5tV33baR72UY6GQ7FKUwWpskHqHF+v+OJ8Ik
 ZMF01ciKwoYB0/Q6y9LyiGGevm3Wjwf6pd8EVLryhYQTjDTWTqAa1Rv
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
smartphones.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add supplies
- Link to v1: https://lore.kernel.org/r/20250427-lavender-panel-v1-0-b2611674166c@mainlining.org

---
Barnabás Czémán (2):
      dt-bindings: display: panel: Add BOE TD4320
      drivers: gpu: drm: panel: Add BOE TD4320

 .../bindings/display/panel/boe,td4320.yaml         |  65 ++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-td4320.c           | 247 +++++++++++++++++++++
 4 files changed, 322 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-lavender-panel-2f144429cc1b

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

