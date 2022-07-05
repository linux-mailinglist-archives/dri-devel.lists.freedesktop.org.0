Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B25679A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8837391A8C;
	Tue,  5 Jul 2022 21:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88B919A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v14so19386012wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RIjyo+v4SVWXgjNDfjVuAJAWZ8Bxe92vN1FxyPqfbiA=;
 b=HqLk5zcJWf6yjk0sm6LnL2fNfSHxlMYcx2NwuUldwgNT7LBQbNK8U+CHNU22ohSZfX
 jfsOHnehMji+CkgBY81zgji8jbKG0uw9RDIRgMLentiuJYYOTmn4nVjRS8OlckRy5WTc
 aX7ZxCMNVzNmvoEFSO/1DsXl9LYItNkpj43Am1GvNm/28n8AUqF+L4SddAB0dE0UISfW
 OTEm1sYYtkE0SainnUlBfSPT2PNzJ8nj5JUUbWlj2bCJAtBeTjiQXgsP840dxXt/sT4U
 VAXXJ1jT0os0tnSlMnOAkFvKzIeMM2ToW1M5kBy5hxQ8nGJ29djq+DavH3lQBSjizXUT
 gUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RIjyo+v4SVWXgjNDfjVuAJAWZ8Bxe92vN1FxyPqfbiA=;
 b=bkzMskJmncjciEalFtLKniTRnyaMQlfefQkrj6jQrbg4L+ZERFCP3gljmuML7L74/D
 8cOeU5AkzJz4kOfGman3e8J0WJYxHQ3wwT9PrXXfPRT1Pj32XlIyKAle6Rx/jZ1DL5Gm
 IlkaBotEmE/TL+wjXeL559sJvdDcRWfnWiK2XRpOaoFvtH18AfIv73925+MVLHl/2V31
 vvKF24xRZH2aAkE+wr7gr+SB0s+46m8vBTG/Wz0iLZZ6jz/zxpEb/dSzQie4SynwNQV0
 9forwcTLjRVhT9xSor9ppsq8tlcXBfCdTCqfEPjENu2KDyme8q90KLz0bW2AhWo9dhN9
 Xx2g==
X-Gm-Message-State: AJIora8MnymUPIcWPPFK/5Zqw4Xc8TR6vf0lS47HMCgdjIYcc3VfnGWq
 /ueXq0R4iZ7QcOPyrKEeYxg30A==
X-Google-Smtp-Source: AGRyM1vJjQMyrNGX7U/FSTka+YYEasXPf4fPHcSV9Pyiex5jqMICTkfId8wmcqmwizt28warzAehaQ==
X-Received: by 2002:a05:6000:1acc:b0:21c:439c:7074 with SMTP id
 i12-20020a0560001acc00b0021c439c7074mr32321649wry.686.1657057950904; 
 Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 05/13] riscv: dts: canaan: fix the k210's memory node
Date: Tue,  5 Jul 2022 22:52:06 +0100
Message-Id: <20220705215213.1802496-6-mail@conchuod.ie>
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
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
2.37.0

