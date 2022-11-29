Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02E63BC14
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 09:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08CD899D4;
	Tue, 29 Nov 2022 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52EE899D4;
 Tue, 29 Nov 2022 08:51:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s12so18801061edd.5;
 Tue, 29 Nov 2022 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EAwbcSycvljMKPe5ABsiy+cIxMkpLo2gUjI9R6uNdq4=;
 b=EFlFtRGjVY6hb45LYjfz4PKYSY8/eYXCDyH2jEWI+6o8+OWi5V8XhsyAL+pxN+iqwF
 JX1bgxltZTtg+XpbSCDvOeZ9WXsuJHdatr27JZRN9XqqmNcIAjk7Y0MZkVkLAyMQr8LA
 990qsOV9NVsjmRFs5iQ6x8HH6XoWFHWlztUXrFoLMrs3o8kIsHGcLIaaQan6E/Lputu1
 nKsNOWZNVdRTWH6cOJ5YJEjOtQQKqsZcp5spPCKfZvGqJQgZ4Bp9JVlhb4JMxvA2Ujnj
 eg3a1PIJZeRfxkP3OOgqMdAEQAkjUdnOtpkhIJ0aHSvxO8KweJtdH7BCbTxdX6X/iH0d
 Cjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAwbcSycvljMKPe5ABsiy+cIxMkpLo2gUjI9R6uNdq4=;
 b=YoUjowfKKRHsbZ9evWL1chbGwYjDbLmIVnyuOmHMWoAB++GOQ+XaCyjrVzglKlDDYC
 rm3MYNMnAmtU4tNa+YQ1ddwDar8t3mv+T1bIy/ZuG2Kdd9BMVzABV0xKUAPpv6EkLfvI
 kbzlGioiG1IuKClPhchlQOnilo2kH6/xr1PaWs/+ZYqYbVIKHGUI1bN6XyV9h2AnFaG2
 rC5yqnyRkl53AaS35Kifo8+XH10LooxSsK+zYdHHj0ZhJEgLcdCj3aTHWwApS3yy2Nbg
 hBHg1hzN0qUJGOFd1ho/qT8+EevlT0WxbdYv47QY2LYk8jYc33tmeV1wi4zyYMPpC8Lx
 we4Q==
X-Gm-Message-State: ANoB5pl37n1IsEJvCWamq4jepSMkCT0Uq5xUeX/8vGRErCL4CR80U6tq
 GVKY5uwi291RqQISsACy/lY=
X-Google-Smtp-Source: AA0mqf47u3/yt28Ofv/5FqQdI2MHkbIfMEKktXtQYWe+me4por6kkPGitzwX2sTe4moLj7hZE7ipRA==
X-Received: by 2002:a05:6402:ea8:b0:462:67bf:c64e with SMTP id
 h40-20020a0564020ea800b0046267bfc64emr37911025eda.20.1669711871270; 
 Tue, 29 Nov 2022 00:51:11 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 00:51:10 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v3 0/5] Support for the NPU in Vim3
Date: Tue, 29 Nov 2022 09:50:40 +0100
Message-Id: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
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

Regards,

Tomeu

Tomeu Vizoso (5):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 +++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.38.1

