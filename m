Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684752A7919
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8C6EA13;
	Thu,  5 Nov 2020 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0796E21A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:42 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so27977520lfp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13zJHfR9di8Ydxi+LOybO5H+JCALzXt2g6wK8WiSzjg=;
 b=t+6XmamOufud85gfyMGuCbFRnXH/pka7+DXkYhQq3VCFFSEvuLsvT/RYOOG2zit/v+
 DH/OLrTipaYalni61+oeoO3/7u84O5R5Phy9YzK2RevmSVcp2gnlyfZfAhm7h4/ZH8cd
 7DpxAk2by+O/uw6YAq8CfQYoCdQ7umQiL8Zzf+xuUMXXYMUpTKZDso8ez+UT2MVdbbr7
 7piRmA6pTCTWJxwwNiFAWxGPBZWfbwBU6mCWoo+b06xnj05+hqgiklRggG3uEah/2aqz
 Rj0ADEcNQAJ2XRayKBWGOhvMriNvkkapI1ud+5e1wQ/jr0Lcs3IUVjwrTb6+uaBT2JZX
 Ee7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13zJHfR9di8Ydxi+LOybO5H+JCALzXt2g6wK8WiSzjg=;
 b=lfEUSjPoALF2OHI5zS7rPl19zj2kkZNtpnetIg6id+t9W/Qcf5LE559pktVn0D8xnH
 dQMDoJpXnrhVx+dmJBWFnQiuL/xJdrI6aCtCFWewBlc0eD+27ZYndsSRJ6pXFnXhNOjE
 BLT1XElAkVaTyiBZxlk8wo7om30QuDOduuXYXyspIFhJUSh9Hch1B+yciUPaHRinfk2j
 /T/Vd5nKpTQ/DQcjmfhUdXEHnWc87e5R57SrFZNmhcv/hXrVH696a3y6rfnMHAx4QMt+
 tAaU5a1Sz8qmbgOfhNub8frGqtTofZ/s2OXCyQT4+Ust7AmYHpaG4G2kLjvlSLDFhuTN
 JpUA==
X-Gm-Message-State: AOAM532c24qgTibrhKQJ6xyg0B8VaCPz0xGbKQDC1wZin8rHZ/Lq85dB
 htNnn2s8L7PZS1Ah+1qHX9dyQ3h5K8g=
X-Google-Smtp-Source: ABdhPJx3MXf1ifZHHtSGhKEXSuUOoWS5aH6HQ2rKgpVEkQPSr1h0IPaDi1gyerE0+/GxhDL58Mu8tQ==
X-Received: by 2002:ac2:592f:: with SMTP id v15mr6582641lfi.512.1604508581136; 
 Wed, 04 Nov 2020 08:49:41 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:40 -0800 (PST)
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
Subject: [PATCH v7 09/47] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:45 +0300
Message-Id: <20201104164923.21238-10-digetx@gmail.com>
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

Memory controller is interconnected with memory clients and with the
External Memory Controller. Document new interconnect property which
turns memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
index 84fd57bcf0dc..5436e6d420bc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
@@ -57,6 +57,9 @@ properties:
   "#iommu-cells":
     const: 1
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -120,6 +123,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -135,6 +139,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-1 {
             nvidia,ram-code = <1>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
