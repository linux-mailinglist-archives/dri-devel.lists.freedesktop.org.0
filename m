Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B71D908A
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CFA6E509;
	Tue, 19 May 2020 07:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C57189F2D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:09:38 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x10so4091307plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=dsYJfxLEd6xbVQlENcWPZzU+WfiP29b3NMO5WPeGK9V/39gTQ7A+H7bFPOu4Kv9N1r
 6IDQH14A5+eKS7P5FL0Sq/5SiYYqyMtcIxg2wrkQN4/A17gljEPX0iDZllkLx9w6/bO6
 +TwDy196nfJdIdS9ROL+TE2Jw5nc3tgtYxhQDGvjdo0FciStS01boz11hBGliU01WiC4
 K+KGnpLlMie0QC8MqcgIsvYASooQm1WAdJ7Lso/HjuXkQZCifiOc7i/ODp6kXbNBzdsb
 rzb/jmP35rtmcaRxVvcZah+syxO1XpzSaSwS1ndM7XP2cqA1meMSUDpuTvbSaH3QF2Bf
 fOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=e8/4RyQxRZIouC3G+SYSk6Qool+/eLHtM4KlCMEHBtJGIxASYcHWC1xEBNP+3Jbgay
 Wq2DTAucL5SYJA8s47yGgeejFert1DwbotGkbNrlFU/0HYYRu8ZrsDnisCVN7T9nyKi1
 wkIQPi8VSYt6hE0js0F1cDWM+wh938N+/rotA2FAyUBhhM/YR043FBYIw0aJjiR3MyNR
 8k65U4JNvjBhyz4K9hAJfpxpKjTMi6iCPJngpBYBPb9BJSznGvNcUgmxBElA5+gK9DxZ
 U1OXMPdE3BnLPem7XEWwefuxvS71Lk9iUlV/Awx7lPJwHaoc1AHr8dZsM0M6VG2rZ0po
 DG5g==
X-Gm-Message-State: AOAM532rxxJjVY17amDvY9myA44smRA4LP8iXqTYtR+XttZgIMRg3aS9
 /JJot06l7g/kDFvJA+d8Ka0=
X-Google-Smtp-Source: ABdhPJy4R9lorCsfCy2+A+sDPo3PPj1Wk+rtgXPYIIzgip88QiSihh3BtYXToRutgkUN36Ums0zoEQ==
X-Received: by 2002:a17:90a:f098:: with SMTP id
 cn24mr6322869pjb.201.1589800177920; 
 Mon, 18 May 2020 04:09:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 1/8] ARM: dts: stm32: Add dma config for spi5
Date: Mon, 18 May 2020 19:09:18 +0800
Message-Id: <1589800165-3271-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
