Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFC2A78DE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDA16E9D7;
	Thu,  5 Nov 2020 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CFC6E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i6so28059542lfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VouJsB+vObe9wiNi+HSaArrhjsYuOEOXN6ddwqBmoE=;
 b=i+A+m+U9oG9PJ2GgdcKu6s6FyOrcp/z8e4pJwLBBVNfvCvHQsAQ4TnbFvqLYOle4EK
 b9pbIRk5rVOi7nBO97CfZA6e4/dZvN3QDyH6Bx9ap8RFchDYecE6HfFRoUIuiZqu68gj
 4fUYV5lirqwpjscHeH2QPyfuLwEZyKY/Qr8W/bb/tQEcAzXENNol9OocqavGROzOEmPF
 PNEvyqFQUlaKxbuAHeimpTdNfvoSW0N8rHf7+ANiNWFGxArhNL4EwO85csk4g/SgLbHp
 eBdPaqLN/JiMCH5HWPiCaM1JjsN3oLnisz1hUpci6Xs+pKIlRziVFxecgFFNdkeSk5bZ
 bjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VouJsB+vObe9wiNi+HSaArrhjsYuOEOXN6ddwqBmoE=;
 b=hg6JJu9r2Ma40hLkwB3G4Y+tM5XVbNiMJmze9B21iEViWCNrYHkOm29JC/znnHk1Gb
 ZNbgh6HFD7MCAj0xQCb8jymVbEU8BAniG/t5a9ynWc+7nowfR2V0mqrSoCanw06ET/e/
 3Y6t8lo89FDT3vETBbeRgZAKdJRvOHKJiCO0Evwz0ZiXFrVr/wrAIR3puy2maAb82hxw
 aXakXXHtcHmIGhpxLoB4CQFLrjMLWHMVnVsz3+cGuhWXstgvJM8hlE1a2lT8uLfPtu/3
 Lp7NcXDl/F4BeIVKPziXdoTV/599E7/c8B1czQLlrStrNSzvBIJjEY7wiYw6e8NxYbRx
 iqWg==
X-Gm-Message-State: AOAM5316Up5ve0mdYfXESs/cIVpjxVy7F+J90P5JKP3wIQJZT68qq27q
 zAm5acNgT7NfbshkwwWTMxQ=
X-Google-Smtp-Source: ABdhPJw6FROJUyYHTBPZolgWGE8NhnAwFz7xveT9/gT29SFiGPKdwlSk6tt7dC7CuIkAEG1ySU0n6A==
X-Received: by 2002:a19:5d0:: with SMTP id 199mr5498039lff.69.1604508585799;
 Wed, 04 Nov 2020 08:49:45 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:45 -0800 (PST)
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
Subject: [PATCH v7 13/47] dt-bindings: memory: tegra124: emc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:49 +0300
Message-Id: <20201104164923.21238-14-digetx@gmail.com>
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

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
External Memory Controller into interconnect provider.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 8ae3dae42d6e..ac00832ceac1 100644
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
 
@@ -356,6 +360,8 @@ examples:
 
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
