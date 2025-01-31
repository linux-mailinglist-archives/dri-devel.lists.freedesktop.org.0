Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D8A23995
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 07:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD810E150;
	Fri, 31 Jan 2025 06:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lkDeA86b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774C610EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 06:44:26 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so2830297a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 22:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738305866; x=1738910666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a8wLuo6Y8PuSoWmYGpdb9OZTpSpfN0loU20jIS3gbiQ=;
 b=lkDeA86biD71g4EZzR5Un9Rv/ovnAf5ZoerRZ/EpHyA7Mir8EYzUvu46SwDw8GXh4g
 QDsdI5yifHpvBhCNrE+cPkOCU78DBR+mZps8bL2q5vlAVB6HsHKXxufCVmUOjQwD46vy
 GzN524p+BG7EttmKwHNi6QH66I2U6Yvxn/J3wD8zcZ/aEyMjOxDxguKfc0UAOMhoakXP
 FP9uLkZt/O/E00TYNZDnNjhPXZoLQi1NMnrICJY3U6LeblrNaOo8cd2ldZ8Zy+pvbT2q
 kr3I+TPgd7lBp2GdzXOxRQJfqXiffGSic+tNHugoXLCJTI2M7xJ7mA/3xZW8gc/FTofi
 0Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738305866; x=1738910666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a8wLuo6Y8PuSoWmYGpdb9OZTpSpfN0loU20jIS3gbiQ=;
 b=Ii/eZgCPsJqqvF9RbD8IlVj0oy/AToLDCUBke0mfFQTSAGCi2RN1N6PAwtRIYe5OfZ
 TCIJ+nnP85U6c6xC19ojjhMaZmO6nhsvcqMJTgQ1r0Oc6F06Mxse5iVNVL7IAgvj5d4M
 2GL2NTApWMtfw1x4mXrDGqRnjyU26om1RtPanDPoIVnhdQnG//JEHYmeKJuXRqWG3iXJ
 GVud0bY4gMzpO7StUQGQI2XQTEMjyTHOEV8uufpplIl2CpcKCfU1+1JL2NS8kvETro17
 cP9xaRB63xb9ZDP43XW2ojaobWyPRiUrxHNjJTf+DpGdyd+fK0Wb+Fn3FAPomT//CYzc
 HF9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqxFioG4DzeKYwQmci+JqwSBJ7CpRNyPY21YHQpxcboXwdJ3P99r/oc0F2wRu3Qjs0yhk6AHcGfIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxyk/m0wR0PMGH8zwBOfnyqIOXeHvLcKWZ+uiph3yHRHU4L7g8R
 LkwFBeCBJpdGoOtdrgHvitk8qNFqSzJUI5AHAg24rpIM73evkQWa
X-Gm-Gg: ASbGncsEpN7iU4IgiL5WT31j8OmnWqA0IYRNVQOY62Opb8t7TwFh+XPcfL96cD341Fs
 V1N853t+aeD6iSpVng3PFy1OGB128W7VX/gRkNaI1iXw8/1gVSgcPr7iN/XjILd1KxIeewn5rCi
 IJNTASQIcV/HApc+GgOG+d9ebWQy0D/4U2ZPJV7u2+8l4gn4kSxaZK+3JJAyBCbBFguLYQ0FfE8
 BGDnaoxXBeVyxQuEhU838PgIRGIGg5pKUaLrVU3iFGJRs+FF/yEOJ+NSA/OCNvdqbRyrDusSk8m
 knuIyiSKL6XVkg3Pw8L7MdjBa/g=
X-Google-Smtp-Source: AGHT+IHz6VGpOU7Q2P2FSU44mu0Jwe+DIUCfoPCztH6MLZjXZrB1gVjhllou8+ScJgH3BIUqDlne6g==
X-Received: by 2002:a17:90b:2f06:b0:2ea:83a0:47a5 with SMTP id
 98e67ed59e1d1-2f83abab52cmr14551878a91.4.1738305865882; 
 Thu, 30 Jan 2025 22:44:25 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bfc0ddbsm5098947a91.45.2025.01.30.22.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 22:44:25 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/2] drm: panel: Add Generic MIPI Panel Driver
Date: Fri, 31 Jan 2025 15:43:52 +0900
Message-ID: <20250131064354.4163579-1-kikuchan98@gmail.com>
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

This is a Generic MIPI-DSI / DPI(+SPI) dual stack panel driver.

Although the MIPI specifications define how to communicate with a panel
to display an image, some panels still require a panel-specific
initialization sequence to be sent.

While there are many dedicated drivers for such panels, they are very
similar to each other, except for the configuration parameters, including
the initialization sequence for each panel.
Since there are numerous panels in the wild, adding parameters to
the driver for each panel every time is a pain.

Instead, this driver offers more generic and convenient method.

Its fundamental approach is similar to the `panel-mipi-dbi` driver,
which sends an initialization sequence stored in a firmware file.

Moreover, this driver allows display modes, timings, and panel
configuration parameters to be stored in the same file or in DT.

I've also come up with a firmware generator:
https://kikuchan.github.io/panel-firmware-generator/
It helps to create and configure the panel parameters on the web.

As a reference, similar generic drivers currently exist:
  * drivers/gpu/drm/panel/panel-simple.c
    - Supports wide variety of panels, but no init-sequence support
  * drivers/gpu/drm/tiny/panel-mipi-dbi.c
    - Supports init-sequence, but only supports DBI panels
  * drivers/gpu/drm/panel/panel-dsi-cm.c
    - Supports DSI Command Mode, but no init-sequence support

Regards,
kikuchan.

Hironori KIKUCHI (2):
  dt-bindings: display: panel: Add generic MIPI-DSI/DPI panels
  drm: panel: Add a driver for Generic MIPI-DSI/DPI(+SPI) panels

 .../bindings/display/panel/panel-mipi.yaml    |  244 +++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-mipi.c            | 1355 +++++++++++++++++
 4 files changed, 1610 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-mipi.c

-- 
2.48.1

