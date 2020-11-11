Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB892AEA88
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9C889F4F;
	Wed, 11 Nov 2020 07:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B9E89E06
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so754394wrx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=c427F4P7nuBAI/UQwiYvu+O7DzW7XS2fssHniUEdNZb7OtBothsXZtTnvGeaODMdb0
 0OIexDzNgl8PBCaqXcZji9LtqBuX5ivbFrtiwGZ6e3PYOKZpjsDCbjj+PEU3pN1ff4IF
 HjwSc9gvvdryoJ4dp48TDgGEwNZkeM0e/2om2P+3UKDmSPYc3ea9msD4FFj1y+Ae9wlt
 Xf7r6hwmg1Mejy0Nl9bTAXzGmib9M0ynBVrWEqZLnuWh4rVze9yK6g8EOeSzqDRzUQsv
 AVLBnqk2VjJnz2iTwwXpFwxxiltSTVUS47fE1yNKWiCXYzrx7eKgXa2UbRjTFwbKweH9
 7CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=Ih5SSwQOABZwWmD1hMg/aoqBLkZXM5Jh4wLUBiMqnp9BaunWeZhfUO5b1WAdcxMqYC
 hO/uyS1GYBAzwbAxivKIXqVOlwHXEUmvRB0idahiMSC5tNoRR7zE3E6zbkymf0mCoRS9
 NL1xDsfS2UE/WfReg9GvMkVBN0ibw0qw/sats6SARk1SOCOB5UJO7HO4D2nBXP4BVVq7
 vgFgNgloisGwoSswK6NevrK41tk0T2SSr0BL7uBrHQWxnGQPbk4DbxQL1P57x144uXGF
 dOKJeB5MMk2M52ajvyvj0w+geQP/J2zpmW9CCW3w6EPTriMPBwmToYopBn2WpNKkxWgJ
 e2bA==
X-Gm-Message-State: AOAM5332wtMYaJuPMaTIKfmNYel3jdgnnN8AhUnaPgpsMythUJmNOAcH
 4F0RNX1q4C4hEZgGS7EAQ1s=
X-Google-Smtp-Source: ABdhPJwz1Mh0V9SDzyrUU21ceD6qnKETJJkRJqebGKi9J5nanHyy0k9Qlal7/vO4D/QNpOdcfnvXUA==
X-Received: by 2002:adf:e287:: with SMTP id v7mr27464179wri.252.1605057349373; 
 Tue, 10 Nov 2020 17:15:49 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:48 -0800 (PST)
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
Subject: [PATCH v8 23/26] ARM: tegra: Add nvidia,
 memory-controller phandle to Tegra20 EMC device-tree
Date: Wed, 11 Nov 2020 04:14:53 +0300
Message-Id: <20201111011456.7875-24-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
