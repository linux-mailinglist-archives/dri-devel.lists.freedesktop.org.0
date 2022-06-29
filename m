Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB8560964
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE25710E674;
	Wed, 29 Jun 2022 18:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9B10E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d17so18141591wrc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSAtLBVYvrx4+26h7+GvQLFIbOLj8yUyLWcfE4t8YDc=;
 b=Gg05/t+/FXPkRenwx1qHvhlOMODtFpKL/no0hINP8JMW14scbGTJqbUefdhtwratgU
 grEGM8eU4lWFIiPESGiueYpts7cjDlJRLBIzM5ZsXVuH9FzkMr9tHsBgVVqjWBN1GlvK
 8Q8loTffgUn8dEzgkBiOh2xMyV0VFHVAZAtsSavWDwGncJhky3H7ImOtJQlzgOOWAqUY
 iJQrWXeLhD8IqbgRQGGdxV35uefbG0o1zSbrLcVIYjgZlRqMq28pTN5szQsAw/tFRiJo
 YAy9bH1NwbpaHtrgHoUWaU2YAC7ZpC+O10b5BEj7lUVsyLa3x39mZw6dh7g0gC0fT41X
 T7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSAtLBVYvrx4+26h7+GvQLFIbOLj8yUyLWcfE4t8YDc=;
 b=scatTai74PnvaKOiPf+0DyQ2/1vOxREO68gEGOooIwhoGgMcreH/oE/G1xiTynJ0FC
 GROJWMqHEDL/l67dI/vEig78xpJB8dH7oKDT3/uox/4nnm6ALfOZFu+8M4g34Zxrg55M
 w4QA5ZP/FFx2s4RL2zVEkQhLLIBPT0kQxvYVZjzHKXh7fRj7iE8onE2cAUSyHVL4yzDr
 vC6a0PRwZpNC/qFgztSpCNg3sU1uFdRxobQwnBynDUw3qX9Ul1ajK1KIXHEz0fj0FIEu
 g47pMgaP9Q9bPPUU4SWzexElbHFD/m0wYfTNkTNiyaxTQzhBZQlOkOafi41FBX3n40sC
 4euQ==
X-Gm-Message-State: AJIora9Tdnzwb0MpQUTB+yCG4HhYbViI1CKK98wNgoO/zR9JR8Zmh/8K
 hWjKYTIiwBCV2J5rKp5WPizbGQ==
X-Google-Smtp-Source: AGRyM1sKo8OaJK8TbEgNGzQ3er/g31kuw/qeXLGUV3MKWqoytAx3LrG09RNZ7rN7G4m3of4rSEmYUA==
X-Received: by 2002:a5d:4e47:0:b0:21a:39fd:5bb5 with SMTP id
 r7-20020a5d4e47000000b0021a39fd5bb5mr4583796wrt.712.1656528282726; 
 Wed, 29 Jun 2022 11:44:42 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:42 -0700 (PDT)
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
Subject: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update spi-{r,
 t}x-bus-width
Date: Wed, 29 Jun 2022 19:43:33 +0100
Message-Id: <20220629184343.3438856-5-mail@conchuod.ie>
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

