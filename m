Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF6B5431A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC76610EBAE;
	Fri, 12 Sep 2025 06:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbdKVrip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1355A10EBAE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:43:20 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-560888dc903so1750267e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757659398; x=1758264198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/e6a4r5HwdADWqt2gxdEiy8yhSw818PuxVS+VjAKm8A=;
 b=EbdKVripJLJTXFXYCws+2RrvWgmQPrpvNMhUZ4sHHWkv3sPpMLoXEtisR2k5z0BtEM
 3st02h8FeAYbnseochISnjjQF6rn0KwU7+F3k4m7bagczLoWts9SH6z5oz+L/W7Eb9b8
 SSlHWFjfdF4ZClNANOUhFLPiMjlpLJnLuEsAea8c0KzZWl38IX2sDXnx5NJKMKboGiNd
 TRPOcoN2pWruv1HCAYEDOMn38WJpQo8bSjeB3J2+fTjKnkuICo185++R4uGqzuZgzTTj
 P1xooFpxInuv64BGQhJQOYgiHCfPNzi08VEhtr4e3/9UG70LbzPUtjFPEmhxBgorEcXE
 rfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757659398; x=1758264198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/e6a4r5HwdADWqt2gxdEiy8yhSw818PuxVS+VjAKm8A=;
 b=vC9+6B5XjGuocj05FR0FnYteHodqkeytbLh7FRI00wQG0p6KBBkbfLK7jPkA3OHfq2
 rnGJDoWnoy1vRKLoAhcrGyq0gvBytQSDq085LvOb7rg9UtXj5TID2ZzGd4RZdiUnjXWL
 8jSAP9fsoEBx42B+LVsRomsn9GD4CF/MEFQs8BQUnkIluxH9PqwMn7JK1aK/NrZgc+Rj
 7m3xTdt5QgFpDCu2MDeeXAgMqvHRds8VR/kxcAnB9FWEbhrNU25yZf7IQZcIacV0TUR6
 4A1Axu/04sFdaAEZRBnEGoSBNYsqCNulLfsPWEZq+phSJth702zYGsCIqu4f1vZB4282
 qH5Q==
X-Gm-Message-State: AOJu0YzZP51DyDJ93EMZMNkgzdYmZ7o6EzTnnFi3w0bsAgBVEBE7dS+2
 YVbKim3mFCfi8gvbmuS5IjVIG/gATI8merOg6P2mICJeMYr06cQ2Kl/j
X-Gm-Gg: ASbGncu+mHMqTYW1sJ6x/GW1U6b3iF/iYPEcuXQzp/6dUfHYKGhgv+tyr+83lM0xhaH
 m+8vqaKqU+vHeZBZqy/Q4VhxcSu6A/67wDYNFYdZ8WAowFcyu7IFOFUx+Lq9ZPzvT7bDM/Cuhn9
 ywt1nGa8cUIY4eJ4i4hQDGXAIPBZMGzGqs7TPS9A41pza556FhEWQAnXw1le9hOewPyUcXMJoT0
 lngkRutgCsxbzyqX/MxRCl0k6gZHv/wHxo+TbQOkOdaw7KBudb3EDyqY8oYyZ32gIixgkDZMMct
 xTvas2cm+oT0XfthAhMsjfsRR97KVc6KSz25qeNafZD58IIDznzbfraWkxBSQGwUDvK3wSItFQh
 /ciSoX0A22BOqPQ==
X-Google-Smtp-Source: AGHT+IEe0jkCS9U8WkTjVXPYNmZSLn/syNXqorRteuFNbdIlDVO4YBhxkuAG4CzXjByN5DDqyt0+Lg==
X-Received: by 2002:a05:6512:290e:b0:55f:4efe:42df with SMTP id
 2adb3069b0e04-5704dba12c6mr472968e87.40.1757659398015; 
 Thu, 11 Sep 2025 23:43:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e64bd15e6sm917403e87.116.2025.09.11.23.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 23:43:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] DRM: panel: add support for Sharp LQ079L1SX01 panel
Date: Fri, 12 Sep 2025 09:42:51 +0300
Message-ID: <20250912064253.26346-1-clamor95@gmail.com>
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

Sharp LQ079L1SX01 panel is a LCD panel working in dual video mode found in
Xiaomi Mi Pad (A0101).

---
Changes in v2:
- adjusted schema with ">" and dsi0 > dsi
- fixed copyright from Nvidia to Xiaomi since sconfiguration equence is
  based on the downstream Xiaomi code.
- adjusted commit name of second commit
---

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
  gpu/drm: panel: Add Sharp LQ079L1SX01 panel support

 .../display/panel/sharp,lq079l1sx01.yaml      |  99 ++++++++
 drivers/gpu/drm/panel/Kconfig                 |  15 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 233 ++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c

-- 
2.48.1

