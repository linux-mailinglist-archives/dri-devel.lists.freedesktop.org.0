Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E922655BBC8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C6E11B2AA;
	Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAC611B2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v14so14489524wra.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPDKSpav5hSShjOawRd8sA//kdWQiIl6x3DL8tBafaU=;
 b=C1x747pHFCl5BIqO2tKVzQODSEqSKX0M+cQ0VD6TIiatD4/0B898wZwGc+vBUmCQ0Z
 ADkKctZpaFeqts/DgO6pXu3oW1ot2vW9NotfT4U4Xa+zwfZDDxaHFDiYVvm2R9CNqtBj
 E06Rcknh3CHYad9cflRuFOXZX1vmY5B3c3ybS+4vwbu/3Wp9I852RvQRqqNz4cuKOOgI
 n6ASQz3H09UYndOSN0Sl15ncyePaPZCwy8CrQeWv2hWUXslPkctHVLpfaWL3RtoOlIom
 6s/OUA/vQFDetPTA2Tu0u58R+o5XSwX+2TI4F7Y5afZgDMoZsAgvkVAFJy3S7tg8MlqF
 4qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPDKSpav5hSShjOawRd8sA//kdWQiIl6x3DL8tBafaU=;
 b=neaHyfR5fgC/+jNeAqr7ZX1Bdjt+Wxnc44R6XIYKh9bcEJ+24DCVzy8JaK2zQZqimM
 fBptZi4YE5s8uJCtnadIXx3BIF9lDax+S6JBNxpjQlMxYUb1DiCFIFDwCuyvMnP9fnOC
 vILKN9hZntUrdjCkGC4txn/hF7un0kQekUeSyVXC6MbMEnQtlb86WGkrANBpToYXzVLW
 cyicQzKyyKtptmvsZIRjTEvIyDlk/CuoNu37G66B8ZFqO5m2lVUelX/m9FXbx9Iio6OL
 9aEjZNDf8UB3ZQLdhwnL/fiP7UzKNZ/QlQBsCROf1kL/gzZelgNa+OmhDJEOa5LXQyJU
 jsSg==
X-Gm-Message-State: AJIora9X/SMa0AHu68hG7UUViikcSafcQcgbAwBnWHmgCWXzE2UoSAxF
 SJXMpBzmz3Qn3+m6Ksfi5kF+MQ==
X-Google-Smtp-Source: AGRyM1tVL2lpq2bKGJHZFM8okKWTC0C0B/ryfKeZtLnMa7gdCDbQ3Nw3Z3guL69dxyfpeL6LZkAb/A==
X-Received: by 2002:a5d:4592:0:b0:21b:8e50:7fb9 with SMTP id
 p18-20020a5d4592000000b0021b8e507fb9mr13593921wrq.428.1656358882170; 
 Mon, 27 Jun 2022 12:41:22 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:21 -0700 (PDT)
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
Subject: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update spi-{r,
 t}x-bus-width
Date: Mon, 27 Jun 2022 20:39:52 +0100
Message-Id: <20220627194003.2395484-5-mail@conchuod.ie>
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

Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
Canaan k210 is wired up for a width of 4.
Quoting Serge:
The modern DW APB SSI controllers of v.4.* and newer also support the
enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
version is auto-detected at run-time there is no way to create a
DT-schema correctly constraining the Rx/Tx SPI bus widths.
/endquote

As such, drop the restriction on only supporting a bus width of 1.

Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Serge, I dropped your R-b when I swapped to the default
property since it changed the enum.
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index e25d44c218f2..0a43d6e0ef91 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -143,12 +143,6 @@ patternProperties:
         minimum: 0
         maximum: 3
 
-      spi-rx-bus-width:
-        const: 1
-
-      spi-tx-bus-width:
-        const: 1
-
 unevaluatedProperties: false
 
 required:
-- 
2.36.1

