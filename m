Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4462A78D2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1456E1EE;
	Thu,  5 Nov 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C86C6E850
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i6so195716lfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDQcvrPMx8drC1s+JMdYzz1VL97g9qI4z34Z2y/XS6Y=;
 b=Dy8bsn+8gKozpA8LFXNo9rNaXYZi8RiG8JuZ7GCiOUv3f8EqLH9Yw1DWyrHCG7aXCa
 nBna2kBpxCxa6756mpfF/sRJLengE1u0981vSeVZ0iww1/R6MDBNg0z7cp8n3hpUWVSG
 FjsBHb432QblMRC0hfqqL4Td+fPBtzgidhCB8OrfImcHEK/zTulOsaqMZyxf2OL4je50
 7YzggrtiQ+LZ1ok9kxO8CnZAsV2JQjx98NF/dI6kmyaIX//EtNilxbc+Qcrm5rRwGz27
 NGH1GnvYdauAc1/ekPxqEtzZNVUC1H9TKTl5j5EZH60kcHtxQ9rJ2uyMKymZmVEh5kbP
 uWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDQcvrPMx8drC1s+JMdYzz1VL97g9qI4z34Z2y/XS6Y=;
 b=WejZquGc1RD/n54DWx2xza0IfzNIABPqZEV+yciotK2Jc5v8xqJCttYWODDSX4b8qk
 o2tctJyvlvPevycBVtIbzOkulp5/hNdyqrOHulKLcd23XkD1uZGdQf8fFyH+cUv7dQG+
 wIJAg6yWpHmLV8C5CHuK81kbUMzwQVx22byD9ie0wnvNs0m/5lrYvWt58Pjuv2mqIGdx
 rBbAKmbV8mdfXU9/v74JB7Wz2UjY6ic0lCIcW19ll9rUlSww637sxYzHQnyBStFHl0T3
 yVpyp29uSiskbToOgPiDgSWcs8vyW2QbYoag1PKC/lmIG9pnc8/8R3XQWchpaC/luFF6
 Q2Sg==
X-Gm-Message-State: AOAM530tj3rZsRurC7WTf7A3KyiIeOFkke6EPoVrTRCpVlQQMRKjfhgN
 u6uPNsL/gsc2PPnoJs+hAog=
X-Google-Smtp-Source: ABdhPJz3iuYSiUPzblNYJ3AouIs2I+aBCXK/4d5+EJAE3Br8G9yiMX5bbzdh7qOCN/1x3cb5bQOQVQ==
X-Received: by 2002:a19:8285:: with SMTP id e127mr54285lfd.270.1604533501645; 
 Wed, 04 Nov 2020 15:45:01 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:01 -0800 (PST)
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
Subject: [PATCH v1 04/30] media: dt: bindings: tegra-vde: Document OPP and
 voltage regulator properties
Date: Thu,  5 Nov 2020 02:44:01 +0300
Message-Id: <20201104234427.26477-5-digetx@gmail.com>
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
video decoder engine.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
index 602169b8aa19..9854fa9d3cd3 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
@@ -36,6 +36,16 @@ Optional properties:
 - reset-names : Must include the following entries:
   - mc
 - iommus: Must contain phandle to the IOMMU device node.
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- core-supply: Phandle to voltage regulator of the SoC "core" power domain.
+
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
 
 Example:
 
@@ -61,4 +71,6 @@ video-codec@6001a000 {
 	reset-names = "vde", "mc";
 	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
 	iommus = <&mc TEGRA_SWGROUP_VDE>;
+	operating-points-v2 = <&dvfs_opp_table>;
+	core-supply = <&vdd_core>;
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
