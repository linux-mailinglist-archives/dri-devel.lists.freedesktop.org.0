Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753195AEED9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693010E6DB;
	Tue,  6 Sep 2022 15:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A61010E6D9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:30:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b5so16031979wrr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
 b=D+lIKJTJ5gmuLshP9pZR7/p9Uq3yXYg4c6fW1hSumSgSCwDmr/fcsKGBJJYtzoWVcF
 TN92NA+w2VWWby8boBIRrC14bsNy6GYJyUPzlPtxWzS4vdR7pAtld7jVe9UKiyn/T3n0
 mnFsqq4rRCunuO52qB/6Rs/YrSV+UibGc8pmWPOntrv5gMbhCfkfgWHX4dCR8zLDaqL9
 kCfQSPl/94cmjytUnDrr4Dls+czbEXkNWUC73gjbfe1dWCc98c4xtUZIa7MxCZu8jtdz
 teAm6/fXX6x/DcjovAjmyj/7jszu1EpgLa2cmsO0eHBSZ2RJFDtT1FFVcEwih0SifB3g
 3E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
 b=N8BWCW0XQ8mLpfYcFNeK+CHy4ROpUNxqnbD1uTlTxGvU3XuHNuxFlTFNl/D6KdRhTy
 s/jZCCH8w1G6k26gGq2HAzdR/J5QO40wmjktnoCkni2HXSd59iCv57ydNUabD9U9yPq1
 vJ6n3SMM4q0Lnom8QKCDjOBrOm/Cq1xdlHEQOKVJyHri/EO7mrOT6l+kjIFSZre/Qfja
 fuAyqAFPAQTozn2KUduxoflWad7JTiU6aeYDZxcOX7pkuKsl7d5DngAFxE0G5TBspjmO
 /13p7CKQBZ/ztCiXn/2Wdjzp1rXSQTfJDf6NJzKOkfQvRfNKMLbnjFFtFvOTLCLDTGtc
 BesA==
X-Gm-Message-State: ACgBeo3/kzpTyuxygAwIvj895TsyhTHqDRK/Qd2Nbvzi8WUC4Qtt8g95
 e/8oyQuWiVHnI1J60lRsTKg=
X-Google-Smtp-Source: AA6agR6P/RoJFPCp99aXsrvNKO/CW4Xn7PpfrGRr103Jx3gdD14r4PVNgrMIKUUt26sNFdyw2C87+w==
X-Received: by 2002:a5d:608d:0:b0:228:d095:4a15 with SMTP id
 w13-20020a5d608d000000b00228d0954a15mr3792578wrt.499.1662478244524; 
 Tue, 06 Sep 2022 08:30:44 -0700 (PDT)
Received: from Clement-Blade14.outsight.local
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:30:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 5/5] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Tue,  6 Sep 2022 17:30:34 +0200
Message-Id: <20220906153034.153321-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable GPU OPP table for Beelink GS1.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 6249e9e02928..9ec49ac2f6fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.34.1

