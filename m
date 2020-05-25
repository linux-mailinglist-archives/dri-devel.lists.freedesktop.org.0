Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5F1E07C0
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B4C89D99;
	Mon, 25 May 2020 07:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BF689C52
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:45:56 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id cx22so8012264pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=L1v+SFIcuOBtC5uNb1/F9JwnI/MV2Y6r7KptSWJmyzbRBYesYs+bXxJUS4ItcP+FPT
 k2IVwpaEgQcZpIgX2E0nirnEIobOUQ4e/qQdA0x4hwmSnzKtTyzAZi8p0oTy3OOlJuRw
 9I5G0UpR1rGvA3BHzYOtSr5wiFI1hzoOIVYgloKziD7+HX2iVNwO1P4IAzl+gUmomQOl
 T7vo1xrCFWwOXCzPsh0LyH9KcnrN8yPtbib1XiSgVcErdtxLZl2AETvmALganitVM3N0
 ePpnyIyaNXbuk7rdgWBPzbsC9fzXx6cZVtiDu0SPRxJL32R/xBFQ/NM8l97RIbYBBFgA
 xiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=ozHwOVT7ECWX/lbiKRGvkISbTJiQl6/sNz08B57rmVrOYJo/J3zzk1W0bT5Hfrr86k
 rsgQE7DERbdrf4IfkI7ThMBCu8HxzbiiLavEgtIzv19RtSip26xThcZTVbDV/vjSxF21
 0CU/CcfcjR0g0KEVrlkElXXSHxC+jY9S0kUIxQdM+dVpkD5PhvEI8JmgSNv3z4ARRUEO
 3zqqddeq5UchKxZ8T+cLjJ1jM8mvAjlMrNHQ1uDzPT9vOqVOWsqMDV/WJ5v3rGtKKu1Y
 fKl2u8RHsZbyCSR+Mhc816o7MHBGlF5EWKG3GWmhaK95PRfO7W9T7UtFXC03hvwQ0DOt
 Mtjw==
X-Gm-Message-State: AOAM532cTh2QSSdKB0sWlLqG+jcaPHGkZ1POJus3xkCYvlZu9yzH/0PM
 dAH+8dFJg987Mf9pYJFhwLnXC0XmPIA=
X-Google-Smtp-Source: ABdhPJwkmS1ZHDjTueCXUPGhysWGmBYPKk9BaU4KH5QdoOaLDJ+q+4xaTLSo+sj1pCIJ1ykv9lAZig==
X-Received: by 2002:a17:90a:a013:: with SMTP id
 q19mr18863765pjp.120.1590378356618; 
 Sun, 24 May 2020 20:45:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.45.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:45:56 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Subject: [PATCH v5 1/8] ARM: dts: stm32: Add dma config for spi5
Date: Mon, 25 May 2020 11:45:41 +0800
Message-Id: <1590378348-8115-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
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
