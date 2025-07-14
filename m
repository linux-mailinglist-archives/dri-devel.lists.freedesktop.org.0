Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB7B052E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B810E52E;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="Cj3KB0eJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7200710E502
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:18:13 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4ab6e66ea68so16741781cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752531492; x=1753136292;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lzGt9wsOTtCPU11nB043+95KlCYKt0UXr8OMVRklspM=;
 b=Cj3KB0eJ38ad2FzWu9Efow2kyvB0SvfJ7Q5Lhv1FLSlY2Uw9qFRIqWz57nMzRghKNY
 pNhD77/P6FjA1u5lreukXVtSLHvOekZt5XxiCpA+zFgWRULZUulEQr7uhOc5o/RReY6i
 VOn+7xdM/3gaZ9roj7o1cQz7H2iUWM1BqMSL6p5SklvqnPzDy+uTsQ23LZaKYY/TiLcC
 XSRiT2j0Qr5/XY/oDXaLhSbnSX2eZjBzi23xr7FUwm5Lva/thduNWGFbAzZIN8GVDrHK
 J3pMj8hrhoSgudUjCFAhZM0UkXS9MnD0cQT+kcDwWuZCJ/7K81FE/ehE7BWxjME63ZUu
 7OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752531492; x=1753136292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzGt9wsOTtCPU11nB043+95KlCYKt0UXr8OMVRklspM=;
 b=iqvYwMqREBik02F5DjKcmBTktBXZv2pOpMuQOGS+n88+SzUc6AHRB0XpWnimy+1oEX
 EQhWmq6cLbxxsP2BXtUMvc/gT58Oj4YJZJm8s094TN1rYvbqts2ctdlchHtpebEblX+J
 v0kX4+DEMAF8EYBx0Cm7+rtvzbcuJpB7aglTMxZRSs9P8FMmUEpwWH12SxjsROAXd4xF
 w8o8cEpXq3IENPxj4X0HHwhsojvWpsrBMWxULxeUyG4mCOWAMg8HZ0V57X1EZgTkjk6g
 oJBzwo6Dn1sSDCR7MpOcemuZccs2b1iQj3J+TWxOuFWbUkdiBtJzka9L6QuA7ww/4Ch4
 3giw==
X-Gm-Message-State: AOJu0YxSu8OjQq9vthNrQQUJnOsFwncwJ7xCf6RhnDs+trL+jMnhr7L2
 7zKtJa6Kw+yTavW6IB0V7ll5CJPFvgYXzA8uRGl1u5eQFJ2RhJf2RODxHhz74IiV7Ku+BQHIPAX
 NLFKj1Pw=
X-Gm-Gg: ASbGncvIOGZ+JOedQn5M0UHJCQjvO14fheInzaQ2pU/97Ruk0BR5MTkyAItmqzDSWuZ
 361Pzyr4Cxdn8P8ZyQ8O3uTuU2OyOzBNBsbF5VuU61SWSsmOWd7fiAIRBAPU29aOTWoEr0fI+xu
 xGbroFLD+e1DB8ippdBPtzaVZoxzllHk7bwiPLWgbesOPeZk14Ef8ArUV0fOu6wzNZR/VYoNfPM
 N6zk5rVi8jNii3IngLEJaxP/z7BgkFXpmdg+rdzpLNzntXOpSIMRCVwSrPjeIi9ruD/toqNQzdU
 mNYm96m5/q4/pYMvg5TNMOyFP6JH2Go7Jvg2fSgPrna41Zs0xtGxXOtlvT6dg9HPNaEoGAcNaiO
 19xwl85j4WGCI9tHopwTYZHBmU8dP2f8GUTpgtjX9egclV6up
X-Google-Smtp-Source: AGHT+IGlRZA/qnX4ZWdj86YPCTr54hQC6VI5zp1c32i2B6ksY/OHCD68yCydeS/hNCHpt55KNY22Yg==
X-Received: by 2002:ac8:5dc6:0:b0:4ab:6b08:9db8 with SMTP id
 d75a77b69052e-4ab6b08ad01mr107012131cf.11.1752531491791; 
 Mon, 14 Jul 2025 15:18:11 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab3a1ceae0sm37822021cf.25.2025.07.14.15.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:18:11 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>, Junhao Xie <bigfoot@classfun.cn>,
 Caleb James DeLisle <cjd@cjdns.fr>, Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/3] drm/panel: ilitek-ili9881c: Add Tianxianwei TWX700100S0
Date: Mon, 14 Jul 2025 18:17:58 -0400
Message-ID: <20250714221804.25691-1-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Hello,

This series adds support for the Tianxianwei TWX700100S0 panel. The
first patch adds the Tianxianwei vendor to the vendor prefixes yaml
file.  The second patch documents the DT binding. The third patch makes
fairly standard changes to the ili9881c driver.

Runtime testing and validation was done using a patched rpi-6.12.36-v8
kernel on a CM4 using a custom carrier board designed by Scandent.

I have confirmed in writing with Tianxianwei that this patch series may
be released under the GPL after sending them an early draft for review.
This should be superfluous given my signed-off, but I want to make it
clear that I did not assume fair use when providing signed-off.

Changes in v3:
  - Fixed squash artifact in the third patch's commit message.
  - Changed v1 link to use lkml.org to address mailing list rejection
    due to "HTML part".
  - Link to v2: https://lkml.org/lkml/2025/7/14/1504
Changes in v2:
  - Fixed typos in romanizations of Chinese names:
      Tianxinwei -> Tianxianwei
      Shenzen -> Shenzhen
  - Link to v1: https://lkml.org/lkml/2025/7/14/1389

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Richard Yao <richard@scandent.com>
---
Richard Yao (3):
  dt-bindings: vendor-prefixes: Add Tianxianwei name
  dt-bindings: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support
  drm/panel: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 242 ++++++++++++++++++
 3 files changed, 245 insertions(+)

-- 
2.50.0

