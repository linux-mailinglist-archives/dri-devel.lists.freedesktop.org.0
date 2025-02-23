Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A826A4212E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2879410E17A;
	Mon, 24 Feb 2025 13:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJWRJJfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9710E027
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 15:33:16 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5452c2805bcso4036164e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 07:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740324794; x=1740929594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YgjojD0fkXCQkwACLWsbK5zmwbRWKyzVLcOWkG51yvI=;
 b=CJWRJJfrZPXcqdUgaS/uIBukzS7ZBV5UBg++jK6xsVyphBReGAELLZ03n6fn/wvxr3
 U5o/rzXKF8bR8KCcIDZOL7qnKkgNn3alyeMPZ8E2m1LbzRIr5goz6TNYq7iYHXcx452c
 4uMSiFJO3gn1WfGKCDJdDc9Ny/uxnr8mAuzWykGe6BF+ji6zWWnXs912PM2qTKaDA8D8
 xPUfeOYqykpy9FUVajwthW354fe31c1nEqYrxhfoN3TYQh3wx+r/iNsJ7/uTIxuR83Hg
 BhotmJYVKVNcKjvgF/N+eCALqbkaCx0+jkBGuPPMns/ttK3qyXw109RXEXBcr1yU48Nm
 u3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740324794; x=1740929594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YgjojD0fkXCQkwACLWsbK5zmwbRWKyzVLcOWkG51yvI=;
 b=Mepvhjgt05BPTyDlaQlOczmxR2hrZosU9Bl5nVPpUOsjNEEWX9vyQ9ToOLJp5UwK9k
 t6mgHPmE6kQktEzYbdj0vjJo6FjSVbFI81DD7yZQrkR5/1VxqHYtFJkN3U9m2V5ewHsP
 zc7ZLWDg6oKVGURlz73LRJaLr/kR/kZEgNRxAAJRWn0OTdu37QNlKudNMl5xQN6QwwXj
 PelzmnRoaWhGvG484H4fs3+TWjgzRrpg1q32l9D3VKGDGj/cbjN7cLMj7MqT0YTvrhhs
 HRbPN5JjBl5AyeIt75Kb/rE9CZjAUoTVfrzXoH7beejQVjHMngah40yVSvTeR2BBKY/Q
 +Q8g==
X-Gm-Message-State: AOJu0Ywq4Qmq+eyDix/8bhyuBiJAcpU8JyPF8XV62LFK/0Rvh+HdodXw
 jj9SQqKuezvttxrNUhaT5TcC2UEmNosWI4zZwaVvruTEI587gdyx
X-Gm-Gg: ASbGncv1j1EQ7QwfRXJiWCNv7i39LWZa8XKx93mwial2qnfgXQOa1VVbB9FsZuND0j5
 LSBxuyR8Y6Xy7dOnVSorw8pgmSCtg2F/oAF5w0K9ZJTItLYPLd4FQ2uGq70FsxbkmqGo741DBrt
 DCRvi1dWV1bpRCiaOX2MRWTtwsUzn2teie46jtqgnMRpjvgVVRpn4aB2e/klI6QFEA7ZCQtV9b5
 sVTilVK0oHB3vlPWiOB84+Swe1CmKih9MZ+Ua6J9ZUooihpTvsprSmf/JrVvwE5xIIttAOT4b6m
 hBn+1tp6sqjrphvt
X-Google-Smtp-Source: AGHT+IG77PHKjf5AhiLyerMkTqb453TjzWBZYQ7pg1s4WIRVRUE0L2S+OmWF2VO1uU3W239jf6xc6Q==
X-Received: by 2002:a05:6512:1386:b0:545:e19:ba24 with SMTP id
 2adb3069b0e04-54838f791d4mr4496251e87.48.1740324793960; 
 Sun, 23 Feb 2025 07:33:13 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54523dd8ca3sm3025569e87.181.2025.02.23.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 07:33:13 -0800 (PST)
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
Subject: [PATCH v3 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Sun, 23 Feb 2025 17:32:42 +0200
Message-ID: <20250223153244.149102-1-clamor95@gmail.com>
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

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
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
 drivers/gpu/drm/bridge/ssd2825.c              | 821 ++++++++++++++++++
 4 files changed, 976 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.43.0

