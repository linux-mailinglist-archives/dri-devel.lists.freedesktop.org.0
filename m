Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8D16A2AD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29DA6E34A;
	Mon, 24 Feb 2020 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD686E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 160C960C;
 Mon, 24 Feb 2020 04:10:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Kc7cB+siTPadg
 gfY98n1dIUNfpOHCaNhkrg1nIOPsT4=; b=rxDwSTJrSH+ia5GRBGp9HkdqtN4nw
 cnhL8L/Yt59RmmEly6aFuA76nNy3d+evKCkOQLcmBitVW6REGgS+/XYWPN++L2ox
 /iB4fhAGe83RUXshBShjGz1pe9l0nxon7nhG8UjPviZqA7Uf5xHdagwGra8N2aTe
 sbh1h+V0/IiHa+a+S6lhBTtMdmaJHrxnn6nIcZroVg1X6Iv50iiYKGfrffYYilbm
 9v9G6yg2JegyI+pefjxnm52iOXLrM8zwgOnN4j8M4DWHZnMUxKyxvBJhFKknA9Jv
 KnQfHjtVPrpZCFoscHM/t60QeMkwdF6o2+zeAjKWu/avALUeBmULCDE4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Kc7cB+siTPadggfY98n1dIUNfpOHCaNhkrg1nIOPsT4=; b=BXcz6Jmc
 iAoWpqj/kIX6i9s16A2gSWuVU6/tjN5jsDPioCvgvGdN3Pab9NUOxDl9cJQjZkFF
 jUYm3hnMdenUJJwe8l89678gYTqI8VGJe31IiNzYeazsIYbAeaAo/6sKEJMG/jxi
 EDYTP6f+eQqpr89HL6naybxHo0D0LoQgk2QZsFEuHjQ/84XioH/t/3w84SYD0FzX
 VAnIhp5AyocEVE8rRFWj7ICsM94sC9LcBOz3lQ92QdWNenUz7mAfWhu7d0J2/D8z
 u/O/MqZTa0tJlpOz8Jn7T5x+aShvwHVRkLjRk+L5EEuV6VnopSeNBp0RBIIuVxv6
 CY+fi79+et0hdw==
X-ME-Sender: <xms:85JTXgqB78qdwP5BZa2YhMHbOi3mt3JrhSGxhtWQbovBc9wewioxwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepgeeknecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:85JTXq7iRdgBwU3PisRJOGge1OFuegSqmhY36ORBsVoROmrDt2BOSg>
 <xmx:85JTXgPFfH1DIx_X5_6XMGek9UOKqjkov-WrIGoKmVj6UWaTAy99GQ>
 <xmx:85JTXsOd484TWoGIFsMcSZJPk4xHYwkHTY7z8cn4apMO3aK-EX3Chw>
 <xmx:85JTXh0Phz74QwzWAuRTo0mCt_uJedtLQMa0S-P4gmt-QohPN32f-tWmzlY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 541C73060D1A;
 Mon, 24 Feb 2020 04:10:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 57/89] drm/vc4: crtc: Remove redundant call to
 drm_crtc_enable_color_mgmt
Date: Mon, 24 Feb 2020 10:06:59 +0100
Message-Id: <bd7d94fa2c8ad256347408cd2e175a25a1af3469.1582533919.git-series.maxime@cerno.tech>
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

The driver calls the helper to add the color management properties twice,
which is redundant. Remove the first one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 34e914b3c686..67d9beb2cff0 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1197,7 +1197,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 				  &vc4_crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
-	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
 	/* We support CTM, but only for one CRTC at a time. It's therefore
 	 * implemented as private driver state in vc4_kms, not here.
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
