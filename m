Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAF1E07E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2518689EBD;
	Mon, 25 May 2020 07:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468D589D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:41:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id v2so3193314pfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=fkNPpMGzjaKpCW8iTYQCQix1C73P0vGeCYEgEBtczSwFoYfS6ni4XDVWMbiLhqvrO+
 YQj1kVsq45Hc7FyzZIQdm03WipH/XllIaDcseSWpV/0g8Dh5ICZ411BaDbDHMWQSa4/f
 0SZsJz3GhwaxVeJopKZG7Wr9Udxdp7O5jxlUFebkd5DVx+GUCmFSnusnoEtRoAeJoN6b
 1PPD3ek7v1TS/KhPcSh6Cd8UCWgt+Ml2QlTTMP/Zn+LAFKaiE7+6Z+D7BUwhr9wPfmmB
 v51sXUdOj/KwHwZ+bMdKThHsEWDk4MrX533ednxTMem3JkkuUJgODw6aLxV/+tjZJPAV
 3poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=eH9jQUkeGAA3b6OwoP+FDkfSBUhBZ/NKMLk9a9X9llJgwv4+sW02+g+sDdRPWoekUu
 w62HDK8NRxK1ZvyMvSzWp/8kwo2bvQRKtCmJjkM+DP5OrVQ/BvSFR/yDfnmZYL8B+Uao
 a0wAP1yUm7RdDHvQZLDIjJ8O6HfhQMX1IKoHZwodMf8F9FhlN3nER0YQjPo5/yRNmdbH
 xclP6Lv0HFc5WPZtYLIz1RDWxZwLGrfzKpbE7zXoztN0NzdVkii94Qr0CSRAli1dogxV
 3+Nx9L+SHPnqorDIBfZHm8ZfmSAC1Jts5z2uqHCOTAs2Kc2tcmK1npVa2lyWWpuvheuQ
 I2Cw==
X-Gm-Message-State: AOAM530cW5XY4cQSzV9e/SjGDBVYm9pDvt8VSo9lc1q3tgYcJfdK/G6m
 1QPIFUS6ZsbkX5xMQimKiJ8=
X-Google-Smtp-Source: ABdhPJweb2OFp89IGu0IqbpvrgVH1AIHqBr5JqD5/OxEMbC2D64IA8gZsH2OyXyZNWnB5ONkhP2T9g==
X-Received: by 2002:a62:1407:: with SMTP id 7mr15471826pfu.103.1590378074875; 
 Sun, 24 May 2020 20:41:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:14 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Subject: [PATCH v5 1/8] ARM: dts: stm32: Add dma config for spi5
Date: Mon, 25 May 2020 11:40:55 +0800
Message-Id: <1590378062-7965-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Enable spi5's dma configuration. for graphics data output to
ilitek ili9341 panel via mipi dbi interface

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d777069..5820b11 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -660,6 +660,9 @@
 			reg = <0x40015000 0x400>;
 			interrupts = <85>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI5)>;
+			dmas = <&dma2 3 2 0x400 0x0>,
+				<&dma2 4 2 0x400 0x0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
