Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C778864061F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60DC10E6DE;
	Fri,  2 Dec 2022 11:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A0410E6DD;
 Fri,  2 Dec 2022 11:52:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x2so6204245edd.2;
 Fri, 02 Dec 2022 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=V7DGE39pLfDtpE6nfiaaKVKzntw4VUS/Inc+Ohx4WpQ=;
 b=SwYGBT2S6+aQVfMDUC6h/9BMQR7Aa/rv/nZKofiHLvTU/0Q4vEdenr2xH0AK90Iu3N
 Q3c4Rzoy1RPYQPbuhxIHjA2D6XXPWzkdpKFqM8lSRvv9+Ts7pEVAbvC0ujDR3hSQ5ZxN
 vD3uurUCf7q8gTLZVVLJ+a+GBp5jmkXigxdaU6jT1DHYEUuZHb5oDdpzCP5CgF6Z7B5O
 u7NAxl3AwQzRLkzS/byhochh/uO28yZGlEcUMh6vQnzjLqxrytmc3WlVT4i235L7vWAd
 0gGeloQm/h47sHWQc73VFtu7SAPAB5bpqEY5keAo9pYSeCsiCSyH8qJzZFh0BdC5Wlh+
 A8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7DGE39pLfDtpE6nfiaaKVKzntw4VUS/Inc+Ohx4WpQ=;
 b=wJaGHQJki7FsjRnq07WxDmNu2YVMUz+MxzefIr6LaB+XqOygD3QolFPJZKHQPfGugU
 gZEXUshuhpudPcRuvaR/AJdL1zHD4xNjxd5U9934kEQ2nFFOQfwLwQ2k4/nzFzXVEviq
 cpKJZ1sR0NG7R6+jCoIpiBs0VFHDl9KdlaZJmjALAl9+EBpAXQxdrcoEv1b9xD2RPfMu
 NSDf3fUqlBoTzGE27jgZuPVxdNn6rIKvYxuh89slgGsUQ4BPMRYApnWWOJ1nxpRivCHm
 FvJFMUHaCrP0s56tiRAxnz3PQk7jydjBUPLPZ6TCtHO/bVyvrKzCSgR8yZjnQ7N6IG6X
 9gfg==
X-Gm-Message-State: ANoB5pnWe9KLtsUIQCcwWh1E12VmJaB2lj8+nzELm/cxjzVs1cwA1ftE
 Zx8Y56a3imWiYerAgRtjGbo=
X-Google-Smtp-Source: AA0mqf4pKF+GIFOv0aOMCQp58IrKzGzJId6KW1UCp0ZSXlFh3tlc5fcL6ng1NZL1EdK19TM8zWr5uA==
X-Received: by 2002:a05:6402:24a0:b0:458:ad54:20d5 with SMTP id
 q32-20020a05640224a000b00458ad5420d5mr62176585eda.86.1669981954534; 
 Fri, 02 Dec 2022 03:52:34 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 03:52:33 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v6 0/8] Support for the NPU in Vim3
Date: Fri,  2 Dec 2022 12:52:12 +0100
Message-Id: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
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
v6: Add patch to move the power domain to the SoC-specific dtsi (Neil)

Regards,

Tomeu

Tomeu Vizoso (8):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
  arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs

 .../boot/dts/amlogic/meson-g12-common.dtsi    |  9 +++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  4 +++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 35 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 10 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.38.1

