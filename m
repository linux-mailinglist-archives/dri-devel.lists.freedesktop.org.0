Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD985B8A584
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE66810E013;
	Fri, 19 Sep 2025 15:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GMbwInw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA9110E013
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:39:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55f7b6e4145so2697368e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758296348; x=1758901148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uctKhO+/UeiiSpqt6MjSlg1WxmH8h+yZMn/dalnwyT8=;
 b=GMbwInw1xm825mjTnJK6clWWif+kwCPz+ugEd9xKewuLdevmkGN50gBfR4QDAWt58l
 Hjoqx4ZHPAcN8CVODlWi8zpkOiU7LjIKBK/oXDmobg4IBJMn0yt/2be5l4SpD+LIJepd
 XW9qxmEitpST5uztMrHy9BYLGBTUqT7jCeitT+cg34EkplV/FzsICULSU5j9e9JY165P
 SOP07dFGDOzI/VCdjSrKPBOHTCdQEeCABzcsUSv3skw+IpC/E/wz1CUpVL88mdtkd4w7
 qjXMor/eM0IIgcw/M9vK4KqncIWU6RdkIObpV1/ZrSpEE5mh99ZoXe2NsVgQEv2vZhEE
 V70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758296348; x=1758901148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uctKhO+/UeiiSpqt6MjSlg1WxmH8h+yZMn/dalnwyT8=;
 b=OsjXo8EUPVp+xzwRaCaQSrXWaPOHU5MQrORJrfr8kgpzNYt/X3pcw8fKKTKjh7VjRq
 vkgA9pwWMBpD7lyndTIFWrg1Gowr9Tlyqo+CuXILTwqgIe/jJ9roFrfiRpiOvMW6HD//
 VTDllTrfg1P/VqSFMgC+QCs6sobjCjwZsAOXYyoYVLynglqqzOM9YPqUz8pcNcpKBHlt
 GQNBxCEociYYzWzS9wlCtx6ECI+RptoISz7d4sYiULiQKWvyQCFUa0mwijU0uffS1PCA
 zEQhgmRpPZ3gaViBbFG6qcteZm9vNrTBGTMe8xKT3vI71FCAMTXjhqbebJM7CzA70ejx
 NfnA==
X-Gm-Message-State: AOJu0YwrBaSpDPMyjbngVUEzqbeDtujTtvPdI+Rt5BXhNAZ8I99PIO+B
 FUqPay6lf+v2TlDGwZGFv1wSZBGxK4CvVRApADHKdkeNDHSIR64lHw4S
X-Gm-Gg: ASbGncsbITye6yWR+OZc8qvOt8MgI7/AFNPHaP+bhd7k8Dv+WoiFkGnFChXNHA6Hx8v
 PqYHOuhkHCYXzpVo41B+P3ojzfx0HWY+g827ZP62o9qKMIKPfFMt86ATkVP8rW9CclxgHGrnp2Q
 W7zNOAXUSCmT0QIUDo2Y+ved2NZRX1ANBSuMq9jv0mUCoKZz2Uwq2UCbO2tXUsTwSlN5LeZUR2O
 j8fPnpPlMXiFOlaPQgoswpOANw7LQxO4SRqrpgPajvJCdASPQlCbJ6orzi1wD0lhUy3yLcVFJSA
 mBLQ7ECxJTge+flLLuXXwf/YbkNEDA2aiBzRR7cTANt0YFX0zDFeFbkC8znStmyCzvPXabeH2nd
 3KSqVb2qnOp1Mpw==
X-Google-Smtp-Source: AGHT+IGJfZhXf/HH8Pyz+cqkoqEOZKpxJz2zqRcH4yC3gZ73i2LnNl7A6Sca09TBNTUOc4JHpYxYMA==
X-Received: by 2002:a05:6512:6508:b0:55f:6c5d:759d with SMTP id
 2adb3069b0e04-579e45216bbmr1104441e87.49.1758296347969; 
 Fri, 19 Sep 2025 08:39:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44771sm1485769e87.20.2025.09.19.08.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 08:39:07 -0700 (PDT)
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
Subject: [PATCH v3 0/2] DRM: panel: add support for Sharp LQ079L1SX01 panel
Date: Fri, 19 Sep 2025 18:38:37 +0300
Message-ID: <20250919153839.236241-1-clamor95@gmail.com>
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

Changes in v3:
- tested with drm-misc-next
- switched to mipi_dsi_dual* macros
---

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
  gpu/drm: panel: Add Sharp LQ079L1SX01 panel support

 .../display/panel/sharp,lq079l1sx01.yaml      |  99 ++++++++
 drivers/gpu/drm/panel/Kconfig                 |  15 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 225 ++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c

-- 
2.48.1

