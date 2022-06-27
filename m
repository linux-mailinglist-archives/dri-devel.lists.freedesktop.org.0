Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091E55BBCE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338911B2E1;
	Mon, 27 Jun 2022 19:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C07C11B2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k22so14495843wrd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ef3I7471zi7adAYmEZiBXZpXh9J/sRivupa07zlI37s=;
 b=HJumt5kWS06mWGiL+4OpEcLUtAC7SNNT45MpSDG001Qi8EIc3dVNUQkn+knFTjW69J
 R8mWOCqcz4e7Q/CPs83n2+HBdGAR/MzDo8iFe+iUMlIwG0BO4ENAltYbtbL4+2H5oDG3
 3WbwwkXTpMHcDzA4RGeRsnyQOybwev/kCCZNAV5bbmfuagFZNHAQw8fw3UnbgMKZLGK5
 KkQqCMzp90DxTnxWzxGdvNfo4Chy7TQO1QO4MitEFQ3DF547kU9BQECLyLo3Uaceo6W+
 sWjJxo+kCADRBxT1Zui4rHIfIWdahlWRan847eRFOyScrZ5BHz3b9KUA57p656/reecj
 FWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ef3I7471zi7adAYmEZiBXZpXh9J/sRivupa07zlI37s=;
 b=AQGY3uuwkB56BK7LL8g+PMicDigz4SNCAblTgvyNKMQAsKgu1xlGxt1OjMynLGi3eZ
 v+j/9LEo1ZNggHTa0/pj08+IfNrmQhmu06HOt2u/vvkLQoaXr6Bi01ksYzBHiEzBNJSw
 wuz1SYxKkEOqBwBFtUYURq0ksal2zq8XX14DniG9483JZCYPcJJzdc9eSSpJOu4KIukm
 X6cYucP2CnAS/wJTC7y+yDekvYNzrIl7z4oxieS6OJWD0lO09fAWHfbSvpFmKMUvRFEw
 6gAT2ywHuTJmgZokXK02XFEImSUAL+rqIRbleKrJhLFN+OVPkrHiUH/6GCPToTAkDJsw
 kKUA==
X-Gm-Message-State: AJIora9CwKNDV5+rdvSCv5gjpnBTfrIPFGANGMEXT3sHzA+O1Pa96rkq
 m9i4yQpre9CPQR0fC+p5na3zIA==
X-Google-Smtp-Source: AGRyM1ttZZCmnyf7M6EsntZ4/SALGTw3iqAI7J+sn1WlB30nJAP/WNiYM9WiVd2M71fg6imXwScP2w==
X-Received: by 2002:a5d:64c1:0:b0:21b:981a:594e with SMTP id
 f1-20020a5d64c1000000b0021b981a594emr13681508wri.171.1656358899484; 
 Mon, 27 Jun 2022 12:41:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:38 -0700 (PDT)
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
Subject: [PATCH v2 13/16] riscv: dts: canaan: use custom compatible for k210
 i2s
Date: Mon, 27 Jun 2022 20:40:01 +0100
Message-Id: <20220627194003.2395484-14-mail@conchuod.ie>
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

The devicetrees using the Canaan k210 all have a sound-dai-cells value
of 1, whereas the standard binding example for the DesignWare i2s and
other use cases suggest 0. Use a k210 specific compatible which
supports this difference.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index be42c56e770c..10c2a1417deb 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -251,7 +251,7 @@ spi2: spi@50240000 {
 			};
 
 			i2s0: i2s@50250000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50250000 0x200>;
 				interrupts = <5>;
 				clocks = <&sysclk K210_CLK_I2S0>;
@@ -260,7 +260,7 @@ i2s0: i2s@50250000 {
 			};
 
 			i2s1: i2s@50260000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50260000 0x200>;
 				interrupts = <6>;
 				clocks = <&sysclk K210_CLK_I2S1>;
@@ -269,7 +269,7 @@ i2s1: i2s@50260000 {
 			};
 
 			i2s2: i2s@50270000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50270000 0x200>;
 				interrupts = <7>;
 				clocks = <&sysclk K210_CLK_I2S2>;
-- 
2.36.1

