Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C9307EDB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0856E9FE;
	Thu, 28 Jan 2021 19:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26B16E167
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:23:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m6so3800642pfk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eu89qGTwFP4V4tI5Jw2nlSDAYSqs2MPYZr62DflexSA=;
 b=SgW66yAVGV8jb7+r6die2alQTgr8PtesUGVhZcPTecXyX/E5hBS2Ng19+xBk3s3wRF
 YEGIZI4ON2g5fItWvAfYicr70oPSzyyijhgAWNJN+Pw7f/gLrWeSdXxM7f6Os6dkNEOJ
 j/IbwTnZPELR78RUVDitb8Xtgm/bpCMvzteK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eu89qGTwFP4V4tI5Jw2nlSDAYSqs2MPYZr62DflexSA=;
 b=E0DKO/bqSSfMH2Da+7pGYTU2VpSTvL+RU5t1StBkvW3tEobEJlHJIUGUfTUOwKjD2b
 +giYf0vnjylbVqRJbIgrPyIZPWtlKCCYxW25eU63uh9cej9TzQWc2EoeugJ+v/CyajQj
 gOkHjXvPbAImP3+/qzMnhLKPZ9fN08TU7uWnZ3O827G7E9R7aLQvLF6ZJQjevpEYp6OB
 8kHzHpbuA+xGRKmeVPMzRuPqMnx5tFdFGtVMH5AdLKZE3ChCnlpA54naTZX+u0W73/qj
 Ss8Et+LbOnSdzCKuASgScX9h7YvPG/0La/2XuzKxAkP1fFS7KxPhhrvXRv/N2osS7ZOo
 RtAg==
X-Gm-Message-State: AOAM5335Gvi+RulouIejdXUiqXjkB6yjjwBZo28mbOsNTdOl0sPum1LT
 j1p6xsz6FEIKPINdKtj2co0YaQ==
X-Google-Smtp-Source: ABdhPJwKmdmcbE9OPMHzqr5LpAToRYhlpvlfYvavs0v6LyeSvK5TicG1LDmjwxq+HPL1qIux1oN53g==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id
 x2-20020aa793a20000b02901bf23a3a945mr15462516pff.70.1611833002370; 
 Thu, 28 Jan 2021 03:23:22 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:21 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 1/8] arm64: dts: mt8183: rename rdma fifo size
Date: Thu, 28 Jan 2021 19:23:07 +0800
Message-Id: <20210128112314.1304160-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
