Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30B1F0EEA
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC536E1E0;
	Sun,  7 Jun 2020 19:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A696E19A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so17764138ljh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMNT0sLytr4m3uFIZANOy+2q8/EiZDnxOa5gRaq0ITs=;
 b=WxFPx9P951q6zhNwiu7nfhIwAwmMXaDNsPSAVwdgKPMJYHNXPcrt3D7bpEYjh9oxfL
 G1khneAFbD5BgxlsXZuDLDbyExuXUH4+mnjERHdGtYGD6hmVgWAKr9K+n/eGrF/A5/1L
 mOOpUKzx+3Jy9RNwWRpt7h0rq9oqkvVXwbIleWTqV/W7f2srEHpnblPKizlFgEh2OTdj
 /FLmepWnlGehT9uh4LT4xn1KUF6AEzC4raWPd65tmXAvD7/2JbVF8nORBhwyqLj9SEDj
 HTePsDwGIpaBVEbdIZm9gfXE7H7F3qdrIiM5G8whrl49JXUSJncCaUp7ZtUdhhH2OXV8
 JsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMNT0sLytr4m3uFIZANOy+2q8/EiZDnxOa5gRaq0ITs=;
 b=eCFpSiEjHhoFAx3i8rmouo/5j8lfp1CguvdeQREO8RyOs6QfhJ65I2tT1Xv1q06/fH
 vIyrhnscLcFgZg1ZWRiu8tAHTuynvspvcWQjKAP9PsT0AZu7w1evQdK6C15oIoDGYziW
 mycCQTWVt6K5wlO4E9t1MoSt6Oabi4+2jdNIiecsGm26wS0WN1j7kOQOtJXj+S6v0BWI
 Ngst6mGHF3UejuZC8Td3t1thLp6JSpAVSHet829IKrgBXTKFjROXV2W8dO5eUbbt4HrJ
 pdhiM+gGuMFEe43LeYV8o1tAO0AM9stMXYPa1NKoOSnvjwFLBEjFeL8UWX2K3VSrCWtV
 ZR0w==
X-Gm-Message-State: AOAM531Rr2eEgU1VHXBAzN66lxb0VatBMb2HjrtadjnDQMCAt1ZnUqV6
 pu0G+xDFXeo7ym9Qq6+wTLM=
X-Google-Smtp-Source: ABdhPJxLKr5apcZwbX/f2uhEc3CycsYIiHiI+rBTaaOK8RepC6wg3htdlRjBBxc+G5WYkEl20EzXOA==
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr8965864ljj.4.1591556257674;
 Sun, 07 Jun 2020 11:57:37 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 21/39] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Sun,  7 Jun 2020 21:55:12 +0300
Message-Id: <20200607185530.18113-22-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
external memory controller into interconnect provider.

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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
