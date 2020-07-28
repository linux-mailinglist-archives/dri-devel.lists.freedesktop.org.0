Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922E2312AA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249C66E3A8;
	Tue, 28 Jul 2020 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3086E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:48:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15FBA5C0135;
 Tue, 28 Jul 2020 09:48:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 28 Jul 2020 09:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=5Tv2+h8oVwzy9
 dfwbmGHFVeDzIUolLWKSuyfYh2PVSw=; b=QiIYGGP0aX399rpcERvIPmvItJNqt
 k3Ts7O7uhbltcxTXI08yDbzUGO6DYs54vejzQPwRjsTUllWtofrRRtxZp9qAH1Gv
 LUKHvWXqJaHf6pjwSt25v4tR/316nd7Vq4iCEfHSjyF+sOtNU/7ZdOfLnHzaQ4B8
 igE49SVIbBCnArmZvjNbqC1H/VU4ZORKOa3xYTgky01nYRGBZSG/RQO8Ktje7YrT
 jtdq0/NuoQbmQ+6746yKmDL2HScbOQDjbVour3BKnYq9khK7mu9PsFGYBx6cFBUr
 jczfC7/mBrZrVI+jtddPTlAzNMjs7dieN+jttUT4KZIgnWWnWEBuqrcUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5Tv2+h8oVwzy9dfwbmGHFVeDzIUolLWKSuyfYh2PVSw=; b=qN3DiTP9
 kI8V+mDG1Dy8XC2Zhc7TXCQ53e3IjEC6ad6g+gu4bTfO+YX87NUvvLpHoY8hGniI
 e91QftfE/FRoO0+Ey89aJBzlOTF1EimBnSROPsZJuLXO6QRQg5Q4dHV7IXPa18Ro
 rTqvu8Im/FX8y4WY24KOed3+GeuF5nQHra3/tGQeEsoPMUpzKWPEbFJfM95hu8zl
 a/kh0fM8PTNxivA8GnZp10EqxiLTNiw1WxAART7b+boPRCZ57acO4bJPzMbIA0EF
 Z/s5PIxgGsLNidOoib9NyIIcd02iBWoSCFFKCfDakTRz8Myddeh5pNbRdpd5om7c
 OydaLYtyRrPX4w==
X-ME-Sender: <xms:niwgX_YbxjViOB-Y9oR4vEBKqRRObjZKMwgzYIUcqHLMrQrFeBQHEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:niwgX-YHN0XbKYc4UWDpbIcyVI7Vzbrou7NWchmoZC7B4nx-kHU6DA>
 <xmx:niwgXx9Z75z-dSFkJuvHJUyRTUG9wmgHloXo6ihpGe0BHeMShV2FEQ>
 <xmx:niwgX1o4cisv69o0K1SBi6nMAcI6f3LFaWc_DhQUZoi4po9Tkemnzw>
 <xmx:nywgX_A0ErFH6ZmyAwRz48TSitg4lickrMTu0SDFLM1U48818HijtQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF5FB30600A3;
 Tue, 28 Jul 2020 09:48:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/sun4i: backend: Disable alpha on the lowest plane on
 the A20
Date: Tue, 28 Jul 2020 15:48:10 +0200
Message-Id: <20200728134810.883457-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728134810.883457-1-maxime@cerno.tech>
References: <20200728134810.883457-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike we previously thought, the per-pixel alpha is just as broken on the
A20 as it is on the A10. Remove the quirk that says we can use it.

Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Fixes: dcf496a6a608 ("drm/sun4i: sun4i: Introduce a quirk for lowest plane alpha support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6d0f0526515f..24574bef28f9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -994,7 +994,6 @@ static const struct sun4i_backend_quirks sun6i_backend_quirks = {
 
 static const struct sun4i_backend_quirks sun7i_backend_quirks = {
 	.needs_output_muxing = true,
-	.supports_lowest_plane_alpha = true,
 };
 
 static const struct sun4i_backend_quirks sun8i_a33_backend_quirks = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
