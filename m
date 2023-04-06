Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339DB6DA2C0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE8110ECE6;
	Thu,  6 Apr 2023 20:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CFE10ECDC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g18so4212420ejx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0S7oRwHDmE/v1QzsyFUnvANXxR4q9mBgaxgNL4iOGw=;
 b=dSxWdns0zP2JtxETHi+2i1PXtp1GhQ++8Uh+/BzvVOX/h40Wie8Jn5vp75LFTFpHNY
 S/tT3An3a34mVKPyZE7LwjH24KSiJ5MANXMqiMQO9OvoJCYNYV8xE/gmaT0QiIpYfZ08
 6VRP7Wa+KHMRdAZvx80i2qebnP12as1I2Zh/+uErn6lZUOj3J1NF5cUDGuEVTvtVgbX7
 nXm1KH6swfdIG0ZN9BP0rik1nN/vgw+QK+XZuEltNP/LtufMw+relNzHZBwVNaoJjTd/
 BCGIsdJFmtTDzBjYsgn6JMfoSwyuPpTj5kPo/LAL6nxCZXHOr+L8abF9DW0rNYuuxxl/
 BhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0S7oRwHDmE/v1QzsyFUnvANXxR4q9mBgaxgNL4iOGw=;
 b=ebXGdQT7QPFMYWhOVqR5DAbUBDtVMt7XpPTbiySk6Vz/UkWHUC4RFEyh5wCPNggyqD
 VoVpBYjIsFeNPe2tk8XLHta7sX2z6S/D6n1TiqMZ06axR9EgmumfBozqgH6x6qL4SzWv
 OIAjgPNZDKG1GlVkFQKS9SBg/GngE+jqe1mjkC02f/3E/p9l93NISfoSIqkYwjBmtx0E
 mH7ihMIBlXSJ/5F1WQzsm6Bc2+ec05CzXHYLPg4G62KaDf6VkpSrzKLeJ90YwAzvPLjh
 nNyqrhXx9SkoFadzv4mnQG8rd/bs19cxQUjl4opLnkSiIvMGC2i4cDYvphMWl3m+5E9W
 QyUA==
X-Gm-Message-State: AAQBX9cWJN1wv0UqNYgCjt+p8B3WHFd1quiq9IPh6xCNz3DqvhI2xlti
 8PLZlCtq9KQgUVYQVDxoSIGv+Q==
X-Google-Smtp-Source: AKy350bea6rokcTyW2fB9+1WRlsLOQlE4zkFbEjh43ieE0cxbpyAZRFvYoquw85XKtp/c76b0gKEOA==
X-Received: by 2002:a17:906:844f:b0:877:8a55:2a26 with SMTP id
 e15-20020a170906844f00b008778a552a26mr129746ejy.60.1680813086034; 
 Thu, 06 Apr 2023 13:31:26 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:25 -0700 (PDT)
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
Subject: [PATCH 05/68] hwmon: adt7470: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:00 +0200
Message-Id: <20230406203103.3011503-6-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/adt7470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 927f8df05b7c..64f801b859ff 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1187,7 +1187,7 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 	.write = adt7470_write,
 };
 
-static const struct hwmon_channel_info *adt7470_info[] = {
+static const struct hwmon_channel_info * const adt7470_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
-- 
2.34.1

