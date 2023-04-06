Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27606DA2F2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F6310ECFB;
	Thu,  6 Apr 2023 20:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ACB10ED03
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g18so4216022ejj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDyUmonauZ8nm6n5G/LkXb2fBKeLEqNmyMFXN+56R/0=;
 b=YMS5yzUgMpMduF8w1083GJyyM6G6mP2dHeTaOtQucecobZTroK8AAqIAmDn6/gJfrG
 ixVUYsEiSU+LJT4zWFOe7Ptebv771vH7Vay68cGCplldTOwBeRcj1S0c47TJagJd9Ab0
 B0VIJAcrQ1aVhxBoW5MBMLiegaF47uXPlYUF0SJ6QCNdhhkinlV8OPOngm5VKzqrURVS
 50xVbFPq8CtFxAmoA7S3p7KME50ER3N2prf22Ax4x/dy9mtv9rg/XqrNnj4kjT7Dqwx/
 dxV/zlM/71fKfQn5h7ZzgAVkNSeuHav8BPytem0sIENRe/dSezZUULJjjpodkHqvG/Ex
 l2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDyUmonauZ8nm6n5G/LkXb2fBKeLEqNmyMFXN+56R/0=;
 b=jekrJjVOrONjF4I7Ts0hncS9mKMk2yR/HG5M60kG65gDZD3V2QMKujF+pXxcf2wI7K
 Xpbb4dTxCUFytUG3X2+YsQwRrpFfXurAqp1tFFt+ifFgv07LMBACSXE79YFfBNqAPpQz
 l4qA2vndSk6Q7ply8nUBfGPG/yYXgKfAUb1bl5Oc47ZP/RCVr6daEk1olKltZdR5ibLq
 jV2tohb5OEdfec1Nu9u9A1Jh3taJGSiCMRP1SlfTcFfhQa4V0xOo4jw1AHuKjh3wHvWf
 ZH83UHQHSL1/wqHX8md//VxozXWw64hMHB6O9Dvg34aNTSCoZdxPsoox43glUfSo6LGj
 Trdg==
X-Gm-Message-State: AAQBX9dvJEKFIIKQzWYYrXeZrXh+DVUXgbM5g99tIjRWhfZgxmk5nRLV
 c10HJjOg3CW47dtQrzqzwLGT3A==
X-Google-Smtp-Source: AKy350ZF8nPTGR4RDE9lm1XOWYeECS7YDWeUJSraSmbL162uZx4DgwowpRCXrEnbKVyGKSKX+TbtLw==
X-Received: by 2002:a17:906:80c9:b0:931:2306:f363 with SMTP id
 a9-20020a17090680c900b009312306f363mr150222ejx.21.1680813145115; 
 Thu, 06 Apr 2023 13:32:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:24 -0700 (PDT)
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
Subject: [PATCH 30/68] hwmon: lochnagar: constify pointers to
 hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:25 +0200
Message-Id: <20230406203103.3011503-31-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lochnagar-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 8b19adf2eeb0..9948e2f7208d 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -321,7 +321,7 @@ static const struct hwmon_ops lochnagar_ops = {
 	.write = lochnagar_write,
 };
 
-static const struct hwmon_channel_info *lochnagar_info[] = {
+static const struct hwmon_channel_info * const lochnagar_info[] = {
 	HWMON_CHANNEL_INFO(temp,  HWMON_T_INPUT),
 	HWMON_CHANNEL_INFO(in,    HWMON_I_INPUT | HWMON_I_LABEL,
 				  HWMON_I_INPUT | HWMON_I_LABEL,
-- 
2.34.1

