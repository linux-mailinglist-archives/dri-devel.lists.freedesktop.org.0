Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153112987DA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FA96E876;
	Mon, 26 Oct 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3D16E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c21so7693946ljn.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9sDSp9UsTOyPg5KK8o0S3uHbpxl1X+CxL9GNXFca6g=;
 b=FxPsN+6J8h2aIRcjDbmWlta0K0EQg++E8JM2eiQpYPDHBJKT5SkDIM1gHxiYDuQGWn
 1JaUQE95oGdqOHmMGIZpKB3Ggp6NfKMrvGb9su8kd29EJsh1RL+YTuYCvmxKswsBJNPH
 KcF2Ej0UsdXaKiLM9qTEThqccUEuxAH1QiWxbW1fD184w+CInvpJNpKBXWmyPZGWUX90
 su5CdTIdxFroVnxlczmm+fajT1vHFSnBOFTpOrqjp7rIbY6XH+hSCDLs3DW6Ng2709iQ
 tnyV44RGx906uM8VUlypVg2NU0MhN4uTk7krMA5jHzEZnqFSG0NSfUUejjKGxUSJFlRx
 b/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9sDSp9UsTOyPg5KK8o0S3uHbpxl1X+CxL9GNXFca6g=;
 b=sMo8sUyptAsiKRLVN7HHThGzSBl0BZIj0jngcC4pKEAQj1rDyVDBmyXNyNSptEcojL
 W732JaWza8D3uzP7+ZVuV6BZ0gzlnUH1N8WvHSaSHjkCQRw13z0I9ShQOmUrvY4pF5FQ
 13er+S2ZisWnv7Nx+ghcn+I4Jf33ll+tdZQebs075HvYDI+lTgR46o1CeysP6ygS2L8M
 PT4Yx4IwKAbycED22VevUxRPnYQmuEmLUREYUV85Y3K42fT9O+PL4kO6WJ9nEeJuSswS
 +K6q5TC3nsvthdJRD2rmZ0cq1FcZWIgbYocCpbf8NvjNQs0gRgNjBuA/pEeTJKwHkqk5
 SQhA==
X-Gm-Message-State: AOAM532BbRM7rm0Ke1rNm/6EflwWhJ575Jk0cDcMk/oyTfWpRGHm2Ppc
 nPfMTEmywDVGVqu7zuPbNjo=
X-Google-Smtp-Source: ABdhPJz3/rmupBxM7znTEZcoQz0lcN70Q+F7s1Js9PKzMr5SOvpvEIsR50oykwy7mnr5miBDEH5Mmg==
X-Received: by 2002:a2e:9bce:: with SMTP id w14mr4590245ljj.439.1603664273376; 
 Sun, 25 Oct 2020 15:17:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:52 -0700 (PDT)
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
Subject: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document nvidia,
 memory-controller property
Date: Mon, 26 Oct 2020 01:16:47 +0300
Message-Id: <20201025221735.3062-5-digetx@gmail.com>
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

Tegra20 External Memory Controller talks to DRAM chips and it needs to be
reprogrammed when memory frequency changes. Tegra Memory Controller sits
behind EMC and these controllers are tightly coupled. This patch adds the
new phandle property which allows to properly express connection of EMC
and MC hardware in a device-tree, it also put the Tegra20 EMC binding on
par with Tegra30+ EMC bindings, which is handy to have.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 567cffd37f3f..1b0d4417aad8 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -12,6 +12,7 @@ Properties:
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
+- nvidia,memory-controller : Phandle of the Memory Controller node.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -24,6 +25,7 @@ Example:
 		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
+		nvidia,memory-controller = <&mc>;
 	}
 
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
