Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EF90DD54
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826E10E7B4;
	Tue, 18 Jun 2024 20:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EisF2AC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CA410E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so3665891a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719192; x=1719323992; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R7M7fPS8zpDvWWWq0XONmDDcbsza5hIcH9aw/hhjckE=;
 b=EisF2AC7id9cTG5NoxaBrixjUADbIFJ1B/2Du+RoM2fw9h/toa11zMP4cl7eyWTAS2
 naKbOHQIt3ZCJvPuRy4N6saErbIo0q+bpiGggnZuTmIqtloIwgmPOCMVp34bqFtswU6l
 CrtSGKz5Zfb3yPtZlfhiA0/yUiRbGFdo+X5LiJ/acfjWlXKpPUialxcbHo1Vg60E40F4
 7yu3nOs8uwvOEv9mxGWuAepI8QCIjSpE1Q3qe8BtJtXpR+O5ny7pbFFCF8G30PJc12NH
 UlDGofUG9WPkCQMpo2lBZHYK8u26/qq5RicTq0dE9vzfqPN8fFkw1/02p+MI8T0xeoa/
 UZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719192; x=1719323992;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R7M7fPS8zpDvWWWq0XONmDDcbsza5hIcH9aw/hhjckE=;
 b=gmDz56uu/6LvchYtqK8OBnN4qaaHtOoVzzNsJuJ++eJeTRiP+7Wr08gb+9sM0M0Sn5
 RBuP/7qjZtjliTf23KLJxJZREJORqaHWELPOLGrtNlJ4rBu44Q5MlXWRTpQvQbhErFEo
 VWp3nDV/7SnmFNWXPtCmJPwLaADrGooHGNz8VvQ086TOsjfgjX0jiWw2CyisecwEbUBP
 CxxnvtbpbruxGGAAXYVFxOtZ4PPpEF7fwFr8akhsp5c/WL51NZH04b10wVCXscSenCUt
 LCaykV254oUeDXIHH+CE0Je8JS2RNJKa8QcPSXiK0IrMEbP4wE+/thuoibInziPlVxXZ
 s4MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiXwuQof9hL/CodjfYQMTUbQrI2sZQ6/c1mLJ1XfGaNc5BsYbdBU9Ex5cK2c4e9EdpXB8F0gFZiFyk2FYhwAVpgP2+3oY4SLHOZlwsiddg
X-Gm-Message-State: AOJu0YwdlJfIsT3CbUW4A95LtpyVXGm+jUcZoAGXuXeZ5qH4mhV+yQdZ
 1IeJBJfKw6QotSZ1r091H3BbbKyWCwChlUcjsAQD/EisVnvumlEhlH1RE9yD
X-Google-Smtp-Source: AGHT+IFxrH/zkhSdk1MaRK4E+l+p5JQYX08C4NcBilAVk0Op8+DaFkNWiaIzFFcE4tvs1PLeBwnIkA==
X-Received: by 2002:a50:cd1e:0:b0:57c:a4a3:f1fe with SMTP id
 4fb4d7f45d1cf-57cf7a926e9mr1837021a12.17.1718719191602; 
 Tue, 18 Jun 2024 06:59:51 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:51 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:36 +0300
Subject: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=1529;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=3HcxN0k0ztF3vxPnK9xWSo9UBEsozU7BSPW6y11+ONM=;
 b=FrDsj3ETUaVVQUOm6LFM6D0nBF+hdet963cj5SLvZ7Hei+IvuV6/EU9kWQmVy5U92Zb8ZIbV0
 dOFifsD41gAC/4qNSbNS6FuI5+bBgsoWvtPrvXOm97raYLyZG5Ds/10
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:02 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sdm845 has "General Purpose" clocks that can be muxed to
SoC pins.

Those clocks may be used as e.g. PWM sources for external peripherals.
Add more frequencies to the table for those clocks so it's possible
for arbitrary peripherals to make use of them.

See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index ea4c3bf4fb9b..0efd3364e8f5 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -283,7 +283,21 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
 	},
 };
 
+/*
+ * This is a frequency table for "General Purpose" clocks.
+ * These clocks can be muxed to the SoC pins and may be used by
+ * external devices. They're often used as PWM source.
+ *
+ * See comment in gcc-mam8916.c at ftbl_gcc_gp1_3_clk.
+ */
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(10000,   P_BI_TCXO,    16,  1, 120),
+	F(20000,   P_BI_TCXO,    16,  1, 60),
+	F(100000,  P_BI_TCXO,    16,  1,  12),
+	F(500000,  P_GPLL0_OUT_EVEN, 12, 1, 100),
+	F(1000000, P_GPLL0_OUT_EVEN, 12, 1, 50),
+	F(2500000, P_GPLL0_OUT_EVEN, 12, 1, 10),
+	F(5000000, P_GPLL0_OUT_EVEN, 12, 1, 5),
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),

-- 
2.39.2

