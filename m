Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3332A78CA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999F66E9B4;
	Thu,  5 Nov 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEA96E226
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i6so28059276lfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaLXEDjIP3Iag/w2fX7ni9eaMug2cPZsxsXqnpeU2P0=;
 b=jU1LtOKTa1OCnxA2EvAhw8VWIKlCBTqza86WrKpewfv5UDC4XuW4u/3tUQtoiUPSbV
 0qmW5Gbz8IsaDineQtGolE4RHswCgvWUGdN4KfLiwdXip/wQxKn+R/N0StmVgZyqC8lk
 d8BRY3PVEFm4RnqQR1ImZw2IqCL4yRG9VHt+EFVYvKx5pYkxOEy62Gb/UiOMK9WbfMC7
 N0ZS3gGan9v+0JaIAdbEpAmRdy3puZkqFl3nMBmUtJgfBEM4sBx2z05vcxf4w2ybUy2X
 dRtYXwip9CaGjL95VhkB5n8W8ZfO0Q+I7yuDnIyBhRDpM64M99+PH2Mrfe5Q4OripU61
 dMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaLXEDjIP3Iag/w2fX7ni9eaMug2cPZsxsXqnpeU2P0=;
 b=Cs49Hk/t8SrQz9GXdWJThFXKtmu7r+MYD6zJl5UcuzzLibn9l8ClCcGdrxtcY8JLNo
 J3in9ymO05jAdoag5vfM08D0yrKMIW2MMi8KXyPvgMqDpgNq12y2DQGryq0lJegmtGkG
 qRTjdXUlZCMiZ8WnZiuaS3ScdmMZtRPUGdV+1jTifBZfhAIlguVd27LJmDwIyNeAnKKm
 Ut5co9gY7NVkMiVIe9sBhaVT7X7/hxcQfH9wFGv38oeGLQHWs7f1zj5P9kpGBwNq3tmj
 wSQaQQBqIQWW2tHGNq/tY6B90VzwMbQVhN9/c1o4zYnPQsif3WDrARX75Y7nxFXb90sI
 BBEQ==
X-Gm-Message-State: AOAM532paS82DovUhU7xv3qQRW7mowez/r8coy2UMgl17D0Y6y4/WN8h
 YQzXzXkdyfzACCRsj0/ACyY=
X-Google-Smtp-Source: ABdhPJw14MqYybDzcLqjY71bV/g9tODhxZ1LoCGsAysETlILk8YtOaRXbvBh3Mjq4ifD3OezTNn9Lg==
X-Received: by 2002:a19:e0c:: with SMTP id 12mr10739491lfo.328.1604508582300; 
 Wed, 04 Nov 2020 08:49:42 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:41 -0800 (PST)
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
Subject: [PATCH v7 10/47] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:46 +0300
Message-Id: <20201104164923.21238-11-digetx@gmail.com>
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 112bae2fcbbd..c243986db420 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -31,6 +31,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#interconnect-cells":
+    const: 0
+
   nvidia,memory-controller:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -214,6 +217,7 @@ required:
   - interrupts
   - clocks
   - nvidia,memory-controller
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -227,6 +231,8 @@ examples:
 
         nvidia,memory-controller = <&mc>;
 
+        #interconnect-cells = <0>;
+
         emc-timings-1 {
             nvidia,ram-code = <1>;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
