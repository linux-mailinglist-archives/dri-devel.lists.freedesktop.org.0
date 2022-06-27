Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBE555BBD1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B8311B2F9;
	Mon, 27 Jun 2022 19:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73211B2CD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so14471638wra.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
 b=MOohgr19HljbByTvyNxJnTzuFRc+80XEY83slSBV3T38pJReWc/r2vS/nOk5tM3fgh
 o0PeEHbIXwdYX8w8o/2Z+tOWI/pblKRMqN6cWcuVmoSgQJcUM4k7o3KZ8Bga/IW3cMxn
 htf5vt82qgwz2AdmKcvtLew4WTHJpzSLNlFEtSdw1lUDBPfmzQ6VPma4Ihqx416iMO9q
 OjG2BfW5Fb/pMNNGTa0W3lzf/5Uj3IdmCXYm0bDti+q5Vvni3wozuVRvHSs4b2osYT2/
 INsrbelKnz8FWtbN/E4RVTXkbha41T/RhTGSoWBux0TT5r20qWoUKgEs96eGFAOTBcM3
 SHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
 b=P3TpwbX/8cSxaB024gQ49F7QrlfMfA5F+vq0yQnQbVTT68JCs9vZpX9smJnEH+S/pC
 JM7GfzVSUOlAeO9EryTmlUCL8hKitmH81ZcPYswq+2SOSomP2pKiPfgFHHQudN+oYk1I
 dtCcMm4yezTRV5e/INo/fXmhqtwLvDrMxEbbapAoFIvssG1rw+Fo+Zq+WURqIKDUdrpG
 gQzw4Xmi5kuRRpWEFvl8/4Lf3eA4SbzcjJZcGUJlB7MTYDicpwBcpyd5vfSR7nA8IARo
 oSt1JabtZAKD9axIv273fLWR1n2HTjQ6Bjwva32djqD8panZrpNgHl0canLjlMvZzOx6
 +U7Q==
X-Gm-Message-State: AJIora9C94oidI5k/gT13uiGlcHop7zi6itID0xfLXHsCyKYkYU1SZa1
 grBaPRkAQRRWJ1Ugqzu4HosCeg==
X-Google-Smtp-Source: AGRyM1tRVPClRCoBOM+0dnNBF8Xh0WBUSfTyTPIl0mjH8CFu3Jd18gFLSGXlP3EBu9PNI15KlSes5w==
X-Received: by 2002:a5d:500a:0:b0:21b:8274:9ddc with SMTP id
 e10-20020a5d500a000000b0021b82749ddcmr14053574wrt.251.1656358904731; 
 Mon, 27 Jun 2022 12:41:44 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:44 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 16/16] riscv: dts: canaan: build all devicetress if
 SOC_CANAAN
Date: Mon, 27 Jun 2022 20:40:04 +0100
Message-Id: <20220627194003.2395484-17-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
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
2.36.1

