Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC881F4F19
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07316E3B7;
	Wed, 10 Jun 2020 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF986E2CD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:50 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z9so24952875ljh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vef4FqcCqXDmWHyU61FfP5+51JqO6VMkIdhuYGZmgG0=;
 b=NuuffknpLSyUN9f4O3nAW/BwHLLuP3isFP/Y+0n/uFpoB7wO+F242cej8FG81mZU53
 /gpHTHEEssaWcp513OWvY2R9GGg3Ye8MU64qC0y/Jh467nELwg6zrl50vLuOjqFOuiXC
 lcJjkJd2PEftOSrVFKksrjOJrd2C3e01OcNnRauB1XcVBwczD5EAY7u/wKHHcLGPcCkC
 UQCpL5fQq92retfRpVKplkgDhS5dsTZkP32S5ErfenKRSjL1uEVDuwMQda8NTnas9C++
 dx8SMjBhiQIYIDT4+O2KWIKIljllH5I6PFXBRFpXZmR+9P3joIfp0/o8C1VwHyRhQ4si
 Kr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vef4FqcCqXDmWHyU61FfP5+51JqO6VMkIdhuYGZmgG0=;
 b=uQmcWOSqgofSNbpXknxCq3bAkLxECUjEGMV3KhUUae1CskgrsMag/fP33iJI/LTtyC
 CT4/xKbGvCD+ReB0L/yQEAoFXv4lWZ/SQaKTr+p36XDQGdAAqIc042F4QpllPGox5GK8
 2iC1FEGXdEaQ7mVmTc7JxmB5ns3IBThIiKGidEshQE0V0KbGop0yN2TlBCMPjcLhBZWl
 iNxoQhZJ+/ypRAB3a1bH01DrRPOCkxpIZOMfxoBNP7I+SGsWtqjH8Od2ikZOVbx1BgRz
 5T0m6deHd3T1P4RpOIbRsyKmc0CYvj2n30l4wot7q7KGK82M270H8Tv9IOa/rO6Unzfa
 4nSA==
X-Gm-Message-State: AOAM531Kz/VhRmDVajCnBWR+B01uktQqNNoCv0edzZ9eXQyEJKUrd7dG
 p+kMq9ESndRwWibD0tygXA8=
X-Google-Smtp-Source: ABdhPJx0WeCYBWMps3AlkLTGYLKGv/akNMpWubTzAWIuEwnP6rPbBlRBpCn2dscDwurf8VClf61kGg==
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr7926105lji.36.1591708488531; 
 Tue, 09 Jun 2020 06:14:48 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:47 -0700 (PDT)
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
Subject: [PATCH v4 19/37] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Tue,  9 Jun 2020 16:13:46 +0300
Message-Id: <20200609131404.17523-20-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
