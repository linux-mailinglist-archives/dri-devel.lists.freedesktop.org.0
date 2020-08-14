Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860E245D5D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0B56E520;
	Mon, 17 Aug 2020 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB886EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:22 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b11so3938699lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMtVCA/+W3wZ2Mh397uGPjY2K7aozwFY+OdCulsbZKY=;
 b=HOT+B89KfZEhp40OvFSrg3vNw3Hm3bICpJH0SAvreADpTu2pg4jXv2YvjJ1wLkp2P6
 yWA6+9wlj34AW5CjCekuXdCkl/15MGl4iEcaWB7n/XfOJ5VxcXAQmBj7dQltMIUh9it5
 TV2WV47UuD4xu89RIgrr4+Fbs0pcTFBgs0ryCOPAThtFW7yFYVYBs3ty9efal3a3A6tE
 O+JYPc3ma4MD5xou6ha7fVkjyqpU4l94e35VbUmS6IInluT0LgEQN7qYzq7vp8QC0CMI
 9wRzaLo8FP0NNC7Fe7fv1dRreUrHiapQta7l7GKAxGb0K9FOzK/5fJgGVm1qyrnVyFZs
 6WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMtVCA/+W3wZ2Mh397uGPjY2K7aozwFY+OdCulsbZKY=;
 b=S2PTD753yWMn86UNi7wUf55mXEbe5N0wdhVVBbQyyqRYuEiKv+r2ISJ/Jqgdgl4omA
 hsKZCbBob9YmyAdsvQRPVZhgLibSdbBBPINouxfBfDRIJuhqdpJyFfO0jo6kBsn64A36
 5q1XsLDbPHya6WT9s+hyMwZI5aoNtwlLf8FEuE3aJTskkIvyr5YGCkF4xPyF9qkk/c8f
 Q0Pd3xSIdCwHbUOGbELglarJm1BNHop0IsggcfPzZsx+gCcw2UkDWYQ+Wb/cJ9ESRpNP
 sSRLKe+LWOoqfS2lMDr630MEjKeGuQJe+r7Ar7e235oS4Mox4Sdnr+vEfFJzvlKZXNSW
 Fnaw==
X-Gm-Message-State: AOAM533vqy8xv66VdahqNTgxm+mGGV73oIIV4EFcECvesRHVK9rV7rLm
 Di7mBjwMqxdYFX19W8gGYKc=
X-Google-Smtp-Source: ABdhPJxuSGGaGXcbC5IRQAu/n2OBRrEBSbs1XGbbyQXsUdDGOM8hvqUGx3Hz5n/nXH8LznMpybJddw==
X-Received: by 2002:a05:6512:330c:: with SMTP id
 k12mr3278745lfe.151.1597363641309; 
 Thu, 13 Aug 2020 17:07:21 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:20 -0700 (PDT)
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
Subject: [PATCH v5 18/36] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Fri, 14 Aug 2020 03:06:03 +0300
Message-Id: <20200814000621.8415-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
index e55328237df4..739b7c6f2e26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
@@ -16,6 +16,8 @@ Required properties:
   IOMMU specifier needed to encode an address. GART supports only a single
   address space that is shared by all devices, therefore no additional
   information needed for the address encoding.
+- #interconnect-cells : Should be 1. This cell represents memory client.
+  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>.
 
 Example:
 	mc: memory-controller@7000f000 {
@@ -27,6 +29,7 @@ Example:
 		interrupts = <GIC_SPI 77 0x04>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
 	video-codec@6001a000 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
