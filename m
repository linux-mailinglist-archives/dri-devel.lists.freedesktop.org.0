Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DECA09070
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 13:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F13410E0C8;
	Fri, 10 Jan 2025 12:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="REsqWNsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884810E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:31:59 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso22048511fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736512317; x=1737117117; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BP9LWU3E3FRLicswW2oBinqYyF3rhC14ijpoNXWp3o=;
 b=REsqWNsxkZy+PPP8nUvZBy+n3hp3fgYxj19sZpVxOqwF7ePlI8/IAtHEqxWmjSzbIZ
 KQoszEAX6bcydvyKWxBOdgtu9IvQ2rPr7Mzb09Yn+NyBTf9QmOKinm9jt6NWKpxNtI85
 IMXV9oelDq0+s4M4gw/pIp4KoL+bPacVxlzUldVTlWYQP4p5T1s5W7npDtFu/MhmaGZ4
 zPked05yYvmNo0W7G6ExM8n81IE8mgYwtg9puL0ar+eAXcyTkr4yEbf6n6YGfArTyjvC
 9RMYnTnPJvFNYylWZo9IupWKfg9dzTlnEXVPVEV20u+cfogVZu2uXIPlUnqNjrMig1Az
 doOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736512317; x=1737117117;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BP9LWU3E3FRLicswW2oBinqYyF3rhC14ijpoNXWp3o=;
 b=hbuweMoxMRwlmrx0WkONTfcWypoeAihXAj94Kn7eF4D/EFcBmSEBg4qsIlZX3PbxKx
 2PyZKHFGV1U4rNZJHAO0eDL/ItR2gyvPmvj5K1pjMHxYEL+vj4Njk5jZPsNYq4FgSe1i
 87KNTDN2oIQ9Ge/DU4KxaUpKlQMhmImkITjTrPuaLiibZkmd11ujSQpSwH2yW8JpxCwx
 mbNMFe7Ibu7BEshr9mw5Kpqc3jtCCyJlD0jpjikjeJmJLuPoqQ2ehaVykk0LlFVJkXeL
 tnaUHU0/9QlOkoqiLqz18VfnH6bQDo129aAdrAyMDdkmBgR6Q4tt6j514VwMDbKEPDgz
 P93A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJgwga6ATaBXkbC/bxQnykm3ECf3p7o8Lv+MtAMcAz14Z8QfyENSNdrlSGyLcxd1Ga37Lx3M/lRX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh0loCAt6QLKTEpNCVbVg5TLwyGmGYXlsp4wcoM+BjKrZjpfok
 0B57ZldUXrSEbwn8dLo4z3YQ9Xc6SCAUoA89GTFY4348J8EjShl9itPKkzVASVM=
X-Gm-Gg: ASbGncsTMrsR62W6V9CmYjHOQVB7EomwcRvO18PLEdNtUGRk6WDKaPP66SgW1TX0HlW
 6MapaTxHHmM/9Z2VNwHaCVroFxKAJrfCZZCQvOdWxTu0i0/c2IjamHP3KjmbPtiOI+107Nw+mY0
 Q1DGF8dYj67BqQB73SUyp8SiXN9nYTq2BRP09ZNIjmxAsnUlUYlRgUPinwwY2H7ztWzICscv+b7
 b98+TyslNxTCZNsiQAyVmCfiErvF2gZTUlDGFd2i3h6bhnPtQv8KjgYb770r++X
X-Google-Smtp-Source: AGHT+IHZ9afttyn/cqAE1E7GmLuAXpsvCaaaWi8kC7R5oAwtkI7oOIPDRS/Hl/Zy4nFPu6RJGUwzIQ==
X-Received: by 2002:a05:651c:220a:b0:302:175e:5abb with SMTP id
 38308e7fff4ca-305f4533291mr27884991fa.3.1736512317337; 
 Fri, 10 Jan 2025 04:31:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:31:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Fri, 10 Jan 2025 14:31:52 +0200
Message-Id: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgTgWcC/2WNwQqDMBBEf0X23C3umqL21P8oHrSJulBN2Uiwi
 P/eVOipxzfDvNkgOBUX4JptoC5KED8n4FMGj7GdB4diEwPnbIjJoNUJJx8dLrat62rFqu9MkZr
 CWIY0e6nrZT2U9ybxKGHx+j4eIn3Tn+zyL4uEOZYVlcTckS2L21PmVv3Z6wDNvu8fzC92O7EAA
 AA=
X-Change-ID: 20241214-drm-move-tda998x-8fb4321434d2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2Wi2hJcT1zNHSKX8/A2Lk6eiJ+5rudw9X/YYXOotMzo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngRM8o+V3INgu9YQUcio8HytbKGG5QUzMU25hi
 vtQ06/uvG+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4ETPAAKCRCLPIo+Aiko
 1ZDCB/sGzYUNqF0GsWbGgXNdDxGTmZGdZyMaz3ASFYIr6I2qPYzg/qSDvNKlo54XHAfwL+EjlDO
 xq/o+LS8FA8Y/7TdszSwaiPIztO8eEmjJnclgtYWsoe6/V0MDXKjXkfGKl96lNWltpuHDb/7gBM
 tUYZORmsL0nUAk5fgys+WtrWbNaD3OUyroMgw5JGPVeqKXb2ydGGOkwruuGJihzDxqKtYz5yFpc
 zK2LYVIliK2gzZCH0NB8QLrzCrlBdteHwNEHWH3EkRQQs2UlHUuxHsJiz0Jcvg8PJXdNm6SOIGj
 UVm2Il4Vz3xXiLPDuwo6M6IcuPoOzhKBkfZxS9aa0vxNoreo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
on-die on the TDA9989 and TDA19989 chips.

Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
drivers/gpu/drm/bridge/.

Note to Hans and Mauro: I'd ask for all patches to be merged through
drm-misc tree rather than splitting them between drm-misc and media
trees. The patchset depends on the patches that are a part of
drm-misc-next, but are not going to hit 6.14. Please specify if you are
fine with that proposal and  if you'd need an immutable branch for
linux-media.

Note to RMK: I didn't change that, but I'd like to propose to use
drm-misc tree for this bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
- Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
  (Laurent)
- Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org

---
Dmitry Baryshkov (3):
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA drivers under drivers/gpu/drm/bridge

 MAINTAINERS                                   |  3 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 +++++
 drivers/gpu/drm/bridge/Makefile               |  4 +++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c | 49 +++------------------------
 drivers/gpu/drm/i2c/Kconfig                   | 18 ----------
 drivers/gpu/drm/i2c/Makefile                  |  4 ---
 drivers/media/cec/i2c/Kconfig                 |  9 +++++
 drivers/media/cec/i2c/Makefile                |  1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c  |  0
 include/drm/i2c/tda998x.h                     | 40 ----------------------
 11 files changed, 28 insertions(+), 109 deletions(-)
---
base-commit: e91570cf7c1b3e406878e7b1efbe823d039d1659
change-id: 20241214-drm-move-tda998x-8fb4321434d2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

