Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A92987D0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622126E86E;
	Mon, 26 Oct 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597E96E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z2so9435993lfr.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eN3ruYqKrfAyq4fQITxNWZN/YF+MM8QbZauHCJzUFj8=;
 b=e8j1vcVbsn//921VHzcG4Z13o0XdteNjufi6m/hcVkJxyjh8uGT8Vdo9h8f9eJD/Ol
 GzctN2Ns9ukBEaURMG7X9/J7VCLYvTwR8+caX5QjIuX4P01pf8ZZUUZ1EDf4uP7+QBDx
 qzgpq74XsDqsLz1y8uVoBXanfVK1ySzaNKYDMMfjI6XhFieR2Peg2PcEOpwXD+XBnCOO
 goZLgQQu6J5+24ZaiBHnXg7AmWtIGHhXZBfWPztHa4OCj3QjOo4eOnMqiB2g3gpi5pyf
 wBN58I0GmRNrlbd5t3pNHzEV3ho0Wcl2t7urJAjrwZckszMg7NZlOj2D7805nPdYDLVq
 RR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eN3ruYqKrfAyq4fQITxNWZN/YF+MM8QbZauHCJzUFj8=;
 b=rhbXY7eBK27beCN53J85jVrSSz+o59iu2mPy6TexeftCu7Y9syaBKsxnqpELNdPlyb
 qdYNlos9iDes7J/ezetnq/VMk3XT0NMLaFDY6H12kr6kOUrkq4+K5mf8ZU94PPv/uQbB
 XAZvlEcyHCOlmaPy807YIqHjAogI5JDyLc6PrCNyIeJzypiTN8w95c04rax23sIzkAJc
 wxBwWWZSQI3vFOsNKHHkmh6S6IHx+9KCPg7YARKf1le+PzTg4DUGPAAk+6aiJYAG6Mhr
 IbiIB7Nq0KnX3qHy6Ako7kKPUqaomOVv9rp7d3SLGd9ZxfR+oL3GHF86L7dFVsMMrO2f
 JOpQ==
X-Gm-Message-State: AOAM533gnD+P+otgBQn0vSUa+zo/X0YpRPAFhxErxbbGF/lcMUwj8dzU
 TBMg6ilbYEcwdSWJtvPuydeB4ZjszZQ=
X-Google-Smtp-Source: ABdhPJyt7uQyGsis9xfuuxeNLDgYDdshhwcrGF5O56+tlL2oxr/7k/JBtfJhNzvtT1KvfyYMebNVGg==
X-Received: by 2002:a19:754:: with SMTP id 81mr4360935lfh.120.1603664295847;
 Sun, 25 Oct 2020 15:18:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:15 -0700 (PDT)
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
Subject: [PATCH v6 24/52] ARM: tegra: Add nvidia,
 memory-controller phandle to Tegra20 EMC device-tree
Date: Mon, 26 Oct 2020 01:17:07 +0300
Message-Id: <20201025221735.3062-25-digetx@gmail.com>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
