Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B7A437B1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40410E181;
	Tue, 25 Feb 2025 08:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGbvkGKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACEB10E181
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:34:10 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-abb8045c3f3so653771566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740472449; x=1741077249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ncfMgMCnPRMr8FAyu3AxbC4kltJNrhu35yNsQQCCo+A=;
 b=ZGbvkGKKZXjzTBrw4zwlKWfoHq1QrYub0MymIoRmKGaS7Jt5Llrbt20+WMLl3J5vyh
 ZOA108pZBmd44DZ9vc00fHC5RCuw4Av/Xb8Jgg+n6/AMTZWfoNeqUEj1rYoLxepAK8aQ
 LafwPFmkUSSb1Vz2dQtokbVCA/0XX+gYDSCS5+Ta13IR1GByoRTGJpK6lbQoPXN9Mi54
 KaSIzcJ0iXackgn8JXIHKq8DI4yWEsCvNVGJM/T6IHapEAeUF1aIZ0ibotTOYPvaMR0n
 LH4uhY5kLz4LBlnrY4eVNioV+ATqys8T+1x2NC45zCCnfAL1E5RQTMUm/ZUVQpwNTLpt
 AqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740472449; x=1741077249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ncfMgMCnPRMr8FAyu3AxbC4kltJNrhu35yNsQQCCo+A=;
 b=tc7R0K4EoC16ASxtiLNR+DdPFQl7lNHMSc/LejFrkl7YlUYLgvLzJeG8gwPTQShuv3
 ZvrlY6zwa0AKMB7qC3Tvau4sL80Pr56ZWJMmDIQSAw55RsjRUlO817VG26GYkgi1mQoT
 d66WNICP1IzRjytdRq9GmVVwLUtR+0c2E/bL93QRNT/4KDoGTSufr1dD3VPY9l7gZPPz
 cbuzNRMMvFXpTGTSVhki4CqurkszlKw3q9OiRPRDBZAAm1AgaJeiV2nKHA2HwxsdItYm
 9TbKL7WBIAq1esG6y6PeFGD7pfIk0/LRbDhrA5RJqpoH3Kxfzj8QfXA/AKgj7p59/ful
 FzUw==
X-Gm-Message-State: AOJu0YzGT1CQUljrOYe0EXa8zu15Nxs2ZRFfH8I+/DEtUzwWyV50hJLy
 1opvRTVIqoyd8zZQT3U9EnGqUDXd8FkhEWeCNNWxcCj0RotVzjnw
X-Gm-Gg: ASbGncvM6WpZ89F60CRX66L+O4AhxFylMahUB9JDMxwnpEgN60xLUHezGI18tu0r7rR
 5BRk53GyDnghYf6IRGXFhaJ3lv48mScFFz1PtTkFNoT4Z0eA/SnWLGNyLfWvs3IJPdwXju/KP1d
 maKyUwoxwouSu3pBwmkIuWqPvIz5Cs1On+EBn6Q89PKLcmWViZ7BYv1LCMoSCdW1o9yI7yRhx4U
 v8W/Dxt2JTAyvhdMAyCPXduWntgzBTpcbpewBAtgO9wluOH3gDXAxEwqwK/SXr9acBzaMKy5W+6
 vBb6TozkaRd52IIEqw==
X-Google-Smtp-Source: AGHT+IFsVJ+G4evgAq2r7H+GUziPoyhbg5V2ZB+XNwTzd0UZ8vWBpEbIR7juW9BOXlM/qfA+5BMgEQ==
X-Received: by 2002:a17:907:96a0:b0:aba:5f44:8822 with SMTP id
 a640c23a62f3a-abc099b838amr1684793066b.11.1740472448765; 
 Tue, 25 Feb 2025 00:34:08 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbe0asm102660766b.36.2025.02.25.00.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:34:08 -0800 (PST)
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
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm: bridge: add support for Triple 10-BIT
Date: Tue, 25 Feb 2025 10:33:41 +0200
Message-ID: <20250225083344.13195-1-clamor95@gmail.com>
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

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

---
Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.43.0

