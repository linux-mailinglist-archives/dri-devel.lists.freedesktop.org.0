Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3516A289
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB386E30C;
	Mon, 24 Feb 2020 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1099F6E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1D289628;
 Mon, 24 Feb 2020 04:09:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HrcO6q4Cs/fdy
 zr6HzRlMJbR7u8he4OI01tO0VTXeAY=; b=TW+wXJz5Fmko4RC7evt3+ZqbzvdhW
 kgTnQGDcqdPm8XLNrLhRno0/NoTygahw6RNbcAgPqK7m/PZDwyxSJqnzP7r2SVFS
 V4EheerRnwkNrL9sCZOB2/98J8lqu9qcIaiHuGYmrUlHUsR2eUuJ3GZOBBbU6cOE
 c/5kwIfa4uKU14CL6a3ZQNc7zgnnVvfRctkcpkIyYsdJj/7eA8ENLI3WNk2y8uhG
 G1STe9Uxf8qk5xzgwpzfhR/6tgoSbiVyFyVm3mYYZz5upAIgaNK5ZPzI1ftxVUwt
 VC9L7UPayPKh6/q8xHM3BB8XRiEV9C05HIZZNnoctheCMqNzdjYBObvRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HrcO6q4Cs/fdyzr6HzRlMJbR7u8he4OI01tO0VTXeAY=; b=TmazJPbN
 0Z6lmlo/FWAM6/7iLe0xjohhcdo1SW17P0gThxzbCt1SPuE+c2WYNIy7bGwp2Mfx
 f4+qzhn9WVyDne3Xd2KIJEsULRSmHs9NkDznrfQNqS9DwYADFJ5bSe/OkqYq55NK
 M5inXuQzJZnjW00v83HIx4lrzaqDy95Qe5WcbyEs0AK59VwhIuL44bL+KT25eRsc
 DSBMJ2LleRqmMgtL128T9UX9TkU8RoLfaY2bfN+4wB2MkEH+Ubf5IsX8SUfz3VNd
 xKy1966RNoI7vdsyMAOHXCBWEAi7Mdyg+PBlquH9RurdS0jTXO9IYSMMEQrTCs2+
 z7o+qDncElxREw==
X-ME-Sender: <xms:45JTXqfhlq7Hr7khdUbHL95OND7PElQ4UOfZ8XRtP8-U9gxrkqmfjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepfeelnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:45JTXudW31iRM17FBtGQaKKwclFiN09MVDb6N26ckd8glxanwhHNLA>
 <xmx:45JTXqc2ZOuACeItKn5binEtBt79XEUcO2i5Gg4r0vVWdRqMlkCyLQ>
 <xmx:45JTXvlt-JS5mXfwzpwl-zeYysYx8y1egN-jzr8Ys5GM4ozuXnqzQA>
 <xmx:45JTXpYCY6gSzKNCoRqUe-5GOaDiu1bkD1ITjsNZ7u196uJSqdEhFvRMnfs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5ED99328005D;
 Mon, 24 Feb 2020 04:09:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 46/89] drm/vc4: crtc: Use a shared interrupt
Date: Mon, 24 Feb 2020 10:06:48 +0100
Message-Id: <386f44abd9b0f5ee6ee1d76b23025a27450a093d.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Some pixelvalves in vc5 use the same interrupt line so let's register our
interrupt handler as a shared one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 236a14190ebd..4a2ea897eb48 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1176,7 +1176,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	CRTC_WRITE(PV_INTEN, 0);
 	CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
 	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
-			       vc4_crtc_irq_handler, 0, "vc4 crtc", vc4_crtc);
+			       vc4_crtc_irq_handler,
+			       IRQF_SHARED,
+			       "vc4 crtc", vc4_crtc);
 	if (ret)
 		goto err_destroy_planes;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
