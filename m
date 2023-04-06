Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C06DA2BA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B818810ECD2;
	Thu,  6 Apr 2023 20:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748F10ECCE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g18so4210524ejj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sIWqsMomKx2PnPBWMVAcd7l87EB+JZ4zJtWBb4tmtA=;
 b=QiBjZo+smpaLDZPnZQ79Z/dEAr4MqaFcZVqqqialTjCXWVvpLK1kIifHK2HcJ4B3N7
 +VLEpX1SSwbzuzq6H3Rf+w5o/msSwZvE0mw+kJbt6rQTkz623WyZ1ca+vUy0UrEPwrop
 WaIxfowNxoYjnRYmFKtXGuhqHnASBsfU6CZV0Igr7sejZ92V+4V4QYLKQrMWtrRDlQOP
 lzm5MdIqkJDNdy9ppfSFbNTHyIhXQShGgadcfbODs49sL8uEem8nYlKfIjzTE5c7s9de
 db0FX8r1RpncYzo+w0IY734Uzhvi4pjTjVhTXqamE6hsP6uGZhyEkVVtGdWZci1BVJrv
 1bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sIWqsMomKx2PnPBWMVAcd7l87EB+JZ4zJtWBb4tmtA=;
 b=S8RiL/wmx0Q+CNHkNJkW37duR+jSTGXW5KtLL+Ctw2gWDoxFIq2A/Y3wwspi6xDof8
 6KzXwpI+5ju8GpJHXAv+aDUeDSdZPQbfIDj+as9NvW+ha0b5H55eTCxi42r6O1BhCfoU
 iYeI9yq9qXsbHOb/xqwae5A/Cj9SMieDJ+5iEKgoJ9GIG4WjUQbP8HLR/5nhQ98Xy+tp
 1cRGbmOrhx2SCY/eH9N+klJgtYWpEw41Y8mfnOSFGvG2R254nI/PxG6M22iCtFehgyzS
 7wSdYRQw/xcu8pZL3RZNQs06mv2N+QWsOXmGWDg3o5rmDMOdIC4qc+Vy382tRcWNX36F
 GQ3w==
X-Gm-Message-State: AAQBX9dFpBA1IIGDjZzoyc4JnIcEJZwwB3PW64X8aJbuDdnLCh0SYVjX
 nA7jSvk9VUF28rd5oF8ywdfjlQ==
X-Google-Smtp-Source: AKy350ZBPO6m6MZm+LGsb3QXB/VIdy6OyRxsTcyuYHJsvXj1X/J1jphOn0rvZiVk7Bg1a2y8pNsePQ==
X-Received: by 2002:a17:906:bc4b:b0:947:55ad:dd00 with SMTP id
 s11-20020a170906bc4b00b0094755addd00mr147468ejv.26.1680813079290; 
 Thu, 06 Apr 2023 13:31:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:18 -0700 (PDT)
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
Subject: [PATCH 02/68] hwmon: adm1177: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:29:57 +0200
Message-Id: <20230406203103.3011503-3-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/adm1177.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index be17a26a84f1..bfe070a1b501 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -168,7 +168,7 @@ static umode_t adm1177_is_visible(const void *data,
 	return 0;
 }
 
-static const struct hwmon_channel_info *adm1177_info[] = {
+static const struct hwmon_channel_info * const adm1177_info[] = {
 	HWMON_CHANNEL_INFO(curr,
 			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
 	HWMON_CHANNEL_INFO(in,
-- 
2.34.1

