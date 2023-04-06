Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370A6DA2D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424710ECF8;
	Thu,  6 Apr 2023 20:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7D610ED0C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qb20so4217493ejc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqwHPALogIS8o9t9XI2PCmXxA830L7wP+ne1/9jP4lo=;
 b=iv6ANrjKsFP0ZigiJpgOTigvQSupXqaPpqtdag1G16pm8J24/j8ce5L59ndg9RVJ8a
 sl8QwkCQWTZa9O0Gn+bvzggaqpnbYHvfeyTUgLOCg+ZDW5yNs3g7jACg1hxEmrqP7cyZ
 c+fnfEGydnbknteHJhk/qtPjj/w4qg5aJpXiiGry0lxJB+8tYqBOUrMBh3As3EW64IPN
 drOMGpdkrx43DerEn2p1hSLmMTEvdOhbYYG3ELOksDBAZeZLFmUxAShY+k8uUi1Z+sBm
 NNiZ2ZDu6CtGDXTvqDsNFktW/F/zGay+uRP5ntdsrwTrDA+k4/CDeQhtEoXayPoNfXj6
 N3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqwHPALogIS8o9t9XI2PCmXxA830L7wP+ne1/9jP4lo=;
 b=30HJxenpQSN0bDBA5115a8yXWMUei2E+xAaKyddoS0gsJgotrwShcA9KT9Y3R3UeqT
 u9RysxOtz8seEaoDTIwGvKcdbCcVq+rWkfujXJESpAEqLcu9BtT0BP65dXmpGrLx5vwm
 XYY726A8qzMZMDI1hkgCjMjeq/Zsl2555Bo6dcy9q67DG/5KcV4GAPkrW3AZqY1dNwVH
 8bcWVahajRItxnCkpzB8DTXWyfLkrDdB0Wuq0CCPYewet+JIJpcN6sxj0SdXFqSXklXA
 G40aVd2gldaDhAvgeoSf/PLHKSYfk6tTkxw0wMW2TUlhIENQc8NI8929XqJ67PszUtKB
 Xr0g==
X-Gm-Message-State: AAQBX9cuxFZWhBL7fOEkyN5MkD4m6M9lXH7RttOXGchSBJWvvPIyDeCT
 sRzDOfymRd9ijXvnsCRaS2Mc4w==
X-Google-Smtp-Source: AKy350YNTXkM6xAyWCAEyvanHLn+j8HqvbNU+aogRqOPOmE/HfD4bNGokqkvcOYR0LGhqiUrpvHSPQ==
X-Received: by 2002:a17:906:260d:b0:93b:62f:82a3 with SMTP id
 h13-20020a170906260d00b0093b062f82a3mr238281ejc.6.1680813118839; 
 Thu, 06 Apr 2023 13:31:58 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:58 -0700 (PDT)
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
Subject: [PATCH 19/68] hwmon: ina238: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:14 +0200
Message-Id: <20230406203103.3011503-20-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ina238.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 50eb9c5e132e..8af07bc0c50e 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -501,7 +501,7 @@ static umode_t ina238_is_visible(const void *drvdata,
 				HWMON_I_MAX | HWMON_I_MAX_ALARM | \
 				HWMON_I_MIN | HWMON_I_MIN_ALARM)
 
-static const struct hwmon_channel_info *ina238_info[] = {
+static const struct hwmon_channel_info * const ina238_info[] = {
 	HWMON_CHANNEL_INFO(in,
 			   /* 0: shunt voltage */
 			   INA238_HWMON_IN_CONFIG,
-- 
2.34.1

