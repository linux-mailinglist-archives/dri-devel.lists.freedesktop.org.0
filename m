Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B044A736FF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332CD10E178;
	Thu, 27 Mar 2025 16:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ba0h6CAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62D810E178
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:38:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-54957f0c657so1391536e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743093515; x=1743698315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MCipadPWDc9+WNsaYqHuzZhnDYq2MJBL/KTC3dNV0xw=;
 b=ba0h6CAMUmZ0uBE2o0Pu/xdUjLj6ugUsDq5H+q43T5LDyvRF0JCrN89Q8Gj81fEtca
 QnS8ZFXOK2+CFI5ZeVWNQIAVLb/oM7zQsxQDzA69Y6iewQ0fysiV7Gf1nYfXvQKugl6+
 fmyegeoyPIuwAtMpZqi0TYkGoLkPmGraM2H+tHFQ6uVqhnnCgXupIN7hBx3TtYleISPx
 afkQCMOIBR4j3zybdtvpeam0WTdhC77on+WTfVSV68535mYUFP+zpV7vGCeyoS4i+Wow
 M62Px5pWHV8J8p8slxwlz9pmhxRddaexlhtukPmHhYfdz47atJRewG3q37Z+Mnzvn2wz
 YHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743093515; x=1743698315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCipadPWDc9+WNsaYqHuzZhnDYq2MJBL/KTC3dNV0xw=;
 b=wlB3J4MIqaLNZaUZUauMIXZ9S3bAPyQBxYy+E+OYmN6kXi5lOggiR53PVQA9LBHOe6
 lrkWpw81JWooM8GxD/3DEVArXZq+bCCFTDsZftENjiiZdKQ06g47+Qm7UxW38pwWmPio
 mmBU6YzA3IMK6jrieNYf5gwUeRc+JnaF9QpLJRdqxVtWxmnfKvRnUEZAuLS26bvDcM3J
 MXqyv91/LitrtPAMML9h0FHGgkFpSkP+33D1G66GXS1/T3wSnSNy1BfCVwjbgmEmlqNG
 hBqSqQed6sDWJ35Uv27DGnx/Fc9sZ9r8OVnIASqPq7h2ImbMAW10+TKu2hC6dtppUdo1
 T70A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/ewVs07PFbCzKOk2zwW2NXJO9/8ioX/VLS0YL5EBtoF4c8qXTkCSYHMoWVxoot49KICGorsu0aY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzROSr4pnHOstpM7QGqJ2K9d4cxVfyWVyLB//yDIaep1gsucdzi
 lt6Kxcq2sGoYQKikQ0UO+IGNEZL0UnymcCZkO9uxmporOP4rSmYh
X-Gm-Gg: ASbGncsSn+E3V4mK/ceh3685AukUwQgylVVNhzMwTvKhrjauG7b8DDoEHWmc/Iyx6Gu
 4MKsHOXV+uSu02VlI/Qy+XMnCOYTFZRhMcfZJmVAFMrKLM4tflHJYZQoZntgnYOfDS7bT9Io2zc
 y1NP4rQeZUU3pJCdlirkNwGdTvtNnNIU9ItGiD0FO+Qxp2uomQXFdqYWrHZUVSTBxBLzyxJLtYC
 HpgxX9hCdqJFrb0DoeOJjX+PqiAsEQSar47gSWpwtlN+ehVudzjP0TIYPRQAbLlaaR/HDCYiQdm
 B5tFcDHBzo89ze9GroJ/FLa89U+BGNn6H/AccXaK+qF3VMQ5F0GMkvoZBGlGgsdfkHER
X-Google-Smtp-Source: AGHT+IE2P34XSAHmzmsA5k5rQZOJz8G4YUEkCHQ1A39qmpTMqdjFzDpAeyy8rjX1BH6WCbNx9lRzLw==
X-Received: by 2002:ac2:4bc6:0:b0:549:68a7:177c with SMTP id
 2adb3069b0e04-54b08b38577mr533774e87.7.1743093515026; 
 Thu, 27 Mar 2025 09:38:35 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957feedsm10150e87.110.2025.03.27.09.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:38:33 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add Visionox G2647FB105 panel support
Date: Thu, 27 Mar 2025 19:37:43 +0300
Message-ID: <20250327163750.986815-1-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
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

This patch series adds support for the Visionox G2647FB105 panel, used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Testing has been done by me on sm7150-xiaomi-tucana. According to the
downstream DTS, this driver should be fully compatible with the
sm7150-xiaomi-toco (unfortunately not tested) without requiring any
modifications.

Changes in v2:
- Describe the power configuration in commit message (and fix the sentence style) in patch 1
- Add Krzysztof's Reviewed-by tag to patch 1
- Use a static const struct for supplies in patch 2
- Fix identations in patch 2
Link to v1: https://lore.kernel.org/all/20250325155756.703907-1-sanyapilot496@gmail.com/

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>

Alexander Baransky (2):
  dt-bindings: display: panel: Add Visionox G2647FB105
  drm/panel: Add Visionox G2647FB105 panel driver

 .../display/panel/visionox,g2647fb105.yaml    |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 282 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

-- 
2.49.0

