Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FEFB1FCD9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555B110E2BF;
	Sun, 10 Aug 2025 22:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H8XaObNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACB710E2BF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LIwrTzSIdW4XyPecxETwMmYAEX2pSsme7PIKfMfdJI=;
 b=H8XaObNzLP9X5K4QD06GcVuh+F7hbSYj8iJ4aqbA+cL32M7W0p3AxajbgFEkbQL8LAma/Y
 xkbGPBzMlvj5JmL9mXJ1Nx+D2mehSEvfxeT7GbM4Xc4ty+LfStkZhZFd4XIcP72+Az9BeE
 ZZlPSKbZbcgHjzVSc4dzNP8Rwil2ygo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-aG5lR4EPO927Eg3J1o8aCA-1; Sun, 10 Aug 2025 18:47:15 -0400
X-MC-Unique: aG5lR4EPO927Eg3J1o8aCA-1
X-Mimecast-MFC-AGG-ID: aG5lR4EPO927Eg3J1o8aCA_1754866035
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b081b2a94cso130922631cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866035; x=1755470835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LIwrTzSIdW4XyPecxETwMmYAEX2pSsme7PIKfMfdJI=;
 b=ZTxPFEWsVVc57zT3EWB/+2Nu1gCM4Ei5Ma5q8reAVTtA5mBz9kLD+Rz4CsCNA5Ss3J
 iRoKRMAYREnh6d3N3XGY/8Nc+4LUndtQUqAtY9YH2G2pFOSzK5aJTMAXCq5Hi5Hzxz/F
 ikXhPh0XEtA1sn8hoI+zdzs0G7uJUWq6RMyyM039XUBxfzWtXjidiROpm3f/CfayZWj2
 7C3uEQG09x1/s9FGEQqfeoyqn9in1Wm3WmOfpGYP2hsIKx1V3Q1XZtuqY7LQNHvw2oaO
 OmkX+ESIUZRrjghDuqBVab6Oc1DOdriQeVzlqH/J5yyeBKxwsao0YPiA8Ca5V1Y6fasx
 Wvvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS3TYk/oVcP6El0Uo9A99/nSctQIT2W7u3zOwuuWZb3qIYVnZaFLVKt+TA6tPdzDbeCzo3WmMJj/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI6NyKfZuA+4NtOrPLW6C4FVmbtArkaz0Jr+x5y+gC/HBzJODg
 iholeLtiRgWJoqlpmszLypyf2GBaw9G0dOZg3nUKiMPF6VF3tM+Sn7tZMLpA3dSEWaE7KhPqC17
 KBToJ3o1a/bPCMWPB7Q76ngP3Pi7JX1r+OJIhyvbGp3H/7xRdXHVqE/AS7Wwkn39Runv7ow==
X-Gm-Gg: ASbGnct0fJhRzPM7+O5mYDpe/pTqi8yV3ax0jb2qQj7tMUcYvXrxwJaSDCJA5MgT+mb
 mLWv8QsvRj1o6LeXj5XQnOUsmvtWZu05afUxmVoxEiUa0Sl+QvF94PzCrH7IGerr3DILUiMWRP+
 dhik69htfy0o2D0rdEemw7IdFVpHvpfacK0ZHoHT35MkYVuEx6eM90pp9UXLwDaRuuxtgCh3FUC
 3FfqH6mvCQD7oo4peTj7EVpgAKd05cObmaz8+sn9dwk+gbxhb5oy8SPFhMIRUK9zYrp5mcwGoeB
 /mCfy5glWP1yDvXOE1j0iRxaVeafPe4FTEjONRMzd13lGF0gjoZlTHYlPMnYUPsiyg9AkGJpeGD
 lKbhxQQ==
X-Received: by 2002:a05:622a:400c:b0:4ae:cc29:829e with SMTP id
 d75a77b69052e-4b0aed983f4mr137421481cf.59.1754866035177; 
 Sun, 10 Aug 2025 15:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI4R4FgcBh6uwgYNS05a9B+ckO+bJARHrSqSCTHnGOa6vmcxR/BVXe8/wOen8M9+MhpG9xPw==
X-Received: by 2002:a05:622a:400c:b0:4ae:cc29:829e with SMTP id
 d75a77b69052e-4b0aed983f4mr137421231cf.59.1754866034829; 
 Sun, 10 Aug 2025 15:47:14 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:47:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:37 -0400
Subject: [PATCH v2 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-9-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865941; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PfVBnMEhY+1VXjQch+u5PcV+HyG2IR2115kG2w+VUSA=;
 b=sL0ngpJvf7ih79HfcU+J6TF8fc534hLr/WKGFEbE4MP2Jf9cX1ovwrN2LEAg3nNaEFb5Q2o2o
 4np7Je1hPi0C73RtTCBtGYON4LSvFYcTDMVZedGa2hpQZpsBbEsg5Fg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g82Ik4o10-EJ1nwo4FHdUKoCUumVdu9fYXeIxwbTx_Y_1754866035
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
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.50.1

