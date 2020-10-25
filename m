Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2212987D7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16126E871;
	Mon, 26 Oct 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309476E20F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so7705353ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oT3sPxYlD0f5rXGVTXjyzzDhRaGcEVEDE7YAWGRs3gU=;
 b=JoyKX/QHfqWqa4YyD0X90GcfMoSm/O2cHzBgCzoDNuCH9SMX64wZ402uVy/4f3SHrV
 vUWhZRFhevJ0QofNW9iKCFas2rA4ecV1wPY74mOhtZcwqAD9QwhktH4NPJa+0ufHWAKS
 qtftWzxG/3KG/aQmG062y46nAHz7fRAF04LwFmsKJG3di03ylo7lt2ip4DMv/BCBd9OC
 AdoUaCjIDKtHywK3mQoT9vRSkC51vnrRL0bj5ZhWgINdIauD+pbkzygMaii7qn4QxhIv
 ewgZ3th9fvr9WX+liab1+wzMsDbDB8uYIt1UO24a2hTR1/BtXqZ9ZFLwhPZ8N1CmiPt9
 Wn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oT3sPxYlD0f5rXGVTXjyzzDhRaGcEVEDE7YAWGRs3gU=;
 b=AZaLtfyaynbWBqmH70ys7Y7SvktofMWg1kmk/io9YaQ7lCbu5SD+QyCv0no73yuqAZ
 2trzMOGpu3yZVfpngrbM0tPej2yZBmSnONKVzQ3Hb+XrxDlVO2iQ198wCthar8rkJZr5
 8K97JRm2rUBQcjKXaHjZPh47q08wAF03IBq7npe/s0UQAg0kVWUrljIo5vuuneFkQwAf
 KNALmSH+kn7zoyHXlnePj8RewN4Q5E2NdMYcv3fAwp+dO+crTmzdfULGKzhVQeVZVOv0
 6NXqut7MgnjFtJeCt7kmpSP0o1y/NhwZc733Libfo6CPDzv9Tg6NYHjRS2gW+owr+oV5
 EXiA==
X-Gm-Message-State: AOAM530WBYr5HTYW05L4RXQnQulhVycr9tj3vIJUoq8RMosbuMMrEwxY
 trmXaHle3xQI+/JrktzV0zc=
X-Google-Smtp-Source: ABdhPJyMT3ti+ZhxL7PMZN9YlmhstodXl+iv7QlqlUkp9W0m/vYM5YJpS2lYW8+Gy8ctqNqgIxUZUw==
X-Received: by 2002:a2e:87d2:: with SMTP id v18mr4291302ljj.371.1603664284677; 
 Sun, 25 Oct 2020 15:18:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:04 -0700 (PDT)
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
Subject: [PATCH v6 14/52] dt-bindings: memory: tegra124: emc: Document OPP
 table and voltage regulator
Date: Mon, 26 Oct 2020 01:16:57 +0300
Message-Id: <20201025221735.3062-15-digetx@gmail.com>
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
 .../memory-controllers/nvidia,tegra124-emc.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index ac00832ceac1..3f74cd173ba0 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,6 +37,15 @@ properties:
     description:
       phandle of the memory controller node
 
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
@@ -359,6 +368,8 @@ examples:
         clock-names = "emc";
 
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
