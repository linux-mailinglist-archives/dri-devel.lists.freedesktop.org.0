Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D512987E6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752C16E88E;
	Mon, 26 Oct 2020 08:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DCD6E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:02 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x16so7737617ljh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xIGrSZ6X+ak6zBINy7RZS8xGDxf4foS2bMs13tOL/o=;
 b=NkBDiifD/zDI1IWoNVHSzB6BXUKWj0bmzCRUjQkOXjXJj5bbeavfi//sykmu72M926
 uFvgVzhaIyBjIUfhx9xnOQQ1XGwvolTh3TwhuK27A/Rb0g44nJCj7nzx8a22mDYBRBIY
 vQ0fIcq2BYnGgneHw9LIv8Gw/3vrevGk4RYdZkC4hW26eu5gWZUJfU6jN/Enwr7EOe9J
 poGgzrVopKHU18IshUyGeay+S9q1I1aYs0gS5B2XffnX9LowRU+w8YLTAOR+moU3MWNA
 2a25Hq3EzFCJFFOEb86PwAPGbKHp+FM0QqTsYH1xPHgWUfHw/V8jQKbOR2eWxefz3D5N
 J+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xIGrSZ6X+ak6zBINy7RZS8xGDxf4foS2bMs13tOL/o=;
 b=REyvlslRYjo+MPcIVqAyQ/Q3yZqmq5QkqWshu5Ux5B5ePL4GflOo6rk9BgHAvWeN23
 v75fOABDvUmxBOANr9NuVAmvUr4vDyLMGT4asvusyNn6SLFajYjjtsFHgclaBALEkLhG
 3q2XTh9L2lKE0gFSYsSg3eMIRLbr1gsgxZ47HKfxRTp2kdfzQ48ZgstYDp8l3v2b2QTw
 Yv8qsZUqKHtp1A91j8RruKFvMPVjXFLRxTHi8Mav+yW6Eiq525Z2Eb+hQoQR2mRKkBSE
 XzlPKquy6qPhIsqFXYCPpeDXtJ8IfYZWjsiF62zcs7eMWS+5SovoTI3nScrWKQtW4u8p
 CaaA==
X-Gm-Message-State: AOAM530j+NSseZucRLh6xeHobhwGHTu09QC2n20FKjDF3840CRosWMuN
 BYBW3atE2fpeOoanOedh2fFV807dmfg=
X-Google-Smtp-Source: ABdhPJxXVlrmBcb0453eBCXLRSREXqV+o5rIXN7u7XAZfnIw5Inm5Yw1WMEb0ElXDmPWKiPz23Yk3w==
X-Received: by 2002:a2e:7601:: with SMTP id r1mr4308153ljc.54.1603664281328;
 Sun, 25 Oct 2020 15:18:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:00 -0700 (PDT)
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
Subject: [PATCH v6 11/52] dt-bindings: memory: tegra30: emc: Document OPP
 table and voltage regulator
Date: Mon, 26 Oct 2020 01:16:54 +0300
Message-Id: <20201025221735.3062-12-digetx@gmail.com>
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

Document new OPP table and voltage regulator properties which are needed
for supporting dynamic voltage-frequency scaling of the memory controller.
Some boards may have a fixed core voltage regulator, hence it's optional
because frequency scaling still may be desired.

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
