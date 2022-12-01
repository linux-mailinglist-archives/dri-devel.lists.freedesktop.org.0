Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC163EC47
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EC510E590;
	Thu,  1 Dec 2022 09:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA23410E58E;
 Thu,  1 Dec 2022 09:21:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b2so2706069eja.7;
 Thu, 01 Dec 2022 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=D4GMG59V6FeZymcJDpr/Ed9DLLQeE59Ry2O920ck0QI=;
 b=HSmShfYANbJDMjl8pkqcdgD+IxVD2GxDxg+y3Ge4ZK1rg9vO/pdbZeZOZaiFMKkY8O
 BG1ax4x2uVfk2bcfv0HXXgKiaRThvqzYv5tLa2Tl3vSQR11ZIMwg/0ehIQUB4AISF4sV
 vc1KJjb4O3Tr98nvcTXzuxr90rYQvX5Iv4MO604v2wjCkIYP9yLtOE7Nomx2klxuT2Pc
 VDh4Y/s+Si0rd0BVsLXaRHPNc/QMAcZPxwB34bdgfuJaMQbvx8sKk66W4JJpUoc+Drpw
 4ubmTbp7/WwT3ESDIUix7rIMNeCm9VqH2jvu7je3HYaPaLVMHOt4h8UgTh3b9i1Ozz4g
 4B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4GMG59V6FeZymcJDpr/Ed9DLLQeE59Ry2O920ck0QI=;
 b=nFHF7+tuMrWGfRoN++Oef1ffTwTX/CCRS8vpdke4T6qVoXmN2tqd47Wf2dj5xzdo7G
 6h+J4tZVGQvI/42HLi6+9K98Y5R7Y9X9Fp/27uLQ6xzoxCkcuEZ18fRU2DNz5r0gSyQg
 a1uA7HP5pSEgBAq/XdCtOaZ3SlQAWtHl6H5i5r7ad484YQLreljG3usqndKo7j0AShWr
 L59+RUlsDdS9/x4ZS2oQpRtPpU3S9aUnatoCduUVk+DYT6YUxwHRJNipSIxrqZL8enjh
 ARdA653EiKGCu5pfZ9Gb+08nVztL7FEJzjFMPrAVQRqVyleJhq3gkS/3InXLR1VapBlc
 IlLw==
X-Gm-Message-State: ANoB5plE59woE5UfeDlAk0+ffEIPz5gqjfM5rzffDhq4Fz0sDhwQSsV3
 da7hLhumPy3kTPMoSyH4eOo=
X-Google-Smtp-Source: AA0mqf6f4lVGT4CKfMKN/i+FgTMcHP2+I0vW+kDXBs6t4YjojlLCLzJcqhVgDVLzAPZAQR/1g2HNZg==
X-Received: by 2002:a17:906:4cc1:b0:7ae:50c6:fd0a with SMTP id
 q1-20020a1709064cc100b007ae50c6fd0amr21346768ejt.184.1669886518206; 
 Thu, 01 Dec 2022 01:21:58 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:21:57 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v4 0/7] Support for the NPU in Vim3
Date: Thu,  1 Dec 2022 10:21:21 +0100
Message-Id: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
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
v4: Add warning when etnaviv probes on a NPU

Regards,

Tomeu

Tomeu Vizoso (7):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 ++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 36 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 8 files changed, 79 insertions(+), 1 deletion(-)

-- 
2.38.1

