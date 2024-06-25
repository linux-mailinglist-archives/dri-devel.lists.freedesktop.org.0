Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6B916A38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4037410E676;
	Tue, 25 Jun 2024 14:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lWoLwXDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7FC10E673
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:26:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421b9068274so48636335e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719325577; x=1719930377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nnbM/UqNU7kz2IjENEyTCA2M982ffhA9NZXJCqFpGNo=;
 b=lWoLwXDJD+ll1pIW+3/0N3pmZ//aTdlPzNAxyg4A3w9ysCUqjyg72vKKihDJ/h/X13
 w5sZzZ8zf9xmn25WmT3jYHRmKLNakCvIkcuMvnBwEwszadKfBFiD4EfBr/vTx4XTrOxa
 GbPHihPrzUKBwAQunOVObgyhrFB/0YzdknWLa3TDLQr0NNzyhoMYu7fz1fD4Gh3XqDe2
 kEBtP2JIEXjeGR4nMgMcAYSPP3uXv7LgsB2gB22bJldpuB5wlHv/ZYi6JGyPBYJ06cgV
 P8+JclKTZzmrY8n+IHEkvpFSV+xSs7/yr6ieJ/41T2gMEj0Bn1kqsFiO6yQKGUl4UwzP
 vFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325577; x=1719930377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnbM/UqNU7kz2IjENEyTCA2M982ffhA9NZXJCqFpGNo=;
 b=XSKJ5BbT3GlMHwMesbDtb/hZ7HovUsT3WWtsGLCvaDWGSy6HuUpJth9eoT3Fu+Iz+f
 0eSECXHxn30hirYjgX6TcFqIA34c9/SlP6tlzUHdHBSkv2fpnoZ6gBgw5brf6GSUAimf
 Hn+/Kvss2UlluQy2hk31XaIIbJgmHde7vqQAB7bkNW5q8wI8mb4zQiMm0a8tQ51chYOW
 0tTCL0YRveQX6yn5escRCFgBW+8QK00aioRvh7WBdkvcaWKE6eUSfIDnpc1/d7JkJ+S4
 ktFyX5upj60MXRolb3jVtODqUw6g8vtQn5qNRcVVTjMpcpBCZGH1sHKXs5K3FifeXhHN
 EqLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvo2u07xlr0bTZ42xoQ46ID1aPk0F98zp+aSUvN6H5q2usIcEEMG9fU2jKAxzqa5LZWgTKkUxVS1QK/YGtWoq1k4swNUlO6nPamFUeHWfl
X-Gm-Message-State: AOJu0YyPlzGoZXIs1wOO4HDITXK1htPGwkUhuBS8GoSHbMvwuUE295g+
 JOnfXHDXuif+BNp+jzM4UcuAuAx4zuJt1Aj9x/304ZcptOCFZhpBMmqZedDCZ0U=
X-Google-Smtp-Source: AGHT+IHBC8yMvfpBU0+onzKrlaDVCnHDVjQCoibye6hJmIGdRXQU3TAea+VE4GZP205tIEuuyYEmpg==
X-Received: by 2002:a05:600c:4853:b0:422:6765:2726 with SMTP id
 5b1f17b1804b1-4248b9cb18dmr53858545e9.30.1719325576775; 
 Tue, 25 Jun 2024 07:26:16 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm213770685e9.46.2024.06.25.07.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:26:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: panel: add support lincoln LCD197 panel
Date: Tue, 25 Jun 2024 16:25:47 +0200
Message-ID: <20240625142552.1000988-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This patchset adds support for the Lincoln LCD197 1080x1920 DSI panel.

Jerome Brunet (3):
  dt-bindings: vendor-prefixes: add prefix for lincoln
  dt-bindings: panel-simple-dsi: add lincoln LCD197 panel bindings
  drm/panel: add lincoln lcd197 support

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lincoln-lcd197.c  | 333 ++++++++++++++++++
 5 files changed, 349 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lincoln-lcd197.c

-- 
2.43.0

