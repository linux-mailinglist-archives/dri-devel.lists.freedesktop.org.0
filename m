Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DA6DA2F8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4510ED09;
	Thu,  6 Apr 2023 20:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3510ED04
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:31 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id cw23so4219716ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6JbQJiorXC7teiECO3hQBxt4FlCv2MlUvUkFyuxz0k=;
 b=U1ICoYYwYwbOimkM7r9J3JON/FvSAKmAqIWF9gCVuWs3wiDIFQtgPQz/XK8W4diEsB
 eg5lQiZ+HP2WyZaBwXj8GEJlu4Q+QJPlmnOZGF0MguHwBvS2/iMP2yirU9rim7RbHAE3
 /ZDGABwquYh9GoCpLqOUunF/XtxxBCtJIq2RWwO9j1NR3GbtQwNrSW/ehxBTIuyY9Q9j
 lw6F/flDtl6Q4JW1pX0P1zj6gnu5Y8WrlTo9KrZtebRMn/OJr7yTONxCwePVGAypeYjN
 0aFTLsdhT4TcNHCGg3HPEmOHIWIvxb1kOfWf0EKAUE18sxqvCXvLTz7rt4JC0XSVzEKi
 +CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6JbQJiorXC7teiECO3hQBxt4FlCv2MlUvUkFyuxz0k=;
 b=NbLU4BagsK/GXmjr4q5pK+DhvKP0M0YsrlmUz4QBSuEDnHUGFK1IgJpZuM1ltnsm6X
 M5cBtCUZja2V3LpJOu1v7wlDiJRWYRekK8YinYXHTDKnRYlvc5CisFpzQxMNQXIey7j6
 ygGXsbRW8HUxxl/9mhVHGiD/h01DBGWiQY9AOqJmLfXGCBqXveBqPvfn3gDXfJbVB3K/
 4qHOMfsUgjDnW7GPSvv1zMhH8cKyegM7UenYt7jkIV1vbjTAPkpOlQNO/Vyj5GrABDGs
 JcDtlNC2kfhoi0VYrJ/kfulRJIvTesVcRNFmqZ3WSO4XcLf9tlvplFxFS+NRATo7gMtM
 bzRQ==
X-Gm-Message-State: AAQBX9cKdH1qAnYPj9PLk+U9mikbLU/oHjRjFku1lux3DqPaGW/STyzE
 kQjimnOf9noPs7R1y3bd9k1CbQ==
X-Google-Smtp-Source: AKy350bZbUwgdfxxvOH7aNNMLToPrjoY0uU/pjuSpPG3PsJDbgm/81WmB/eULaoFO7UA7TtjwHBtSQ==
X-Received: by 2002:a17:906:cc5d:b0:932:ac6c:7ef9 with SMTP id
 mm29-20020a170906cc5d00b00932ac6c7ef9mr142631ejb.22.1680813150619; 
 Thu, 06 Apr 2023 13:32:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:30 -0700 (PDT)
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
Subject: [PATCH 32/68] hwmon: ltc2992: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:27 +0200
Message-Id: <20230406203103.3011503-33-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ltc2992.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 69341de397cb..429a7f5837f0 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -812,7 +812,7 @@ static const struct hwmon_ops ltc2992_hwmon_ops = {
 	.write = ltc2992_write,
 };
 
-static const struct hwmon_channel_info *ltc2992_info[] = {
+static const struct hwmon_channel_info * const ltc2992_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_IN_RESET_HISTORY),
 	HWMON_CHANNEL_INFO(in,
-- 
2.34.1

