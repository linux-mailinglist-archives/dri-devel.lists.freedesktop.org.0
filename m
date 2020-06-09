Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899641F4F37
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA1C6E44E;
	Wed, 10 Jun 2020 07:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD376E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 202so12460327lfe.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYJTTF8rWAxRJdQ4tpKkvqb5inrmde6SNOd9Wsb86uU=;
 b=FyU3xezRgYRLH4TYd7XYiDFM6LXHBEelQLK0NGdETaX6WKkyE9SUCxdnXF1tKr/Qca
 Y48mQSDFBW18u0dkUbwwNnyfMOGvf+dq/QGBOZmOespFOndPPnCdwZ/jV2sNbZvwl2nz
 kgFTDOum0p3zBMWWBv7Jzuwm68g92qmFIDdovSC1GBF/dhxlxtKTInzW6tUYmXxqD5/y
 J+5pqklvO55a5VcWmscU8zgcuExscaIAJgNkxh4mWiIEQFnERuFZZPhEuzavsSOJ4I4N
 5UlFRi+emAPxbG0h7CHHAhf+sWPexhOEgTqTIPzcOTmcH5KJC/C5fq236fVzqs/xyDW9
 RN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYJTTF8rWAxRJdQ4tpKkvqb5inrmde6SNOd9Wsb86uU=;
 b=ECbEbxZ2riN6f51r/EWabOeAm2z0zeHz3FXqH6cOrSdGhyOEhAQ2WPnu7Q6YK7er0Y
 tcLUPpmouOOctIhFsMTNoWvjxEbVEjqvdpXjnKNDIxk2AZGM9cpTMZHLmqykIyst8mOA
 mP6aiJjYNN2RQvNWqhtY55Ime+AVlEged5ndIzSapBLWtxPfT+kLIBiguE9z6dDauVFX
 SVcVwjToXpXXs12Nczp5ymo28ywokC6E0qVTCYlPZ0ltkZ0hWJLcky7j+YSVJJe668FY
 RLJsLF1A2ZiqGr2KHujFzuuPI6FTSDFz53ayK03BjS0gnM75e0cPKOz2EFlwlQAa7mrZ
 J5Nw==
X-Gm-Message-State: AOAM532QRhmIf068+BfslsLK9MSKPwhw2MQs+5Z/2R/SniPeR1XZpDy1
 DNCyvkH/C8IiiRiAmLd5qug=
X-Google-Smtp-Source: ABdhPJzEfsQbWQzCGvZqXQMeMC3xMP4vYYgAN1eofLkOvEDdkLppDoquu0V/j5apzqmH5PdMteSdUA==
X-Received: by 2002:a19:642:: with SMTP id 63mr15648100lfg.173.1591708487296; 
 Tue, 09 Jun 2020 06:14:47 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:46 -0700 (PDT)
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
Subject: [PATCH v4 18/37] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Tue,  9 Jun 2020 16:13:45 +0300
Message-Id: <20200609131404.17523-19-digetx@gmail.com>
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

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
index e55328237df4..739b7c6f2e26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
@@ -16,6 +16,8 @@ Required properties:
   IOMMU specifier needed to encode an address. GART supports only a single
   address space that is shared by all devices, therefore no additional
   information needed for the address encoding.
+- #interconnect-cells : Should be 1. This cell represents memory client.
+  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>.
 
 Example:
 	mc: memory-controller@7000f000 {
@@ -27,6 +29,7 @@ Example:
 		interrupts = <GIC_SPI 77 0x04>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
 	video-codec@6001a000 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
