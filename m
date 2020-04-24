Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEF1B7FD8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5766EB2D;
	Fri, 24 Apr 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263AC6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DA864EB7;
 Fri, 24 Apr 2020 11:35:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lgLp0qWWRscbA
 ZPBFEBy9wSxXxrWVVMD/Dw+AAXxxz4=; b=kjkFPUtv+BsrrC7LNyrzdOEpThfTA
 ov5+EVfmj6tF24zR7hzUrEkvVPEsaKm3CCUn4VIwEidYbGeBqvMi6ht2tnc7Zgnf
 dXAyY5WRAnS8uquielvWkT+BCfrBVeyKMqkOBWQT6YW8I4VFBCtH1GqH8KapziWV
 8/3VA4ia4jH0ZZNuj6Skx4O2YkhxnjrMwrzgfOY2s2fv4Y1LCtPEHCO3NmnlWIoM
 ZVCWZDWcubCIUMNJ3pqvbZ85gMy1vmhIzUU2L3i+SwGVraJOaOUszsVsuV6LGGL6
 FrIIAzTJKa0XIPIEOZfW3oOi7sqcSBlDfJA9Y4WE/ZTqzvVsJbrvkfNsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lgLp0qWWRscbAZPBFEBy9wSxXxrWVVMD/Dw+AAXxxz4=; b=06f2Ne+l
 fsDrhicSiId4nb/KZ1YTsCUhB9S7OpbBA23AHXiUKuxvF4pwrUX+w+8dsAdSwK9L
 XkvPEolO9QzbfC0Wj7mUgSbBrBfCtX3sYEjpcaqGOqoy1hg3DXtp14xIrRCyta2/
 Gt0hORSH2A8iHMEhfpjuXZQJ/+dIXL4uRon3dM0Pms6VlDFmDJ/iX/HWsmnRq8a0
 BDEWSVVLzYUuko1IbGUh22uF+cIytKpA4rrk678PWtKB2xY9HwVdvUkSkOAVAk+j
 qKEhBqgSkLBc+csUrlzv0owBh6hQ2OiH2VIkmPbuVVMFkoFAW6dnKIu0wAU8JfBS
 kHcyqf8RRL796A==
X-ME-Sender: <xms:SwejXuSW-qd1WRNEkIt7ADT90j6iMa2MMHAZ7GrxOsW5scx8r1FYBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SwejXvZNlHipdz5UMUC0ndUwu4xi8ETPpPOmFq54UKgZjpZNGX5VJw>
 <xmx:SwejXmSs2mJAxZdnWlLvDvKmz5Pbh3oRWhGcLnDbaMaxkU4o8-5uXw>
 <xmx:SwejXn5XnJWSmiHd3OxKK-F3hhDgvdbguO3BA8z8hK5S_EUU4AasRQ>
 <xmx:SwejXonBV-lQITbqSloKXLyshcj0Mze12CD0mPxJFBzjPU1s5LJLxlMnLtU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 312F4328005D;
 Fri, 24 Apr 2020 11:35:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 12/91] clk: bcm: rpi: Make sure the clkdev lookup is removed
Date: Fri, 24 Apr 2020 17:33:53 +0200
Message-Id: <12b4b665e18c34e5b81882ddd19bfce2ee50b78a.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clkdev lookup created for the cpufreq device is never removed if
there's an issue later in probe or at module removal time.

Let's convert to the managed variant of the clk_hw_register_clkdev function
to make sure it happens.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 013706816895..eb5c4f5720e8 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -245,8 +245,9 @@ static int raspberrypi_register_pllb_arm(struct raspberrypi_clk *rpi)
 		return ret;
 	}
 
-	ret = clk_hw_register_clkdev(&raspberrypi_clk_pllb_arm.hw,
-				     NULL, "cpu0");
+	ret = devm_clk_hw_register_clkdev(rpi->dev,
+					  &raspberrypi_clk_pllb_arm.hw,
+					  NULL, "cpu0");
 	if (ret) {
 		dev_err(rpi->dev, "Failed to initialize clkdev\n");
 		return ret;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
