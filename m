Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24590DD4F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4E410E7AB;
	Tue, 18 Jun 2024 20:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LGDyoUFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ACB10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:51 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57c714a1e24so6222807a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719189; x=1719323989; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CSe0urafDT2z1+HpSSV03N11tNgqTMkBCf6I1SbHXSY=;
 b=LGDyoUFeEfqXd4JN1El1MrQnCskAmp8lx0XRpKBPPjdpJSawmKDkDn6hnYVJxaCrut
 RXXnwjfaLwJX1B0sp7zX7t9+zrNj/YHzyR1arMX7maOmt3OIyoOlMe06HEb07nC/TdJZ
 ecGclSAJQmi4mniwOxioH/F7OVtV+mQuSQi4SCj4hm+j9CIkVQ5dWZa2poIzuq22OUrx
 R45+Ls548y8JgvV8m41f6AoYf8/pH4dAAmgBStGmLA2JXPZsiScHMXPXqFkUY7dCkxTX
 X91xH2YKPpOHRrS7Ev5b4w7CV3I2OKQRJY5iI5IjYg8Yay1GUnAoKz44njsB3TQX1Lrq
 5h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719189; x=1719323989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSe0urafDT2z1+HpSSV03N11tNgqTMkBCf6I1SbHXSY=;
 b=hOp1cd9FYcskNImiqezWcf/nYGDzS0xpYTgbgxQPu1J8NMD4aNLDoX+4cwlp++7vGj
 RZkzAY+50A/eTpmNe8kM3y0Yg6L/rl4o5xlRQeWRwKhOWlOzJJkJ47F9ThInLxXHJOWn
 ckzP7qwHCjD/sXN20AT1mJllhff9Sz722YNyE+fFTRr2C/vP9n7CymOONgZ4q7Pj8XvD
 A6oJUJqAryrRIpFa+cf+VtVxyWP9EbAYA9wfbSx8fDB0WwYpTrT2G3xMgjIoobbSXiIz
 kVYzYO0pYm3rmhy4EU5o7ACqnpmKxsyu/kXp8CQwzfPmUanllOuzBtIUWEZ8oZLy3rrR
 vS9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVep5mYLGIRZBcOIcLdFsaUr/bPTKrKpbtOS3f3e/pe2aS4C07LeOEv2603QUFaBkLLNowu9jB1ov94S6IoqFurqX7QRTM/KggVVViOpvh9
X-Gm-Message-State: AOJu0Yy6fRmy72Y/4VMkyz3EmZqiNuZci5aSXox7aN8xCpij6cNIEfiu
 N95YF5vrwIEDBihAxLcZOvvpe+yuc69/F8aKNZNhkJnY10vasUBFO9jGujfW
X-Google-Smtp-Source: AGHT+IGvN7W/J9F3YIuria+CV3PGWcs1VK3Ax+ln3/ipL9AA6AsOYEJMmxSCCBizSSU6Q6We2LB81g==
X-Received: by 2002:aa7:c253:0:b0:57c:ce20:152b with SMTP id
 4fb4d7f45d1cf-57cce20164dmr5541095a12.26.1718719189451; 
 Tue, 18 Jun 2024 06:59:49 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:49 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:35 +0300
Subject: [PATCH v3 01/23] power: supply: add undervoltage health status
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-1-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=718;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=MYDk+LYjEzzvLPDU6mjzpg2IX7z/HKPNPkCElkRcQ+w=;
 b=6osR5sQb3KfAqZxw/zABeeghkZzuowKR+l9GQi+0gqppa+51FZOCldCtLrCOr+cODyhyepNtO
 Beikk3e7TQ8CKJCAPvaKcz8UpsfsQfaQyB+QH3eRgK0LKT1K32tsI9K
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

Add POWER_SUPPLY_HEALTH_UNDERVOLTAGE status for power supply
to report under voltage lockout failures.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 include/linux/power_supply.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 65082ef75692..0f82a5c0ccf4 100644
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

