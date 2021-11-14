Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3D44FAA4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319A6E8BE;
	Sun, 14 Nov 2021 19:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161E96E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:22 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e11so30637834ljo.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyjSvb4lk8LZ0fmi7jCFtYmjUWcyFJSJ9ZWFZBD+V/E=;
 b=maH4dIIKowUpmhvo1nvasbs5OKzNudbTuKFIJsYGWjULge1tHtj4zqOdu1VEo5ThQD
 Glnd/VhdB3vL7F9jB0JYaof5JNlFMcmT2dTkiuBcsy6fdbPTRR9Cosg4q8ld0E3KLoRs
 QCOo/vBwI39ZdFmMrmnpuKUczLMKCAgCHXdLWUyUtBRwoZVaumPhfn22KWhw/uMM97eL
 6HM7goA+Mr6pmmVqQ/KtjQg3ceoyq2vDdCSsa2YqB5hn8QXM9nH36XE782M3t96uMhIy
 cjHLqnfq/ru1C8IAgMKjMGbRkU+0yHj8OmJgPwAuDICjHftwqM1lSMXmdFHtmuAdfqlw
 dvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyjSvb4lk8LZ0fmi7jCFtYmjUWcyFJSJ9ZWFZBD+V/E=;
 b=YLi2N2tOrIfhMsRJLnNbGZUa8Uy5gmGdATzaUhDXt6oFQ3kpMNKRjegs3J7Y1Q74ta
 GUdnVE8EQh3BI40aL5Jq9EMDLixJw7DSQuNrcDvveJUzVyAhFkS4ldXvs+TinUybdi+Z
 B3OXUlkCrXCXlUwo8e+ZbtVA9x1LQ78oY2nkvL9tn5lcTHqvstyl0aAnghHb2PEUsdct
 vqSd27X1V5/HQ+MMDlVN/DpFOWyLbFFA6tXSWJlWTRq1p0tDRroDgJbZhrr3sQsLTMdM
 aHOtP8xvXUSuk82RfmZYfhye+fwj9oiKr4FCaxoLHSCTsa9IueIUxB7OQUWBWtStoKgZ
 L5bg==
X-Gm-Message-State: AOAM532YrEsKneG9qsOjXGD0EUym8QIEhbRhHRgVqHOIApk03RINOvxu
 XWPUUqppYiVTI6r+FKNYqRU=
X-Google-Smtp-Source: ABdhPJyyX3w24VyTnKWk6OR5+Zr92mvnvMrUZ04yBXX0uU6eSI60ZteV99zQ+/n6hcffVQwWJz3ZLQ==
X-Received: by 2002:a2e:b163:: with SMTP id a3mr33547827ljm.264.1636918580462; 
 Sun, 14 Nov 2021 11:36:20 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:20 -0800 (PST)
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
Subject: [PATCH v15 25/39] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Sun, 14 Nov 2021 22:34:21 +0300
Message-Id: <20211114193435.7705-26-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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

