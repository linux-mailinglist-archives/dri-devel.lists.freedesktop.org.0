Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE55D1B1E8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88010E53B;
	Tue, 13 Jan 2026 19:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SshSzzGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AE110E540
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:47 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7ce229972f1so7036195a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334387; x=1768939187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H8g5bJc3pUYOOH+Mh3z0UWCzPpBzWdqcnl8TWmpkj5A=;
 b=SshSzzGgor0sOGrrdoUbLeRxoF6W+JK0dPRbjeIJx1Ig6/S3sfCejKwPeJLJrEI2Q8
 SpnKc/K97UD59q7pawx1LeZlyUauJ5ctaqvwjRmemRNitOnGrG4w5R27kPzZfzAhm3ft
 +RvPI5KyHGACR6UVbiw++OSRu10M7jTdKqUG3huaLgmLab0YfzNk8y1Zu6Y6+UeNnuW9
 Y3UFBMsenABPtT40W98318nvzbnd+QlLkNJ5J3qEC3wee7BaHo38Oyd1b/nKQQ1xnnVj
 QFwt8JMtXQ+g6MnNVqhs6mByCehJ4niaVkExPkTWl7q1Ilkb1/dWXzNzOFnGsTyC9oLC
 SjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334387; x=1768939187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H8g5bJc3pUYOOH+Mh3z0UWCzPpBzWdqcnl8TWmpkj5A=;
 b=sKiydmK/nZEFHUtqPPuvtSHxOMcjNPQH3rf9VIPurrmMTiNSB+eE8UXd3QraKEViSo
 7n4e32Kj0j4kpX2WWxLCfQTTaoRp3PUYFq3WONqcf6eFmZfXNQfgaHNmbEhyF2rvfLIL
 +kXO/1yrRCWykZlBBZaxZsYN61ITZcfENpZggAMk/LDbqdOQFzc0pcMhb/hxqFb8DMod
 aHd/2hCiwPJYSvaL9Was0DOXDUz4LT7So4uN3DzHddudcB0tthcq7jmV4/RsnVFEdP5j
 UP+ZBIJ1wzLHRXchmanXzc+WD42gEGNolC8W2xyIIKk2XgosCsORByiTkVQOY6G2pZ7U
 9MZQ==
X-Gm-Message-State: AOJu0Yw2evdL7qsWcRBagSt0qsMrH5ODK++0pjfLqZPPAjQtEcPGFpKv
 CuRzNrT65bsExqudiD6zGdppk4e99lpUwItSgajIdc9q3fS2ypE4R0Eq
X-Gm-Gg: AY/fxX6ya3zZ92qaZ23UyukIdHrhhDZ1oqmveszpa4KLbrqoOc6W3qW6xucJaBv3IaG
 VSu6zxHa5dEWL9xX+ahs0CjdcFFgpdFkRBYfjaqIzGWT9igXBgcyavgdWVl9bJleQbUQt48MR05
 B8EeqJrx0O8NvdkkGEklAbM2Da/VAEQsA1XDtIg4d0IcZ4AGSAJ2v5z3JO6Hr1dYkr+ONmDQApd
 S7obyM97HcVhB3g+utFtMe9GddW3mxnVtX/rmiGarybeZqzA9GsgHz5oQa2pWgHWl/XryhEk9Zi
 FRHa4aRYQxDu7fPflN2zXQlnWhKMCcY8dmg6e+JQ8gmZbWF/1LOLvUIQFmOimEoH29K98+1OVwz
 Dun5jPMmHTT+4f6gCNJW6v0beGeX0rxrJB+AYIYjcTKQr/rCGkj6hNPs7PgKzHyc+O7Vb/CW4Cr
 0v9SaicmMs
X-Received: by 2002:a9d:6c18:0:b0:7c7:1c91:1258 with SMTP id
 46e09a7af769-7cfc8b3a696mr126207a34.26.1768334386967; 
 Tue, 13 Jan 2026 11:59:46 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:46 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/6] Add Anbernic RG-DS
Date: Tue, 13 Jan 2026 13:57:15 -0600
Message-ID: <20260113195721.151205-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-DS. The Anbernic RG-DS is a dual-screen
handheld from Anbernic powered by the Rockchip RK3568 SoC. It has
dual DSI displays with touchscreens, multiple face buttons, and is in
a foldable clamshell form-factor.

https://anbernic.com/products/rgds

Chris Morgan (6):
  drm: panel: jd9365da: Use gpiod_set_value_cansleep()
  dt-bindings: display: panel: Add compatible for Anbernic RG-DS
  drm/panel: jd9365da: Support for Anbernic RG-DS Panel
  dt-bindings: arm: rockchip: Add Anbernic RG-DS
  dt-bindings: input: touchscreen: goodix: Add "panel" property
  arm64: dts: rockchip: Add Anbernic RG-DS

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/jadard,jd9365da-h3.yaml     |    2 +
 .../bindings/input/touchscreen/goodix.yaml    |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 1237 +++++++++++++++++
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  |  281 +++-
 6 files changed, 1522 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts

-- 
2.43.0

