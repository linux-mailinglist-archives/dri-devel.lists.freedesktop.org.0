Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74C97835A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C4310EC06;
	Fri, 13 Sep 2024 15:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAHwkFZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64910EC06
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:13 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so2529245a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240092; x=1726844892; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4EIqNkwsQqZA2boWTxgOSCM1LnprICOAsFLvJ5jdzT0=;
 b=NAHwkFZbcKYeJUbVYPjDovlOKDKlwz/TjNqlPXfTy6rnjX4sd3sI8XBnVy/ibySGAs
 vEaDX6U4HQ9tnH82wtwiNSDTBU7LEMhVFQ6fuiiQEdkfJ3LbqH+mWmAuPicoeF0Pkos0
 8V8ZRvXbsPHRXuVgfLmnD4XO3wuNJSX4WWwdLd/3OeaQovWTw8O37RD9zFA2kQCKT+yH
 NABdqf2/2NGhARvAN48EEiSMWa22VHt3TIBija6ZtLdFfu0slhpBOTBFolWH9nEVRuTi
 ZEbZ9XrSEppvLpulFp9ZSyLymbsK4Oud3qFCikqirtHIQHy7WMC12ERN0qOH1iW4Rge+
 A7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240092; x=1726844892;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EIqNkwsQqZA2boWTxgOSCM1LnprICOAsFLvJ5jdzT0=;
 b=jZ2nNxyiw6nRkew9ySvuUsUOcsciJsfURjthcNe3Rb+sRnbwFdVvF7rQbz2ZOiHtDO
 l53BsFG9lkgVt8Ig3SloVseE0d/Gbu3YqNTzOiR5MNWT3wt7mwfgWniPsxmxjLHplDAK
 ryOO489Z7S4kqSrU1gRs+tzColxADlVGrlgVHTCPcIg8FPobW4d7yIf7DEfUSX7FPgN4
 ljFM5GD33KjcjgrFkHbH4NRyI5VNjcAQLtdoA134eCBoj7rHmqzlz9zhHoXW54ITxu98
 aHIHuuP9UbJ6zipvFOws/kp1rbMZhQ/sgbX8/iJ+EcpTeZZ3oRrmi7gc9/QF/lgXk0nt
 mmCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzTA0qtrkNGha3orOL+0xxKHooX54asGerZ/8b1prSI7DoKNZlKXO8ov0F3l78VsAkWSX5ENVnEdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO+MO7COh+zJ634bo5drQsByh23cWIv+QBt+s2v4GCAkVg+gnh
 M6RQpOwhjCuCQevUbOj39+SfcJOUdTNCodkV2iuLPLS0Y7Ks1Tx7
X-Google-Smtp-Source: AGHT+IE6p8oIHSJsZjO2mqGheGUSLlmJW/eDkgrNE2S89U66htUkE0mJEAHFXlxpzTiGrpsFC3Ltvg==
X-Received: by 2002:a05:6402:1d53:b0:5c2:7570:3a2a with SMTP id
 4fb4d7f45d1cf-5c413e1ee8cmr5399227a12.17.1726240092072; 
 Fri, 13 Sep 2024 08:08:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:11 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:44 +0300
Subject: [PATCH v4 01/27] power: supply: add undervoltage health status
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-1-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=718;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=ddijmglUy+4wekTGyDAt+CkBz5h456H3akY2zm7U9hc=;
 b=DUew05PYQEnECXRBoPaNkYafjbSQTw/TzmdaaO86R3ABKGSwEcD3aOOWmE9UYWH8XHLI1cCOW
 1spV1CZGhufDOpTXp/PEROc9GP7fFhmLUklqPu3P8Cey+x4U1/xnzm/
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add POWER_SUPPLY_HEALTH_UNDERVOLTAGE status for power supply
to report under voltage lockout failures.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 include/linux/power_supply.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 910d407ebe63..8682e6466544 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -58,6 +58,7 @@ enum {
 	POWER_SUPPLY_HEALTH_OVERHEAT,
 	POWER_SUPPLY_HEALTH_DEAD,
 	POWER_SUPPLY_HEALTH_OVERVOLTAGE,
+	POWER_SUPPLY_HEALTH_UNDERVOLTAGE,
 	POWER_SUPPLY_HEALTH_UNSPEC_FAILURE,
 	POWER_SUPPLY_HEALTH_COLD,
 	POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE,

-- 
2.39.2

