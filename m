Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD672DDFC5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE0889BB0;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DC96E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x20so40283028lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7Hru9c4axCiAf9woJy53kOley4NvjvqF4UHux0sYDU=;
 b=kyDq0EA5RNjnC/fsGqPlDaSkTFdkQ+aqw9zOQ278D359QGyusE4zOZi7/yU1vKwcGQ
 vpJ6V2Z+uyc5+PsbGqXMmj32yPiZMBfr2bW5dP3z+WLef2EpuUnhsHInIWa/fhQ2B3y2
 b/wkwz65gc+3GqQhmGZtJwt2LgAXl4ye6zUVJ3UWJ+W4DXLe6IX/ctqQJGa6XdWmKU66
 oALXwrQzsPwwEIZTf/wbM0+pzW6uVQcEuREGIwzmv4qOqZ8Z2Rldnfmr+1KlYWjrk/ex
 93MMad/N8JlL4jTBBcVY5oIYa4BQhNZtGqXo+o1byzoqF2CAaljHENTN2kvQf2wsq2N7
 drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7Hru9c4axCiAf9woJy53kOley4NvjvqF4UHux0sYDU=;
 b=rnKiYigAhB629CvC+skusLxbKLqjfzEWDeIVpoZurJWzclWEYVll6ZraVaMt12TvpC
 B6gM+NhLTDRpoYP9D6hoOAJpW/+bBECnfhYN6DpUzjyeH+a6B59kgPLBAJr/as/9whQR
 jJ++FNVl9i7dP47/9Ln3vCN5z8kH79KJARgOBVnrD2Y3607wIGUWXNidAMwa5H5Tn34W
 pQDDFs9UX2AvM0ae4fSx8+v3k+e9XJI1UFwOnFQJUCBNecX7Iry85DIK9V1Seavgrd1d
 jq4nUf0osbN2pGtpCsDGwK44eTyP56koWzEmqZZLu4gyPF2FgI3fxpuv4VbdNYAdJ8NS
 5+Zg==
X-Gm-Message-State: AOAM5328+KTQzaW1ES/bRrYbEFJCtqtfT2bZZs9DBH/TZMGqhm4qVJMV
 Fxcg9Uy5JNgTePXUWlOT/VU=
X-Google-Smtp-Source: ABdhPJyXeMpAOUP5Yrs/4jb7LSTsEn8j1plsmuT5R8wjgXCqnyhB5LwnYmxG5dzWY+sgDgnPDCNhTg==
X-Received: by 2002:a05:651c:2045:: with SMTP id
 t5mr211738ljo.462.1608228443423; 
 Thu, 17 Dec 2020 10:07:23 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:22 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 03/48] dt-bindings: memory: tegra124: emc: Replace core
 regulator with power domain
Date: Thu, 17 Dec 2020 21:05:53 +0300
Message-Id: <20201217180638.22748-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 09bde65e1955..2ab42b05e198 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,9 +37,9 @@ properties:
     description:
       phandle of the memory controller node
 
-  core-supply:
+  power-domains:
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle to the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -370,7 +370,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
