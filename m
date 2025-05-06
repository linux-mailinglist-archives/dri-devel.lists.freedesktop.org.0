Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8336AABF70
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781410E625;
	Tue,  6 May 2025 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jWxU+2mD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC84D10E077
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:27:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso10651701a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746523648; x=1747128448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=184wuFTAJlMSFIwKpNsxB4H0JZOaRNDGBSu0dTC1wqA=;
 b=jWxU+2mDe4ZBHb8b0jeJlXREHb5/otrEJLKenRYL8DxPvBhEH50uy+2AKGNvocj2LI
 UHy80g2bNYlKd1VKW0RS9uxA3oqjTQ72V8BLA6kfGS0Hho6Sj/ktKoTW8CjJRpddIMCC
 X8YIvceins/DI9IlLK2lhdlA9VElHGKvuUsJHoLRdNGdLzQ/k8Ut6n3RypwLxOzKx70h
 KAaNpna0m+fEwCaMT/r9t2uqUJnIVZr9oP7il1t2573s5p8X95AgUrTwhFs7JGWj1wwI
 kf/FxCLN6rUazkq9GG/L2d6dly0rgqLRJf9LkuYSFqwp4LVeNQfadr/HbzhK3YC8/OXb
 B2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746523648; x=1747128448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=184wuFTAJlMSFIwKpNsxB4H0JZOaRNDGBSu0dTC1wqA=;
 b=lYZQn+H2fxHzRVxenmM8SU6lc8GlblpfaOytf1p8nkoHhBlxdMv8mxz9QSfCW2dpVg
 7gPoZEnFOUfNZTn8S9FKhohcmMqY+BqG0Y/3JS4sahHA6wucz4V5nfm1zvGETkMKYBMG
 D8002Pq8UO3NooUew5W9k6L5FiTec1Xoaf6ElNwbrktysM1tV+0ex64aMWynuOUNVEzo
 vKpcFFa5BW40482/x4pY+xo9pT252ncZh3yY0HBt5DTVTHWr5q9rNRuXld+STSxee1Ba
 6ZbeUl3InNhEYf1gz10p9DVn0Liam0Zl2nBowyvrIGP1Qshd2i03FzgtolVXWbymj1M+
 VVYA==
X-Gm-Message-State: AOJu0YwJBl/112h4Xrh2jKl9H17A644w87YSrk25j/0SwVPV555l2VLH
 BfR+M+TsTD07NVi4+4ip5xrrevHYnuUnV9y8TQXspu17JdV5b63t
X-Gm-Gg: ASbGncvLJttxdDbJXalNnK8FhmmuKAw6Sb8DjTYMy3zHh2emdx1sRShOX7Xlt0AmXi6
 22mRtYno/Xi5AfVjXlj6A3Sl9OFNbcy4Q2GhpdG4yPR/EiXRtmMQadQDruGUP8aYeqF2nk8u92z
 7ZEPrAAGmXoSGzLOKPLJNqIgDp2RgJT4JVom9OdzxifrDw/wL5Jwn223BIZr7lUEMykUwUtbOb3
 upX8/hElOqW5SvnQVd1IGGWuaLBcb2TiuZOK2R3HFgtwjAKDrs7QJ86r8u2UZxQwbhE2zRzwCCO
 gBPck+Fcmprz/LuVEmMMLAuL9Mk06FBq
X-Google-Smtp-Source: AGHT+IEfjJcQzL0jr4eUj8ffG6VatLpr1FG10qmF3SwSlavdo3y44IW2Rq1TdRSj1YvO7W1aQKJEvg==
X-Received: by 2002:a05:6402:348d:b0:5f8:d4bf:e663 with SMTP id
 4fb4d7f45d1cf-5fb6fb8e175mr1840105a12.2.1746523647640; 
 Tue, 06 May 2025 02:27:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:27:27 -0700 (PDT)
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
Subject: [PATCH v3 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Tue,  6 May 2025 12:27:14 +0300
Message-ID: <20250506092718.106088-1-clamor95@gmail.com>
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
Changes in v3:
- switch to devm_drm_panel_alloc
- rebased on top of drm-misc-next

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

 .../display/panel/renesas,r61307.yaml         |  94 +++++
 .../display/panel/renesas,r69328.yaml         |  73 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 325 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 281 +++++++++++++++
 6 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.48.1

