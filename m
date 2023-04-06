Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A2C6DA2E3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35510ECF9;
	Thu,  6 Apr 2023 20:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E850A10ECDE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n21so4222374ejz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/VbBbLUbmYsB9ePpFHrMBDx88zoFjkZCXjdqcN0U5ek=;
 b=ZE1rxTOK1djFdNdrAhKpMrSEtLAvEiqF1wfNoSQfGz2WRdCnsAec1pqTEs7Aeh4Daz
 5hMt5SrvsdLX1fAyDf3lUt/+DfA9sjmR1d6QUjOBHKTVqNJPqrMp57Py4g66QZVmqeot
 KjrJ7q6eSgPe5k3qHOEXUOTE/1iZa3ULlbig9d57u2pyy7daZ5VYQdBbFWxWpOUnbRJ7
 VDlhFQInYWSZkQVNdTVB0VEtF7bx8Smb/GBymNgr+1QwqAW1u2jioBmcY7dQwFG9DQWS
 KjxVxjzNpMK/Eiwab5e+aRjsnXlglhvGPIdfnZzRxi8UA0fKEFgmHR1Gx/fsJATlPfMN
 QwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VbBbLUbmYsB9ePpFHrMBDx88zoFjkZCXjdqcN0U5ek=;
 b=MAtSwgYRLd1we3IRO10dzASphjxgHp4ukBArkuijKRfeyKbnzr/ovzKVg6zpmzytDY
 r7qhFHeoQl2kfKkN3nfAmDG6VhQCrfz3mt0MPLyNC5FlOcHmSc7sCl+fJ1LU45l1soCA
 +xSPP5kXwq7oHu6IDFnuTa/qmxLOeUDWVP531ADedG5TBvW5UhF2xFpwWoYLwTexbDCk
 CQ2eH8MX5D5hoAFsb9llrzPPy67diqTVA0sAG7I1Hy7Si+4BjpIskrR1fEnTlxHiPdhN
 0DjhFNtQ7CITkLASqicMYSP7xKgUQQp6yyBMx+i1OiUWIIdsS4ZdSdWXR6kVizY0ji6G
 70Qg==
X-Gm-Message-State: AAQBX9eBZBV74E24yMptba8cHcuqfaxZ6OzHFu4NnsWSOI6RmFLKa5pc
 2O9wrJtGfyV/dBph93dMUvOVPw==
X-Google-Smtp-Source: AKy350bFQoFbQgZJrlPh/DTc3IetAgrPSG6bX2Fm1fMb/g+BV9MwE0u2UuNjXkxdQKCAQMcL/H/nCQ==
X-Received: by 2002:a17:907:5ce:b0:931:20fd:3d09 with SMTP id
 wg14-20020a17090705ce00b0093120fd3d09mr7427601ejb.17.1680813130437; 
 Thu, 06 Apr 2023 13:32:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:10 -0700 (PDT)
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
Subject: [PATCH 24/68] hwmon: k8temp: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:19 +0200
Message-Id: <20230406203103.3011503-25-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/k8temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index f73bd4eceb28..2b80ac410cd1 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -118,7 +118,7 @@ static const struct hwmon_ops k8temp_ops = {
 	.read = k8temp_read,
 };
 
-static const struct hwmon_channel_info *k8temp_info[] = {
+static const struct hwmon_channel_info * const k8temp_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 		HWMON_T_INPUT, HWMON_T_INPUT, HWMON_T_INPUT, HWMON_T_INPUT),
 	NULL
-- 
2.34.1

