Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5A1B7FEB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BC36EB1E;
	Fri, 24 Apr 2020 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3276E081
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5359B11F1;
 Fri, 24 Apr 2020 11:37:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yBSySeAZPxbSW
 /2B2VlVvClbPmm7sNacu8s8+ecmGOc=; b=nVgZ3BmHUJ/SAPkWYxAatjpK5sbaL
 CiuReG5xJtySJYbOcmEmtNl81JFo2TMF+o3ryrpaZRPwt9uyRim7ylazyQ4OzP05
 p6sbEQBza0RJhuJ4SYUR7K4a68rz9YqLTfLIZdoj2OEQ0d5FOaiYPsgYqINXlhci
 yOZFq9OQUmXmhLR9jVetTddR5GYWgc246/IadaHIfp9EiDNr6EaNaadLq5wwn30U
 JiNU7FYmAxF5hGvyNoo4x57UrQqQZXUK+t5Wtv67XhKgyIS7yg10s6Lgxe1GVLMi
 46wELmnOfEfPew7qbtvTtX9sVlkncBXQ8Cg9ZeLhZXeN9dj/XfakqS6eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yBSySeAZPxbSW/2B2VlVvClbPmm7sNacu8s8+ecmGOc=; b=kkXLQ0tH
 OPlHxST4wEtDiLAxHh15oEZ1DEuCOqKHmBRSddpiWY3o3bvHVf/g49beyyr9IL+0
 ulaPSGp8Xcs5H8819TDtkzBo9z4tMOR8GutbZvjEDCOQAnLneFyiZOV88SwgFJ7J
 AZmusZj7ExFp8am3TFya2FmxLe2xuo2mwfF6SYUF2DzL62Mk96+TD6HvHlG6sPvu
 ZUCNeW8YEt02rNlQvv/z/ilSidKMRqy7eCTtBy24SMN+54ohDJhom3Ir0jFsoESi
 WqxqwfbfX+aiQQ1kIgl6+Sa3Lm39Qe42wNIZStuAeSlAScepybgCTIltrblNhKx7
 Or1dTdZqRgD9Qg==
X-ME-Sender: <xms:rAejXmScVu0kHwNxDAm7F-tnzpZJDg-RwH-rhMklG6lAubEPjyXNIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejgeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rAejXpVK1q1yPn3mdI37FqMKSobLI2UpAj2PrjRahTAngil72tQHDw>
 <xmx:rAejXqQNSxE3iodkTiPKjWV2bPnlQ6d-S0SUKGwR-Nv4UqKeQddTDA>
 <xmx:rAejXjn7Gt7ZgoD6kEkTelKYoD9f_r_DooGZssxMLWAJZXLpj-MxEQ>
 <xmx:rAejXj9XdYOyo4D5NJQ82MnqCgVXlz34gA3ikyWdQUQ7m6YKRxDaGuiKSgI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9064C328005E;
 Fri, 24 Apr 2020 11:37:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 82/91] drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
Date: Fri, 24 Apr 2020 17:35:03 +0200
Message-Id: <0a61007b3a91a8f70257fb3a3d417eb424860491.1587742492.git-series.maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC_CLOCK_DIV define is not used anywhere in the driver, let's remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 20b6af98abad..360743187f95 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -54,7 +54,6 @@
 
 #define HSM_CLOCK_FREQ 163682864
 #define CEC_CLOCK_FREQ 40000
-#define CEC_CLOCK_DIV  (HSM_CLOCK_FREQ / CEC_CLOCK_FREQ)
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
