Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6590DD66
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8914810E7C0;
	Tue, 18 Jun 2024 20:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSQm+30q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7D010E6AA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:37 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso7347355a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719236; x=1719324036; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N8C5cZtO+2UCwtEojtBuXITHFJF0Ul+anrs/LLrVrxk=;
 b=fSQm+30qd2Z6IKnxGfO5FRYLvC+wYrJFwwRVxs3itaeHGOugBeq0xitqI9kkCwNlnh
 HpyJGYsMc9i3GyR6q1Oqyd2Y/T2YCdsuPzChHRLac++OmX7EiI0uUck+AIbMiqJFwXb4
 5d7hoNIUemuwySPBmbqRldkTMRq9ooRaXTNWoA9bLhjJOuSIm3EZijb0SurzgVYX8sot
 /eJU2oTsBA8IyRJVk+j6Xt1e/iZG48BXwJfA/QlayMcZhBMdxLuakl9VKDmFfcs7u2RK
 0mkyYgxbHfYL1KUumP4Wz/NhXh6CDU/Ls+eIXPiJIzRsnUCbeGULWsB4YM6gWIqKno8E
 /r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719236; x=1719324036;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8C5cZtO+2UCwtEojtBuXITHFJF0Ul+anrs/LLrVrxk=;
 b=Q/gkBoSASCM1QQ9NT01DDFr17ydd6axUqxlMit7DzlrjsZ5b3z2Q5DUKH/HVMHKesO
 yWJgzGXjZXf+QvExifAj4ewWflz6aTO/P253l3VIPK8xR/Nb0RgLWM3crtxvnwy+9hXT
 LbthM0aqhinEFPxi392f8KYIW6boSy0NfqumPXUoCVXabpDhJUPz9lFSXAGaUoAw78fg
 3GqwrPjxJEtcX5HWLUcpkXSTLGbJnzY00WRpv77q8VtzLg41BzosDlL5OyC0BG0Ckrx7
 gDq0trv12p1qn1AAdTDJ1CNk0NZZX+7bkC2/nfFyZFODR6PLPqHFLr7WbfAa1/UQ/Wtf
 PG+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ZzS5OKbPSY2W/NV/9usfqu6/HJ529NTGNvz0Qc0w1WcI/3vT0zZHKXM9urAYQJ8yhw83hxF8lMTldN2JxYmbUef14h3MqFqsrW4mmsRt
X-Gm-Message-State: AOJu0YxUFXIiv+TC3LMPcflCoMBUTSM/Gq4VP521A1bRkCavlUnYwE8D
 ZoSnCxeUDbxN+JqiFpV4LYhz0/65EM68l4oOcPGYyvZ6tDiy9wfSkApIQQ==
X-Google-Smtp-Source: AGHT+IHQorFEBelRVlnJYSg0Nj0exKGkeoGt+vHNChz4s1U63SUJqDJ4IXGFzwDNCjEMHQbzrx2ZIw==
X-Received: by 2002:a50:ab4a:0:b0:578:6c19:4801 with SMTP id
 4fb4d7f45d1cf-57cbd6a70e9mr8232985a12.22.1718719235560; 
 Tue, 18 Jun 2024 07:00:35 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:35 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:55 +0300
Subject: [PATCH v3 21/23] arm64: dts: qcom: starqltechn: remove framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=914;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=DzdFdRz1gVcaCMECSJAIQnLBTgojo3XrhxzENnm7+Yk=;
 b=V19181JL5PJh1FZxnidHS2IZyd3Qo7EGVRrt7RJyFup2Mg4Or7+mluh4O8nPJterG1dcIbP87
 yDealaQ5i9cA12cOnIJfdiYlbhP/WAfUNEcsJ0zd6HRE5SQ9Rep2O3Z
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

Remove framebuffer because a panel driver introduced.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..578798704577 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -19,15 +19,6 @@ / {
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
-		framebuffer: framebuffer@9d400000 {
-			compatible = "simple-framebuffer";
-			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;//2400000
-			width = <1440>;
-			height = <2960>;
-			stride = <(1440 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	vph_pwr: vph-pwr-regulator {

-- 
2.39.2

