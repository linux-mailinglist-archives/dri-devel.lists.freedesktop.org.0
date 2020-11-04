Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E812A78DD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D24F6E9C8;
	Thu,  5 Nov 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DBB6E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o13so15392682ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bx8gx8+d1g03DAKla/SIGpVTuVq7snjdNHpSyCav3o=;
 b=E4fVzzEbN2YOZaT7L0YMq0MzZmwK0d5G6U1UdsHOygRHeg4qD9/kMAl31z/C7UvzgG
 3wfNw+SsSCew6J8BJc1FkTG6ol/t1QiIa1Ix/1hrZilYXxIBY4jsknB+cNHgZMWOJTA1
 LTytMvkcgBF8OEXqBMsuC5+boAbL6idy3aCojRnyMjNUn4VzjFvuIi1/qV8lMIsR3tjG
 Rklpa7X8zpedENSm9wa+kGSTC1tRrCSwsnqPBtDYo0M/PxgPvpCMC3lTZx6Vx3zR8JLi
 ituiJ3sgD8uk5s6N4B7KHODv4BIgVUZh8uuDolNZcIpSB4tutXKVidPdcwIjV5eBO8J+
 ebjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bx8gx8+d1g03DAKla/SIGpVTuVq7snjdNHpSyCav3o=;
 b=Sjws8CBGTqAdzQW8x3QU5TYALlccsvvXc6BpeACBPRvPJBSrAxWt6LALlKJtA0wWfs
 MQUR+KJyP5ISNUXCX0ZNKcFSNgfQm4OVgJRX4KwY9z3hqEKKN4c8V1zb8K2qSn8ADUXL
 bJk9Qfi2uuxuFQMxWOaQGENlazZvkfC5iknHZQnQUe/DpiTlGVEAlBVdO3o4TKh14aRw
 qnOAX7MCtO9m7JMzaKJk27f0m8V++0TJJLi8ubpM4QHBUl6NwGn4pihcKUAHxa6TOKjE
 VlWuevGpU3/lNYg3juyLCswU7eGZSpBOnD96Guim5piCeWwTVORtzRs094NmHGOWBMbN
 Nzug==
X-Gm-Message-State: AOAM532kQcfr5FchUcLAGQubJtx3TOuO0DVKro1/L3F8SooRJy4Q+j0G
 WUVX5jg8+tGsSmByVLpi4MI=
X-Google-Smtp-Source: ABdhPJwGNgNsjt7GM+mUEmujJb3ulRATwMxAQBV2JYiJ+8jaEaSL5rtWnNfZYbAIRZqj86M0zhzGjw==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr6607807ljg.460.1604508577584; 
 Wed, 04 Nov 2020 08:49:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:37 -0800 (PST)
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
Subject: [PATCH v7 06/47] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:42 +0300
Message-Id: <20201104164923.21238-7-digetx@gmail.com>
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
