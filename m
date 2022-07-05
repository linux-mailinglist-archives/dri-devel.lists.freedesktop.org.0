Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0A5679A1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD95C91A6D;
	Tue,  5 Jul 2022 21:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AF7919A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v16so7946667wrd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bn7NMU6i2JipaHjilcDVj2dVJzF0Mozbq5+lea1OdzA=;
 b=Slkpsl7r9Kp451ZNey0oEZzxjuQF0suIIjxL9cZ2NQwn/t1lFAU9Tnh+suky4eMS1h
 YUmFPg8cYA3FAofnfJJV8ocNpuN2u1BAa+fQ35PTOkwttnxQ1zDR1Qc8de64sYsXnBUH
 ajLI4JkOsiOJ4FmFcWefB6nrvs/7GyrBRKYz+6/eOYVP/BE+xSu4DAnMoA7m08+pWwaW
 ELJHDcXeFjTZU4OrOCwONiswxxTNfceAQzWy+UcN47rs6g67curC4Asuc1MmU70KlF/V
 nasOCrdsJTNHCfg3y67UHtpYybbM7aKBZTTjA/5NNdVuWhbOCRNbKDRc0WOCbLp1OcZd
 jA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bn7NMU6i2JipaHjilcDVj2dVJzF0Mozbq5+lea1OdzA=;
 b=1niTlgHjM9xTPMxPyXV6e8Wt/7EosR0LnFrbey+5PRSmo9lXPsv79/VFNKk8hLtoe4
 nco9X47CNIWGNlq6gqFDOMIboZ8e6FK58ClBtUdJ7KFcLKdrS5e7n892eVceI+945tPr
 FToscmSa9tRRuCvGnPf9YXRVOTl5kDsXNoFme/gPlaedqeWVQJTVsiHcN51suvl9f4Oy
 oHBcI8+3EXwKuoVRIR6x+hqTRFre9xoF5XzFoGcZbTOfgFQazjghN8rF8LEa67wrGAIg
 tPlsdQfsRtvxJtAprBIVPWTgih3DJzI0qKlmb9CvwtRUEDg6Z1+jCxs84TiAgXkCKurm
 d2UA==
X-Gm-Message-State: AJIora/7yov2v5V+EGimCWNumOdMpz2rC39h4DYvdjxRgP1aoTTTJfCK
 UR3oVaOO0OhRrFpQsZCatPJcug==
X-Google-Smtp-Source: AGRyM1uDlF2/DUTmOv95q9ml3VpkOLRHZuDe6OmNqYM6t+SWDXd/DCAq3Jod5QPF4ItOmxcBKE2/jA==
X-Received: by 2002:a05:6000:1888:b0:21c:9a16:5cdd with SMTP id
 a8-20020a056000188800b0021c9a165cddmr34342146wri.562.1657057948113; 
 Tue, 05 Jul 2022 14:52:28 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:27 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the number of
 interrupts
Date: Tue,  5 Jul 2022 22:52:04 +0100
Message-Id: <20220705215213.1802496-4-mail@conchuod.ie>
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

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Support the 6 interrupt
configuration by unconditionally extending the binding to a maximum of
8 per-channel interrupts thereby matching the number of possible
channels.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..67aa7bb6d36a 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -34,7 +34,12 @@ properties:
       - const: axidma_apb_regs
 
   interrupts:
-    maxItems: 1
+    description:
+      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
+      will be per-channel interrupts. Otherwise, this is a single combined IRQ
+      for all channels.
+    minItems: 1
+    maxItems: 8
 
   clocks:
     items:
-- 
2.37.0

