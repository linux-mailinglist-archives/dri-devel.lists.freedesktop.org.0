Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7CAA54D9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 21:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85E10E33B;
	Wed, 30 Apr 2025 19:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="rpGpd2OM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A775210E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 19:42:23 +0000 (UTC)
Received: from [192.168.78.162] (254C22F1.nat.pool.telekom.hu [37.76.34.241])
 by mail.mainlining.org (Postfix) with ESMTPSA id 75B95BBAD2;
 Wed, 30 Apr 2025 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1746042136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tBaCp7GDrjHsX8Pvl09Fu1jU77VZa/OZKfdlMSUymeM=;
 b=rpGpd2OMEt4bWkB64hWOQpbQSsdAXVUKM1BbzfXg90kBABvnAsVcOwuF6LcEzZhvIki36+
 Qjzn83yS01GTrtss482s4p1veWWmF5hshGcW0M9v2c5JKhFjy6zdVNzJFOoU6xCESdQNZy
 udS1HIQR8uGEcg9a1qpJPx1M2RR33P/vxhsxxCcJFnMMVd/B+wJ4gCLK9OWcWR1lzbs/Qs
 mlkuiiINQYXWEf8CAaffx7ZfrpjNDlyjSRWY8JT3dujnXGl0meaeSupJBetmaZWqYAIeu1
 2qBYuWQ2qUCA4xRDb+/WdqAQMN5klZQJpdjfFjsz9chZILRGolVKtxbPpUWZoA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/2] BOE TD4320 panel
Date: Wed, 30 Apr 2025 21:42:11 +0200
Message-Id: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABN9EmgC/2XMQQrCMBCF4auUrI10xpiqK+8hLpJ20g7UtCQSl
 NK7mxYEscv/wfsmESkwRXEpJhEoceTB5zjsClF3xrckucktsMRjqVDL3iTyDQU5Gk+9RAdKKTz
 XNViRT2Mgx68VvN1zdxyfQ3ivfoJl/VLVP5VAltKiBtCVAq3r68Ow79mzb/dDaMXiJfw1zhsDs
 +Gs0pVzJ7Bma8zz/AGAXARg9QAAAA==
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746042135; l=1101;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=2+4SRA/9LdSjPheH4Q8cDuja6UpLq8wSEuPOPddLIak=;
 b=WxSfvaN2kZQkf+1xudZszr2+e3fl9FgMPY+Ts+d0J2LM8jNUxPgxMedQk6Bf6YQVYt5JvdHjh
 wfcnt5TDYvyCTzgtcy2evJokURj5NmCEIrZpqqzqGSbF02mnn7rjymd
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
Changes in v3:
- Convert to use devm_drm_panel_alloc
- Fix vsn, vsp supplies description.
- Link to v2: https://lore.kernel.org/r/20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org

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

