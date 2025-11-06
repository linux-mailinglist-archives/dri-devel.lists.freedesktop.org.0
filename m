Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC40C3DD34
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369D10EA0A;
	Thu,  6 Nov 2025 23:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H9IXuxLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013710EA0A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
 b=H9IXuxLW2qWZOzujRWilzz7kcv8xReRtaKgJJlDtkuD0hD8nGy6qN3190DjYWFRV8/6coh
 mb494Q7xPxSM3xSJHSuvRu62AMM0f++cIWSFBu1YkBYGBbEGB69gkpW+5OMJGdDlVl2JIX
 a1hklEnJGM9TlmNZxlVJ5Bi7ej3vRNg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-tqlfP7_QP-2AzYAdpISzBQ-1; Thu, 06 Nov 2025 18:26:46 -0500
X-MC-Unique: tqlfP7_QP-2AzYAdpISzBQ-1
X-Mimecast-MFC-AGG-ID: tqlfP7_QP-2AzYAdpISzBQ_1762471606
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88022ad6eb3so6541136d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471606; x=1763076406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
 b=XEixWk6dA8sRkaOmg2rqwzfavgM9Qsc+cBMLNtJP6pRwtvbPneJzzk3AIUcPr6oqKw
 9j+W2S/ucuPV4Qp7XFRP6vxnHK+rKB9BFKKTsnskVtBdDUCRlHAPTLHKW1Dvkw0gn/I5
 CVOe432btj9Nj6DQaZOXlqXPrQw7/6wc/GXELkEmyun/EyWKyPUxYPjO40TNH9zNgAri
 jZaaAJHJb2ASjigcCIeoBQ/2LRy83GvNrXCWYniiLCuiat1UVshaOMlEemqZiaR3PtSE
 UFwRE8AaIjYnhie4XSUQjGG/9Fikwa8petAUX+A5xwjK3nbpK914UcxeguiGJjp1rGw0
 8DSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7SFExBl1GtNRxCakYxp3XjXp/SWZjZ8DGasLUvW5DnlMGOISk8V2CIa6xEc8m7xq/2aWIkUzMBUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFB155KGUkUi1XRdBVi4IMfeiuxfyOqDIcWYPUzBlgxqzFljNz
 gqUOhMNX33ZjkQQUlxV+411TkXQfcGtlMVfX7LnhMyIStC0FMfvs4LCbO5uHEvt3lj3p0nuHvQy
 3pzOTdsYfWJWK3r5YCLhXe9r2An/rO1i/0MH5eG6n8TKXwYvptPKxD8PFlxKr2Or1Xkpylg==
X-Gm-Gg: ASbGncsBJGHw3/XuOdXGDs5DzBKegv+VmjBX6FkldqjnCZ/4M+dFVZ8Ar8WyzLCZrkS
 csHy3bMAuJKQgMlc4EmIZP2STYH7UEXzN1gSymMtqR7RGb/6dLDwLaLLHVMz2hHRmzCuSPjvw9D
 R/ccaIjKsdALa6KyaS3AVFZzac3vNgK6/eIkx6eMr27BL/catkfGdWlWYOsTG04ZDlEISfmS3jU
 9CT9e8NgFb7uHJ9oMu4qYlEZ+tlgdY4TRTcLpN1dg4YmhILDucQQThYqWNKWtgyxhEWJMWoDN/H
 BUr+/iX/pTmmq2cNUljK3la8Yv8KN/r1ATGgIH2MY5VbsArEole2dHRWCJhdat835fB2JPzNgmy
 u/JuXypZ94yVLoeDZAsX+lkIS62fQFR6VrYxidBCXrw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id
 6a1803df08f44-8817678d8e7mr19316026d6.43.1762471606043; 
 Thu, 06 Nov 2025 15:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHwlRC8CZ2UFXaZBcGupUhAP3gsyq39my6h5pJeWpOeH+fDN/RFDAKGIUl3UBkcMQENq+LCg==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id
 6a1803df08f44-8817678d8e7mr19315736d6.43.1762471605711; 
 Thu, 06 Nov 2025 15:26:45 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:49 -0500
Subject: [PATCH v2 RESEND 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-3-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=N8o/S8JYpE+P94OMt6ofvyUqz51LnCLNCgONjtOPtQk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RY8/PBwxpQIzmk34ntPmseIsDDNz1O4qinfnm5ye
 e/uLa+0OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgI/3lGhl3u+fZzhdU+/Dze
 fFh16+5wt2rZRwu4T3yXfO8lq/V7uinD//wHB3T5l/r0mnFP1Vf89iOU+XbonQtZOUZNP5rz76e
 cZgAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MhBYJfZohi0aiZlC-SUeS_zKCJtXNdoXbJp-5gtikN0_1762471606
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0

