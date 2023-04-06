Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD76DA2FB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D3410ED08;
	Thu,  6 Apr 2023 20:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C817510ED08
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g18so4217916ejj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yu09rRuq25z5vSgNy1uvwATC8+EvP1JWMz5329MS+70=;
 b=Er6spU2uAbZju8iYd4yhN6tt1CtOtNQzNFT+yYRHnRP/5jjQX8N7RirDF6DGIA2kQC
 83ax5VbrN5FgKerCnIzVQRZMjJexJomDZ6LtuwTtKSTbMwGHrnnNVDHjqvBC/EN8X/Av
 wjwSqiHeFGRx+IcD7T0WLfTlgtbcbe3vbzRL0pdLBB81Ib+1n7Bs9v01REshrVjYUxiS
 UhPaAOfCNuKPtZn1KxaQw0H3ZXwUYN1XNJRTjDD/yoH9gkq2ZblWiqGCH1tWaQABrTzS
 8aRY2nKPl6D1rzBKjoDf4j6OlLG0MYNalyJU9fGGy0+Oos2YirdAkawRLXpdBI96qpZ5
 utOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu09rRuq25z5vSgNy1uvwATC8+EvP1JWMz5329MS+70=;
 b=iJ/pvyB0sW8XNMrBYOftagGd4OQd6NxpHCh2DGQOUcfef7knXnLjNAu4wktDkmtHEI
 dOFtZiziQwE6mPfc1DCVCzcOwtOlWbEpkB+hU9GTUyaEM/MTaH9E0g/wwIg47K5bjgWz
 h2sVfW1IFviC6/yi5VNtpkAI4AYv8edKqLw5KAJJDjg1efOS5HBjAMdTWGNjhgGGTNJ9
 Wbq+25lBiLXcD7R4OKPuG8J8w3mJYuqY6kvtg02/ixLV4qd3itpmFYy3kTrs92KKkJVa
 4SV+P4blipQ3ruTBHpeFgFVGNCL6dwQ+41WTsZz7PhJl8o8UjT3aaspSTTlES5B7ijtW
 v1YA==
X-Gm-Message-State: AAQBX9c3NbebggIvxJV+GP90A3conLkOGg+6aOkHLvwchOKMCr9XT++n
 5wCQRhPrYORTjL96zB/FOsGBzw==
X-Google-Smtp-Source: AKy350Y2U0dgGwrPTwBB5Jgq8qLRVpEH7+smPCxiK1hop12hSkAyhsBX5i0qbVARF5sKL2C+fHU+5A==
X-Received: by 2002:a17:906:b206:b0:932:5f7d:db33 with SMTP id
 p6-20020a170906b20600b009325f7ddb33mr128737ejz.34.1680813162311; 
 Thu, 06 Apr 2023 13:32:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Oded Gabbay <ogabbay@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Clemens Ladisch <clemens@ladisch.de>, Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonas Malaco <jonas@protocubo.io>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans de Goede <hdegoede@redhat.com>, Michael Walle <michael@walle.cc>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Agathe Porte <agathe.porte@nokia.com>,
 Eric Tremblay <etremblay@distech-controls.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 37/68] hwmon: max31760: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:32 +0200
Message-Id: <20230406203103.3011503-38-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/max31760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 06d5f39dc33d..4489110f109c 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -318,7 +318,7 @@ static int max31760_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static const struct hwmon_channel_info *max31760_info[] = {
+static const struct hwmon_channel_info * const max31760_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-- 
2.34.1

