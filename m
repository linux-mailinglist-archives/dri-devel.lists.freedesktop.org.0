Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00052A790B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863B6E9D4;
	Thu,  5 Nov 2020 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B278089E5A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:36 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so28078125lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4fEi3wCPpoua/qDylZx+LzNx6L93XnSjhKMe6q9RTI=;
 b=Ewh2p2GdPp3YErWuvEMBgwrJyrpprOiY9HGheGbE7yGeOgRh4QBLnjOfP3Z7J6V/WB
 rCunzf5c1YCFkQamSR5BPXH/rwDZWWGCLoAsAqM3Q7jmEYWMKmXWirHQXv9Q94bmDqGy
 czL3WgXgHUHeIrdzUCQe0dmm/jPDLUIjYpizFa2J9u1EFskOFQ5x4k0lS1hBLQju0gL7
 feB3SQEX3iofrOfTAlUdZGy4wOPpiO4dgF34prS2mpK9QbaXwJwrQukoRAE3Fnw5lHEE
 pNje1OHhaycPJod04a34HbSsk0lhi98gFglTejRdEA1C5EbdF6U42k1xFeHvVuRVqMbr
 7fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4fEi3wCPpoua/qDylZx+LzNx6L93XnSjhKMe6q9RTI=;
 b=T4wgcjakgFLqg8HnKUZD9+JFNWNGmUpM7DOO8vkl/OxOiCzlVwkkDnhDLxl0WacDcg
 ibHaEsWxcuzkAKoa5dXco2RCBGCiS/FCmJwgEkcmoqw4VRZkOytjv00wpcphJbpRoXW5
 fNNlurRCp7qNSBChdZfefIjNaWinKpOzsadFK8zhH1dS7vsbIr2e3ZEkhTuYA3UBGJoP
 aUzCahXLnsAQiBpxlwkluT2Vo9DS0arJnFHG/fqc3ca/tlQ3czOGImaMbvyf/67QVtd6
 /A6q5Zh2oHDXUdvEt3E4xVjGL7g0N15Tm0flm5N7OaOvHbljpTsU4iWe7kbWwQZ8nBGS
 W5RQ==
X-Gm-Message-State: AOAM533AHzipyEFz0uv10T+0i95In6WNUsAc4llO3OYQNCC1C2qhZSj/
 riquJZN6muLqaA/Ml7svxes=
X-Google-Smtp-Source: ABdhPJytaqJbhmbF+AyRx+dDbl9jnyMGeieAeK3YQ3FzCyw01EWXEE8xUVlyNtTNvsWUIPKw12LPpA==
X-Received: by 2002:a05:6512:290:: with SMTP id
 j16mr9505173lfp.62.1604508575190; 
 Wed, 04 Nov 2020 08:49:35 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:34 -0800 (PST)
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
Subject: [PATCH v7 04/47] dt-bindings: memory: tegra20: emc: Correct registers
 range in example
Date: Wed,  4 Nov 2020 19:48:40 +0300
Message-Id: <20201104164923.21238-5-digetx@gmail.com>
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

There is superfluous zero in the registers base address and registers
size should be twice bigger.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index add95367640b..567cffd37f3f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -21,7 +21,7 @@ Example:
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
-		reg = <0x7000f4000 0x200>;
+		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
