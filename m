Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39827727EB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7410E1F3;
	Mon,  7 Aug 2023 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449910E1F3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:35:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c353a395cso625299366b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691418931; x=1692023731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGYSWbN7PMS0f5vrz8dhv/rjh9hiks1eC9dOt9xyQUM=;
 b=bp1TLXRvHNSid4EjH1/QveY/HipnZUWNjWTL5jsgeD/1GT95iQ1tNH9UoS77Cgxxwf
 PA09gwHTQ9j0TUlMLBvpWzgAWeabnUjzi2fXJknfKo7Zt4/TtOoYVniwGpAvlDreHeOF
 YmwYf8QKyb1Y743cM1NE40xIouKeM5kzNTi6+H6yKeqEcrB7LMsSKTB4TrYqKWBgtnE5
 9n8w+b8eE3ibBIGzon+rySTEDJWOeWPtzmsWG1PtRInWngIrQYv2rWq/rrPF4qHPEuM3
 biiRq5gWk8fbaOWN+6lUFmcXZMQmdXEIsTtPyhLUoMcxBN9uYSCb30bFP5BFNAsxNhOl
 ZSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691418931; x=1692023731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGYSWbN7PMS0f5vrz8dhv/rjh9hiks1eC9dOt9xyQUM=;
 b=eWgF1mR1RvlEZQb/e0gpo85MUjNy8rhewwkgaEnJ2iilpDaFdFAAHt3CdtQ72tW6ye
 NEbQhB/0WIEcA5fRfs6JcKSCa9ZeTU8QZif2nZrNQ1xVRfATKwa6C4PnVNF2ShzSasNM
 DDJlSs2tqf9+wcwoCqmtvvxeSyV/fgrjLkHm/OHdMnyOrTetMaT/m3LsYR3LUkxcCg6O
 pllXmwMg5JTemir1Gn8PNZ8lWzwbW2A/LhhOhiaqBq/ubLizn14HIOyMlXV8OYjCJB/7
 A/+bj3upNkOvLA4J4KydY4k3n4956b7HTW39vh3j217ycLmqBWu6m7ZXyL7tWyg8PwPm
 YbJw==
X-Gm-Message-State: AOJu0YzAJ0o4C7tUxkpsuFXaiyJPwJ2tQxSKRQBcME+qGkwlF3+N424s
 x0I746NNlvylB7hU+D/Axpo=
X-Google-Smtp-Source: AGHT+IFjTFWA/gj0Ka2hniiSJFmIIgLMsQotBuRcjNn9ShgdWt8Pp/COmTMd1mmaUYbit0xS6Zorjw==
X-Received: by 2002:a17:907:a068:b0:99c:20f0:dec0 with SMTP id
 ia8-20020a170907a06800b0099c20f0dec0mr7106521ejc.43.1691418931285; 
 Mon, 07 Aug 2023 07:35:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b0099329b3ab67sm5323292ejk.71.2023.08.07.07.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:35:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/5] Support bridge/connector by Tegra HDMI
Date: Mon,  7 Aug 2023 17:35:10 +0300
Message-Id: <20230807143515.7882-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for the bridge/connector attached to the
HDMI output, allowing to model the hardware properly. It keeps
backwards compatibility with existing bindings and is required
by devices which have a simple or MHL bridge connected to HDMI
output like ASUS P1801-T or LG P880/P895 or HTC One X.

Tested on ASUS Transformers which have no dedicated bridge but
have type d HDMI connector directly available. Tests went smoothly.

---
Changes from v2:
- added missing descriptions to tegra dc and hdmi yamls
- fixed "Warning (unit_address_vs_reg): /host1x@50000000/
  dc@54200000/rgb/port@0: node has a unit name, but no reg or
  ranges property"
- dropped reg from port to avoid same warning with hdmi ports

Changes from v1:
- no changes, re-sending
---

Maxim Schwalm (4):
  ARM: dts: tegra: Drop unit-address from parallel RGB output port
  dt-bindings: display: tegra: nvidia,tegra20-dc: Add parallel RGB
    output port node
  dt-bindings: display: tegra: nvidia,tegra20-hdmi: Add HDMI output port
    node
  drm/tegra: output: hdmi: Support bridge/connector

Svyatoslav Ryhel (1):
  ARM: tegra: transformers: add connector node

 .../display/tegra/nvidia,tegra20-dc.yaml      | 31 +++++++++++++
 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 32 +++++++++++++-
 .../dts/nvidia/tegra20-acer-a500-picasso.dts  |  2 +-
 .../boot/dts/nvidia/tegra20-asus-tf101.dts    | 24 ++++++++--
 .../dts/nvidia/tegra30-asus-lvds-display.dtsi |  2 +-
 .../boot/dts/nvidia/tegra30-asus-tf700t.dts   |  2 +-
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++-
 drivers/gpu/drm/tegra/hdmi.c                  | 44 ++++++++++++++-----
 8 files changed, 136 insertions(+), 22 deletions(-)

-- 
2.39.2

