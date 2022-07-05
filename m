Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A866567992
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59D3919F3;
	Tue,  5 Jul 2022 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0BA919A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id cl1so19399938wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/fojUw0EeEcK+rqcJSp3I2q4GoLWZt/YWa+Regpf2w=;
 b=Jr18FWZSzSRSneVObsSjnVJxBEUXAHsbqU/4W10bboXeXN2L2pGC6VHQ4lgo/UBYrp
 J0CMP0GRKp8dUKbMzK9I1qdn1rq3wK26lnd4XTIQ0sX7h71LptFUbULc6iaAnW6WGhm/
 okjirNplhv/WA9IcoywKUcGHw+BXG46zwI2GDKyZOkmqjyOn04Z5BJhC7yJplgdtIB49
 wuTwK1SUud924+xRGcyrhru3Yn2If8/5ynnTC895rXmhv7F9KKS2ySwpJDiF/o/a0tk6
 AVZPaubBcC4eXqg35e2ngXfchcbpzRQnzCgaBYEME++JqIp0fl9txiaPCPAGuTEtjsUi
 YJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/fojUw0EeEcK+rqcJSp3I2q4GoLWZt/YWa+Regpf2w=;
 b=ecTkD0hUjOyVgU0adkLkDdI0Kzedw40wDuhCU9HEDkEX6rGnYwn5x7GVx1WfZIBbEs
 PpnM4+gTrz379DLCoNKJM65qxiV3d+vpzdS/eCtAzdr1JhcpRPrLvduu6twIOqprqY5s
 trA9zU3bcCAlwShwHEYM0pSUm/r2rAX22gpJyF6rUrWx9cJqLDznDmUzJaEL4UysOXdx
 sGAjXV0ogvKtcRrAn6x+nF3p6Zmz8mpvuB2vfQFnKvgnrRzheHOOJJD2vODdYKVBXSSN
 Ic78VnSC3TzyaZYGovF61xEH7df4SEzOvE+Fanyk8z1dMOYcbQKuQSHJenD3RWJk8U24
 mhIA==
X-Gm-Message-State: AJIora+o4g/GW70QiTOqJtn5G/k1j/HDnceIpcCXfGOFB0IrMQvdigLc
 9wjeCmEmnHizVaq10ZxZBIxzyg==
X-Google-Smtp-Source: AGRyM1tX5bERlh6TaveO6GrgyXdZI+WLqirgKBhUqp4y28CVn8caA9+OntupBTJIPlHx+MDpz9T9Gg==
X-Received: by 2002:a5d:5985:0:b0:21b:c74b:5a7 with SMTP id
 n5-20020a5d5985000000b0021bc74b05a7mr31952683wri.242.1657057946655; 
 Tue, 05 Jul 2022 14:52:26 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:26 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 02/13] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Date: Tue,  5 Jul 2022 22:52:03 +0100
Message-Id: <20220705215213.1802496-3-mail@conchuod.ie>
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

The Canaan KD233 development board has a built in LCD.
Add a specific compatible for it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index c5571391ca28..99e0cb9440cf 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -24,6 +24,7 @@ properties:
           - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
+          - canaan,kd233-tft
       - const: ilitek,ili9341
 
   reg: true
-- 
2.37.0

