Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22D2A7902
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488926E9E1;
	Thu,  5 Nov 2020 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB66E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l10so319059lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tp9Yqrg3ShDWskF8okk8dyCecDIPmsRhr05c/t0mOxA=;
 b=NdQEwwdMZ/yJ8OPkD9uloM0o9Ugj2c5ieJ8wp9NIAg4kjdkCRrrp6Ude1JYuYIY5el
 cQ6T9hxjtsLOMggnGayrIGviTd5zP5TmyeAhR19Q9fq/kaJCXx7OBuhnTCeqhvfrSguA
 Rv4ks7q4ok1WjbMowL1f6z63nyrF+GmoOHEaAOUS5Fxj/XKxQW14PgoN1eaL3naw79IX
 aLkXyfnX2RmIvqjqe6TajXkhlx2gBtY4zoXde/weS+BuPwWztMj9RUDljXw++NeoX+21
 CEVubhkQvuVQyjMvWVwLaZygJnsPTNBVNntcOhwNXbHdInAh8pVfdkI0IC9sCjSOa/LH
 qo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tp9Yqrg3ShDWskF8okk8dyCecDIPmsRhr05c/t0mOxA=;
 b=NR3pga8rsgraNFRXOWS5ogo43nlpJlQ1VIDwQNQvJ2o5UVU4qZB95ZEaJnQZXCEWS6
 LKwKpWNMneWFriuZQinwyKH9IFqnu1FPqYvejnjYX3ahd/SzqpCXWZLBcWJH/r+NnYQo
 bGDv6zXqI6VTMYFo7upOS1cJ2wCVNohWzli/6YqBPFu8/SIqcXjucH/ftmtXtM/7r/UB
 70+XIZS7DvTkABxHxaXumUQ7mgFZ90xdJhgGLzwlk6waa1Qz4OpVTw8i2XvbrElZoq9x
 BxC8g96OoZrz/IUe996aghLKxPSPYYx7Da9y0KHy+dVLKNp/qD570WAhJ62IocNLTh6j
 iNCQ==
X-Gm-Message-State: AOAM531iKFVnlJNvc3Rz2R3xLXsuB50T9e6XMsBDB7bEKZGFusI32iSf
 0LQKar9BhUegXosT9Bc1siE=
X-Google-Smtp-Source: ABdhPJyMzZS8yFbdeuBZmLEvuZcRuMGo/R+/3Gh1ylV5XVZW8SAuxgU/GPnV+T1exBhvuYiAMbxSkQ==
X-Received: by 2002:a05:651c:32a:: with SMTP id
 b10mr125604ljp.256.1604533500240; 
 Wed, 04 Nov 2020 15:45:00 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:44:59 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 03/30] dt-bindings: pwm: tegra: Document OPP and voltage
 regulator properties
Date: Thu,  5 Nov 2020 02:44:00 +0300
Message-Id: <20201104234427.26477-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new DVFS OPP table and voltage regulator properties of the
PWM controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
index 74c41e34c3b6..d4d1c44a2c04 100644
--- a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
@@ -32,6 +32,17 @@ The PWM node will have following optional properties.
 pinctrl-names:	Pin state names. Must be "default" and "sleep".
 pinctrl-0:	phandle for the default/active state of pin configurations.
 pinctrl-1:	phandle for the sleep state of pin configurations.
+core-supply:	phandle for voltage regulator of the SoC "core" power domain.
+
+operating-points-v2: see ../bindings/opp/opp.txt for details.
+
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
 
 Example:
 
@@ -42,6 +53,8 @@ Example:
 		clocks = <&tegra_car 17>;
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
+		operating-points-v2 = <&dvfs_opp_table>;
+		core-supply = <&vdd_core>;
 	};
 
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
