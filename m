Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7C2DDFD3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C1D89D4B;
	Fri, 18 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0816E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m25so59777891lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJhYseBJYkwEkfQOyblPdMpOOHz4A7k16XFAy7Oga6w=;
 b=F5gtx0dqcxZkkcTo7UWZnaw7Qj9Ra9yO77AeY5iLggl9m6erRwHxn4BW1pJ97VJKGq
 YcV+1PWkv4C8mO3HuprA0toW5oQVPvXyvypDcHfQ3LBMW/83TcsKkn75giHcRn87HTw6
 QHwCfKcwAJgFjFtNJWyVh1MOkNixWO0nCb0tiEwngi5LyZ7owU4oF7G1k/+5HCx3qSNJ
 lCmnEQPNPTiNBzucIDBPweD4miL9n3PayTyhzS4PPj+lRRFXYO6GgrVItV4NhaeW9pUD
 tZEr43oWkWFIJ+ExDBzEDwy7s8y7AfoiZuB0VBikcGqe27kygYQJ0VNNhK+CFDbU67Dt
 ggHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJhYseBJYkwEkfQOyblPdMpOOHz4A7k16XFAy7Oga6w=;
 b=t0tTAP0P4CMETztdnkgomuZx66mvcP/yocbGY+qEU2FYLawPEImYkDTxdm9gnq8Yd4
 Jh/HEpKmyo+h5aIUf2v6Hnr9E/DOn7VbAS5VtHaszbFLpp/n94RSXHc3Q4HysUoKfCeb
 C3QIjs8HsMjD9CONU7PGgRgIYLAg6SdJ66L/S1drLR0PmqjABVTy+OKQI/BxshqmdnTx
 +rc8WuQbTt29wBsWKnwq+vcQxqTqS4tcbObF5MompEMmh3HMfnW4PEYULIVnL0hp+9Kw
 0xtybonAdIeNdLDKTfJsBxlgrlZaH2hAMzkv8CFURdaobpbcvBwHMoAjFkDDersPRqOi
 wfyg==
X-Gm-Message-State: AOAM532YKlEUUmLyBtZO20ZURHENZWXQ41qTaAwQ3fx9YDLKDCWRwmDw
 GUwKvdoqX7tpkpUPwogpavY=
X-Google-Smtp-Source: ABdhPJwIgGAwCQwaSYDTBeW0kNDGf+AD0VQyaJlAS233nqerThHuruFM4Tg3UsndwI906n0c5dBsSA==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr212325ljn.328.1608228445790; 
 Thu, 17 Dec 2020 10:07:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:25 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 05/48] media: dt: bindings: tegra-vde: Document OPP and
 power domain properties
Date: Thu, 17 Dec 2020 21:05:55 +0300
Message-Id: <20201217180638.22748-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new DVFS OPP table and power domain properties of the video
decoder engine.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
index 602169b8aa19..02fe2af3bd13 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
@@ -36,6 +36,16 @@ Optional properties:
 - reset-names : Must include the following entries:
   - mc
 - iommus: Must contain phandle to the IOMMU device node.
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- power-domains: Phandle to VDEC power domain.
+
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
 
 Example:
 
@@ -61,4 +71,6 @@ video-codec@6001a000 {
 	reset-names = "vde", "mc";
 	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
 	iommus = <&mc TEGRA_SWGROUP_VDE>;
+	operating-points-v2 = <&dvfs_opp_table>;
+	power-domains = <&domain>;
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
