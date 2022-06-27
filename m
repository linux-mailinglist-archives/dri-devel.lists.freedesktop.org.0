Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C655BBC7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2862B11B2BD;
	Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61D311B2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:30 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o16so14513158wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ycV6k4WWkFTlcXLHw72umTHvHWH8LEFc+03pUq4wXA=;
 b=axHtYlAFA802beerF1xUmeKXQb0vB9Fu/ETM67jL15osjDB8WaKiAX7FLhUA8wDNCt
 0JauD+QxMOOSmVweUIMThSA/MdjGiw2P9Zcf7oBC8V470chKbGUhamRKQSN8/JGghVrF
 C8M9VTM8twqOHV5RLITlZzDwSDCwpD0jZhmR72UHeY3tws9Geat9wxnemuqMicTDOuzE
 0fkrc7rybeNJldWOWrgHWcTCto7RUo3nDSkb90H2c9zd3j5W4PmnmKNN62zarK/7bLHX
 capb3ernqGdYqMQ4XmvBWywCw56+3WDEjld2V385oe5lIaCMN8k/EyD0m83ZQXgpwM1Y
 9J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ycV6k4WWkFTlcXLHw72umTHvHWH8LEFc+03pUq4wXA=;
 b=s87FfFeR3z7r+mzNfbSzRL9uctx9GhNAB7a0I5mbrdErEURhvdzysEvd2XHseLp6FN
 dm0xlsm9VouZfrI3fP3B/3DMLWXYGdF0rbRrQpa0hQeOGTw2HOWII1yCjjxt+fOoBl9M
 VcD5TuEw3X1TuEj25qXG/hyrv/zQMdRsxRgOvQUIoCzDsWKfZ2Xykxh17rIfJGmHNXuE
 oYP4O8Yyum1veMTMxGvvt2dOuWh1kcNuuYhUaJm3NKMr2ydrHYOcfRvC0GHTOVHcraDz
 FTefsiymF/UT2uC05faD8XGOo8J6x7kf4G5sHAMjcg7eI0xrF+TWOi+bHeRn4J+Zf8if
 1OJw==
X-Gm-Message-State: AJIora+/z7okUsfhk7dBfR6TnPkjJ5g3lXIapXbz0VuoNW+VO4CVLMyu
 426jWE814RjrERaKIehg4alKEg==
X-Google-Smtp-Source: AGRyM1ugZPNhTAyfMNKJfAKWSDZJNQ6t/9bFfe93+HgnOEovCz6LbNAyLlE563FuiIH9qiKlJvd6pA==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id
 v5-20020a056000144500b0021ba91907d3mr13498611wrx.545.1656358889211; 
 Mon, 27 Jun 2022 12:41:29 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:28 -0700 (PDT)
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
Subject: [PATCH v2 08/16] riscv: dts: canaan: fix the k210's memory node.
Date: Mon, 27 Jun 2022 20:39:56 +0100
Message-Id: <20220627194003.2395484-9-mail@conchuod.ie>
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
The corresponding U-Boot code seems to be:
static int sram_init(void)
{
        int ret, i;
        const char * const banks[] = { "sram0", "sram1", "aisram" };
        ofnode memory;
        struct clk clk;

        /* Enable RAM clocks */
        memory = ofnode_by_compatible(ofnode_null(), "canaan,k210-sram");
        if (ofnode_equal(memory, ofnode_null()))
                return -ENOENT;

        for (i = 0; i < ARRAY_SIZE(banks); i++) {
                ret = clk_get_by_name_nodev(memory, banks[i], &clk);
                if (ret)
                        continue;

                ret = clk_enable(&clk);
                clk_free(&clk);
                if (ret)
                        return ret;
        }

        return 0;
}

Which, without having the hardware etc, I suspect is likely to keep
working after the move.
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

