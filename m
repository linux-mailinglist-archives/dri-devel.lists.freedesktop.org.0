Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853B2987EF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCFB6E972;
	Mon, 26 Oct 2020 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163DB6E209
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m16so7719771ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWNk11rR3zsQMdytt/6fnv+TynDPjc7HuIWAQcw2oxg=;
 b=bmKU+d2lgw5ziYt2dnavqq/Qobws6M3xWT3qrB6T9DKe7MOJkP+K58tkKYQEOjoCMa
 1HJ6EHKr/I2L0oXpyHqhYuSq9XX7AVqTQrD2oIpEq2Lwfag8wpF5GCSwX3uVbMXlJNJh
 Yow9k/Ir70Up0bIAgn7JxkTABCdJMehW+vjgCsp304M1eKqcVbLj3MnJjpqLJE6ZznNW
 azReUgfGECkUkCeF04jDQERby2h5y3BbmlxDUP1wFMoofsDLXUS1WnWjckVXLiUllyI4
 1ELNhb0M7Ecw7R8bCWe+cVuDVwYvNf5SmptwJyexeiFHd/dthBkisjuLcS8hCUdWD3YY
 ox0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWNk11rR3zsQMdytt/6fnv+TynDPjc7HuIWAQcw2oxg=;
 b=nf7kE75/kStkcyrmRO/xTZgBprn6BdqvB9AG1tuGjkdn9w1/3nKQOUli/0w5U9KGq2
 ypn6mXOfALbSjmTWHjumzHf8EZxZNN0PvOCHpmMWii7ciM05UpKAibBr9TLiDNT8Kq5g
 +3Ym5hZoXJyK+xTYcdW7MVsnKADp6PnKcvP7wqzckM9vJajjGAMm2qnqh02LnlDlrl/e
 wZGVHvVQMbXcJWxsLNvd9xqUiu0E+KhY6JDCseGcOwlQNAGe1ufInG2Ku20J8YMsqxcu
 m95HjfGhZYKYFJj35qqM6ubM5/BYP+nQrWTAYkQlggIky0EQOWyXJrMf8Bm2fvYtse3q
 Bi6A==
X-Gm-Message-State: AOAM5333R2ITwNJ2uz1UqeHN+gbEAjkEpBLq3NGEHf2zo+thDa+RYZBl
 FA1AsonSwpWfAwcv131MS18=
X-Google-Smtp-Source: ABdhPJy3W++AY9ujNDBt9x5Vu82+g5NvtUk81oKYjNm/Bu/PyMcGDDsesvMHISONbUDRWkn7o1/60g==
X-Received: by 2002:a2e:b04a:: with SMTP id d10mr4916649ljl.81.1603664283581; 
 Sun, 25 Oct 2020 15:18:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:03 -0700 (PDT)
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
Subject: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:56 +0300
Message-Id: <20201025221735.3062-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
External Memory Controller into interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 278549f9e051..ac00832ceac1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -29,6 +29,9 @@ properties:
     items:
       - const: emc
 
+  "#interconnect-cells":
+    const: 0
+
   nvidia,memory-controller:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -327,6 +330,7 @@ required:
   - clocks
   - clock-names
   - nvidia,memory-controller
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -345,6 +349,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
     };
 
     external-memory-controller@7001b000 {
@@ -355,6 +360,8 @@ examples:
 
         nvidia,memory-controller = <&mc>;
 
+        #interconnect-cells = <0>;
+
         emc-timings-0 {
             nvidia,ram-code = <3>;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
