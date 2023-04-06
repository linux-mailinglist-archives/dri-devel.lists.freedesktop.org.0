Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15686DA300
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D8510ED0D;
	Thu,  6 Apr 2023 20:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0010ED0C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:41 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jw24so4221715ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppNE/j5dH4h2kt/jgazVM6wfbsekqqd/ryXw3i4bi1M=;
 b=cQgako4VzcQupeFA8QvrnuOXoQ5KeRWJ1lAGsViufDEK8wPY4Nj5S1aYfozyq6/bU/
 NAv+2rf5QIGvFjbb0f7CinR03b1RxkXEQ+lyM5bhcW3jfUupKTOJM0+MLKGeSIi/trsn
 Eta0Qdrcxi7qmX81Um3MTiLu8D/Gu8SNu90BCc3E270I4w3xH3bfBQvomRv/y3/exaWl
 7j99fW+W+fbPgH5dvpuwWqDXwEi22ruCJXJZUvSo1epPn6D7ExpksQ4JsvQ3LxBx/IeP
 Ax1fkWw7nAUpf2oIGXMHplxMFJSXgv6mqpA136lolg5Ek1FMixre+pHiOjWYNQjLiOr5
 a9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppNE/j5dH4h2kt/jgazVM6wfbsekqqd/ryXw3i4bi1M=;
 b=Pp81itEtpsooHLZ513rFqFG42S74pEl2zSJxV9cBFIUc20XizPj2MUsdTXORucckeb
 YMnfs3uHJGqKMqaEjmmMyg8rUAcQpq7zOfxm+xQSnpVy7qXQpjmnzxDqTEKlIJ7b5v+f
 rKN8JvapskYW54CCOugpI8mFCcLxej1WHU2AaKcBtgiywnm3juW5BrNemUIy07t0ecB2
 +9EktCRzJqrMVFiuXn/OqiA+5zQRmbUDpX+3x5PDDhDsJSBQ4F1EegNOpvlOsD0gogk+
 7lkCtiBwQ6tJ6eC0uSxdm4eUN1hHTK6ByU0OwYwZVvpCmHBxXKNiUUnKcCbMlBFFFDeE
 E/hA==
X-Gm-Message-State: AAQBX9eJERmnu0EEhGq1rsEdAEwEo4VEe+PaLXaUs7jW3jSBRE2DqD5M
 nsRT/1QtNGisS2m5GuT74a2i8Q==
X-Google-Smtp-Source: AKy350aghcMvibuC07Vsb1fyHFGf7R3/xbMTh207yfOWRgC42TQZhq0hGqVSSQR51VINp6KB122GeA==
X-Received: by 2002:a17:906:f142:b0:948:f810:2960 with SMTP id
 gw2-20020a170906f14200b00948f8102960mr6266458ejb.22.1680813159668; 
 Thu, 06 Apr 2023 13:32:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:39 -0700 (PDT)
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
Subject: [PATCH 36/68] hwmon: max31730: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:31 +0200
Message-Id: <20230406203103.3011503-37-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max31730.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31730.c b/drivers/hwmon/max31730.c
index 746a767c9fc6..924333d89ce4 100644
--- a/drivers/hwmon/max31730.c
+++ b/drivers/hwmon/max31730.c
@@ -248,7 +248,7 @@ static umode_t max31730_is_visible(const void *data,
 	return 0;
 }
 
-static const struct hwmon_channel_info *max31730_info[] = {
+static const struct hwmon_channel_info * const max31730_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

