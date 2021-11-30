Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D94642A3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026506E81F;
	Tue, 30 Nov 2021 23:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23906E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:21 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 207so44221751ljf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyjSvb4lk8LZ0fmi7jCFtYmjUWcyFJSJ9ZWFZBD+V/E=;
 b=MkhwEeO5+CdWqDlgitQ8yDbdzgWi6xh1tqG4982cZtFNn23ZgAFp7UUqDMMOMZQ9zr
 CLZmFy868oqlhjFA/PN8MsZONbNJi+2IafAu6MbsiH+cAepnux22bDTyXzo5d+Q10kHj
 yYTqy35mdksdJKEf2pM7tzrFkcBG7imAd3CkgkGQAwklUAKnQNsVfbc0ilhZMYOeuE0o
 TAARCpglriNMEXfI4vre2BQ2Cq71B1LawduNLAJfvU+r6gX7AhqwcqOOwpNAWP6UJye1
 xo3JWMHm2VkgpYf4F4tMr3/W7gvJsmd62ZbPHLnIdmXHrkmKygBm287r1NzRAbwbndLH
 z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyjSvb4lk8LZ0fmi7jCFtYmjUWcyFJSJ9ZWFZBD+V/E=;
 b=RZnIFUDXDPpyrwdqF2ondCCutTD+QQRbGPpxrSiSs8kUNMC6Ajy5U6eK52DxYJh1Gm
 pi5AliQnSHu1fZhuC+Ex+vMKQiXJHSwd1O8EQcmWeM2duALXBX4O7MH7OUfW8Ymeedjg
 hoPyLbr78+SrKJG8VMQDtUoWJroae7kH8w3Ju16D8CmGk7Gtgbn5k2w90hL4IQMfwLu0
 FyVX3pyVd4/QxaSd53rtvhKe34o7cElg53XIss/IIfs8U3sd4anHtz8J683jCQv/A+SX
 kGNn8qkZVGwXjzN3XAHIHlaKwJuZUwO/TAaMYTX/26sn4JhDvppH8V6WUGaMfVp2dqrM
 eCcg==
X-Gm-Message-State: AOAM532EHmvwARMJ16FmdHTUfTwIwdVnBcDGDV8MinNr2YQs09S77q1I
 x8N/iA8NKwx0TtnbCL/sQ2w=
X-Google-Smtp-Source: ABdhPJwa1SV6w3TVbjiUVfrrS5uM+KrPfqyISSji0kQwwgoD21u3jWP3tkLcipklfEsVy3Ju0ThTMQ==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr1927513ljp.25.1638314660235; 
 Tue, 30 Nov 2021 15:24:20 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:19 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v16 26/40] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Wed,  1 Dec 2021 02:23:33 +0300
Message-Id: <20211130232347.950-27-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new OPP table and power domain properties of the video decoder
hardware.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
index c143aaa06346..4ecdee1be37e 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -68,6 +68,16 @@ properties:
     description:
       Phandle of the SRAM MMIO node.
 
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property,
+      which is a bitfield indicating SoC speedo or process ID mask.
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the SoC core power domain.
+
 required:
   - compatible
   - reg
@@ -104,4 +114,6 @@ examples:
       reset-names = "vde", "mc";
       resets = <&rst 61>, <&mem 13>;
       iommus = <&mem 15>;
+      operating-points-v2 = <&dvfs_opp_table>;
+      power-domains = <&domain>;
     };
-- 
2.33.1

