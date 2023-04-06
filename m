Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1E6DA2C7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BA210ECF0;
	Thu,  6 Apr 2023 20:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31CE10ECDC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id 18so4214189ejo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fstBy6yWcExH6RGLHLt2IS0s2Pvrh3Q8g8Pb+fMMd6I=;
 b=ZnhjZmqw++GXIV66u0SJMdSn0ABd8Ck+cMBwrxscy7ExiQKNxRSIZOVNB4YpQWAez4
 gVgFqj2axWjpWbqV4pgxLNCcmmnCDnN9rQmgr9PuBIoyhbQMG+dkJWUnKn1Cz3AZkuNT
 Wx4/GxsKwjAAoDqjrHgh1r6VJ6MRdrZAs4wpmZl8IUlIUG2Rh8Q9JiuiGnr1Ieq0gOMy
 g38xMZio5/a7kNGhbYZxTjWu7GiVPX83+sYjr5XeuYPuvmPAY3++28MbL1Bs4UUj9ZGB
 0M9AfZvvfLmaWCsHcuVMlmCSYu3BrmB/LXgBE6nZrzYkLuuGWSQD9y+UvrtXC6BVEifq
 6GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fstBy6yWcExH6RGLHLt2IS0s2Pvrh3Q8g8Pb+fMMd6I=;
 b=PPAXtigEzy/1tIfosB1S3/gS0+D+D0mWuDINTyR6aDJQnos3TN9Z/yn+v2h/BxL79a
 CQHBpSs5odGai3pXn0KizHkD/v9cAi7HR5ZfsGPb760anWQ2qqHjPbVhsCIXAaFqwW4r
 l212spRxHJdGu8w+QzVktz9nsfBS/2K1dAeq71rNkLgbA7sGHcNqZ2EPFK85a74YckSY
 HoGgYuXNT9+Vrh+H/rkDx2HngcHXyfv0i9iaSaeOKb9m7wd1VXr8JFVqXdt8LIyHVwCi
 /i0yGHw1LYpO5t9AwiPthkZ3yrns/6Dgv4CzAyyzzAfDqucXcedZpdTr5JJ9pucMg3ek
 Yg5w==
X-Gm-Message-State: AAQBX9deLk0mHRtZN2sOZFbVveF8iOpJDUUUtK6Va0sp5PhuCR5hC99r
 P6DYogp4wEBHmKl74xGqDbEgRA==
X-Google-Smtp-Source: AKy350a+NU0k+SMmkfaOKPj/I9Wth66NJKumih3jnB2M3CUI7kwp2CZYW1SslvpEMjt+glLhGWcj2w==
X-Received: by 2002:a17:906:f9ce:b0:93e:24f6:d7a3 with SMTP id
 lj14-20020a170906f9ce00b0093e24f6d7a3mr258509ejb.8.1680813095377; 
 Thu, 06 Apr 2023 13:31:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:34 -0700 (PDT)
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
Subject: [PATCH 09/68] hwmon: as370: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:04 +0200
Message-Id: <20230406203103.3011503-10-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/as370-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/as370-hwmon.c b/drivers/hwmon/as370-hwmon.c
index 63b5b2d6e593..fffbf385a57f 100644
--- a/drivers/hwmon/as370-hwmon.c
+++ b/drivers/hwmon/as370-hwmon.c
@@ -76,7 +76,7 @@ as370_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
 	}
 }
 
-static const struct hwmon_channel_info *as370_hwmon_info[] = {
+static const struct hwmon_channel_info * const as370_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
-- 
2.34.1

