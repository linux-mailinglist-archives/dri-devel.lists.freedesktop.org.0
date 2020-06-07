Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E81F0EFE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0206E39C;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCFE6E395
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x22so8885450lfd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vef4FqcCqXDmWHyU61FfP5+51JqO6VMkIdhuYGZmgG0=;
 b=TS8fGzYytLtTT/px0GlFwerGCThxAj5OO43kcgyM6cPOY7liUEu2g105G/da5bXHUi
 NrwqxCNx0e7Wn5G1Hdm7NvwcnKMweUospIXopYDf4MzxrSbZ0CpHSO51zEbLAIVzPaop
 6ynkgc+SLMAMgTDYwg+opo1dZbK7bcpnKHl8zDPbFbVJpU6z3pLoNamVRsBgGT9DEaie
 wC+Cg1Tvl0OYWf5bGXn+A/VbHXRFzWCR6OF7+28syjcug3tfQ/z1RnlRyAQ4+97t8of2
 mmGPtvmJJr5SoNPAhOVMafec78lP0SyrlX9b8KIYT8eNDzZ0BVxIzNoAvM2plOWWY4CP
 gs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vef4FqcCqXDmWHyU61FfP5+51JqO6VMkIdhuYGZmgG0=;
 b=ijtj9DMKsDHcPCQqqHtdrFz9do8m3K+Wy5Lm6ADd20atwKrue+t1vSFBNU+2OgmDrK
 u0YzzPyv/w7VMRmtC3i73XA3JOL0yMTj55BtjCLLTyarvS0L5NmIa4j/T6rtcP0eTYSf
 VCgAhxwfuq4rmk3R02eu6lNOVpE+XNQfkpD19M462BHK++Xf9+4oYHKyIrzDc3ow8drr
 Ie9oTiQkahuVeqlTm0T+7vPBVxWlEflG5Q5xMjOkbpaLnRRRBfzNmmZmDJFEgMIk7miT
 dXcSN/+M3PY3jx8nwWyWCO0Ng5HvQOFXWAVaY1+MgglM5jIFoAVOG2uN+kQFJPpiOSf3
 XgVQ==
X-Gm-Message-State: AOAM532YaqqSpr0M+AXQ6A+6a2L1T0Y5mxR9oATwEgQ6mhwkr7LPNrDO
 tfMdDzYH0QWl7bkOJYxiFbE=
X-Google-Smtp-Source: ABdhPJyU1ZfwlAOtsF5N+kWpO1lDlq6wJghIBRE9U+gCIClpNOA80FdDiwHkErGm1j28esods9vH1g==
X-Received: by 2002:ac2:5ecc:: with SMTP id d12mr10892740lfq.165.1591556255053; 
 Sun, 07 Jun 2020 11:57:35 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:34 -0700 (PDT)
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
Subject: [PATCH v3 19/39] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Sun,  7 Jun 2020 21:55:10 +0300
Message-Id: <20200607185530.18113-20-digetx@gmail.com>
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
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index add95367640b..f51da7662de4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -12,6 +12,7 @@ Properties:
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
+- #interconnect-cells : Should be 0.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -20,6 +21,7 @@ Example:
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
+		#interconnect-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f4000 0x200>;
 		interrupts = <0 78 0x04>;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
