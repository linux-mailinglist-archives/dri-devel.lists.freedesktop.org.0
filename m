Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548D2A791D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FD36EA0F;
	Thu,  5 Nov 2020 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AB16E239
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:44 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l2so28078755lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPe+0/YRUBexi5uMN/GkvJXoQXyO1wntuOhCKO4PYjA=;
 b=YQlZjqd3Y0ufLowRJA3QsB31Y7NpZIgj+06IXOQ6+eq9+UnKMvGEu24QLivpB6A7LQ
 2C4zW+03RNLuCWi8xFQ3gLq27KGfqOHNnckzGWy5EMLQX8IaP87Sts3240FZtSAKYN+E
 SUCUDbRt73VFUFuE8y7oUdcGaU5ZVsSyy63i/5N96/TwKBxQ5TMKlm7/iHexN1/xofuu
 925pFVVX4je6OnR3uoJqKOhnCNGrWKUj9Rh3RG5JRO4QyTHrS/K2WECqVzyMfyLQlPdN
 +sjgDWbxOGKXItzCcp9/TE2GjGEEO0gznzTODO5xC3nTw+nbnK9DUYjQB4uxiLkZw9gn
 OC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPe+0/YRUBexi5uMN/GkvJXoQXyO1wntuOhCKO4PYjA=;
 b=SxxvfevIlyZQneMKFe5KLG186Fo2qcEFKuAGDs4ezR1zPkdC1/dboFETDj8C7gU6TC
 cTrtwLy9/npzb1j2sUaDODtu0BdJW+vK5c7waFd0S/qnhkicMT/hno9ZQDjaJ8d0dd3N
 1VjM+2Lwx4PMaZkhLTekJO1oa/VOh4Br83rHkKxu3b8xRcS3CR0oX7q+10YtQLU5/9UI
 BRdwEaIbKpa3xzxWtMjoGnya5tz3ZDdyPQFY+gz9lbnlb1EQtQwhSQ+CZm3ZgU07zCik
 hsQ61inFOg9c70ek/aqW9Bu6zXD4q9cEfTvnbrbJrRwq8KBQQGB0RFCKnIWCjbuZdtZ0
 mRaw==
X-Gm-Message-State: AOAM531zorG2UU4xaOAdJIDEh9sJpCcyU5mkjO/bZEBCcdwOXa+K0ApA
 itj+9+N8tZFkkG7pcrGgPCGtQxRGSsc=
X-Google-Smtp-Source: ABdhPJwgk4Q5UghCChg1NU+InTF2TRZHDkQb/vK7YBZF0U7epGDBX9SNAFzBVs1YHi/JLGyKJCc3EQ==
X-Received: by 2002:a05:6512:358d:: with SMTP id
 m13mr10940243lfr.435.1604508583465; 
 Wed, 04 Nov 2020 08:49:43 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 11/47] dt-bindings: memory: tegra30: emc: Document OPP
 table and voltage regulator
Date: Wed,  4 Nov 2020 19:48:47 +0300
Message-Id: <20201104164923.21238-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new OPP table and voltage regulator properties which are needed
for supporting dynamic voltage-frequency scaling of the memory controller.
Some boards may have a fixed core voltage regulator, hence it's optional
because frequency scaling still may be desired.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra30-emc.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index c243986db420..0a2e2c0d0fdd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -39,6 +39,15 @@ properties:
     description:
       Phandle of the Memory Controller node.
 
+  core-supply:
+    description:
+      Phandle of voltage regulator of the SoC "core" power domain.
+
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property, which
+      is a bitfield indicating SoC speedo ID mask.
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -218,6 +227,7 @@ required:
   - clocks
   - nvidia,memory-controller
   - "#interconnect-cells"
+  - operating-points-v2
 
 additionalProperties: false
 
@@ -230,6 +240,8 @@ examples:
         clocks = <&tegra_car 57>;
 
         nvidia,memory-controller = <&mc>;
+        operating-points-v2 = <&dvfs_opp_table>;
+        core-supply = <&vdd_core>;
 
         #interconnect-cells = <0>;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
