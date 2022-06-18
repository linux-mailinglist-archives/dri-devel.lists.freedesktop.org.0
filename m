Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD3550482
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C386510E5E6;
	Sat, 18 Jun 2022 12:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC1510E5E3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g4so8781872wrh.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
 b=dM4LDKg5XtY0Inv2LgZSsQ50IPuzGfCzEsvHlFQ/2NLIm/6++fbLLGSB9koJgwMTjp
 07IF9XMy4P4HaeMA1yfSnaPY3CYXQ+u0Kv6ZrDa4GjATk93Wx2p5DeaQw29BenmArCiz
 I6simFjZ6ZTWhMpFS4z5vR9LZUvOOE+DqLAunuoSePBDY5dNABj/iCXgooJ7JUM1Gx2w
 oJTVRWFtg+XkkdFP3+9IwXZt69jucggKlNwGuChB7WxmXKdl5k9lj8f8ITLIpfckoFQS
 YaBPUVjvUVp7mpO9D9wZzFoEi6tceysbIOAoKo4R7lpk7QqiW4+Bkh5CqE2X/nDML5P4
 Wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
 b=EoNeG/WBBaVeuqSttaBcnG3nIu/LgkLqX6R+sJH7o5+w3vlmfE3PUBK+T4BM+mKZ7v
 HfuwwiQldNZcTtHBSJH3kSeZPl7mf88WXx/j0qZDzoFF1wQTxsnrFWtppANdNE5t5DW9
 u19HqIqt3UhtGSX2b/W9W3HY932Xs0f/HWllscSPJgGSyGTQJ/GpZP0cP1adsGDYHQWE
 fliUUMEnbDGIItlLEwqRd56dwa0KApsb0qQ3DnTfLw6jRYQKQ5+EWFwqDGpr0NfXehxU
 8HlQ7QD5G8P3Gz8RvadsoF7jzwV13HhFbctNvp1laMOxc3rMbKCUqp4reE6gd0/eRtX8
 CnCw==
X-Gm-Message-State: AJIora+9FY1xmrKCu/J5lb0pUc2R5eEcG37ePeJ8ftcOEtUR1VKtdmHJ
 LL6Ugode6USg6hmtLnSKPyCGDg==
X-Google-Smtp-Source: AGRyM1sfPQ5XTH8REWSlcNVbh+KVLu6pjXz8b6gchhSbSGxDuCamFh0CMH0mba5q/rzWCUN22eIJUA==
X-Received: by 2002:a05:6000:1b03:b0:210:3372:2bd9 with SMTP id
 f3-20020a0560001b0300b0021033722bd9mr14215037wrz.704.1655555531747; 
 Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
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
Subject: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Date: Sat, 18 Jun 2022 13:30:29 +0100
Message-Id: <20220618123035.563070-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
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

The k210 memory node has a compatible string that does not match with
any driver or dt-binding & has several non standard properties.
Replace the reg names with a comment and delete the rest.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..287ea6eebe47 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
-		compatible = "canaan,k210-sram";
 		reg = <0x80000000 0x400000>,
 		      <0x80400000 0x200000>,
 		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
-		clocks = <&sysclk K210_CLK_SRAM0>,
-			 <&sysclk K210_CLK_SRAM1>,
-			 <&sysclk K210_CLK_AI>;
-		clock-names = "sram0", "sram1", "aisram";
 	};
 
 	clocks {
-- 
2.36.1

