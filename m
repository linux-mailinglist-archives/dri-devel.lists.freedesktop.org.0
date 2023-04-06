Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE336DA2CA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546510ECF2;
	Thu,  6 Apr 2023 20:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C4A10ECED
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n21so4220036ejz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q738x7YwOS0X3XmE9hZfN9Ce15/MYjfZeq6pSQ5ilpI=;
 b=zy7BsgELujF2TPKCiJuSaYGU32HQ47Wnx8gile3JZ+/AgQXY8WdeOW4obbFD1dAIRj
 uvJw+TfNSxls3c5pR8LDLmgLowzfPQsPuBV/CW056h9mYKnjpTUtCfltSV71rmQHN/z2
 /eyqN6fAe25ulQsOOcjeqVFUCuoARqhTmXUuHld3T29X0n09hsvJMgBzTEIMKTFW2km9
 /IXj7PDEAjhd4WAMeo8Fxh+szfqGiQOS0CXJTWgk4wpQ1uexo3u3NO41aKEWdOdVtnBL
 WqCMfNpldHDYZIWn27eqxOPcANqyCMYrQ5IKv4Si6qKXHV4X+Qh5rGVvEYsb/EPDUFMh
 Hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q738x7YwOS0X3XmE9hZfN9Ce15/MYjfZeq6pSQ5ilpI=;
 b=1PNvzRyjVWPLuyzpiZIl97GGNfqAo8Y2f0YgZ+CwncIklQAmLWjOowbVpscVbHMK3K
 4VCk/ePRyper7HaQ8yyFp7uPclTIvTbVeeC0d7gHsTXGF9nccOs/6hOa4pPpf+/UGprX
 fOFudgXm1gTttkWQNaH4tkjI2hnq0T4cGsn49M+xjUSRwUPQ+Unisr/G9SKbeSkXkPww
 tWXsy56wIfivRzh3fkeEdnXroERvF21nmQIIUoKbjkXQs+7KSwqcFpE6PjwpoWQsrPfU
 lx1s29gk038lEalki3YIsjBMsbcuIbN5TyK/iUzZRI5HEQDxI97HfLEzCyEtQvdp/jyx
 gMjQ==
X-Gm-Message-State: AAQBX9e+NrdK5x+3+ffRBKlj+UzyWg0oGwRVIpdNXmK8o16UMRM5qLM6
 D9Ka30ZoUQQNF3wdI5/7KjwR7Q==
X-Google-Smtp-Source: AKy350YG+aKLeJk+41CCwPZ32gqUjvwfzA9HY7Ve4lEg7WnoUkQNi0XJVnjTSA7FZiCwflxqK0bw0w==
X-Received: by 2002:a17:907:6ea6:b0:8f0:143d:ee34 with SMTP id
 sh38-20020a1709076ea600b008f0143dee34mr7334618ejc.1.1680813102050; 
 Thu, 06 Apr 2023 13:31:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:41 -0700 (PDT)
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
Subject: [PATCH 12/68] hwmon: corsair: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:07 +0200
Message-Id: <20230406203103.3011503-13-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/corsair-cpro.c | 2 +-
 drivers/hwmon/corsair-psu.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index fa6aa4fc8b52..463ab4296ede 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -385,7 +385,7 @@ static const struct hwmon_ops ccp_hwmon_ops = {
 	.write = ccp_write,
 };
 
-static const struct hwmon_channel_info *ccp_info[] = {
+static const struct hwmon_channel_info * const ccp_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 2210aa62e3d0..dc24c566d08b 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -571,7 +571,7 @@ static const struct hwmon_ops corsairpsu_hwmon_ops = {
 	.read_string	= corsairpsu_hwmon_ops_read_string,
 };
 
-static const struct hwmon_channel_info *corsairpsu_info[] = {
+static const struct hwmon_channel_info * const corsairpsu_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

