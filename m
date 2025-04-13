Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463AA871CF
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 13:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466210E03C;
	Sun, 13 Apr 2025 11:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWAXH+BH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D9710E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 11:24:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso652117666b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744543450; x=1745148250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rUTDjy7xdeVquaQ2yrizRZXgwdn38Vk2chACh8D3pZE=;
 b=JWAXH+BH+EiIV//DzXBgEQ0i03nEtYVsoBXWSpd1GuSxgdZrW+qPsvAwNVsMouQ547
 qqv7dT5a1r4jed6ndkFmFdfm7Sn5XW7Ua0kOHBNEOSo7cTlfH203SWgV52QRDcf8uFKi
 xy+d/2TqBn7XwylWHcEKAOOdyde47Yd0b8Mn2LC2rkzyqrTpmpJ1XjbczEpl/GF2+sWy
 2neFYXsdNzAiMtdJHrE5w21HVkIXeH/puwzwVyV2RSw06+FfNq8c80SR6cOlf2Ja0vPo
 1l50F26HKVhCy9OTNI57GO7wsQOPu5OAwmFVBX9zC+gBPliLMER+raIKghxx29LU3jL4
 0rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744543450; x=1745148250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUTDjy7xdeVquaQ2yrizRZXgwdn38Vk2chACh8D3pZE=;
 b=bNDVHVrbtkoWYhjnCwLHJyOL7tC7EDSKXOrDqfw77xzG/4CkGzB9mRMid6GTzsO3tq
 OywZruUuHqt3WoAqnRGICh7c+sBEPGgpM7Wl0AyIsJGDJ5h3d4L3zNUfKqM69loaRBmo
 S/iphtAA1Dn/VWTdkc4ZnwpLo4oRklUYrOLWCOPHgXBaZrPbHAhih/1GfuDHfEXOzuvv
 trjvnBAjWcpUGzFdsI4jv4mhJ3c6IX0GUjCMpuFSA2OL7W+hQgq3eZaOuJPnepsqaGKg
 EHAqrr/sE1zvq8Rf2fBbgjCneeLi/V7GAm4g6F1/sfxislDkD6lclDenvyNqgBzSP5HB
 uwfQ==
X-Gm-Message-State: AOJu0YxwJUddIRfg2bF/aEFv2+v6/2e2iSu/WJy/x8fVIT28DsctJiA9
 fOCGFOripmGgNrzUPQ7bKW+fRcsXdPedQC15a+ju2Cajj4TjzEv1
X-Gm-Gg: ASbGncvqx0ZmnDzjzzshPBEZKqNz4Pu+jP67AQJ4PhqSVkNMzuM0MjN7TI1csAqamSw
 1Bq7OoeKTMG0AMgr1GjFqsFZyvAArAk2/h4abNSRlbTYyHg/iMg61Wzz3QSH1KGMgKWy4bgUCVR
 qIs9mRd0Zg20Zo4Pj2oowPXXdE39qtRTD0fhJaf9fkS/03N2oGReGBcqQo6jNtB9P9U6vSV7e+0
 T2BaJhHmnsNkxPIMIOMqTQke28SX4ap2c7TuQOKBRPlFTslgZZ5Whq8LkmlFZDGd7ybAj43C1Cu
 9a2fXFW7adDBHxbXc0emwKBuSDLVTZvNbWo38axhPZc=
X-Google-Smtp-Source: AGHT+IE93UB1qoyXlQ7Rv6TpcB8vp7o9k6YIA/hmBR3invbLq9NB0l+XJsASKJhsxC36HjPlH/VLXw==
X-Received: by 2002:a17:907:3e87:b0:abf:8f56:fe76 with SMTP id
 a640c23a62f3a-acad34d8da8mr882386766b.25.1744543449638; 
 Sun, 13 Apr 2025 04:24:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 04:24:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Sun, 13 Apr 2025 14:23:57 +0300
Message-ID: <20250413112401.12543-1-clamor95@gmail.com>
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

Add support for panels used in LG P880/P895 which are based on Renesas IC
(not related to Renesas RISC-V architecture just the same manufacturer).

Maxim Schwalm (1):
  drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Svyatoslav Ryhel (3):
  dt-bindings: display: panel: Document Renesas R61307 based DSI panel
  drm: panel: Add support for Renesas R61307 based MIPI DSI panel
  dt-bindings: display: panel: Document Renesas R69328 based DSI panel

 .../display/panel/renesas,r61307.yaml         |  93 +++++
 .../display/panel/renesas,r69328.yaml         |  72 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 326 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 282 +++++++++++++++
 6 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.43.0

