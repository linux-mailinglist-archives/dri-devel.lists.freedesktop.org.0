Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1125D1EF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DEE6EA87;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4D76E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E4876B0C;
 Thu,  3 Sep 2020 04:02:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xjW7xn8tega2f
 QqhFSzGhgXz2ZtI1k2ChmTaGq2MRWo=; b=Uz9EJdBNxHaqLxRQ/Ib3tBqUPOG9E
 hunKIXqrpRysdlcSlHY9ShXDQR75jjGS433cJRxX4bcjzMksOWbMdreV6yjgwm7H
 dQq7Arsw0qs+Oyp8ZhF6pZO52jXFnUe+vvwZTZumB9EkMLypEeXeX7g0RM84M1Iw
 SvyGKUl+9K0Tv4mSD465hNo0gqRRNU6ZwLO50Gf0tjghTA2FxGzj3s+krTfUUmFv
 6RzQ/8+zqRV4TT5sLlA3/AlmTQXp2VSWeqKqzIWDBhADtlBAQK44eK6t725uuXtO
 hDqNTJSsiYJClYcRFx/18Jub1xAI7G7MyCopLMnfT9YgVFdZUIZlMjOcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xjW7xn8tega2fQqhFSzGhgXz2ZtI1k2ChmTaGq2MRWo=; b=VUwAGE9B
 V73t/XvIo8qh8fhp8E1IvHIWUFwKvBdyrFkVoPi50ibrHAEx6a2c9pzC6i+ThHq1
 BaOIOGGOgk3ixqmHuar0D46HX0gL3knVaYOBw317v0KwvjJKLBEIXBBP4LLFLLi/
 7n0K1Y61pINMyxG6N8glRfYxmuLaXmwSkX4O1odSRSWpmMik3Abt9KhP0R7cpO5a
 ODiytdIbohMdKAgq32nvQw9JlmWZffX3z6zCbKTiCeNYdIip/SRx3kjfz4zHb6fh
 al7pmwFNA2cKjAgoZchafrtWM8wi3tI1Nd/rf+E7x0UnRPEJP4BYtkD9oiVFR0ym
 +Oy75Qpd5jg4/w==
X-ME-Sender: <xms:GqNQXxan-cttdCgdM3JA1Au7uF3nDjVQ3YXXonh1PvWaa0jdo85NkA>
 <xme:GqNQX4YEqIkIIlZ5IfY6H-ze7E0KtxT33rVqfMKaTLZcKmbZQ2un3-RakBYSQD75J
 rn-O-0_Q0o5wv-NdC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GqNQXz-pgudW9GfT5o8pbUpoIlQjLHrMXbvQwyswbiJD-KpbjuE9mg>
 <xmx:GqNQX_oVqON8gscs6pT5K60H6BcdHsrhbvXmSIYJ26p_DhZZurOLag>
 <xmx:GqNQX8q7Cz0OnSasbUUwdKKMwpIREyWOn1VqKc5EGh4zTJYt95tHyw>
 <xmx:GqNQXxQd2bvXwCxc2bkRUhArzec_vwwIkG8OgqkBTF8h0YRvabDJ3YLgjzA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BDD7306005B;
 Thu,  3 Sep 2020 04:02:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 29/80] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
Date: Thu,  3 Sep 2020 10:01:01 +0200
Message-Id: <15cf215bd2ceebd203c4010c09c21a4019c650ed.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid pixels getting stuck in the (unflushable) FIFO between
the HVS and the PV, we need to add some delay after disabling the PV output
and before disabling the HDMI controller. 20ms seems to be good enough so
let's use that.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d0b326e1df0a..4c23cf8aefb9 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -403,6 +403,24 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
 	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
+	/*
+	 * This delay is needed to avoid to get a pixel stuck in an
+	 * unflushable FIFO between the pixelvalve and the HDMI
+	 * controllers on the BCM2711.
+	 *
+	 * Timing is fairly sensitive here, so mdelay is the safest
+	 * approach.
+	 *
+	 * If it was to be reworked, the stuck pixel happens on a
+	 * BCM2711 when changing mode with a good probability, so a
+	 * script that changes mode on a regular basis should trigger
+	 * the bug after less than 10 attempts. It manifests itself with
+	 * every pixels being shifted by one to the right, and thus the
+	 * last pixel of a line actually being displayed as the first
+	 * pixel on the next line.
+	 */
+	mdelay(20);
+
 	if (vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
