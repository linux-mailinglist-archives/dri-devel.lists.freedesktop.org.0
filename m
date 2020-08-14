Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2209245D10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1106E45D;
	Mon, 17 Aug 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39B6EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t23so8128486ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGCT3sNWog9i79de3oECaNCIcXqg0vqeqpgOXfgBL2s=;
 b=oTqX2EUnl8HGI3rFllgGCao9PaM5Hs34AwPJeMF9eTiUMjyHYXZtj+/MuAXb+y52t5
 1nr3rx4eILLbhY2W2CXfYI9Osik1Ev1oTRxp+3Qa5v4G+8vMfmNvJP9TKQbs9faYmRKU
 BomDWe9pUNflgvawX/esQ3OoGvt4ui55B5pn61+MgueKcIhiRhuljfn9kEDE9aTEJpjV
 h9lLQ6JllmIeq7/n9ZggMjmht6qiDliS8rIf2Ou8SIbzGF9HL/sixX8AOQsj01s09LIS
 emdPxTSlTXrqx3X+OQUU3Xw6y+uFFDVVQi+l8qsbd4FpX5LLOyP+wQu3BOFYi/KP1VcC
 NpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGCT3sNWog9i79de3oECaNCIcXqg0vqeqpgOXfgBL2s=;
 b=lRwygDsFGPTQwgfptTu+d252uuRpILrFA1eCjf29ZtzSaFOAyviB6Jt+UoefbdR+AC
 YGmPrGcdAcbNhfHzFoQbtnPNr6tSVDf4xuINfvhWAfrQZe7CGTlL9MFBMXOZ81T334Bw
 W+qgtY4Bp4CgSEjusp/EFbM15gwvidQgGIPrBFBQ1uWNXpJHWEeXXoR0+4iwSAJRmPVp
 IizI6pn2oauEaoQ7otMmJ6LVUKY9gTORatrFSzosobsjPd1u2CQUexpoO+BsXLJREe7w
 7JWkhL9VvEJzVvuZUjQGhuHMMYgWm6jsbPCisVFxldnArKUTkJEfdMJqqoY0UfXR7+kG
 mRJw==
X-Gm-Message-State: AOAM530Sho2jvsYtbbJRof0gZcPOleTm9DyCBg4sl+iI+iBHZzllijc6
 hIp9dOgSu++jC7hliX1CBVU=
X-Google-Smtp-Source: ABdhPJx0a/vfIjLaMytuE/JHr3pwaIdv8cFEDvBL3Mn+6obC4nXwTuYaAYAVzNyWTRpeneXHlaIVGg==
X-Received: by 2002:a2e:b708:: with SMTP id j8mr102010ljo.375.1597363642405;
 Thu, 13 Aug 2020 17:07:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 19/36] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Fri, 14 Aug 2020 03:06:04 +0300
Message-Id: <20200814000621.8415-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
external memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index add95367640b..f51da7662de4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -12,6 +12,7 @@ Properties:
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
+- #interconnect-cells : Should be 0.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -20,6 +21,7 @@ Example:
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
+		#interconnect-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f4000 0x200>;
 		interrupts = <0 78 0x04>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
