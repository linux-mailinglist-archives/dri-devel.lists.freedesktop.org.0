Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49BA9E147
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E7010E07E;
	Sun, 27 Apr 2025 09:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="X8p3q0j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (unknown [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DDA10E16B
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 09:11:27 +0000 (UTC)
Received: from [192.168.80.162] (254C2712.nat.pool.telekom.hu [37.76.39.18])
 by mail.mainlining.org (Postfix) with ESMTPSA id DFCBBBBAC4;
 Sun, 27 Apr 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745745075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fhWq+YLEhSYtuiJd7ME2LnrPPOIcmR8L3Aqjf8KIYI8=;
 b=X8p3q0j+10RjfxkQH6cnTW076eux+Gjy0ds5Roe/C4y2nh63gEbwk8TdtqC1lXQWmslEC7
 7Bybg5h0O1zHsyIgFyV2vGlPUozIQWq9wsZPxIi0WSax+nwYX3lJ8tZZkEBOaMZUIkNXwo
 dJFx8MF8HfJe+8psN0luNU6ZLPx2xuk89Q/pC2XkqUE+PK/SygZPSDrpYm5sj0M5xDQaUh
 QBUoGs63N0jHp/WcZkrLScLYRyjpQD9mqXMzIjqUF+PFfLZVQQgSEoUCUvwg3QL5LUgNfW
 JL42eOgvwMxpEJMmcA4Ck7EyANNLTGdN2wCcquXQtNpeE4n60sFIpUnC8tjwog==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] BOE TD4320 panel
Date: Sun, 27 Apr 2025 11:11:10 +0200
Message-Id: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK70DWgC/x3MQQqAIBBA0avIrBN0sKCuEi1MxxoICwUJxLsnL
 d/i/wqZElOGRVRIVDjzHTv0IMCdNh4k2XcDKhyVwUletlD0lORjI10SgzbG4Oyc3qFHT6LA7z9
 ct9Y+HiDDzWAAAAA=
X-Change-ID: 20250426-lavender-panel-2f144429cc1b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745745074; l=770;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=QdLkz9HIQwG0Lztr/8GKFq4ltt3zfOwpXgoolgkFwhw=;
 b=XTt+GUT7Xba1BsNgCZvGcr6f4GQDyvbIuUdFu8DvFjlqfiFJ/T3mcQv8pzSekP1GdyP2d/lSv
 fAg5U+LElu7B43PY2NoQ482JK5F3SArdI+Xqr2oluUrqho+qHo0BlqW
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
Barnabás Czémán (2):
      dt-bindings: display: panel: Add BOE TD4320
      drivers: gpu: drm: panel: Add BOE TD4320

 .../bindings/display/panel/boe,td4320.yaml         |  55 +++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-td4320.c           | 224 +++++++++++++++++++++
 4 files changed, 289 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-lavender-panel-2f144429cc1b

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

