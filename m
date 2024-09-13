Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E5978377
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7A610ED2F;
	Fri, 13 Sep 2024 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MfR08txx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064210ED2F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:51 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso6420237a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240129; x=1726844929; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aMyS4TGv+HH7D7PP1BOOaznRGSa+Pie/rUhrnOoO0p8=;
 b=MfR08txxtWhKm60qp/7IcCobJbrUbjozWCBkk+jomV2NvJwb/tDL0X0TD6RkGucN0e
 TFKE9/5QOrIq36z3N3pI4FGzqWmnGcN46XLKm7sabzV9y0DcHt4MDzA6cFGye5kZbux/
 M73f+lj5fxHrxRB1ZquhpK1k6z7JjoF3lAbTm00bOOoGVefTawJEnRQ/nDGP2P33J/pD
 CQOE/EoWQhJMZLzaL4xphGDqBAkZUTWoEvzBv6X7znIF6hD4o041F0LnCIAqzoE3viBR
 p14+mf2RqYkiYYzNjFzk9l/kf62uQk+MaJd7uYOTkAoQcT1Z3mwNz2jT5zRQcR0fqCAV
 SXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240129; x=1726844929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMyS4TGv+HH7D7PP1BOOaznRGSa+Pie/rUhrnOoO0p8=;
 b=K4egkeNIfoMbfpqIbFj744mI/Em/2RKINyzK7IuZCE+tMu9hsTPXT/HHMsG8NvEY7/
 ds5hZLPeV15aFH29LBjL2k5BuvPqMyAmpCJayYO1GZq+BhrC5NivnB0na274QeRc8ShY
 EwV1G4WiLEPxo+i0U4SYpxcsWg8Y/Ls1XXlezieQXXM0lBS6Iofq70zj0aZ8LK0oulP+
 5WlHtBafjVqXulonqk905lhNGSHvH2Bikmn+cQdw9hIi0mtKKszLJvxoAT1U0U+/bLV0
 moj9lK2wJpoPK65tO+URqpvCwrQszmQbBlh8pIqb2KAn7VscdVyhC05senhlMj/BzJfs
 mAdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqCK2eLY2A1gktJQhKnk0ROwUnFeUgXB4zZ+HZmVFmpqk64zOAMGiVOPJOkMd5u6WwxvQ+wFibj6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEU8+1pGNtHxoRR5Roc4Zr2Imw9wnmI7bpMBQt8ISRFYhNkYCO
 ZSD4+Q7qbQfcL8HUBv84ogT53v2mXbNqzopydkHOpEqQO4Bg0Clo
X-Google-Smtp-Source: AGHT+IHSrEZZjUESARYQ6fIarJ7TrElR8MiGf6iIEpLCfKv9PblhIITrPdP+yNEt2KLdvqVkd+x0iw==
X-Received: by 2002:a05:6402:4144:b0:5c2:6f35:41af with SMTP id
 4fb4d7f45d1cf-5c4018e5d05mr17182296a12.16.1726240129470; 
 Fri, 13 Sep 2024 08:08:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:49 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:57 +0300
Subject: [PATCH v4 14/27] mfd: sec-core: add s2dos05 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-14-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1802;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=YbxXX5O1uF/FO7LjGr4qHVRuSX/d0hagRp09+kmoocw=;
 b=F+1j39KA2eCELndZF8q3la6rvLp0yMuYrqvtxV93pOaw2HT1vWbRSfjl+rA9qYN4xKfR+oXs4
 XFhJyAbMoYkDn8N8u94dQWU0o+kAVvUJZng5qVb6y3pq9e51TkboXTM
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

S2dos05 is a panel/touchscreen PMIC, often found in
Samsung phones. We define 2 sub-devices for which drivers will
be added in subsequent patches.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/mfd/sec-core.c           | 11 +++++++++++
 include/linux/mfd/samsung/core.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a6b0d7300b2d..cdfe738e1d76 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -34,6 +34,10 @@ static const struct mfd_cell s5m8767_devs[] = {
 	},
 };
 
+static const struct mfd_cell s2dos05_devs[] = {
+	{ .name = "s2dos05-regulator", },
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	{ .name = "s2mps11-regulator", },
 	{ .name = "s2mps14-rtc", },
@@ -83,6 +87,9 @@ static const struct of_device_id sec_dt_match[] = {
 	{
 		.compatible = "samsung,s5m8767-pmic",
 		.data = (void *)S5M8767X,
+	}, {
+		.compatible = "samsung,s2dos05",
+		.data = (void *)S2DOS05,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -339,6 +346,10 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 		sec_devs = s5m8767_devs;
 		num_sec_devs = ARRAY_SIZE(s5m8767_devs);
 		break;
+	case S2DOS05:
+		sec_devs = s2dos05_devs;
+		num_sec_devs = ARRAY_SIZE(s2dos05_devs);
+		break;
 	case S2MPA01:
 		sec_devs = s2mpa01_devs;
 		num_sec_devs = ARRAY_SIZE(s2mpa01_devs);
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index a212b9f72bc9..750274d41fc0 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -37,6 +37,7 @@ struct gpio_desc;
 
 enum sec_device_type {
 	S5M8767X,
+	S2DOS05,
 	S2MPA01,
 	S2MPS11X,
 	S2MPS13X,

-- 
2.39.2

