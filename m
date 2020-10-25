Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FB2987BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5DF6E83B;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072D66E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 23so7704371ljv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bx8gx8+d1g03DAKla/SIGpVTuVq7snjdNHpSyCav3o=;
 b=i947Rcj1upUno+xtTpk05tqFfb8+q/5AIzJJvuhnPOcfBtRNeVcE8iww4PN98oK+3z
 xxrAvSpkFvy9hrpK351SoA7AZyki2zig6s/0uSyjzUvlPLTTgTqft54DEjo4rVGospAq
 8Xe7h2hJj6AJdjUYZ+uuxLwX6vqQ7xGUL3xUA79RAPMnMXA0m0CPeNTXQo1XtHgwiw3c
 wMS7bL9Pw3Z96EaOw2TAqWJjtdhWJl2QRym5uLqITgcKLZXMurA58bdGTibokajBORWO
 wnnWUJPaxJGjzB4fe72NVtUiNdVNPflO361f0nHsEF5HSGu0iQj1SEFIn3/bWypLqSYH
 nXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bx8gx8+d1g03DAKla/SIGpVTuVq7snjdNHpSyCav3o=;
 b=LfKPQQ7ralWrn5VW323vWY8mOZlBFKsA+pgRviiKUkQZ/ezxDOaNk1cgOLb0iw1hhq
 xeNcDKGjr9PHpsTREW/41YStc8isa7k1YjBFoG3oeNGEqAImLFxEzHN3jqILP8GMlD5I
 T11cM/dIt6O/ijbJLAQpUff5/hgWm4nKJ0dBg9JEHHTS/s3mEIzaxG+gpvvKm2IM8ROd
 VETJ8DmWFIRlKmnsfNZtR7m8IpEtd2wz+mztfA15od54kPGamcjbJXFuQiuEuZXcvuPG
 /a+5xKOBEIsXwP05GXkZX1cb+SdYkwiuhGkhxKt9N7ISxEKkfzIsNkpMqd83N4jhcSnW
 ybrA==
X-Gm-Message-State: AOAM532pOXXXDeXPUpetDY0wIwNhTSIrT+5Y1O3AES1AMAex2o8cpBeq
 NaEuVzvAq9pVGR2Nan3WjtI=
X-Google-Smtp-Source: ABdhPJz+1LjXdbQ+D/yc8viE9lMCwBHY23zU4GE4LsvRVfk/mxSEXHmG1SbwFx1wcRejokAz+Em7+w==
X-Received: by 2002:a2e:7217:: with SMTP id n23mr4699165ljc.43.1603664274503; 
 Sun, 25 Oct 2020 15:17:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:54 -0700 (PDT)
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
Subject: [PATCH v6 05/52] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:48 +0300
Message-Id: <20201025221735.3062-6-digetx@gmail.com>
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
