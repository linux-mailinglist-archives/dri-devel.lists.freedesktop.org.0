Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C32987E4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BF66E8B8;
	Mon, 26 Oct 2020 08:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1E56E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:01 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a4so7701154lji.12
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaLXEDjIP3Iag/w2fX7ni9eaMug2cPZsxsXqnpeU2P0=;
 b=RDencuCb5Y6FxnxvSKraKK476CUoUGcrFMA6y9TBMMQtRuuOhSK+mzG7Umdg0uxjZj
 NcGWeqnplJ4XcQw1QW1PJu97jdNr3o4TtKLp8LXRbdgFszv/74srplgF1b9bgp27HJ0A
 EgTuqBgpUmL/RwzfBLJnnsRZwcRR5GxMxxuzUHNZjXfJ5929o0G9flJ52+n5sK8Vbs1k
 ni+vOzCRBOCFVabbOERAKBiGIBXcCrQa3nAEbNVS8TDm3gz/sYbuDvo4MBiUNnvaTiVo
 O41eE2wCTMvvJ3wfEiHdOqGKaDatnGEPJkImIr3ii0zgKER02po0rpg9iQNtLWSkZ45L
 eI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaLXEDjIP3Iag/w2fX7ni9eaMug2cPZsxsXqnpeU2P0=;
 b=IdDsjelUr9HI+FqcINBVrzLEVYWzIGUuzeUJA8dswZqDIs3nVzILAXsNfaTDKxFh8R
 8bTjmSINIiJoqbXTpjUWXx9/nD8aRw3UlnCrsUWWtDOx/3PwVB7xnz5MpyU5MW+8CEd5
 ziViYwi/SO6/nJL6uTur5KrqHuhtr5UetaDBIDjHLJGO4Qm46FdpXsNy0NHP5dOHm5cx
 WgMlcP7lcZzgHZMxRY25UL30QbRtpbIWqeCQaKwx2CXpK5976BU0Uzu+iEZw/VeeUrIi
 MLbUVYiRmvNNVoVBu9FTCsSNNugQ4NMi7O0NCdeZkbzTzNRKrU8rTd4i+ez28LuznnnU
 aGhg==
X-Gm-Message-State: AOAM531yvoOP4VStrEZrKig+uMaBbo0HjVKQOzmN8uagZvzG9jl2C/ID
 KnbSBwBj5gdenV/F+X3XkEM=
X-Google-Smtp-Source: ABdhPJwHNdos+BXaOsOCCap6LKKXDLIHLLbZkSkt3/MMApNT0gleMksSLiDUIBBERRGJ18qcGpIX3Q==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr4399665ljc.188.1603664280192; 
 Sun, 25 Oct 2020 15:18:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:59 -0700 (PDT)
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
Subject: [PATCH v6 10/52] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:53 +0300
Message-Id: <20201025221735.3062-11-digetx@gmail.com>
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
