Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E13094BD
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889886ECA0;
	Sat, 30 Jan 2021 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55A6EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:22:17 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id g3so4933283plp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKkdntMWDZy+eiWvpGEbl6K4V4PyDtJ2Lkb/5Ec2zno=;
 b=NUT9OOBmMJjLfT1/whNjeztSfuBpB4Qmf3qZzRGQNXB6lTtADVTwNO2rsNTP2CmS2P
 vmdlYAMiLle/rL2gdfpSjA2oRT3NEjYiCZejicDdOVCN6WaWL4VkiTuDgBZ44TULwvYw
 UUxwwMKV5VyJxuE6zxu57ZaZ/kjB7hK/M8u6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKkdntMWDZy+eiWvpGEbl6K4V4PyDtJ2Lkb/5Ec2zno=;
 b=tvNI96Xh6hZxuFJra60OGPCq3r9p+qb8Tn8mNrYiNXbfwJU3du76Q658Tn+D5l5jPM
 /2leE+ak+8mtLIA2CdFRuhmo9Phz/LzuPRsBM0Hia4A5LXvN22Wikdn3/0DBm9kXcNEA
 xoaBvROvA2Rw3Bn8vVNDgICKU/eAIgle4SjWM9t71u1rpdWTNZqnq2llRYNGRPHVoeVq
 r/iwkVkOXXwpcViTRZlgJjgvLmZgM7A9CeSWmwsL0/prwlO9z5ZTyIL1T3LiatkKXRZE
 0Pp7jb74/b6Eo8U910lOxrFRQgZcdHlCSsW8SDBdQ4bKGGDRJb5t8qU9uKLowNV7Qq2d
 kKhg==
X-Gm-Message-State: AOAM531gJIDu2IbzriYk6k6I/FtAZJeypEJaINpH2hFULN5xO2uNPlST
 g+YAldcRWguKuYMe1AvuXPWHkA==
X-Google-Smtp-Source: ABdhPJwyqNacB1GotJvsyxIvuCNLwicaApsl9qK+9ec7iuWopBibM4gR92Jlfy9MUVxsyBSTYEjJ9g==
X-Received: by 2002:a17:90a:4607:: with SMTP id
 w7mr3721707pjg.148.1611912137468; 
 Fri, 29 Jan 2021 01:22:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 1/8] arm64: dts: mt8183: rename rdma fifo size
Date: Fri, 29 Jan 2021 17:22:02 +0800
Message-Id: <20210129092209.2584718-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

property name must include only lowercase and '-'

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7e..6c84ccb709af6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <5120>;
+			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
@@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <2048>;
+			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
