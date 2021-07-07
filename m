Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD43BE494
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32916E093;
	Wed,  7 Jul 2021 08:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01716E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:47:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 910572B00936;
 Wed,  7 Jul 2021 04:47:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 04:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=iCWmC2ecLLuxN
 n3QZCajyh2Iu29eugrlpzbybb0pnSM=; b=H13zsr83PaNYCAedcFECZwcwa9uMr
 O/7aKTy1XCu8saNq8iu1usbldMWuAtVGLZ3nMEo0QNVkEDjDqQ/proGe3pWOqXv3
 MtY+T0e0rIxJFlwzdOzGCajaunAOSHz/NCNPAKXJyuO036fsNfswnHhHlVltd1Fl
 Q8UdcYQI6x9H3Is+NH8UYxMr57B8PskIGr9u2HJEt1+NZcDy+J1x5sAK3Pz/Joll
 gCvn1P9wRi1qli8qyq67ZVFk2dLTiOfysRH5/LOhU/uFBfI8N/7XHJ76smYS5V6r
 BcdyRs8WrXkiOONYYy2De3r03Y2uDTKA1r8340+6bq41bt0T7ZI0yTx2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=iCWmC2ecLLuxNn3QZCajyh2Iu29eugrlpzbybb0pnSM=; b=CHDYwvUo
 MCv+DAweF+pzaFm2eQ7/gWQk2BLvxkUHG2RlCSCGcxwcBrNI1j+04SZbpxjVibLW
 108oORqXhqvqi5T5iPCh+gysa7JYIba5FY7Qv2lWGd0Y9W8xOgVEzUH+fygdFtXw
 zxS+48wM+Aq/3K82jaZsyTVDaUBjrBO1MVg/e/GQSf1ExN4IsXBu7ML8QsiPOcqP
 WA44zEzloe5xlFskzwJ6UZhG51UfrUkTAX6KilJpr4QMRj2j3BSScruSV8pSu6EK
 tMo3VCV2VyVXQ0e62Ctfric/qevwJmut3xX5dwTIOfzS7P9LcEzxYHIwfMKlXj5g
 SrQdZP8cgOHgvw==
X-ME-Sender: <xms:OWrlYBDe4NST5c1AlG4qUqO-ruC5EyvTSF_QmtxSU1BYxm0Ox4xoMg>
 <xme:OWrlYPgI94kWRa-FP-PMSV9PWnqcJkMTABb0VoWyPgJrIGsikzw0ZsikLgCEj0cel
 X4VwmvVjd7_p15HElQ>
X-ME-Received: <xmr:OWrlYMn5PfxzIr4oPvwhleSXJl73aSxrCFJ5DJVwof4yuwiaQlNUuVlZIDjX-Ow6_xmHgGQJF5UnLCRNX5UGgOXVF5OniugS92wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OWrlYLxc_ez8iP0RhBolr9MdTJPVajTWdfZT4Z5lc45OrHJqa_p5Ww>
 <xmx:OWrlYGQoxUrXMzPOkSC1StRQfY0Qkrx_hIO3Ngo8D91h3HWpFX45kA>
 <xmx:OWrlYOamUm1yzcS9ZqomFi-KrcLSOxaR8OTlAUvuJLW9yZ3V8cXhnQ>
 <xmx:OWrlYCoIEuTEir6P1z52PGAQysvWIKudH1VegeK5aPJS772nhYhI-F15E9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:47:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 01/10] drm/vc4: hdmi: Remove the DDC probing for status
 detection
Date: Wed,  7 Jul 2021 10:47:36 +0200
Message-Id: <20210707084745.1365390-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9d44abbbb8d5 ("drm/vc4: Fall back to using an EDID probe in the
absence of a GPIO.") added some code to read the EDID through DDC in the
HDMI driver detect hook since the Pi3 had no HPD GPIO back then.
However, commit b1b8f45b3130 ("ARM: dts: bcm2837: Add missing GPIOs of
Expander") changed that a couple of years later.

This causes an issue though since some TV (like the LG 55C8) when it
comes out of standy will deassert the HPD line, but the EDID will
remain readable.

It causes an issues nn platforms without an HPD GPIO, like the Pi4,
where the DDC probing will be our primary mean to detect a display, and
thus we will never detect the HPD pulse. This was fine before since the
pulse was small enough that we would never detect it, and we also didn't
have anything (like the scrambler) that needed to be set up in the
display.

However, now that we have both, the display during the HPD pulse will
clear its scrambler status, and since we won't detect the
disconnect/reconnect cycle we will never enable the scrambler back.

As our main reason for that DDC probing is gone, let's just remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3c4cc133e3df..8779cef13f52 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -169,8 +169,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	if (vc4_hdmi->hpd_gpio &&
 	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
 		connected = true;
-	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
-		connected = true;
 	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
 		connected = true;
 	}
-- 
2.31.1

