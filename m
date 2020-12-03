Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212D2CE9C9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFFA6E1BC;
	Fri,  4 Dec 2020 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7A189C1C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 19:24:53 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j205so4383299lfj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUhKJyasXG2LBKITKz4o43ZB62Ht6r3ypNcA03zC6GA=;
 b=piGC8uTtwm+ToJJ3OM+dvwV39aEqVZGjI8n4Bbn/lXm9Umo3CS1+ycC3T0gOosRlxL
 uZHpFeHecPv+Ih4UYrGS/HGdYU70ttFQc40caN1Z4PeOGcQ8P1oI3xm7nKmmSmFu1dg9
 tDblp2woZRIL6fk1HZ8oL5gEIB47rb7fW2jzjopLDWCI8bqhrELv+S2y4dzIbg4wu65Z
 Jz2HGwnDv+t5Fkb7UWDeixf1NQcS9ORqvVckvBc+z4x3vwFDjQIB8WqjnaJz05YSobhY
 Pt85u6jH1Yl5uu6NPyP6QN7rjgwQ38vJtkpQ/PjxzoK6FMHbvNS+QX6gTxdputOZHwtY
 tGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUhKJyasXG2LBKITKz4o43ZB62Ht6r3ypNcA03zC6GA=;
 b=Yu9HvQk3oam7EHxj6r4pNSg8zPeolqXd+lRxUPDjmVIVpblMRIHf6c9fq3BNsdIu1K
 B8L21CBeqzqNyfGqqYMaePvqDXIhPXXftYgFD3ojFCK/YBg9ltoEjk0JaT+sXkMT/frX
 f62KGNEn5P1JCckV4qtq17GTnhQuglwS4PxRoLHo41lE56SfYQY+/aD7opjLJcxx4Xq1
 bpc0alhRGeejzNeP4YfJOb6mR5QDUFSogvIl/mjUEHsCatYPeIabr2e7L7OU4I1psAf9
 E3Er8ypfSXR37nwHZKEdEAclhFvQ+lJnTagcEGbFFagVyLL1kZXe4s4krZ5Pv+GpWn1H
 LM3g==
X-Gm-Message-State: AOAM533iiviMDNGV1ie0gGdORFxYjzS96GuUC444eMQyQKHDdkCOGexr
 qoTE4QyAQ7U73hqMcIuBNvY=
X-Google-Smtp-Source: ABdhPJyaASpHVGCirgSfO/q5vizNXp8daCV4N7sSu9YBJ9ArVgBxlQn2qEeoa2k4nh9uBlcmQKlIkA==
X-Received: by 2002:ac2:51b4:: with SMTP id f20mr1866998lfk.338.1607023492203; 
 Thu, 03 Dec 2020 11:24:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.gmail.com with ESMTPSA id z7sm861932lfq.50.2020.12.03.11.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 11:24:51 -0800 (PST)
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
Subject: [PATCH v11 01/10] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
Date: Thu,  3 Dec 2020 22:24:30 +0300
Message-Id: <20201203192439.16177-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203192439.16177-1-digetx@gmail.com>
References: <20201203192439.16177-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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

Document opp-supported-hw property, which is not strictly necessary to
have on Tegra20, but it's very convenient to have because all other SoC
core devices will use hardware versioning, and thus, it's good to maintain
the consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 67ac8d1297da..cc443fcf4bec 100644
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
