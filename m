Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C59560980
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0B010E7EA;
	Wed, 29 Jun 2022 18:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE41810E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q9so23797923wrd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1sKeykQQRtYj4kj+xEuSgs82fAmu7DyyvRULZ2/Pb6I=;
 b=BMdHLMoOwn6zAxEtDDa7k0h1f/DZxYTgThu3U2sNuU1A+J2K+WADunh8MBK6GQasvX
 bZvbX2AUE3WkwwdX1tNkMtXNA8L7f1blGzcC68saXHEBzsdK22yycaVeMLYkxq7AyhLL
 0C4t2FTjsmp0VGR7E+AoaIvn0ZeON/zWIol2+bxphxTssK2+9gqxMql6G//GigObaYxf
 /NoPS2HGfbugk99X8z9aoWaMuWtx6qv4eWquj/tnR5Pol/4lsSCRVCWYtIA+UAXYn6Mr
 TDsy1g8lVTt47WmMpnvavQWY3UdJ+fGtNafwfqqmqUbeYTMgSgBnM66BgnnczfD5P+y+
 Hv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sKeykQQRtYj4kj+xEuSgs82fAmu7DyyvRULZ2/Pb6I=;
 b=cbmcWaxRlqPY0Uvyc3KPiYKUPqQdjxoTNnj8jNPEigNDBTBF3m4ymV7hMXuMLw2+/H
 9nfVbSBF+1Bblj/tI8ssTlOFMg43S/6DeJ30sRYJGsLFY82pcJwh0Pp+DF9leBo7DSlD
 FCllv8nnFoIZICCRvpGBwmwTg534Bho4Ks4aZuX2tZcdpV0In6yEv2cDxSsdXWeZ41wf
 JV6DPbNuQI7aQmSuL6ESnn3P40se93Bf/s1rliSPo9AoHbnNLG0F39ftbRsonz+IkP5q
 5ygaN3WfD5OUJ47DcjY+WOdt+x15k4Ss2+Xp884LIh2O9TdmhJKZZEIdIn5bqMFH4gZS
 Ta9g==
X-Gm-Message-State: AJIora9lUsW9hDhCR7/9qFTch+1Xp8z5SQnx2/Ncxbja3i+fdR/vkUIr
 s3ybYu6/Je3cA2Pn4AACqt7ykw==
X-Google-Smtp-Source: AGRyM1txmcVZd3QPq2DQpn3PG07YMXIn7w8Wmsh9JviOd6mCe5xqRBVB6TunKvps0uLWXYGFL6mRJA==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id
 b9-20020adfd1c9000000b0020fc3dce980mr4479112wrd.552.1656528284293; 
 Wed, 29 Jun 2022 11:44:44 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:43 -0700 (PDT)
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
Subject: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the number of
 interrupts
Date: Wed, 29 Jun 2022 19:43:34 +0100
Message-Id: <20220629184343.3438856-6-mail@conchuod.ie>
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

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Support the 6 interrupt
configuration by unconditionally extending the binding to a maximum of
8 per-channel interrupts thereby matching the number of possible
channels.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..e33ef22aec9c 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -34,7 +34,9 @@ properties:
       - const: axidma_apb_regs
 
   interrupts:
-    maxItems: 1
+    description: per channel interrupts
+    minItems: 1
+    maxItems: 8
 
   clocks:
     items:
-- 
2.36.1

