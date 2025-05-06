Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA7AABF9D
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842AA10E632;
	Tue,  6 May 2025 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DkglmcQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE41510E632
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:33:50 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5f861d16622so9331183a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524029; x=1747128829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUmVy1erubqo8DKwJt3dysVszYaW23+/y8mD480tYSU=;
 b=DkglmcQJ3EkRF+3qPFg4coQ1wA8uzUKk0dnqkVYLb3F2dB0S5A1GuGD3s6zfvTNld/
 1AxXTcWiz8tOchWJX/JpfqKPouoCwkfg6jX0eHHTZf4Lh2ofr8rmGwCo9I++9xNM+dhL
 SanF/JljvBw9BLtn/np9gLYV7R3eLCArdaoQ1ZGl/dCXfBs6h4l853NfanQP/Vbp5UF0
 o0k+VgT/q6MXMv8y2Oy9src9CNkTjVPY0MhPz9rWIO55oNIAYtIBxikU0FGAikJNDejL
 D+9vOAajki7aIDiW5O6+gdMaZJXTCZqMbBryDtOw6pXzhCrjJlkfJvwMT0haht/G44r9
 qt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524029; x=1747128829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VUmVy1erubqo8DKwJt3dysVszYaW23+/y8mD480tYSU=;
 b=LPtrUiV+aqS7LL5pZsRjtyvveEr7P/ZAgCzSM+zjVlCnXbqLyLcrO6TNjIO0QWXRHx
 tQK/tc5mc8jAhx7ihnxeWSmFcONlAhqlBLFJV0DBEl+ZVIxB9DXr24l0DLNVZu/8MZH1
 xMH73cS+g7ZYlamDssiMbzoLb35kmMN44FXBILuItEaYorYNTNJ2ZefFLSNfF9v71eX/
 oIEP0FEwUi0IE+1nt8tsOyuQA163+WesjCMO3j+fS83uVBFvkfi2lYusAqIATTno3FX5
 0jLtnkjQViI59j7E5XDMURkBDMZKtzr1b49f1Hz2/AhtB3TWY9JiAAHD3nuyjJES2UPi
 BElg==
X-Gm-Message-State: AOJu0YwmKThacXA1jlCGyLdmKu0SO2Yc9XQ1VW8qmEA/Npj++1af49cn
 IiBH7t2EtQwfK1zNHrIorivpl61rWjMUW39ioNPKklkskmrD3SUH
X-Gm-Gg: ASbGncsoEcDTkMtZx5btIbJ1Iyxtje0PNESE0hPe/weW9rCGmbzzxZWdbfZKZHwwgSX
 XE/ASMvlQ/EKifNTVeVVNcxZj+I+o+7V3tQX7840DR9yzj8AU+e+D/nWwSqK0AZFrByyo8cEqRh
 1C+7xp7hnAmUhI6w/CSWMhuMUTPv3Rm6JjIhO5WbvHoZEkR7m+9L92P56sH+elqgU3x9ijjuif7
 37bFGh40FQObvO9Ee85xOz536uydJ0DYuPe5vhu6oqog/QYB9yFulOYy98Qdgk0lBU4bqOOR5IZ
 RN8GjvJjGUMtIRrmaGsUC6k2GwG5y5vO
X-Google-Smtp-Source: AGHT+IFunOPAi5lNpQEz2am+muFSqRgNnILvh4u9PAiY5CHL3xqm1l6WqdPBO0kK9vDkP0eCSnyH6Q==
X-Received: by 2002:a17:907:f496:b0:ac7:c79d:f8ce with SMTP id
 a640c23a62f3a-ad1a4b7c7c6mr915428066b.57.1746524029335; 
 Tue, 06 May 2025 02:33:49 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1e1292696sm25594666b.111.2025.05.06.02.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:48 -0700 (PDT)
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
Subject: [PATCH v5 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Tue,  6 May 2025 12:33:38 +0300
Message-ID: <20250506093340.106575-1-clamor95@gmail.com>
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
 drivers/gpu/drm/bridge/ssd2825.c              | 812 ++++++++++++++++++
 4 files changed, 967 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

