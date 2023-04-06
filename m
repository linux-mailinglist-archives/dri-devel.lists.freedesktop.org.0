Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EB6DA303
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77FD10ED10;
	Thu,  6 Apr 2023 20:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837B10ED0B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sg7so4217263ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyU4R7+rVxuTRbNla/dZpdNR+174rHG6NC4kuQr/+W4=;
 b=ZyrN+KeV4TLYQjcjz4bAGx6FzuzFIaHoyBJ5Q+EncEHnlNTdRX/2/NLxQnpRbIE5PT
 cDRXu63gYGKnCgiY/+fnjRbbfcJkLjU7J++SdbVaYF16jIHuufsGSww3oXT48GPvvCK0
 ejWy2bvrxJbVbkpOEmIcXBq9hcBM4TXyqYaFMFMd3jn9kOIrItEvSCSmwzn4J23gnxNk
 mFue/Ou4BfYZ+WhEV7A2nwxOuBJjYH34fxSLVVTDGCdxLgtpfR/EvIXNy/iITrRB/WIl
 qsihOJlw1tqaSVWLyacyyMg4f1GOJ8q0VJo6dAk9UUpZXTInEgb98q0RTNJTJgNUdXSe
 x3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyU4R7+rVxuTRbNla/dZpdNR+174rHG6NC4kuQr/+W4=;
 b=a5L6CwEFIDXXLK0YNj2RbgKU7BNZz2kDV/Q0PRuE0HDi9LKIUfPkpgvU1Z33KztPGD
 /m8KnpPRn9uyQml1Qb57cQ3ojxl5dMuBNOvyqBBlA5pjZ8HXgDmMt7FCO9xQaOMAAHcH
 NBkSSTEYVWPnNs7DdD0BFPw1pBmoYloGq9cdcQEky4M8OuH00K89/wGs2p+Tef3VKCLg
 xAjg2jUQAaAJaGRnMRy4W1gjMdtMjhQsFWmwBdEmAsO4DLFGE6u0eLOBsRcU/3jKCbVq
 FN7c5z659dylL7rrC5VRrj6rTy9PWStjh9b8RI8YKPQNERvApLa7ZwCCFWGCRaq3VUNx
 Galg==
X-Gm-Message-State: AAQBX9fWEIP4VjbQFpTx5BWtdP57MRpQihumtISoXZcWctqnk5b1z3td
 045t2NpWJaWBE4P4gkM4G6eKGw==
X-Google-Smtp-Source: AKy350bii7iEoKCPegCaCQ0FeAKw4HkZrsyHUjyITLNrI94PP6vX0m3OcrNQyQTeoBcZRZQaL0ysFw==
X-Received: by 2002:a17:906:399b:b0:932:a056:e77f with SMTP id
 h27-20020a170906399b00b00932a056e77fmr97415eje.60.1680813164450; 
 Thu, 06 Apr 2023 13:32:44 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:44 -0700 (PDT)
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
Subject: [PATCH 38/68] hwmon: max31790: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:33 +0200
Message-Id: <20230406203103.3011503-39-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max31790.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 20bf5ffadefe..6caba6e8ee8f 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -445,7 +445,7 @@ static umode_t max31790_is_visible(const void *data,
 	}
 }
 
-static const struct hwmon_channel_info *max31790_info[] = {
+static const struct hwmon_channel_info * const max31790_info[] = {
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
 			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
-- 
2.34.1

