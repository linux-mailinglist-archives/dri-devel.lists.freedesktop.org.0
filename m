Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A743A734
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3CD6E2F2;
	Mon, 25 Oct 2021 22:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D336E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 65so10796147ljf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=Nw3/IIiKpiyz7AiQ6ai2nq1KUA4QxDcDCtWMckJwLyKG5Gxq32OBoSSQAQLbeRdFnu
 YorZC5XRyE5krSSgSCw8DC6ECVOvt6OZomLKTVmdkvGdjoTGnN918oZxwg5qo66Eszla
 2YplsNGal9SI1Sv2NIj+288U9YGLB29xDxTrY7q4aBHL4YCns6pOjDiAxyew41gpcfZC
 Y3jNeBWJovoZZ3L224ZMfo8vHqgUTRX38MGbXcCyqJaqaArJJgzMEwL61qk9XYHRCKDf
 dU80AfV7GQhviy6I62cVW1N9WC8qM25Hu5tPRTJRRRmT5rvIIVpuMKFXd7r5j4lpI/PA
 +P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=e0bzdMvipt/oMdVdfz7QLLrHW8P5jJs2evS6Jt4S+E6eRjtI/VtREWGp/vxfw6M4e2
 2ZtDzx2lW5uCkJ56vJeVeteOQB0fmo4VMn38tkQL2qTuAM5xR3ieheg4PxWxTRPMJOiq
 Cs+aTKtGnLkplbKQpAcu/bNX5Is8km5assarvlxvsmbzHiRJcgcO8rvv2HBwPwJYDJTM
 fgwnwULmKtPxnKYo6MW3WN56JAwpVnkam+JXoYUgwwe0p0gc2OMmf3QJjN80y+uIQBoa
 nW/rJ2ZZKsUWvuf9LvKrROG3BP66uXroIZFxwyQjuLGL7lf6GXYr8qPxKOOTXdc3dSPJ
 Ln8Q==
X-Gm-Message-State: AOAM531iWdLmQAouGrlvhV/n+4RyGCi7e4it3oqjyAhjcGEevKB8rF+v
 ogELK5Xd7P+/fJD6g5Ivp/8=
X-Google-Smtp-Source: ABdhPJyRyNXx7asst86YnQ18/+ZRfQnB/t4MlWMaa7Kdx8f0jPEkwI6kMj2W+rROBoq7NY2HQZVA+Q==
X-Received: by 2002:a2e:a717:: with SMTP id s23mr22667950lje.265.1635201952797; 
 Mon, 25 Oct 2021 15:45:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:52 -0700 (PDT)
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
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 07/39] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Tue, 26 Oct 2021 01:40:00 +0300
Message-Id: <20211025224032.21012-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.33.1

