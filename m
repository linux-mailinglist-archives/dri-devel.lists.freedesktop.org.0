Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A9A70853
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D83B10E5D2;
	Tue, 25 Mar 2025 17:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ey3cN4bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D35010E594
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:58:58 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id
 2adb3069b0e04-549967c72bcso6710610e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742918337; x=1743523137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WxXlB3Q2YL2Ilad6LW0JN/V9aTo4Xt5BBRqQjvL+Sk4=;
 b=ey3cN4bq64kzW6mPQQcNL1M7Cu4kGCDrnz3dOZtd3/njNZYiClLXTpoYuqwaCnfyLo
 U/y15CFpJ+OAo6GsOvV6mnHSmi9IEim85HPmYAoF1DErJMyQNd6mo7KNUs2CpGmWP9LQ
 hfFDVr2qhigmo07DtqiNWFF/SB9+JpqdgTDWP84mY/qk18X4NJ1kh8gQItN0HK/ME+UT
 PmdUSEJ9JjUZ9jTJyhTeV62htIH0Riejh/pO/yY+Hoz10l3kRwNbQPbVRsb0PfXkRhXu
 YEZ+dvKB1UvGiU/04zRDTB5buZy0cM09RN1Rh4A0AcRjHrzevtmtNZ1DG1kpuu7MijLJ
 0DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742918337; x=1743523137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WxXlB3Q2YL2Ilad6LW0JN/V9aTo4Xt5BBRqQjvL+Sk4=;
 b=I9pN/JYI1GeLgm64DLvbbPq/hyEHsetiBQ0Fl4TMFfqBGPblJOgZ5DEErraiuO2QNK
 Qncs/ijabrwWuVFsSZaxFAN3wi5pe+SGcSD8cM1AdQgSeYVSaike1BR+kndxW5qCrL4n
 4Bx6mBrrUWIqO5dwdasDmIeMPG+7b++3XuFSSRE0fRWXBK7mkSQ0y0nRozjDqrGAjJfE
 uCMpzr2s54w5V+vQB/t+xlibyLjCJ3rmfC5Atp7Vyg4fzgoyBFJEt+09QKcvChJamueu
 1xiP0HH5bFjjW8GJPwf8gfrYIF81i3oEwDU5U2nbRPdf0KhGwDok16MmatMcsazVB1ni
 Lo5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKeQeGohA8MtzOsqRy+XxF18OxynSKQAe9SN59OdVhu2M+t60QT0t3C62Dl6CeZgIbF9XRNomUv3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb1rY48Qg6xruqPvx5x6cfApDmmHiN4avMNF0FqjW6MTul+f6W
 pfIn62AeAnVI+avF5FZwURdSyNHEWzLnYOox9HCEpCmTT8kxlEpV
X-Gm-Gg: ASbGncvFHHoY7WSJPLK+jzDv+Pu4Fi4yLaPlPtqZATHoj2vrEuJswBKvCRtycMzFwAW
 HdkBUuSFUpazDov8XLGka1kBGqSQDyvMafxez3t7o0S3Y9KZ3gwDRWCelV7GRygiz+pPH4F3fi0
 +ByEzHhvRzxdqvRyTBLRXt5pVk5AVryCZLz9PTC6G5+YgaQ6yJTF5eNJFhs7XMgCpXkADr53hgN
 ZBIGRPuR/ipVUK5xaQNS9ihJemWf9AXYowqeCPk/nJiNSt5zRql3FFFqKy98kUaB4dc1kjvddk+
 AoAcYwZ4X65URLf9v/wMrWdRTpuoBbjgki1NK0kAzse27bM3bX+mhj48vA==
X-Google-Smtp-Source: AGHT+IHrbmRJ4XKU9ftZ0EjXOQDmgfR01iKjUAzH+4vTrN7X920Ls+acQM0brH8Yhs+E5/llV1y8wA==
X-Received: by 2002:a05:6512:3e23:b0:545:22ec:8b6c with SMTP id
 2adb3069b0e04-54ad64b311cmr6540631e87.35.1742918336460; 
 Tue, 25 Mar 2025 08:58:56 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad646cedfsm1544573e87.2.2025.03.25.08.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 08:58:56 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add Visionox G2647FB105 panel support
Date: Tue, 25 Mar 2025 18:57:47 +0300
Message-ID: <20250325155756.703907-1-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Mar 2025 17:37:54 +0000
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

This patch series adds support for the Visionox G2647FB105 panel, used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Testing has been done by me on sm7150-xiaomi-tucana. According to the
downstream DTS, this driver should be fully compatible with the
sm7150-xiaomi-toco (unfortunately not tested) without requiring any
modifications.

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>

Alexander Baransky (2):
  dt-bindings: display: panel: Add Visionox G2647FB105
  drm/panel: Add Visionox G2647FB105 panel driver

 .../display/panel/visionox,g2647fb105.yaml    |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 277 ++++++++++++++++++
 4 files changed, 366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

-- 
2.49.0

