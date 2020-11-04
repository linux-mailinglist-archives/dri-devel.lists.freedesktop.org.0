Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AF2A78D9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088516E9CC;
	Thu,  5 Nov 2020 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39A16E852
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so333719ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6xeyw6ZqKT/K4JMygz/BmuhCT9ICHlbp1KBA4DEr4A=;
 b=nqm2X6ZZJuj9sZgSTybdOUi83IBwYn9f7Zvfx06NhWRHbQaEo61dn0AWICDKuDsAzX
 WcnvRncZgz7BZ9/CebWWEjbmvtTisywn31eZ4pmGs2UNS0RRtZfCOBhiTwow/n6mPe9r
 7agAHRD0R2EELNcElIqennHlgH8OGOPHoFL2PRl+Ja/SdoRvkx4BsTmnP2gpWNQvarxG
 SjryQPM6YqWLBzOv3L/jKhwY2mKEYxloqIA7EIeYrN+YlKNWbDi4sdhMPjwR1DWYKbqi
 vxBJYm1aGkZ0x3sS+0lBKRX7ZCwqw3mmTLFKmuBg1cW60xhkD71EveU4NYFDyWJAnfX8
 8m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6xeyw6ZqKT/K4JMygz/BmuhCT9ICHlbp1KBA4DEr4A=;
 b=ttdVzaKv/6Fk3EW38srBeowwPZBxthR5uhkiR7U1EVNzMCrpXrC2r6Qm4aYhvpWDx3
 L8o3Vvy9ygLZ5uL0W8SLYL0AMLfxzNEo81GhV/DONFuUbcKAWhOiD9fjbHYWt9ls9Mpq
 r3ss6BR2oltcWdt1dpcJFR0z+NsUWjCr/agno7EjE7wRVrCnERhPa9h1KKkRe+I50Eta
 5l/GPSUNvrt3wcicnRjgNeFf147yde2PIUWD5/7mJN5IgxzwFW6WlQFhxGlcvGrPf5zw
 bceT3k5dXQwHZfF6PCegpjDAdbEyktNKY44LECQBN17aQ/hF4HBnAauMVByCMzl8Jf5u
 mpxg==
X-Gm-Message-State: AOAM531Wi83kxrtSAGBjDqYuEr0bjEVHaJS5VkaxJIYv4nCjKPPpSyVC
 uuf96LC6MB3b0T0TY10vnXI=
X-Google-Smtp-Source: ABdhPJzDTd1dZ6QvpxBBESnqfpznl55p7ubyewQPaYA9itl922HIytqPgmIH/zsQSw8jZFmiQ9g1kA==
X-Received: by 2002:a2e:b619:: with SMTP id r25mr134978ljn.465.1604533503104; 
 Wed, 04 Nov 2020 15:45:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:02 -0800 (PST)
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
Subject: [PATCH v1 05/30] dt-binding: usb: ci-hdrc-usb2: Document OPP and
 voltage regulator properties
Date: Thu,  5 Nov 2020 02:44:02 +0300
Message-Id: <20201104234427.26477-6-digetx@gmail.com>
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

Document new OPP table and NVIDIA Tegra-specific voltage regulator
properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index a5c5db6a0b2d..f02a98201062 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -90,6 +90,7 @@ Optional properties:
   case, the "idle" state needs to pull down the data and strobe pin
   and the "active" state needs to pull up the strobe pin.
 - pinctrl-n: alternate pin modes
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 i.mx specific properties
 - fsl,usbmisc: phandler of non-core register device, with one
@@ -110,6 +111,9 @@ i.mx specific properties
   The range is from 0x0 to 0xf, the default value is 0x3.
   Details can refer to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
 
+Tegra specific properties
+- core-supply: phandle of voltage regulator of the SoC "core" power domain
+
 Example:
 
 	usb@f7ed0000 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
