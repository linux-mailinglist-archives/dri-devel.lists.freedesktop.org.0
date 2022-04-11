Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF024FB2FF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDC510EB95;
	Mon, 11 Apr 2022 04:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9FE10EB94
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E245F3201F73;
 Mon, 11 Apr 2022 00:34:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Apr 2022 00:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651697; x=1649738097; bh=GF
 Mu8ARIAw6YIaqjRrMzqPr2bRnKZum/EaxSGb2uoFw=; b=cGwDPuZJS3qbvVn/oX
 k9FXFB1MLBwzNcHIhTxFu14GcHW0JYkhAhhGTzZVJ94qWTPPcTDfa8p4FgURBmBD
 QmxR3oUJ6mY69mIq+r2I0aOfFq8SA/GNuAVb6GQIAoVtE1SC2+4PcC+1xgcJA+KZ
 ckR6HrD1hPJXJQT8trQBEsezoaLQqGNHvHcHCdrCQx5rLrScjbGxjF/jsNan9/ar
 URO0OELpJfpyArFi4ULZ/Zu0B8U4mFHeFUMTHQpACUx+UGnrp1RRgFjAFLOwT/ll
 YkpBeHTf5OB9WHyB2VDTFAIAPwcxPNr1tC1xpC71qkVr9wJJjYhD0qMa1wUZ3uBB
 4BTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651697; x=1649738097; bh=GFMu8ARIAw6YIaqjRrMzqPr2bRnKZum/Eax
 SGb2uoFw=; b=fpKXoqZSYnH34Qv1kXpxO3HoynnoQRSCPcAJK76Tm4VxlMpvsqA
 BxCIDplh344BnVHlOZ4RXjUiQgIzNe3njpps/1R7fr9DaqJo4qpuJFIxkA8y8ucT
 mbS+vSF5vQwGq5D0T8z9P4n9PXunmOHAzjcVi1dQYw+n6IWuf0eF0hGM1hsH/4By
 ojD1O58dMsdZxcv2uX1rp5AhqCWr9xJk6dHFENla/qiLn4g+qF0TtKzVm9V1lAIr
 uK15+2PjOvnVT9oxqOTBlzPihu+pQOHms00AEqlM22HVqg/I8b7I2dpUl4ObnbXf
 lYMo2BCWM7IIFHD+fh0vAIi3pTYkyhNs5LQ==
X-ME-Sender: <xms:8a9TYna8qZUv_981JCmTrG84BHlm93qL3tr_pHVx-E69gMXM5NnG6w>
 <xme:8a9TYmZeVZE7VXJgOUC6Et4HOT2HaDKrqOyyhEK-nuytHDStq8CeqSnFKi1a40CRe
 VM2R00Nzs-SulNjSA>
X-ME-Received: <xmr:8a9TYp8tkQVyBrgIAi2v1SpphBzmIpGyQuCPdyQHwe0fDQK23h-h94kghBddzjv3kYs0W70CzT4fb13_U21NgureVAYV7O6HkDrS7jqNXybCT2KU4bvx7ASWp4dgiY1RSgp3RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8a9TYtqyRAMy9Uu6utjRKlM_YTvOuXPeYhbO0FHGD3C2CtGx8TPjYA>
 <xmx:8a9TYirHK0YOu0ACofDlRP57b63xkDCFoBmPicji6jKGxxX7xGpHgg>
 <xmx:8a9TYjQlMr1hEBUhc7cXMQUA_qGPcHGK-dJV9YiEAgkRWZBTSGqUAQ>
 <xmx:8a9TYvTsKwg_BpFHbys59XWdcKeKsbj9BBE72HjA3ojr81f7CyIsIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:56 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 10/10] drm/sun4i: Add compatible for D1 display engine
Date: Sun, 10 Apr 2022 23:34:22 -0500
Message-Id: <20220411043423.37333-11-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411043423.37333-1-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the various blocks in the D1 display engine pipeline are
supported, we can enable the overall engine.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a9ba8a77c77..275f7e4a03ae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -418,6 +418,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun8i-r40-display-engine" },
 	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
 	{ .compatible = "allwinner,sun9i-a80-display-engine" },
+	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
 	{ }
-- 
2.35.1

