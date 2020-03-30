Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0C19755A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D26E0DE;
	Mon, 30 Mar 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E889F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r7so8639640ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0J6DRAOAyaTpCiYOkunPcKmZ48BaOfYFgW2usyzuKP8=;
 b=br2TMenOYQKMU0MQqe5hNERWMDXSym6KywsvVY9MbiXbFgwB15/mNeYK9ffd+tuYgX
 I9cwr0aUwbzVYEVHJUQmRq2gih6WeT7J+zk6ei65m0q80UFYOk9zbygJPZfjcfHinQi3
 S5VSjv+rQxVaycNdEOzS7xZy0rNH2hLvwgfesGzqh+tnroOisljSZpIT+XFlLOW0rDoZ
 KkUjKUTT8cnlJpS+FNjwCS4vAX6SvcPnjMB1ikRwA4nUVr+M2DPPXLqUdYguUihw5GEO
 RBj1yvBEiG2ozqqPn1wn2OHrBSxfy4Ilq4AAPpxcMWxbRfaSqw90MTm/8a+umdjTEBQ5
 lBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0J6DRAOAyaTpCiYOkunPcKmZ48BaOfYFgW2usyzuKP8=;
 b=ETnT0nilb6z6NkJQVQIFwgbCKy7mGDPcYJyHdsTLOMlILxw7Y7wSi7V/6RoVKt1Kjg
 eaps1HgvHPjxp7pJyZl4so7WGq+1NIcx/x8FM9j9oDE3adp+XqAUlwaSstD/oaz+sETZ
 geM4oLmi5JAafRQwqQLbaxQQCCphedlAi9V7Vr/IT1P/0d5shlRMsDbs6uciytjWzYVD
 4DMHsXn/j38aEgkxKxFmZtyR9fNvLXq6Xs4YG2Lqn0rq3p2FWGp//qUvjTEnzl2eVpm9
 WxZzjZ5XAUegxDbP/fwCMVgT8bKkuWz+qv9ilgc/4W+9gVOqqnWMayImJFsArnbo3uHh
 mG1Q==
X-Gm-Message-State: AGi0PuYJFHZeWse1PNAmVhdcKrjy5CPhxDuKtFPqJv2McXNkf+1/37Gm
 o/sDzUQoqc7nxStDQZws1ZRcYzN0
X-Google-Smtp-Source: APiQypJxz4N3lr7iOdRVaNWJ1a7Kt/SBCUYZhP3n8W449ZXJ7fMfJK3kvtdPi2dOpFJR6QpwemcihA==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr5525552ljg.171.1585530579284; 
 Sun, 29 Mar 2020 18:09:39 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:38 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 05/22] dt-bindings: host1x: Document new interconnect
 properties
Date: Mon, 30 Mar 2020 04:08:47 +0300
Message-Id: <20200330010904.27643-6-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

Most of Host1x devices have at least one memory client. These clients
are directly connected to the memory controller. The new interconnect
properties represent the memory client's connection to the memory
controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255ac5b6..d92d4e814d77 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -20,6 +20,10 @@ Required properties:
 - reset-names: Must include the following entries:
   - host1x
 
+Each host1x client module having to perform DMA through the Memory Controller
+should have the interconnect endpoints set to the Memory Client and External
+Memory respectively.
+
 The host1x top-level node defines a number of children, each representing one
 of the following host1x client modules:
 
@@ -36,6 +40,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - mpe
 
+  Optional properties:
+  - interconnects: Must contain entry for the MPE memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - vi: video input
 
   Required properties:
@@ -49,6 +59,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vi
 
+  Optional properties:
+  - interconnects: Must contain entry for the VI memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -62,6 +78,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - epp
 
+  Optional properties:
+  - interconnects: Must contain entry for the EPP memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - isp: image signal processor
 
   Required properties:
@@ -75,6 +97,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - isp
 
+  Optional properties:
+  - interconnects: Must contain entry for the ISP memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - gr2d: 2D graphics engine
 
   Required properties:
@@ -88,6 +116,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 2d
 
+  Optional properties:
+  - interconnects: Must contain entry for the GR2D memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - gr3d: 3D graphics engine
 
   Required properties:
@@ -106,6 +140,12 @@ of the following host1x client modules:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
+  Optional properties:
+  - interconnects: Must contain entry for the GR3D memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 - dc: display controller
 
   Required properties:
@@ -133,6 +173,10 @@ of the following host1x client modules:
   - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
+  - interconnects: Must contain entry for the DC memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
 
 - hdmi: High Definition Multimedia Interface
 
@@ -281,6 +325,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vic
 
+  Optional properties:
+  - interconnects: Must contain entry for the VIC memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients.
+
 Example:
 
 / {
@@ -363,6 +413,15 @@ Example:
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -378,6 +437,15 @@ Example:
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
