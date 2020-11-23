Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D632A2BFDF4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CD189BEC;
	Mon, 23 Nov 2020 01:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144FA89A60
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:16 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s27so1466753lfp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiKxinntaaBhKNDA6LHo2vQincTmnZ6b702qKhoDqBY=;
 b=efaz58nHi7ZIPNTz1vsAj1hnSBa0M1ImwOfX2KoyXe1MoVJ48V7MkK76CAiFX9Llis
 JC7VMkN+rIr8dQEBBJYTPMLkPHND3na3EjyX8Jl18Bh0JuNMwAEyXb14kyyXSwsFBX3r
 2nSsamHEb3exucuwwPUd8QU0NnAVWFp7kap+4TABQVuMuAmq+3R510d/dxvJ1/N12Y1v
 MkwYeR1oYVCe31LVUmvFfsFfHD8CclGXcHoYCpd4xrhrh60VG3aEdpoPObEPhy4Ar1oK
 8Q3bvL+iKcah8cCrbmhF2QedMtE+FL6Hl0goHN2nq+kiIIFT4CJjfL/PSnTabI+acx6C
 rZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiKxinntaaBhKNDA6LHo2vQincTmnZ6b702qKhoDqBY=;
 b=jIEQ918HvW/ZLEw5J7Iss5iaE/rp8mAlxfMZv2lEsTJ6ZwTphmgSR4cIFoConIoRz7
 ApbAjWSBqLZalHdCMDHSZ7mXcNuAvqzI65AQCrVrWVt/5XqPGDHs1TiPbJDZ9xGcx3w8
 4Q/Ijfjg3oMnmgSUSG4cnfn79Acud2fzB94xqo2IMnF5kvw/uavfAZH4s/xQJQgkj08+
 UTMBZRj/s9YhKM06VAqASFB6705uUAFH9s1i6tjMlMHHvQiT8F+vXm4Zju4D1AnJ4NMy
 PWcqSyO8RmrpJ2sVmIpsaM3kvs6OvqZSMTmUxv67xcoPcd5GJpYF6qhnz//GTOcdPGM1
 xvZA==
X-Gm-Message-State: AOAM5338rhDxUIMbiwnKtp6unjlFIUIKAHPyjodctzeOiGbxk8PZft8H
 sLD6LoX6piF+2Aw3VnK70sk=
X-Google-Smtp-Source: ABdhPJwJcon4kwwSKPI2+abWib1wTP3B2tcX9CDwpGJUURqjxaPIly5wScJkIBxUc6uYOv3TCwHzvQ==
X-Received: by 2002:a19:ca57:: with SMTP id h23mr885032lfj.12.1606091474437;
 Sun, 22 Nov 2020 16:31:14 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:13 -0800 (PST)
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
Subject: [PATCH v10 01/19] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
Date: Mon, 23 Nov 2020 03:27:05 +0300
Message-Id: <20201123002723.28463-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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

Document opp-supported-hw property, which is not strictly necessary to
have on Tegra20, but it's very convenient to have because all other SoC
core devices will use hardware versioning, and thus, it's good to maintain
the consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 67ac8d1297da..fe99ce1013bd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -16,6 +16,12 @@ Properties:
 - #interconnect-cells : Should be 0.
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: One bitfield indicating SoC process ID mask
+
+	A bitwise AND is performed against this value and if any bit
+	matches, the OPP gets enabled.
+
 Optional properties:
 - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
