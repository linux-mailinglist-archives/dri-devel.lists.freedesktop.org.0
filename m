Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC783EE253
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3996E0AA;
	Tue, 17 Aug 2021 01:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FC66E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y6so13443835lje.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
 b=O20xXbpstS1K4NNNeIVcVXjBhGfcu2e5nNEJ5pDBYki1kIj4o5ZYIjru23tbYEGsyz
 r52Hf/+40WfMUNMEhvN72pmXl0XoPmEVNOOv8yUg6XmPcR6PW6ztKlm3dNhyGBEbaa7Y
 r09HKxsCu7pdY4G8ZxhjFl3L8Ms3XExvbjVxLlZReoy9dlFs4piRUc4FJoCVKmVfN6W+
 DvcxU+uSjJq+dyj9XuEHRIqCDane++wPVshyPW0s4dKK/D0v5UTDlCWSDUB7FBD6VcAn
 DSh/YDly+w0E3m8BW/O1X+usNpnRL02EHD/izGWDARukpTDuSfyZm9EWXzEP8jfQItxy
 Nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
 b=qPWsSJchj0lz6Lb3W+INC4U+Ml0PpIVFJMCKWGaRUAsz8t1qnaChal/g+DVu0MzaFZ
 6KZ9H88LlZB97YO/z+ukEzI+zCilpjDZ+sJH1ah8eNmeIVhE5mAltvPCdcrumkCTLrh3
 2dfj7n91O/+YvF719IjU4naD2o9drn1h2cTk2iZtdlfysVElS5//U6KhH/bneLu+n0oX
 rUouY/z+OxE6DyebgA0bJWy0QyLnWmpSVIPMWQUyrP/6woIEPIOOJ1UOPkuVCX8leTM0
 5dHv+p9wBNXgjC82/tGSaXC/6cUtVfrj9Oyg6IXrU0pZ+gMrRvgM19puNJtVL9a6Jh1U
 SFWw==
X-Gm-Message-State: AOAM5334GjX6nuBgh8dx5vZOODmw/55zXuIrogAamjMYkvFNiB81k9nR
 0PUFysSF96x+gBo3rQyGces=
X-Google-Smtp-Source: ABdhPJxhuZkUDfR36UaYb9aumi6B1iVfEXbSXNsdxNHhblZQHD87dEi21/QGQqgVOj5+f/BnA4ZsHw==
X-Received: by 2002:a2e:8147:: with SMTP id t7mr859862ljg.126.1629163812262;
 Mon, 16 Aug 2021 18:30:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:11 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Tue, 17 Aug 2021 04:27:29 +0300
Message-Id: <20210817012754.8710-10-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..07a08653798b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -18,6 +18,7 @@ Required properties:
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
+  - mc
   - host1x
 
 Optional properties:
@@ -197,6 +198,7 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
     - 2d
 
   Optional properties:
@@ -222,6 +224,8 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
-- 
2.32.0

