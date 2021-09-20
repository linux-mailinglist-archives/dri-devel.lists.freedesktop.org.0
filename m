Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E5C412256
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BC86E82B;
	Mon, 20 Sep 2021 18:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5A26E7DA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z24so45176100lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
 b=d/8SR5QIcgc+jDwTQtsdPq+k7oz8LN8nm2hKa44BYP3xKD8eP1xglsSvu9u2Z8GdNw
 9ZYFSyWuKyyddfmH/XVzXertBV353KFlPLDtR5BQ1ZXR9lpYbD9JZsLWw4x6TYp4OYYQ
 RthRZAWri7TgAxJ9G0JJDZDISsLbF5IlP83Dmxa4mDtQsXwUTne3oXuFua5neFap1m50
 h+MqIvMgVMUBNxmf5413tepjwHAvxmGr/OuqAK2KUCScWzjcXUEHvs+wbBtmsZ+Lef2g
 YU66RBpbkuXxcLwygeobdrtPVjZDSlCXjK3IUHxkzPjPh+Nr+Uj7qc475Uc21UZJZoGv
 8cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
 b=bRRJbqmhyCL5PfjUXOOShpeOXPN3/BtZebS3bszF2CFB0mCNauhAC2BjPQE7JzPbTU
 EQdqlhvcyP58vCtFvgSz5NqlcmOXwWeOLI8SrhD2KBDn+xCiaXmFzF3sZaw9atSKkjUF
 lSUEfbwk2Gw3u2Ls46Q+7K034N2m3QTn0ZiIsjqYRClf4SFSx73SGJvvpkr9FEF0GrCK
 n5S58zEjtGvfyBzc8RnVAgwhlRXS27QR833vwf4D4eeISc1dJLzL4679kk+7P8/AmBt5
 A3NiD2ol1DAYG3i5Dv/bG5f5B1xh8OjS8xMMYuxTLJ7wzFucUcdyLkxOMQu3eR1CpIzU
 0vRg==
X-Gm-Message-State: AOAM5319L68cY3XiJhTQJ8S1ks4dQwuPEuMmpGrW8LiV5/ZBXtmtuZxW
 //QflVwFEnNdYxsRVBeSMSM=
X-Google-Smtp-Source: ABdhPJzNPlq6lQF+IFC+d1ak283Ur0/ZIjKZaw8UqSG6j6aTEX6i01IVn+xu3KeRoB6jLyboTMrPdA==
X-Received: by 2002:a05:6512:2348:: with SMTP id
 p8mr5974751lfu.431.1632161548573; 
 Mon, 20 Sep 2021 11:12:28 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:28 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v12 23/35] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Mon, 20 Sep 2021 21:11:33 +0300
Message-Id: <20210920181145.19543-24-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Document new OPP table and power domain properties of the video decoder
hardware.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
index 3b6c1f031e04..0b7d4d815707 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -68,6 +68,16 @@ properties:
     description:
       Phandle of the SRAM MMIO node.
 
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property,
+      which is a bitfield indicating SoC speedo or process ID mask.
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the SoC core power domain.
+
 required:
   - compatible
   - reg
@@ -104,4 +114,6 @@ examples:
       reset-names = "vde", "mc";
       resets = <&rst 61>, <&mem 13>;
       iommus = <&mem 15>;
+      operating-points-v2 = <&dvfs_opp_table>;
+      power-domains = <&domain>;
     };
-- 
2.32.0

