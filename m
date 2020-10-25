Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEF2987E0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974D6E890;
	Mon, 26 Oct 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1DF6E209
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 134so6685685ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWndnYNPQqILNSiWL6iTiqZhdvnXENgisKXO1ZAuXRA=;
 b=D3yF5UWrGIQD6Q6QkzMYFLRBW922gtSyUQwXc87g+6+DHWwRO9e/5vmexGHJ+BTs7R
 A344NC9u3pwugBvx8H65M+GDXcM0MnMfZExfEY60l0kJsJe0sEN/ujsabgxyRJbE3zd2
 yTcqGIJEUsgoaVfYx+1THkPjR85b9Z7YzkawHNcHOd2CO9CZUZEfHvnS2a1TDPuuqbxD
 S3SPnd8Oz5mAtLTYbj9dVikWdbJbdcIyMl4ikcPPCKm+d3GRYL0bpotDxgu3EalYg8gQ
 ij8+y2iNMB+WXhWxcLvtjH/iXuYQY3qUatyRFfsOgZ/NgeNE08mgArkSUKjaNGsDCH+P
 Df2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWndnYNPQqILNSiWL6iTiqZhdvnXENgisKXO1ZAuXRA=;
 b=O8yM0DWbQx01XVvUziey2ZSvKTra+370hZ7pm4qrFKIleUF6rFhETkoE8W8/9niUTC
 NitGoNWI3OPsAEuDZLro5EIjJTW2HA0aBY3MSApBjnoVZvkJsPQlqsQBQekfrhuw1ieS
 gW+kcAqPobVo/Nx95UGC9mjT8OlomU1UW7RXpsb+d7WbzeoUF+bLGJbf984CTaS+DqTi
 q3B1mpRUWpP8GNkRhKpwowP7e4WRuGFUx++1IGyIGbmw90LgLFUTvHaL66acjFUyeo/b
 MNZGgeXHNA0l9Fb/QRLONCERZOW+7V0gp1foFGqP5lqIiU46f8BgbZpeM8r4rOSUQc3w
 rOEw==
X-Gm-Message-State: AOAM533zIR++iDhCYfReqsw05sbGaRhkRFfmO+aXoCGgzrWfMw0WkdlX
 dtLCm86ILA1QpRjNV20TZzg=
X-Google-Smtp-Source: ABdhPJzi0WSxLH2DDzGc0b4e6DF3+sSPvg8oMr3VqgPstg50fpHlDvAVDRrKx78J3l/YaXTc72mrQg==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr4767803ljg.311.1603664282474; 
 Sun, 25 Oct 2020 15:18:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:02 -0700 (PDT)
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
Subject: [PATCH v6 12/52] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:55 +0300
Message-Id: <20201025221735.3062-13-digetx@gmail.com>
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

Memory controller is interconnected with memory clients and with the
External Memory Controller. Document new interconnect property which
turns memory controller into interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-mc.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 84d0339505b1..7b18b4d11e0a 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -40,6 +40,9 @@ properties:
   "#iommu-cells":
     const: 1
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -104,6 +107,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -119,6 +123,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-3 {
             nvidia,ram-code = <3>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
