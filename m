Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D3560981
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0602510E71E;
	Wed, 29 Jun 2022 18:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E794710E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i1so19294301wrb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPbPYlymephNVmTF4XMmqzgSP29N1hKW0nY3OhQ8kt4=;
 b=bIL3O+08jSafbGtb7U08BFLv6ancGGHOyy8t0PuyztZ0247LnqujD+WEk1rMsOM5Hz
 x4rbXKhptTq9voYY62GNR7QzTopeKEUDk0JivS1uwsBcjxPN2n/CXBB4IOSdhPCdVN30
 iF4DDu2c2NUkBuOkWAkNrx+XHLu5HWbytieuTXQ6YOIsvbQ3CRlZuDbN/QNvkIFSLxZj
 KsKxVsL/5aI2KP2l0tOnjXqGzGAaXjkz+ia9erDlkqPPUZmRGN65QSlMuzTTewm+GZuH
 ISKmZiEQbwwDDwl11tRKVMC2d29J4mdLuNUJQ9OcdhM2RVwpRHFZFcpIHcUw/K+zE38G
 XLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPbPYlymephNVmTF4XMmqzgSP29N1hKW0nY3OhQ8kt4=;
 b=6zJAqAtdM40wCwr66jzji9nmO36i8HJkZ0/N3OaoXZc8ntHHprPwOc5Hv2h0GbAjhx
 VFe5/tPmV3Gz3s+w5Fu1ePhd7klGvHSYpo4/sJwHLY9PgfwOq/S12MnYrvThWMGKlCjr
 I7jfcyP46iH4iEhWcS+07JaqXDcQhVibmKZ0YDjOH+cGX3hh1tfhK8L0yyVR3Tn3YpxD
 OVDysjxAZ7TjhMQrlGoBzAVjs5kKgl3u488OQV1OV2NcNu+cpDq/Se6FqL+PLy4cMTtR
 wCwbc+/bGP7gQvYCgWCBFly9ZFv3njScZ+dEyuw29ObeQPg6HUCzNE/GbBlHN24uNOpE
 S1GQ==
X-Gm-Message-State: AJIora8+LLolrA7sIX1XBbhqsbHU4uk2+ge/AQKALqvNjzv4ND0XjyXF
 tpjqiqX02MQBYRH9/ztnvwScwg==
X-Google-Smtp-Source: AGRyM1thyJi31gfTX2uVAqIx3UeLhb+ISWNyFKRvah2HDTfAAbgqaVsuL5zuItNJWE1qpvCtHqQqvg==
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id
 v6-20020a056000144600b0021d2245ab65mr4552665wrx.315.1656528287443; 
 Wed, 29 Jun 2022 11:44:47 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:46 -0700 (PDT)
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
Subject: [PATCH v3 07/15] riscv: dts: canaan: fix the k210's memory node
Date: Wed, 29 Jun 2022 19:43:36 +0100
Message-Id: <20220629184343.3438856-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..cd4eae82d8b2 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,11 +69,13 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
+		reg = <0x80000000 0x400000>, /* sram0 4 MiB */
+		      <0x80400000 0x200000>, /* sram1 2 MiB */
+		      <0x80600000 0x200000>; /* aisram 2 MiB */
+	};
+
+	sram_controller: memory-controller {
 		compatible = "canaan,k210-sram";
-		reg = <0x80000000 0x400000>,
-		      <0x80400000 0x200000>,
-		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
 		clocks = <&sysclk K210_CLK_SRAM0>,
 			 <&sysclk K210_CLK_SRAM1>,
 			 <&sysclk K210_CLK_AI>;
-- 
2.36.1

