Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16963EDC9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE3689B01;
	Thu,  1 Dec 2022 10:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3689B01;
 Thu,  1 Dec 2022 10:30:55 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n21so3087849ejb.9;
 Thu, 01 Dec 2022 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=b6S0scQh8yy8m15dX2Y4lOBnYQdGXad7fSn2qrpTdRk=;
 b=HFcyySkPqaTM7WBiMKlZeWgslSqeqpLPwySBhEvlh80264v7CzkSuBaMbhEX/C0Lv8
 759cQ5lN9Q4+zZd2pxh/WhTBAYMgx6J9bimo23yhBDYKWmCONcTeIZ3WkuPbp4mY68Rs
 jbyAqWPRz7DNe60YBJ6iIB+8no69TZvtEewnV525c2K70Y6iptETbQty4DLTChFHwo27
 H//Mgfh9Q8x2ZAmjS+wHf9NCHIQ2mn8kKGY1Sk3dYRAhn13VTEepvZ1v+uNrXVpLLQnC
 lYdfDjmtVVIoXL1K/Q9PpGeLwgDSjwS/rFhZW2iEzu2Rhg7uvq1TNSGK7v9pYDRMRs1I
 FjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6S0scQh8yy8m15dX2Y4lOBnYQdGXad7fSn2qrpTdRk=;
 b=osGp2PJ1ooJRKoEnAK7MP8gEN4YLj86Ug5VCe52mz4Qytt33Z+dAPCVHgtWrPvE0yT
 LQx1MOBTp2Gl650gohwagvWkwI0AP66q3VKAC7VFnOS+w1VetF0NhiNAP4OhuIOPtnt+
 BHNLM6Di8Gx3wNS3vhklUkkHCxTg6Xeg3aB1z3VEJgjHEMG3Bcm1UUSCo9tiWy5FBODG
 fuVDChQ/2PpdUkiEwFJ6Y+zX99KP7/VG18dWx5HPrxGC+uo4DHDVxxTmlZTDy0DNi/Ld
 c22/S10IYMA2L1bDkh2gxYn49mZgtrcl73y4PIlItDSo/dnZ25Rlghtq317Xj6Vv6+8l
 tmdg==
X-Gm-Message-State: ANoB5plpwAH3UUq980GUxY2/q+OYRkSiktUusm2ZTLvynH3E3l/PVWvw
 kTQNIGlVxp5Bet8hrK/MJyk=
X-Google-Smtp-Source: AA0mqf6Ku5iWPl8X7VDR/8A9LQk+tuRf8R4xRAp9qx7nZWslQnUcAyrE5bu2txEmOsaNWiv265OUag==
X-Received: by 2002:a17:907:11cb:b0:7a6:598f:1fb1 with SMTP id
 va11-20020a17090711cb00b007a6598f1fb1mr56078222ejb.606.1669890653698; 
 Thu, 01 Dec 2022 02:30:53 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:30:53 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v5 0/7] Support for the NPU in Vim3
Date: Thu,  1 Dec 2022 11:30:16 +0100
Message-Id: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
as in the VIM3 board.

The IP is very closely based on previous Vivante GPUs, so the etnaviv
kernel driver works basically unchanged.

The userspace part of the driver is being reviewed at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18986

v2: Move reference to RESET_NNA to npu node (Neil)
v3: Fix indentation mistake (Neil)
v4: Add warning when etnaviv probes on a NPU (Lucas)
v5: Reorder HWDB commit to be the last (Lucas)

Regards,

Tomeu

Tomeu Vizoso (7):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 ++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 35 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 8 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.38.1

