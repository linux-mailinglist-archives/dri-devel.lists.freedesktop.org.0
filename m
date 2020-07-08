Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6D219917
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A82F6E9D6;
	Thu,  9 Jul 2020 07:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624256E90A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6CD9A109A;
 Wed,  8 Jul 2020 13:42:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=f4BJOj1xVlQxM
 cKf+oW7yKIzgA+uFyj+cxi8CQLgJ1E=; b=P7woFKhxxpNNXGACwdEN173Hw4kDN
 bBpqs8zitxZc1CkwQsFfT97GbDUGbjnndsFhjyPx/pbIumKcT+6Zt3XtTACcQXb/
 lG/ccMgegAQdW8ydkoQda73EiJuubuTEdspyRh1oAQTZueg0+pL2DwAdoOFhoT+A
 4kcLUuIm7X/IgwE4K1ELP4mEPlAFZHhkKpnlk9XPsHc209SlRnHMeH8F7YBD7hfh
 DOpouqLo22dTygjy/Ch9PdNxobkaY8bq1LAzMUMtLXCy30i7xq+CnW3xM/mTaWZR
 b0pASVpNKF3Tm0HPCV/Z3Lp0Gmyt0w5l608i1oZu7z+D1mJxdhYRAsv4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=f4BJOj1xVlQxMcKf+oW7yKIzgA+uFyj+cxi8CQLgJ1E=; b=n06CJEGy
 62/8q8FdNUMDoGRvI6Og2Vjh7uMfegImB452ZIxwUiP2aOeD4YwOAwyi3dypXHek
 SEfdE8Gn+8aucg4mnqvqpIubm6rkTz6S7Hx26c5a701cKoqZcsTrP97jnj7vrtg9
 OJzeMC5EKZeoHEuRxx8KnfEBXNA/1MW9eCFu8R3pVHZ/AaSpuudDD9iNlVoOD3IH
 nmG5+oOF2e3cZWbG7mOB48rPnGYfei0MTI3CWk28PqF9bRgnfGnUKFbe21jTXANk
 yn5b9ShuHdE6Oav68myDx0S3kifj4eUm/Emvn/kdLj73z8kezMYhut8ivJAJjUn0
 YMn/TBNXhLmG0Q==
X-ME-Sender: <xms:kgUGXxPqIBxTcDlKX9RWcjtXieQqCivdGr80MGzvCmRfZ958rkK1qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kgUGXz_YyhdlcVtxPRApk7zOX4_kV7KhNWPGi6yxcWWbjSu0UPlqAQ>
 <xmx:kgUGXwQFG1MxHrrgl-7YmAjjRfuBXrWz-B9vy7a5S7-itPGVgiCp0Q>
 <xmx:kgUGX9smlgXE9LANm67CTHxf8lNVwJ3pQAEffFXmIgPJlE0Mu2IADQ>
 <xmx:kwUGXzvwJi-f_cEvLXFTWes3_OTPNL2NRtTD3_v4LwiRDdx8RiIx6iRsYRA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5627328005E;
 Wed,  8 Jul 2020 13:42:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 08/78] drm/vc4: crtc: Use a shared interrupt
Date: Wed,  8 Jul 2020 19:41:16 +0200
Message-Id: <ad67d418a44497a8f483d148f602d52b902e931f.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e55b2208b4b7..9faae22cb0f8 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -919,7 +919,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
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
