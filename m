Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1206DA2E2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409710ECDE;
	Thu,  6 Apr 2023 20:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AD610ECF9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lj25so4210734ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXFOj5XP6GGH/xdoeDcQ495WqTsc3jvxQGcIULPs+bA=;
 b=tAH530IsOfJwLPhjCRb2a6QLiFZ+A4sm93VHs6F2KU1UpCdiHUfq/w8KyepLOuG+JS
 VbATh4yTNe18i7hex3ZgKFUkiw0ZZ0yFZHXb5X7VEkIjfQR+3rvf81XZOl3L3/ZXg0Ak
 NfRF92uZAuY/FFvihjWGdG2NzU2+mHlC6Mb6bsTEraHlg1z+GeNKIaTVsHCBgW++TR4l
 I6knMQtQhxoBs/FZFfoVnQbbqOXa6WHlTFCxboFnXtYLlqzpXDH50kxvOtHQAFAAo30Z
 XK27U08kPOKn3KmigfbSCVEzGRhYqcJHuaBNPL1V6om3YrBPNsBUHnLqkBtgWk4SJvxA
 tWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXFOj5XP6GGH/xdoeDcQ495WqTsc3jvxQGcIULPs+bA=;
 b=Q2PbQtWz9fGGnFlgOgfDi+G7wVflRvBiquJ7+vBL/wjlHqy8+zn5abHUO5lZBVxIvz
 KmYUU/t4QxQxi+gUXYsHpH8MRaNl1Cq2fQgjBt7lclx/eePSFjU6rCH9UUfa7MAc/CTA
 /bAJ4vI+MbKBZ+xOLVFr2EWnDc4MI47Kz/aL4OefrEkF2XB/i0cMZtdEk6SHKZ1xt3Qn
 rNvGqkG138mA1ZUo5oZJer+muZe7N11aRCJHVIge0vDxu9wx9GiTp2QBEkY70XNXOIfU
 qhJQyvplJiYT1kyMulnlX+ZVSkXN0I6cxG7k5jYcMJ5X1cYVS1dlnJXH/I0Ues2bd4d4
 eF8w==
X-Gm-Message-State: AAQBX9e8QQ1/BTIjn/gRI9Qx73AMfv3oEIynN/vKvqe9BZNgpcZjjEYK
 WQPrLo8P4SEP0F56vxL8bqeALg==
X-Google-Smtp-Source: AKy350aCP7vJgYzvgsdr1w8OB+3cnrioQgc4Ehey8zq08G4w6/AHxqP7MSkD4NnYB5eXuIOSWR5N8g==
X-Received: by 2002:a17:906:68d7:b0:931:99b5:6791 with SMTP id
 y23-20020a17090668d700b0093199b56791mr105268ejr.72.1680813128037; 
 Thu, 06 Apr 2023 13:32:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:07 -0700 (PDT)
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
Subject: [PATCH 23/68] hwmon: k10temp: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:18 +0200
Message-Id: <20230406203103.3011503-24-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/k10temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 5a9d47a229e4..df8f08740c1c 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -332,7 +332,7 @@ static bool has_erratum_319(struct pci_dev *pdev)
 	       (boot_cpu_data.x86_model == 4 && boot_cpu_data.x86_stepping <= 2);
 }
 
-static const struct hwmon_channel_info *k10temp_info[] = {
+static const struct hwmon_channel_info * const k10temp_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
-- 
2.34.1

