Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B48418C16
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CEC6E7EA;
	Sun, 26 Sep 2021 22:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3DB6E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b15so67585182lfe.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
 b=n17OwVdrkj7Y4L1R9tjfVhXv+cgwadphs0AjRe5Y0i2moNAviWCc+UoOV07BeJQNSw
 wtNY9+e9OLovtBu/NaoV3b5ooNZVDcG+xZ9tuQhutTYA+Rcl9FT2OvtbQRwy5ibph0FC
 XuaB/RuBlOniAOKdvOW4l8FBlbQ7RL3sWHx6C/WSRC5PfRXKQkHL1wZoEQWQRjAfQOsB
 cVfvlnyQutOOdWgZVAlF4MA3szcxGtJ8RwvIdSZ5HS/vTVW7clZt8u8GSq32GGlVZuJw
 wS42eP0Zwlm9VrzTyg7rShqDmtQKB6aelU/z5CIf7SIxV37CVsl423DdH5TtCapRhcMz
 LqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
 b=msT6QwR1nJrOdIInAYSsQRbZZQXSdh7LjrCBOBm00MXaCJ1XtNNvYRbtj7sHkBrF6H
 g/kct3G5C8t/MEHnp/cMb8fYWoAF7jOuO1BKPftUdahMmvrxwIEEZyBEREMM6CTV1M6r
 xICo1U57KvbSWrxI5IlP6JYnYcXOa581TINoazILRMGipfPkztgQ00kL8daEteL9egdB
 9GkrDfONayzEf9a21ZnRkS1Osyw9wm/z1tR6S5ZmfVCqzpmQLhMIDh2jizMs5KTTg25N
 bOMrtb9FbyYB4O1STMVo4grQJ7V+/DD/czcHYMJWZGx87Cd4U1ekXl9/u61WbGkVYAp/
 fS7w==
X-Gm-Message-State: AOAM533x3/Wik4lq1Tj0p/rS/M/rnFlSW9DET+A/34SlP2WAydSefNNN
 uw1ADPWyGoDLg4wR0zYEKnM=
X-Google-Smtp-Source: ABdhPJyAW8fEFRtMs4lMIldQGDgrGCV7P13WNKC2dzvx+S/aHC5HbOsIUdN3yZj6Iybbiic2V/vFHg==
X-Received: by 2002:a05:6512:3caa:: with SMTP id
 h42mr21438411lfv.349.1632696173061; 
 Sun, 26 Sep 2021 15:42:53 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:52 -0700 (PDT)
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
Subject: [PATCH v13 23/35] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Mon, 27 Sep 2021 01:40:46 +0300
Message-Id: <20210926224058.1252-24-digetx@gmail.com>
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

