Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84434B052F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FC310E539;
	Tue, 15 Jul 2025 07:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="MkJLfxhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8055810E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:06:36 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ab58720d04so18757231cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752530795; x=1753135595;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wZdUQjRuXevrjG9zfFX20PvAf7NCX5bdBDziT4aMcwQ=;
 b=MkJLfxhwPnWy3rkZDzpYSnZ4/bzAph8dzU3VY8ySOJmzQq0LdELFnB75teZfk1p0PZ
 PHEYrYmAyPUu3TLpfoseAP6yZ7ZR+qgAb/J9XbmzM2Gi/K/eofkVdydgwwTZ02t4rD5o
 aBSi7Rog8WZb9euuyyLWMoL9GdjTaqcyz0UGRwfDOGEc4qndnXqMrs+vXKg2mEDfloIJ
 9gOeTfcU7e24WbNGFc84YaVw5C3nL1WeayINKa5wvW1Tmx7R6quGPmykJFCClXpy7JVK
 SLEDqKlYtLpMJ43LtFWH8WVBDzbx7gbjS4IicfEPT0LVaqn2nxrn3YKaPsiOoKwR8uJk
 lPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752530795; x=1753135595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZdUQjRuXevrjG9zfFX20PvAf7NCX5bdBDziT4aMcwQ=;
 b=aQwZJMljhkV2ns2qvWoePAIebJXob8Z9MXU1eslyMNWpGJkgcUpah9GGK+VOPUYRiY
 PSkpX74FkHrDji30RSQuN0VBiUjpIYExjerpwevAjou6yximw3cZGKqBRbcaNd9JjdOX
 sN+Zrj/G3WGxHimPJk/k405oTx97VnfEqikOkjHTk5MQ7YrEVDdmwChO0UTn3W9f4yrt
 ZFSZo69RA0vSRwie509ZMXnNUub9ZE2KiPCGJYK77+oyOSNWrMayiR3XiXDUvRJN4zOG
 a5yHD20HxvwZvpZDeF3DI7FRTZkYGxoL+vdkewKI2R4cqBZKLdlBl0TcvrNng+doxqa0
 CTPw==
X-Gm-Message-State: AOJu0YwCbl9kkzzhx5FcTE0uRoQC0EH6ybobqIzR/XGKzVgCO/Bmii8K
 cH1q9ZI0Sryc9x9lLZf1ZWUwHLPQcmdkflAFEieWIGhg5C3GSEuiv/9FqIiL3FeJSwLMDie++0R
 drPO/dsE=
X-Gm-Gg: ASbGnct+qeadHIVAlJoljXewFvGdZaA8/PBC6gnUO6pA50ERmfgGN17TXZ/Bzx1e3XC
 qjGNDeYJtV2Pvs4ATBNlVee/UCaEqR4DwrBr6tSq4vAj2dTlkD2mePikBS2vdfx5jp0tYPRXdRm
 Je5YpoT2HNV4oexlOkA77vq8VYOzGpJK6Wvo2dG/YPlp4anaPgxWOSgW5jMvpzvaPIkRRnoaZqk
 CWd8UqFvUgFlFQLj+xSj4rM49jGDZMClUhjGTaeC58KlF++5RkN1JMqv4Ec/YbgCqfueLtaf3hC
 YQe/8ebxJQhKDCkdhvO8k3IRlmccfh7gXilROb7nM52VA2PEny5r3rMV/ZItzl4zCg00p9+dWpc
 IA/rjJyEA883KeelR57lg2VnkuzuHoxoxRX3JnvWj+5iQHcSu
X-Google-Smtp-Source: AGHT+IFuK42Dr2TXk0jJlKJvYbbUoHS1t+GayRDQM86fdZ8yBZAHPMI7oCFh+clT7Nh1wPBE4gQeeQ==
X-Received: by 2002:a05:622a:40b:b0:4a7:24b5:71ad with SMTP id
 d75a77b69052e-4aa35ef7d72mr202420811cf.35.1752530794761; 
 Mon, 14 Jul 2025 15:06:34 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab6fdc7731sm13137311cf.40.2025.07.14.15.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:06:34 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@ryao.dev>,
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
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Richard Yao <richard@scandent.com>
Subject: [PATCH v2 0/3] drm/panel: ilitek-ili9881c: Add Tianxianwei TWX700100S0
Date: Mon, 14 Jul 2025 18:06:21 -0400
Message-ID: <20250714220627.23585-1-richard@scandent.com>
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

From: Richard Yao <richard@ryao.dev>

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

Changes in v2:
  - Fixed typos in romanizations of Chinese names:
      Tianxinwei -> Tianxianwei
      Shenzen -> Shenzhen
  - Link to v1: https://www.spinics.net/lists/kernel/msg5767021.html

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

