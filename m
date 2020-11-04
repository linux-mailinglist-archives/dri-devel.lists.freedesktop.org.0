Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C692A78F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FC26E9D5;
	Thu,  5 Nov 2020 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD26E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l10so2703952lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsN85nbqgTsS+El/SUQtmvE9KBR1cwbaNWWJDf0k4lI=;
 b=AJScU/2VUzKHgW+HOaC7NTJ41vUc4OxAtWpYQE0GFtojrKMFUpLQ745q30moeWMQon
 wdSZH2uwscd0ZtQ9Bxe/r8H76c5JsoD+DYz5P9HXNH0jWbXL3Qd/pUQIxrX+3YXHpktg
 OHlC9MvIadTH8DhHcqHoTzi0p9L/baJp6A352nxlijtsH4m9VdyC0QG3R5/rM5xeg1pn
 Cr95ssc0FkGQq7kFj4Ah5fSx8ng9IWh7aZhRSVwAx0Smf68mIuZZJYzt9QzIk7G55Fwv
 4QxHxt07hJywqn8vAAhoRNiEV2aIPTVlR6v7hOcjkyMimua468+F6/Oa3ruEJg48Ix0B
 05Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YsN85nbqgTsS+El/SUQtmvE9KBR1cwbaNWWJDf0k4lI=;
 b=Sr0++69xt7Rp7diiuu4aH8U3vq7KRv+21tTnuczld9nsiX4kfaWPWWA2kuvUKwUyc0
 P0jsLk6/UDe14W4XqU7lJwmmRkZdJvParoISr9Cj2OkGFe78zg1/l7xlpdGhH2hI2aGQ
 9EXC0qXv6nezg7+JtTJEocffPWdtyaxmxTo1z1dmc0hYfcYPR7mFoJZGjFo+XoET9nat
 kOtk3fQpHjtwaBDhfoJtB/i77P8fj+FNG7m8eCUBSKKkR/Bn2fOjUEh/HrMNXEGZPb6J
 9J5DMsmNVwYWAsNZV3GdaFn6X0g9VIHrDML2AQtdM0LM4HX+DFR6rpUgOlDo6sE+TPBI
 2sNg==
X-Gm-Message-State: AOAM532fOryx6+qiiobOoUTkybH2fTVs+OtZ6CawjiTw8T39kZv+9hS7
 w4eXhSZ/w0hQBHBTeOMQ7b4=
X-Google-Smtp-Source: ABdhPJyVVSkc3ic01jwE4gY9fzJuqHoq8xVpnZn9HxWe+YprF9XVQzXAYL9UyDIGqgA8ZUVOH735wA==
X-Received: by 2002:a2e:b4e9:: with SMTP id s9mr11895122ljm.141.1604508576389; 
 Wed, 04 Nov 2020 08:49:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:35 -0800 (PST)
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
Subject: [PATCH v7 05/47] dt-bindings: memory: tegra20: emc: Document nvidia,
 memory-controller property
Date: Wed,  4 Nov 2020 19:48:41 +0300
Message-Id: <20201104164923.21238-6-digetx@gmail.com>
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

Tegra20 External Memory Controller talks to DRAM chips and it needs to be
reprogrammed when memory frequency changes. Tegra Memory Controller sits
behind EMC and these controllers are tightly coupled. This patch adds the
new phandle property which allows to properly express connection of EMC
and MC hardware in a device-tree, it also put the Tegra20 EMC binding on
par with Tegra30+ EMC bindings, which is handy to have.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 567cffd37f3f..1b0d4417aad8 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -12,6 +12,7 @@ Properties:
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
+- nvidia,memory-controller : Phandle of the Memory Controller node.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -24,6 +25,7 @@ Example:
 		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
+		nvidia,memory-controller = <&mc>;
 	}
 
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
