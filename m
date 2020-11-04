Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98722A78D1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4586C6E9BF;
	Thu,  5 Nov 2020 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5DD6E21A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so23728742ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaJT1vjZMvf/X8YLSd9ZZ4MLx0gBpwx6yTJ1gBvJkXU=;
 b=o+PN+lFWYPC3q/5e+PBs4YIDTtISHaS7z8ihni+Qi3cmP7lxQEqiML6aqXk/WYwBSF
 /Fd3sH3BMXEPP62hwlW1yjjba6gaEliSe5J0Nw02lFmDlFyI76T/qnM1ekhX8jqEV8Fl
 5W/zRpZ9yupjboVSPuVKuPYD9L1kPMD7uiLB1U48vllyTMVmj2X8HPYaXcPXBbA6LD0i
 mW9aBfOEn6F1F+Ik146ldnJKNxUhHlJ6Zbp60VjoXWKcGnZR+eaY6qQCrv8gK0rpwRWv
 cJUB5c4PMJ7mnxMqrTgO66ku7UAHcxcsIVaqqMk1rBGQmHEzgH8DBx62HCPzRcvDO2Nu
 Bd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaJT1vjZMvf/X8YLSd9ZZ4MLx0gBpwx6yTJ1gBvJkXU=;
 b=gauzZYFyHq6WVGrpebNHAxRkIxWlmulnzt22E4aMhg7qyjTh+uLjGJtFEUXd8vireB
 bf6bM47UTq+yO5cKnwlNKQKNBj1JWfRAhgjC4Qfcjzk3A9CM1ETBBMJsge+DsZesMFsF
 OkN+5/pLEbegHhaDAZ48KU/2bv5Zu4MtvHDRMRaVWc1XV0uK+VkEdYtcHj938HRurgUx
 OjN2PJeDbUaHKKvtp9rKYksOlP4TFnAcHfmc8uckdbRoweyfIXVx2P+tac5TYIBXop2k
 Lcc9OabPHhXJixQ6N3cMqy2pKdAk+yNFb636k7mfHv6N4GVP09ne0rtyp361SNmMlaTX
 OJNQ==
X-Gm-Message-State: AOAM531mcS2eSWJrIhEdK/6okdg9gmZm2aOjGMyo3QazvvaRM2K3nDet
 0HOGSAqJ72mmC1GoDLphgcQ=
X-Google-Smtp-Source: ABdhPJxPzT4dfgMeZPtc8/pOQuOJNmNAEDQa7Z1ToMwzkGX4WNVnUqfiw9g6i3aNgPTyVvE0XlbEXA==
X-Received: by 2002:a2e:b1c6:: with SMTP id e6mr6983022lja.108.1604508578791; 
 Wed, 04 Nov 2020 08:49:38 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:38 -0800 (PST)
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
Subject: [PATCH v7 07/47] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:43 +0300
Message-Id: <20201104164923.21238-8-digetx@gmail.com>
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

External Memory Controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns EMC
into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 1b0d4417aad8..82bc5b2ae7e5 100644
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
+		#interconnect-cells = <0>;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
