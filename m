Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD81E5937
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FDA6E3FC;
	Thu, 28 May 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF566E297
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:27:46 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id q9so1139733pjm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UETiT/+hv4pHR/FxQpN8ElBZpgtWRVFOPMtYdets/m0=;
 b=adRZeb9Lm9Mw5bBmtIfv6dbOePFDu2sMfBHHzfZKYcv8RFY4FDsx76Z2h7qVYFEcFA
 SiAtTZRpKiu6ZGk28yBVC+DlKWd/LxQaSRsvi1xHYD+8SldaaJZSs3WvbxZpflRB0qJ/
 K1psQWI9snmWeyfED0jbFki2a2fiRcYvv8DPDMY2QdjMmij/oQmu7PB8aXeHhCbsto+W
 5BBXh/bQMYCLbQHkrl4NdUaBr+/5rI+/dkc2oxIch/OhpNYLJoF4GzDi5/UtkfDwYSdQ
 LZHeiRvVNBWyAszvLuEfCkcnjKxTn767Co+SsHu0pNEh4sS1CsjP7Ydsad+v7/0w7nhs
 P6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UETiT/+hv4pHR/FxQpN8ElBZpgtWRVFOPMtYdets/m0=;
 b=nGrU+b/vvH0qvZnsw3PKCWOtNEiBG9tD0aD1C+wfyhD7y9o4i2DCEvT8jZgMIi2PT+
 hx7IRUs3PS5Ys2PvUd3UFKrpiW+x0Af7zFZ3upI7KlhOasXmTY+k4K5gbKH2tVFlBLv2
 tRwrsPMO0Yer2zzC0M1IEUmS4M7deMGzvGLjVa70eAN9K4cfCGdpDSAHEBOTYqWTWiQ3
 22x4L4xCrskC2N2O7d/FkzmeQS6tZu1n2L45CMKfG/7MXqbkbo8ZQNQJQwKtUMqRG/bO
 Yndew81QWDSwtgw5/UsruJsXT8HpqZa6SMzCNAVfYgy7SV6byhFcrl+EBOF/9/VXCsp9
 Z0Bg==
X-Gm-Message-State: AOAM532To33yQlR0UQCJcMTkqYREA/JVWMzik+A8llVCvqCNqBAo4Cdw
 SRqD1nvfafqJ4wAKVR+qdDk=
X-Google-Smtp-Source: ABdhPJz5gbkJ79n4grpbJ62IF8L3aiqo8pVw26w3l2Nkc2Ney24Q3/bI3BZNPFN2Svinwt0qeTx7Ag==
X-Received: by 2002:a17:90a:a017:: with SMTP id
 q23mr3572709pjp.4.1590564465807; 
 Wed, 27 May 2020 00:27:45 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:27:45 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 1/9] ARM: dts: stm32: Add dma config for spi5
Date: Wed, 27 May 2020 15:27:25 +0800
Message-Id: <1590564453-24499-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
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
index d7770699feb5..5820b11e7365 100644
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
