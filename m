Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59D5679AA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6833891AC4;
	Tue,  5 Jul 2022 21:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6A91B4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v14so19386430wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lj8lQBl+rzKhHnZ+Xd+ZIX70dBba4zQ87/hMtZKztKo=;
 b=SWBLyNd34TD/mZu6n2FRfmU1HE1CDonJi13qsFyhAyqnSyEQ/KmdR1UWXQSWh8Lc4S
 wboztDYyEl0cB6dNxkPhLH8Vut8eQklDlAzLAba8wD+ncpM0c/ss1G9HZw6iwywvQYDc
 Wp4EiJ8gFj2NtEhHkoHzq6BO5iZJQV8yqDNi/hV+TI3EdwxWa8PyiRtclVAhofmrQMv1
 O4MgZCyDw4sYc3gDgn4HyTIQC0OgktoApwqj7hpRysjTLfmxTwmhIL9038u47rfi3QnR
 TEsjdMTU0aXj0ZC25wthUzJnFtFa+8G8sy0GbjfRv+uUUgqNTVhurKapbgEb8iTWOR1w
 qZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lj8lQBl+rzKhHnZ+Xd+ZIX70dBba4zQ87/hMtZKztKo=;
 b=FmWsJ+e+xVslLfn1UHV1nGnTcWQMf9pqEg+w9FeUR0ZGIs0NPR8dLcl4xne7jRfqRc
 UapcQb76CXADnN6z2E38g65KI3mMKZSkf+EZteXNeTiM3CydKY+ITuKamSOtQHLQEp07
 X/YKZ/5k5f3oh/YRm/ZrbophDflNgCTwOggiiwTyc3oCXxKsg/RF3JYcrU8yucg+d0Kf
 bFRQgCn1FYQIXtm8+7AYuBIPOFMzG9xgbM6silt8wGnHukfTlr+LJOhKH9Cc9xThEcYd
 i7t7aioYGaWBVzv01GaZtC5cPnmVybRuDX2RNeaPj6xMLYi+ic9nHTvbO4Bwv0iWD/x7
 ZXpA==
X-Gm-Message-State: AJIora/B25K/9P6z/7QPdtWzvbIgVNJSaYzc33hUGBF/NP5Ufo+j4VMl
 0vtaj34r/NnYdXZBUW93+qyn4Q==
X-Google-Smtp-Source: AGRyM1tr0mSvjiKuETZ7gcWxREDHaUXAsNoHFiE497jvmcwKxLKMvl+jTlZGzJe6mijwSzLjNBUwQQ==
X-Received: by 2002:a5d:64aa:0:b0:21b:c38b:bb81 with SMTP id
 m10-20020a5d64aa000000b0021bc38bbb81mr33626354wrp.666.1657057962100; 
 Tue, 05 Jul 2022 14:52:42 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:41 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 13/13] riscv: dts: canaan: build all devicetress if
 SOC_CANAAN
Date: Tue,  5 Jul 2022 22:52:14 +0100
Message-Id: <20220705215213.1802496-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.37.0

