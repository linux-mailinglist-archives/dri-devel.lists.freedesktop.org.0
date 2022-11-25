Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35816638884
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE11E10E72F;
	Fri, 25 Nov 2022 11:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80C310E730;
 Fri, 25 Nov 2022 11:19:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b12so6305627wrn.2;
 Fri, 25 Nov 2022 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vJ/Ad4hSKfagSWXJgtJNFFKqplgksfsr8uetGe6EuYA=;
 b=dHZmajYnzz4u1jEo2HZja6kVm1mWJREW0f3tbiQn1KmezmC7S0VAc6VWFkNXA0eZaB
 EHAjzMMhncEiD+gratUs0iJRq+ZhBY42zlYNrV5JoLQBB8uwcLZ0+WwGDWnaGwb7ri1M
 K6GyCqwCqr5XqpnGJSimkapXZVnWD5QyBb2f/qj4qHGWuyO5Y4unUXkQo7REY0Ab4yUY
 nxWMqqzpHIsz6tjDAc5sBBUlhB4NUi5XSwz8w829yZycYO3+0kutXTTuEeEdxGEp3BvT
 y3u4079+nY36PXhoFse7cqNF4oRZ164FJtNjnISILNNq24uLevUhZMAluMl6TXhjp1EB
 5RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJ/Ad4hSKfagSWXJgtJNFFKqplgksfsr8uetGe6EuYA=;
 b=JnSLDmDk73py01dbsdlMeK/kQmI5C6ZT4VWDAopIbSkqDOykVCumwQTh8AJYPfdXVr
 nKbZFHU+QZfOzgC1QwWUooHTc6s5VbdUT75Fv62b3TZsZOH1C8cuRmDtQNS3V2lHqQns
 lQsurzzRM8ZctlWv8itf/HyxDZzqzm6XxKt4b0vgBOwE9Vgu5YeNdUuVh5E4U1klu/JI
 wZqAOTVuueJfhEhiBMuuacFLYTPa8Q9UmPnvzdzeY0waMP533JJ5qm7CjmRtiT1p3PhF
 zxN3DKDPh4zKCaedqdkKsutjF184gRMRqqdHvqEzzlICAGJiRCE02/j0gLUBUbi2BxOm
 B9KA==
X-Gm-Message-State: ANoB5pm4XWsfF+jaC1BqR+t009ZyFqQCQBeEzmaghygRHnTS2QKqfou2
 9zWW+LQvlddyCG4Y9tpegYs=
X-Google-Smtp-Source: AA0mqf7qcwBF0kX1Tp8rgnVWvydougD+PQOYjSSxRa5bPdGbWmiAjgx6M/qac3U1VJJkyI9gVdzcdg==
X-Received: by 2002:a5d:6b45:0:b0:236:7a1c:c41a with SMTP id
 x5-20020a5d6b45000000b002367a1cc41amr11849573wrw.680.1669375177118; 
 Fri, 25 Nov 2022 03:19:37 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:19:36 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH 0/6] Support for the NPU in Vim3
Date: Fri, 25 Nov 2022 12:19:13 +0100
Message-Id: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
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
 Kevin Hilman <khilman@baylibre.com>,
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

The IP is very closeley based on previous Vivante GPUs, so the etnaviv
driver works basically unchanged.

Regards,

Tomeu

Tomeu Vizoso (6):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: meson-g12-common: Add reference to NNA reset to pwrc
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 15 +++++++--
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.38.1

