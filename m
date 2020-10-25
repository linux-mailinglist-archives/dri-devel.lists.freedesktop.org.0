Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524082987CE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D40C6E86F;
	Mon, 26 Oct 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6756E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:00 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a5so7686115ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13zJHfR9di8Ydxi+LOybO5H+JCALzXt2g6wK8WiSzjg=;
 b=pi1Sw4iTWdKb3u7G44iN1Cn4RgCnmCKT4Cn7nwd/pzgIhehiAyjKgeZwn8hOqMufC8
 CcxG1AvW1OXc8hMCB/mf069RbwynyIxk3cOnZ75TphnMCqGtMzFr/NNpChu5WHdesqom
 VhoC1QhuKhGgPdVxdSGEc8pSq3os1bBpgOhCmkiL88VH4/TZEDZEkRAzyvN863grCoSk
 jpDODAyRwNcgM374p9+B1XSbDcwgCy42J3AAwmxe1CIz0M+WiTIxWrLkH8+CodCNeY5r
 MH2CAsIMLGx9S+gGicsKZFzrbhyoK4ZNA1rqvRGkz2tIIeOahH6TZNfUeyLasZtTUJ5e
 sO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13zJHfR9di8Ydxi+LOybO5H+JCALzXt2g6wK8WiSzjg=;
 b=ZkJBxUpbKI/ZfALILt8LUceiaaaoHnq/wtMo2oAnXB4t5fTEM8hKPkROdW2SWdMJwz
 FBYIVwtKg9D2pyIRKZqxMk9xDeE4JndbU1TWU+FlGFG39I/p22G6DgLT7MdFdCdBJBu7
 1QZCI4UwAENwK8a52LCuFLq3C//YMAhUVWZvIAp3+PWjb4ebWPerjMrYzaUdCYLAlhxR
 kzrXpwok21Qq4MGUa4+WK57DRNosPl3dVQ5/3NOb0DGfOisZlN/AdaXQxrIbkXA27l40
 OuASacJjqDuyTP2WUmoLpKRS4vfcsVZeWmGhA9xE/wngbBE0RSXSv5azmo4KM31CSh0E
 LJ9g==
X-Gm-Message-State: AOAM531WlqPNc/eurHWrYHgZ9LU7qR/cRe118ijdW7AELkPL4WQMg18h
 arE1yqic8/9o1Qt5LObNIeI=
X-Google-Smtp-Source: ABdhPJwBZUmmqpaGlJ6JyqCamZD1xU0AZutTv50uc7sLPs/Uo7oOfST7uP7der6j6DDav/QMe22Plg==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr4864460ljk.428.1603664279071; 
 Sun, 25 Oct 2020 15:17:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:58 -0700 (PDT)
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
Subject: [PATCH v6 09/52] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:52 +0300
Message-Id: <20201025221735.3062-10-digetx@gmail.com>
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
