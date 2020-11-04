Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63F2A78CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C556E9C0;
	Thu,  5 Nov 2020 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9A89DB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:48 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so5745436lfc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsEiBNqevS137X8EgsTINN66YSPI6dqy0hGSUXN1Nl4=;
 b=l0gsx/WOIi+QcOSWIQOGjzVyqftIJLUglBlpPJ+plhlETQraCIxv2lVoACM/kgHZxa
 siE771TZn8MJ6Xi6lXvO2L0NXhWsDbevsF/Z8vfotFQbjb/3YZwUi0idR6s1e39T1T3N
 c9Qt0/JexF7OHne5CT/8NdKAx6zc6qhNgCRc7YajWDLGoRidLr24pGHvZgMYgqgr9/pS
 2lEXNGHw9o2ltXvvPv0yzy1Awe/1+MilQwzp1RCyXnlIsJnPhXQ4YA6EjflowAYuVWyO
 i7iyg17ZOs7yHYNNhzVZX5JTcHeCkFmnWFjad7pnt6HCMcY5PKx9xZJMJGuZgEtCKkjZ
 HwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsEiBNqevS137X8EgsTINN66YSPI6dqy0hGSUXN1Nl4=;
 b=HUi2MvVd2rrnj0x4k+yull0vlAscVt01H5zjX5GaAoRKEYbdV+dqYQSFMg1TbOdw6S
 nZ4IdX8EaXfWSi7ulB4x+ymC2wTC/aEK233Icbg+/jXJjMnxMDp+WWe9y4xweAnDio45
 yZGMtUawa85fzlTpEPx+z2L00E2J3ju+Wa7hsjoW7WTF2kleY282/b1cpEPx/4jfKSJG
 dsKdnEX1NZqs07dxh1BhfjPIv78/h7+qbswmwL2vRe+N8H6ZcTexdNL97HkkFGiTNwtE
 GHZ8QHCvmpHgXb0oER1744IXYZcoWK1IVTWpgCSPO/XI0SW5V44SxHTwaPV7GjQIq+K7
 gfZg==
X-Gm-Message-State: AOAM532jj4G5/Oe7eqSZjbfdDwcQU9tydwgT2WrLyL39hNKiTKhNapoj
 tCv6a2DqtmQnYoP+gTdp6oQ=
X-Google-Smtp-Source: ABdhPJz8Dwjo5uSb78kKmSUyVRABa9SgfHctcnMFRcKzAvnBpwfjqTfXnzmZYZRynjQu1olS+RUcQQ==
X-Received: by 2002:a19:e014:: with SMTP id x20mr9473796lfg.444.1604508586969; 
 Wed, 04 Nov 2020 08:49:46 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:46 -0800 (PST)
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
Subject: [PATCH v7 14/47] dt-bindings: memory: tegra124: emc: Document OPP
 table and voltage regulator
Date: Wed,  4 Nov 2020 19:48:50 +0300
Message-Id: <20201104164923.21238-15-digetx@gmail.com>
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

Document new OPP table and voltage regulator properties which are needed
for supporting dynamic voltage-frequency scaling of the memory controller.
Some boards may have a fixed core voltage regulator, hence it's optional
because frequency scaling still may be desired.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra124-emc.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index ac00832ceac1..09bde65e1955 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,6 +37,15 @@ properties:
     description:
       phandle of the memory controller node
 
+  core-supply:
+    description:
+      Phandle of voltage regulator of the SoC "core" power domain.
+
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property, which
+      is a bitfield indicating SoC speedo ID mask.
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -331,6 +340,7 @@ required:
   - clock-names
   - nvidia,memory-controller
   - "#interconnect-cells"
+  - operating-points-v2
 
 additionalProperties: false
 
@@ -359,6 +369,8 @@ examples:
         clock-names = "emc";
 
         nvidia,memory-controller = <&mc>;
+        operating-points-v2 = <&dvfs_opp_table>;
+        core-supply = <&vdd_core>;
 
         #interconnect-cells = <0>;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
