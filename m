Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764285679A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F95691AF8;
	Tue,  5 Jul 2022 21:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4966991B10
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h17so6233107wrx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWVsoJ84nebg5qEzx/IyFZjNfcxxChmP9JWxkkGh06M=;
 b=bNjVpXzmlR/oWM523pD7Hne1AQQQiJuJz7eymu4r8tKUB0QnUyvNkL1aZIAxqUooj1
 7ihDvcph+Hv85n2NhhFyIcvChV6ZYHBSuL0TfLXBN28IINhNsV8hUqQz/SlKfVTjTsb7
 LknjMoulh7s2k46gfpL15T51BpP11SIJPktkH4UR9iuaLkRyzjbYSadCvPzXbLcBjhoB
 tDXWYHDOa57EAjaRLpeFhmKYG2PSTbvCNdceBjvnTYwGHKteRI+1wFGI640cAeey0kmB
 IOuARbRZuqQW3V3qs8fqjCY+OmQ8YhPuJW4/bE1xcuBIY3hi1nCOP0qRr6w884X/VAxd
 dbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWVsoJ84nebg5qEzx/IyFZjNfcxxChmP9JWxkkGh06M=;
 b=mZ5tNUujHKPwlhX0JSGPsClfNBibrY6lWG+qqsLjAMteTRCu50aMJ/ap5WwNttqN0A
 PCAM0nYfMfOYuMEeNvYgIw75x2lr+K154tcJg2JjLKNnwA8sN3F+nw66uxHa4TbeBanH
 pscwK8S4llabc7ZslQo3mAUDZVfc1gEuyFLuhFvlz16hdvPfJvnEXd87ycl3lTQHfoM+
 6ZyFzqf9jNXy7vi5SAMHXzvenwM9NuG4MGFhzhjhM2Hm25Vr0gF6DUcGncAI4UlNwsms
 8qTVaGAUhLVFhKsvE91Zzgoa7Xi75IbwrvnZEJ7vWiJSlWMJNw81/J52LCSSicN5m35+
 z8VQ==
X-Gm-Message-State: AJIora+GOG/Ahbmf729zSBsVjq0wsTec5vP4cGOAqn5ErDCR5IoezyVx
 At6ljO8Y/HW4LttCgJyAfPo0RQ==
X-Google-Smtp-Source: AGRyM1tU1s0Kd36TQuvH5KjPiRqTOb3JL0g6qqv8u238NyO/YXr5MyXJLGr8xZQuXd4xQnYkdnCjzg==
X-Received: by 2002:adf:9cc7:0:b0:21d:642b:85f2 with SMTP id
 h7-20020adf9cc7000000b0021d642b85f2mr16256358wre.21.1657057960735; 
 Tue, 05 Jul 2022 14:52:40 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:40 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 12/13] riscv: dts: canaan: add specific compatible for
 kd233's LCD
Date: Tue,  5 Jul 2022 22:52:13 +0100
Message-Id: <20220705215213.1802496-13-mail@conchuod.ie>
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

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.37.0

