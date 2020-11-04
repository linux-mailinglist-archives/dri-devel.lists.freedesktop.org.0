Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEE2A78D8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CED6E9DB;
	Thu,  5 Nov 2020 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A26E853
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 11so328255ljf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQimpkIRWNQnMpbdhCpUPNBZvo/GpufqvOqt4z0qAwA=;
 b=ERKSO83J6tv0QUdt8vnWSOE1GpIwg7mIR1JUrs4PyfgPVzV1mH7mEpyAJOsSR12xY3
 rsldAI/5QE2rxBoNdwYh3hxk/wzRAkSsKIoHuD22P4lN8jkkBxNCFgbBpKfwYVwMtiZk
 hY1Z1gChPo7sDA1p9MxN+Mx1EdAo2nz8TwGsz+e38nVaIbWMWUcpVKqUAWxqflyFUc2z
 zmVkx897k9/dL5uXgyLRVGwDyjmwfMJMHjINdfH3z7T1O6RmI6/62I+J/f3RaDIG1/F3
 b5/NryfWaEyEXi653d2wn4BVQldGJhyt9pi+F4OHBx7bGp4zD1BVXptYQfB0SIoKU8RY
 hraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQimpkIRWNQnMpbdhCpUPNBZvo/GpufqvOqt4z0qAwA=;
 b=pvWiu8oBo0pQGveAVpTt7aAkqXZYcs62nbc8TDW6Cb4sRlNllIVhH+yfLFUJdqHhqT
 w8DjMXmaz07K2ol+/hLOrQUrQAs/TQImyn662XuAq+LnnHOV9EfBUaBO1NCBR0q5OVa8
 dOUjA3MR4c3t6uugnc1TIzZv/Yfe5RbLqej0/zWKMmGfpZZzj7HneUj2FjC3K13KW4Zj
 lcCgDATr63sM2IysnUlRl3Mj/+rCUQZPeQq564h1fREnPBXLfVKmMh3ui9XdOUawluHU
 sN3C5r4M5NZ+LmfOgeD5OYUfOWNsRmvfsaWV1oYQaeurSpEwrv0/hP29sk2xL3GzYkan
 lK5w==
X-Gm-Message-State: AOAM530TmFfvj6MDDpCoY6yT4eWdScbaUx7oRFwtRZzf3Nb++wtmedZm
 jFU9T724Z/41ajmYptXn7tM=
X-Google-Smtp-Source: ABdhPJzqZV2lUSiNvg9T7GHr724oG0dGwDbtok/GVt9MVRYZxSxIwkdsf2v5hnfIaDwbq85V2zwywA==
X-Received: by 2002:a2e:b169:: with SMTP id a9mr156579ljm.84.1604533504504;
 Wed, 04 Nov 2020 15:45:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:04 -0800 (PST)
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
Subject: [PATCH v1 06/30] dt-bindings: usb: tegra-ehci: Document OPP and
 voltage regulator properties
Date: Thu,  5 Nov 2020 02:44:03 +0300
Message-Id: <20201104234427.26477-7-digetx@gmail.com>
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
Tegra EHCI controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
index f60785f73d3d..e4070ae21fd9 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
@@ -21,3 +21,5 @@ Required properties :
 Optional properties:
  - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
    USB ports, which need reset twice due to hardware issues.
+ - operating-points-v2: See ../bindings/opp/opp.txt for details.
+ - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
