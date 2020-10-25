Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD92987E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0376E95E;
	Mon, 26 Oct 2020 08:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D26E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z2so9435475lfr.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lWu/mMLdPTGio8YSQylDeD3S9LBmx+ajaTXUfXipIPE=;
 b=FZZV5aOHHxAcLl8vvVYkO+lmSej36EV0gZ3ub+YcHLnIr8Dtb5vglgR5pUr4kX388G
 lSnK6cs63/zQQf0hzUNYFT+TTaYrUanI8RCj9MY304sa/FxuHqfJTOWCbAJ3U4gVuyd0
 /cxoHnaYURF5/RdAefp79Q0SHQPuvX105yKy9SCyncGfwmltsjG4087Ml4OFt9EznGfu
 cpIDu61s4EBGE2kulCHmTsuz+KplPDpZi59ShikSxSDukloobbl4oVnDns41fcSKI50/
 1tIlnaLewqoK7jcvPYjejSlsQIWOqvAXDFIQM9EpZm4CdgFg9vzw4ph1fAHR7wSEmfGE
 xddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWu/mMLdPTGio8YSQylDeD3S9LBmx+ajaTXUfXipIPE=;
 b=RXYeo9CrubzNxyVqlRA87BmrncMDDVoW6KWkRYY8UBtCp3rfGaxKi1fdF41oFsceA7
 nQAo5Scq6Hj+vhrQSudhVv0nbKJh4Sw64SDfph9gfg9eMr0zd4/86tZNFehloQPcUaP3
 CrLK8t+bve+KvPo4CxjB8wGZZ7yZj33fWVPB412vBzE2CMbCs3RMtM3AD+/IyMnP8zLG
 fKfjPpKHWNjko03bTdPARGUP4ycdbekGOOKQG6aF1AOqFgmmsvYutv8ngsS1ztdv1vFd
 HUCVx3kXIqz5SktJupz2Z/ipo7Y7/aBNc2ljMWHInmBaKNKjUT5eouhb929xjUE41wm6
 +zcQ==
X-Gm-Message-State: AOAM531TLijxke4Fdmr521R3Wh9Crcso9kfnB3CMYDJKY+db67stbvC0
 DKq/sjzRpwW/iTJ4TnAwt0w=
X-Google-Smtp-Source: ABdhPJzA53mkM4J1Nl0Ouu4LDwd4GMj+pfYIySmoHsV/wNETKZbiy8fCBMKxrhMwExjUJR50dfgAsw==
X-Received: by 2002:a05:6512:3490:: with SMTP id
 v16mr3848789lfr.61.1603664275759; 
 Sun, 25 Oct 2020 15:17:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:55 -0700 (PDT)
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
Subject: [PATCH v6 06/52] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Mon, 26 Oct 2020 01:16:49 +0300
Message-Id: <20201025221735.3062-7-digetx@gmail.com>
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

External Memory Controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns EMC
into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 1b0d4417aad8..0a53adc6ccba 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -13,6 +13,7 @@ Properties:
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
 - nvidia,memory-controller : Phandle of the Memory Controller node.
+- #interconnect-cells : Should be 0.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -21,6 +22,7 @@ Example:
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
+		#interconnect-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
