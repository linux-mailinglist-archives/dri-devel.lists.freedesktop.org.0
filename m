Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F02AA7FAF
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82DA10E00E;
	Sat,  3 May 2025 09:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kNpIBz5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCE10E00E
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:42:07 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so589214366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265326; x=1746870126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HRzJEkB5JYl0DdIU3L/hXETUklhxJ9F3t6evSuadxqg=;
 b=kNpIBz5tL7ZBcaCh0E7Ae61nuQ3D3LQGDgxQJZv4z2KnXsVrSk3bhOOLmuR7w0/K4j
 sI70LCQWtWd7kPDhhtyvZM8IIU+Mf1XZitAx7uDbSxfo1mwpSesvZkWoMpaJtuan4QAw
 pS/XYvzo+46TDJrjQsFzIKSsTC6XsXuFsyMyUdAV9CTuPOmAbada5iLmgFjeN1uewcKh
 jIFEEvh5keoyg8VejKaPe8ErJvOq5LJYr6KRf5kPP3QFmYd5U49DBukPesoRFGzSS52B
 Y9C9XjiOXWqNsYGIhZ8xZZQGqHKUr/T02j+5As19S4iBfu3wC2v5bCZQj9A4DuQ9X/Nr
 nHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265326; x=1746870126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRzJEkB5JYl0DdIU3L/hXETUklhxJ9F3t6evSuadxqg=;
 b=UQ6hjo5lTr091kqGcFV1dLXcRALG7J1cTdIbK6kvblYFZFehocIq88nWNuKqr75UyX
 CypFXcKjjl1poW5PQk9QU79NnlStd0ZU2yIyUIKjUWohPf0R71Pd24Eud/Ihek1nmFOS
 3rgBytH+uQEUVFp8h5hHCUXL7DIUmgM+xPzQ3XolZCyaattxTDuq7BnA4nkpDx4oUrjA
 +Cs5HSDE787MTJMri0S2WQ94v5QBv5eb0av7jDYJzEIMRERQLC8OzXg6n8apToHsRHG9
 UHcWX30RmOG+c0FWG7uvIkB5679VNQCoZ7/Vfe7UUOqB8rYBRlsMkpj+cBplgWu1P+3U
 E3VQ==
X-Gm-Message-State: AOJu0YzNe+3r9Fsgo6bTmXubW9rrU0PzC66n0qTej3XKTX8qHlP0fek0
 ujaq/tVxu9WrLuarugmpr4fsF6964SRsEC/CfRCqjF2IxzBgpzXP
X-Gm-Gg: ASbGnctTCNaDfOml9LWY5rN8WOYB5xzToEYVJqemjvzmrC1kMcxhEiKg9ExYNBBRnun
 1jUy7/89+PzLmIpWgHbxv3ECgES1rRSxMqWYSmG6olpgtdZLoNPazlSuUDfzILb3LfO/wN9x/Jh
 z4OA5RJHlJjx/C2aqmLoL0iC5UWJ/49hTDDtZy9J/9SSqwu6lxAMQ2SS5f/WuI/x924vTjiIoK8
 M3ZRUle6SjBGTxH33gQ0TGYdVLBCrAeD7Ct5I2kyQnNt/dQSESXiqHiomn+Jfq4w1PsOo5NiY+1
 RABX86e+adTEKtnXp35aKZkvr2wCOaMH
X-Google-Smtp-Source: AGHT+IGGeJl2tlU9uooYzf/Ee9b+oIKzptXSJEsbTWbOy2XBTYA/rYncL//Ldq00kOmZ7BTfx9Hb2Q==
X-Received: by 2002:a17:906:6a19:b0:abf:19ac:771 with SMTP id
 a640c23a62f3a-ad1a48bc392mr41488666b.2.1746265326088; 
 Sat, 03 May 2025 02:42:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:42:05 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Sat,  3 May 2025 12:41:45 +0300
Message-ID: <20250503094149.29201-1-clamor95@gmail.com>
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

Add support for panels used in LG P880/P895 which are based on Renesas IC
(not related to Renesas RISC-V architecture just the same manufacturer).

---
Changes in v2:
- added IC vendor compatible ass fallback
- renamed renesas,inversion > renesas,column-inversion
---

Maxim Schwalm (1):
  drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Svyatoslav Ryhel (3):
  dt-bindings: display: panel: Document Renesas R61307 based DSI panel
  drm: panel: Add support for Renesas R61307 based MIPI DSI panel
  dt-bindings: display: panel: Document Renesas R69328 based DSI panel

 .../display/panel/renesas,r61307.yaml         |  95 +++++
 .../display/panel/renesas,r69328.yaml         |  74 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 327 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 283 +++++++++++++++
 6 files changed, 807 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.48.1

