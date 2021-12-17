Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8420478CCD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C7B10E66B;
	Fri, 17 Dec 2021 13:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F56893EB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D3C865C014E;
 Fri, 17 Dec 2021 08:51:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 17 Dec 2021 08:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=M5JGNx9FeMwdw
 lOvMmXdMRjjfgLQMV3WSX6j7dpkXZ8=; b=a2v5ceb/6apx31i/nsZy/79JostkI
 fwdoE1hfjWasvTUBPODdOpuvuc4hg3KG0xX+8+34BYG2HQUqz9ZwuSZN2mtzHZ8k
 vTGKMMavHCkLVlR+g4s75QzkVHF2dd/9uxxWv+Y+m/BCY6rSF8ZF1Ajdu03OOmXP
 uq6vvdg/+duZf6vHuWKn3Z6MevIi/f+XTEgUmpifacREjyFH2LuZZUuIgxdibuy4
 OXDAPO3ufsNaRxH3mPnyLT2yyKdIS8EdburlsNpTCoSKnIOh3h0fBT2Fnd3m1cut
 a+DQZp60qEHIwBqehAUbP3pMk5trYnnP/pPmEe6lGxUEH3jfNpsS15h8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M5JGNx9FeMwdwlOvMmXdMRjjfgLQMV3WSX6j7dpkXZ8=; b=C1M7Wd3L
 E9A8qM0giTVfJKvIuZk5EKIJYBkVZpwNFNjd9sFpUMuKX4MjHitstrAnmCV/oLVM
 jxEtFfR7mgEnBmCVrI2WjEiFZddZs9E3hsg/Jm5/ez+g+xAVLCzfiW/sbPsVY0M9
 58J7du7izO9tCtLhZwWiwW+fUzN0zxlhDH1WJLxrhfLTSwQ5T7QwIHo5jZ8HvQq5
 qhAoIxMhuE8I4bOcj9lDbI6zgwljiOjnPFyPVj3ObA1NjSixyRar6qaEDCRW/I/C
 z24gMFIZXrlb4syVuf8CoKGQJ/IHHZt5Tbk6ZNWwwftdCti3RPnV1MKPS7u3akxj
 ty8hEWG6R60qqg==
X-ME-Sender: <xms:55W8YegdsoFbqOQ_8_2AUSjpt2D-U10Rl9K3vxVQTdCanGCutR2p4w>
 <xme:55W8YfBHi0kuLVNHKea93knucqs0hIzNEDuJ-znRSFMxiTB0x1HIE_E00KQWFZ5Z1
 fUSEONZjdKBior_lI8>
X-ME-Received: <xmr:55W8YWGZj9tBHoHenQcWl6N4CIFFXlQuCt_DU5V1TpKeS7SWM99xMw8EOaJ42KL9E2YaQ4DbgHlSS33ZwWlnqzEeRJbY9XOHwxvcbeY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:55W8YXTgQEhyuxN-Muwh2mPjO3cLYpjmODIKZJsPz7b2XlK8uInoNA>
 <xmx:55W8YbyNe8xIB3Tz6WcqkSsevZFpdKvcdfEZ1JiPUDpwzXBtkIyM4A>
 <xmx:55W8YV7dKERQIUFqV8uw5Q0hkx5J6goMdrStiz9a0hHuKNBqYJcgYg>
 <xmx:55W8YSmcS_au0NSEpiND8sgv0Sr0mtEza1dqaXZRLg-2GAeXOM4nQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 6/7] drm/sun4i: tcon: Enable the A20 dual-link output
Date: Fri, 17 Dec 2021 14:51:18 +0100
Message-Id: <20211217135119.316781-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217135119.316781-1-maxime@cerno.tech>
References: <20211217135119.316781-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The A20 second TCON (TCON1) can be used as a secondary output to drive a
dual-link LVDS output. Let's add it to our capabilities.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 5e8f020d8c03..fef9457d898e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1519,6 +1519,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
-- 
2.33.1

