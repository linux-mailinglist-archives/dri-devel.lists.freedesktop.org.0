Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89032B3B0C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244489D58;
	Mon, 16 Nov 2020 01:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586C6E9F0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r9so22363185lfn.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=jf3ZImOwe577lJR439hGff+0i8ovX0KuZO7T4XuzzZejil3xAOChl0c8J/pJ9Mxi/n
 3itHvHWhjbbfhur0iH/pvxr0+PEdJc2KPuMbIucjve1Fal4jiselEMKvt+TntKEot8mV
 uFOzZR/5+4lzFZy6mUzGW/aZyuNWxWW8rjAOhgn1qu3RP4lg/1uFRL/fhg0CfPCi5Kjp
 adJxJHy3irbFxYw7wGN9t2ajRcrhlb77DFeT+qMHsDm7DCj79aIistXRHYVyz4GerZ9n
 2nnxCNnVik6t1jyfLpYEoLuGoIlY94zjzKbH5erFDuzW/7mqqvgxnTAkl3m2YGFKjzPD
 I8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=BrQ87Bd1Qi9ObwhntB5nywUeni+QcIxouABpSsAh74o/cQJ+YNtLNQboHQouNE18FO
 VHbH8u0ZT0bg/9Y8awRsZkCodkNui6aF8CJ/RxLlGL5/z/N0T8X33LzFHS5b6EqhIILu
 JTYw/zJUjyfjuzocLV4KS497NLWSa4Uv3wmY8RfQVdzkPrRWypySCfFTC1C3rtnlTiAF
 jka3uyCyhFirA+RFhIex8md7L0FaLlJ1DaaNqUzQ4bsjOg6lhnQ2VwmJB51ELVlA1kD6
 MzUZQ2BH7gt2JE2TT56t1lmUZtc2FJoxpmRDk94f8hcuSJ2iWq5pkSLbSiWXZCKfim3w
 Mtdg==
X-Gm-Message-State: AOAM533S1pTBijZHbpv0f1Bah7MddPADIDrr9Sx2Uj2wTQR0QUjJ1D9M
 RYxTYO8rCzbnLiUeEwr2Ju8=
X-Google-Smtp-Source: ABdhPJxQzbs4RynpvwJqImrX86voEs1LcyYYV1C1oOIDFRdpy/jt6pFm0Hrg8fWndzhUhV8uEolMlw==
X-Received: by 2002:a19:8110:: with SMTP id c16mr4220627lfd.372.1605476011517; 
 Sun, 15 Nov 2020 13:33:31 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:31 -0800 (PST)
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
Subject: [PATCH v9 14/17] ARM: tegra: Add nvidia,
 memory-controller phandle to Tegra20 EMC device-tree
Date: Mon, 16 Nov 2020 00:29:19 +0300
Message-Id: <20201115212922.4390-15-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add nvidia,memory-controller to the Tegra20 External Memory Controller
node. This allows to perform a direct lookup of the Memory Controller
instead of walking up the whole tree. This puts Tegra20 device-tree on
par with Tegra30+.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2e1304493f7d..8f8ad81916e7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -663,6 +663,8 @@ emc: memory-controller@7000f400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	fuse@7000f800 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
