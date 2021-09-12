Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09264408031
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08966E079;
	Sun, 12 Sep 2021 20:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400DD6E072
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y132so5131891wmc.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
 b=WYlYCIHhy2AwhmX7L/AlwoRTFLRNk1Tw8KZ1cNf4Z2BgAk5gJUFFsDyiI8pBahl6s5
 CWTx8U8kQqpUC9d1Kf8UW3oIe3rg5dwKzaXaPmyg7lVuMXIceWpolx5f3LJKPUU87Bod
 3O7Lw+5Tjw2jpvqVMGOGBC9qMPlfztC63JbLV1QRppX1gNBIwTkmSK7wVXdpf2xO/RIR
 mKmyCaWGc1Dt2qQD3YL0XF5a3RJ5eAHEezXtRX5g508Tq82JkTJOiVmuZd4spjcZH8JY
 vwFG+NAvPyDBBTFXNnfKkQuETEecgQZy7+Tuc19oJuaNa11vCKL8YU+lmpseq99X/jCn
 Udiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
 b=j3tSOpo19fHwzxBRTpWvpZ8H5b8m96b57J5ilsrnNvYSmeH3gGayze3Z7tblUw8Sve
 1NKOhKfsw0eht9scfNMmPBR2PQluaefGMauz1bHyh2FYNnkaWClw6IwiahZPgE4X9ezo
 z3mcAMQSyQ6PKtBovTa9nOpb2MPQS06Wxg5WsXufzgKgtyFPw8i+3m4lXAEKBVqgdwET
 gFxjX/xn+yRUJLVgUyXRseYV253xsFSLjCL2UKoGrSXPYzEUlzpg18XnDuKes33BeeBT
 h0DMDDKQCbZOye31iQ4bMg5f043eBKQnR03xrn2zIL0x88BpdvQ3itvlqYeYaDfkt+0F
 RSfg==
X-Gm-Message-State: AOAM532UqCUBBu1CEC/k0SWKD40xmV4SSj0XQnZm7KXI2nbE36Zkqj1J
 f6qV2dCDKDSV4/szySj/UB0=
X-Google-Smtp-Source: ABdhPJwilD7uMmHHQ3Z72aCq5cGCPEr6BZMewoEYkEkrhgvxyF+teVEQagLVBgnOWAIx7IIGBJO7+w==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr7626369wmq.165.1631477429807; 
 Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
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
Subject: [PATCH v11 23/34] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Sun, 12 Sep 2021 23:08:21 +0300
Message-Id: <20210912200832.12312-24-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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

