Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E399D418BC5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E656E5B9;
	Sun, 26 Sep 2021 22:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199E86E5AE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z24so69310726lfu.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6xrHF0JDm5yvfpc+kvah6ca7+v53gn0YbmmBZcvayY=;
 b=KTBp8TCCGq/owdZuVTDixCYSrDTCvyoPGPhnTXQZDuyWzz1TnDVS1NTdeLBjT4nZFf
 VFgQQq1+5AQ4fHNtht3Ss9wSyzSUPvewj0d1+bChvvdGBsW4NfmX4wac3oZu7lL2lgzi
 Ejg7kodc+O/JVWOO/B/u+OFYXGcbl10gKu3mynRYp6IvbsCg+pEc86qOeT3+lgtZz69a
 z02amcamXQh/vp9CQ20yvtkGytkZrhUdSleZ0lk69p5jH9GPM0Iz837+RbLJWQuyztOM
 0ySBuA7ZUlKBLUOBqdvMQ+RtBlP693qwqk9/ee0482ONvCEAQxg66CalLRktDkvsnJj3
 8TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6xrHF0JDm5yvfpc+kvah6ca7+v53gn0YbmmBZcvayY=;
 b=16zpzdn/3t8aWYeQ8Gdukuqww8z7WtDCbHivXP5PX1ECU4Nlk1I3RqMctvH+Pfau+S
 JKaVcM5HpUYZVLKf6yF262LmVb/l6ISJymeQrZDlAg0BNgPQyATl6jUEGBRsdR6R5HxP
 wdNFg/OOABxi2STW9QxDvqfZ/1Sd34ejPS8dqk051lFEFqCBeQtdldB7OSyprorcq2/v
 KGW984Ggvctm0u2F8QX3K6gLmAPpm2HG44MpdwVYLhAklvvcBLHLaqGUo9jMULNlrRZA
 70ZsR70PMZ4o8/8thpDTsS0jHiLWhkSPuNnPjRDUKoxK9Av0/lkVLS6/J3RkAEl7PabE
 Rauw==
X-Gm-Message-State: AOAM531HdW6qIkZ2zpnxRZOpMPTxyqpbSR3Vn5RlOLhhbodVq31bOJvi
 Q+6M52vH8wBZC0uNvKIq3dM=
X-Google-Smtp-Source: ABdhPJxubncUissBx4ZmD8hh1ZobZ1bSg2iuLfg7u6HmSwkWTeEZFopmJ73U5J0ZtcXnw31JdxV8+g==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr21099936lfi.309.1632696155401; 
 Sun, 26 Sep 2021 15:42:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:35 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 08/35] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Mon, 27 Sep 2021 01:40:31 +0300
Message-Id: <20210926224058.1252-9-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.32.0

