Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C1AC3EBA
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2410E312;
	Mon, 26 May 2025 11:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YUIFyg/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60510E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 11:44:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d51dso3258376a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748259863; x=1748864663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EAIaiM17e9vEsXi6JQZ3zU1G6+zswjSGbk11YUFfR5E=;
 b=YUIFyg/ZZGazgf5oy6qvpK+AMKBL5VGaWwPakJpabVxYljPPXscEOpkl9kL7SSO3Tn
 uDLxeBqxpOqcPnWWa7bUgp5lLH8phmsaAxsk99hG/W55LP5hZXvHLMED9ch789zbsgJC
 jdxOKw9uyetP1EXx3rVHnJecdrDe0693bYmT5gO2Lj3wyMSngmTLIpdmumDPc0qih0o6
 CRQxAZwX0CX9KgJUq7LjcHLCWgau4FmRy4bFMhuDe7ZAysD0W9TJzqSBUB7GJAgsqEzR
 xAyCsajLtCfObH9OSoXQmhsPUPA+IBIz0xuoWlmMNDz2WeY6Fhrr8sG80Nn+a7X/cW7g
 P//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748259863; x=1748864663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAIaiM17e9vEsXi6JQZ3zU1G6+zswjSGbk11YUFfR5E=;
 b=HuB1oY9j0Scp+S7sDiyIUDirfNRx3bUcQmXSk+IGNnfaroVY2Hz8xPXs15mBXzlcnh
 zDbtBEA4NTrWXk7jHUAH8pIocs0f/ONAqufVl8GybUOuMexpMVErsVj4H5m/Lasl7rfw
 odnDHKRdI+1LU4EjktVNAfWjignm6SoyqYKRuY5VHAXt14FCrsKPrO3Guigk0ICxk9V/
 zax7W2NcNkc85glm2U2I07sV07qA2QpIOPORuaBKDRiktpfefA8HQAHwddySNzvrGG2K
 Q88nOnYQgfixF8d6G72nBe+l2jN+l8bXS3wLGPgFTY+6mSQwJhrh3afiyyS2LgFQXTDv
 wckw==
X-Gm-Message-State: AOJu0YwOu5YgMhfjx/Sx/1Pwt311AZ7w+AfdEf1qoOCrzYWKvG/Nt5yG
 aS9+/V+rZ3zXMCEscD3ZpP8PZ7gHEg9Mw9nzG1+rHO50Y1WpJSmYA7Is
X-Gm-Gg: ASbGncvFxDhQLPYDqel/MKKYLzsZa5M6VyFvkKyKhw8B5JiDihf9nYg6dDI8HGCrwcz
 UMH/HomqvabfJ15Wf8ZgoZmfMHXN7JwCbB2UG1w94z7FmetddILkX6a6ju6OCIAr4bABZ87oySd
 PizdiiwViHM4Alrb727l50+xS+ipsbQLNDlGeI1t2bPPbytH5O1jZctg+ESn2E20g6fE9J4/aw4
 40QX0t5rTQKUGSwFUxdlJ8tF4DMOf7lcd1AiHp5cPHxL97Utpxu9EJKLHuNJZJBy6peB/egLF9K
 6YDT315c+Ii7OSWL1ylAy/KU3dbU8+03eYlAZMl3rdU=
X-Google-Smtp-Source: AGHT+IFeDKj2wwKjk7FZaDOe+mf9EF9EwY6Pnj5HmbLPqahaPtLmowD8Q0xEX/SgcvIJNbpNPRuTqg==
X-Received: by 2002:a05:6402:2789:b0:5fb:f31a:df83 with SMTP id
 4fb4d7f45d1cf-602d8e4e90dmr7578503a12.3.1748259863301; 
 Mon, 26 May 2025 04:44:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.65]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1be3sm16270716a12.5.2025.05.26.04.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 04:44:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Mon, 26 May 2025 14:43:51 +0300
Message-ID: <20250526114353.12081-1-clamor95@gmail.com>
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

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v5 to v6:
- set correct module name in Kconfig help
- return error if spi sync failed for reading

Changes on switching from v4 to v5:
- rebased on top of drm-misc-next with adjustments to fit

Changes on switching from v3 to v4:
- no changes, resend

Changes on switching from v2 to v3:
- added mutex guard
- configuration register flags parametrized using panel flags
- removed unneded debug messages
- removed unimplemented modes checks
- added check for maximum pixel row length
- use types header
- remove ssd2825_to_ns
- shift bridge setup into atomic pre-enable
- cleaned default values of hzd and hpd

Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 +++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 814 ++++++++++++++++++
 4 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

