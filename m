Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDD19750F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E756E0CC;
	Mon, 30 Mar 2020 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0889F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:36 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t17so16314138ljc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SyPm2KUzhH4yj1dDse11pz3n8NBqlBEAYiobqyRVKu0=;
 b=KP9TxrfH1Yf2u0M+Qtac+pS0JF1w7wo582/b4iHBGbtBNizsLtp/XIKOhtjx1hlfvL
 R6t/LkbP+19Yq1EXACCNsU+pkMNzVT4AiHeHn/0lr4pEKcJuPzvoFZ/wxAPjKYR757Ho
 a5PvbKFSiO3kOk24Yvx2hSWeACsEowJuj/Ub6d7ov70sS9Xbv9XPLdDICyRYEbiAUBj6
 S4NuHgx2bM/09Q8WZ8qLgPNP0j9TzqOJajKK7y0Gm0gcGh4ZHlNMhv7R4N872aiyRql6
 k5NMBWn9V+dwJ5HXs/lF6jcJ7NZaXjejWFecR//GK+8G8bhe2w94UnhZdEuzhkiLYSCx
 P4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyPm2KUzhH4yj1dDse11pz3n8NBqlBEAYiobqyRVKu0=;
 b=Uen24nK7SYcT8kSA9a4bAN15WfMfTvCXvRzIhQYnFGf0ZzpLtpvLuvza5smXLJSQIM
 VZ3i6SCDNvgSrDVo1XQXLbL3o8YfJuv80jsy0znQUiXhGg4DgOq+RjmFk/UVeujQpPAL
 R7wa1MfGu+HbzUnYuyAuXJZYW6k0B3qw4nhwSmGYZ95BzM0QFvr/Umh3ap5kOOtLSkED
 WCkgym/3JlYWncUzAP0owqzzZAgwojYdesQQVZBmK2UNmx/HcvZUlJObEMRjf11hx90D
 E9liaYh+NKRKwVQxDxwE3gBGT0q/Q/6IlyrSIYLyejHRT6cgIWkfYAwq445KVn5BP4YM
 /c2g==
X-Gm-Message-State: AGi0PuY/+WKigbO1/KYFC7JRwOzPYh+8j98g1Y1m5iJHvqntM11ljYG3
 y+dvPDvY76ROtWa5mVz1hzUZE+VB
X-Google-Smtp-Source: APiQypLbylsFxaY2bHTyqNbB0g8en9J+rivsuZCDeT0HmvlMHYmh+tF0t5nYIOiPUvnJQ/+pK6AF9A==
X-Received: by 2002:a05:651c:310:: with SMTP id
 a16mr5341055ljp.275.1585530575210; 
 Sun, 29 Mar 2020 18:09:35 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:34 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 01/22] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Mon, 30 Mar 2020 04:08:43 +0300
Message-Id: <20200330010904.27643-2-digetx@gmail.com>
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

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
