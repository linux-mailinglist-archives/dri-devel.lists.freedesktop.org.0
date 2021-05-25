Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77686390232
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491BA6EA28;
	Tue, 25 May 2021 13:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3B6E108
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:24:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9BFCB5806F6;
 Tue, 25 May 2021 09:24:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 May 2021 09:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 mwr+loUju+nUboAV2hMRTjqnQueA+4RdS0j/M9fNa9A=; b=Cd7vRdfjoGi7Fcng
 TBvMum69m3QhfF2HwMCkBw4WExrniuycMSYXJbOhcQ7WRcnw6o59e7/MoLnUYdtn
 53ZMZf/9DsATvjJn8pKSyQBzSi8BpCV2pHi7V4tzhmpAewvO8cZISLIei2xamEOP
 tIEY7XTAFk8enHBO2NRKJ9N9bUvVWZn7yfgJ1RcWWOJBV0GnxyWad44XqqnLtXRx
 RtS89ID6qkz/yzWVe0WpFyvpTSM+F+yrbOKlwwloj0zXvPs++tL3NBlWd2h25bNz
 a72N5kMRfpe1Bt3TdWkt6QGtxRfFl7uapvuJTvaVNsN9XSDLzcGmWX1G7QLv0LrA
 m0f0hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=mwr+loUju+nUboAV2hMRTjqnQueA+4RdS0j/M9fNa
 9A=; b=YSLAyLB42uKhVp45iIM4+Ybxqns+f0UyMNmLKTEfvPr2O+dLENGDOtTrT
 VyF618Eac1x3iDQxR8a9CFrED5y6JUVV3rWoUhHAkHGUGVqUAdJSakT3Io6gpd+G
 UYBE+6TYyRsGDCBfd+EV3+ooP9zHEWRXkvwe8dPEHmLrrukeagFon7cyqbOZF4lR
 oE4ND4GjwGda9QSkjq/v7crYeoOOazhWj/lh0peg3v2hJKTujJOdCcSE8+3VMCex
 GTgiZOUCn/3009oB6z2ypo5Fn2b8YGoVJwzbuNUzPDZqHHIo8O0JWrKRzE9mgKQX
 qrmC96kif67KVs9ySlCiRgBQeDHBQ==
X-ME-Sender: <xms:cvqsYO4bcFRyVIqa7MJQFTbF6emxBNij3qh7Esys7n5K8nj3N6LNFw>
 <xme:cvqsYH7UMRi2GyIRgc_BZDCbzLEX0f6JqogFLxHsybLUMCgjg5nqdY-tAAfPsDXlh
 0tc46ry6UHgQtdkTHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cvqsYNcFqTG-QKcQALPkSUYwJ0xo3WU1yyQoSWHxp5uFvbck5d9yFQ>
 <xmx:cvqsYLISThlYdIbC2JuXoH1P_2PsiRUxK7q6uCBci4gmAUabEA_gWw>
 <xmx:cvqsYCKmZb8_hpcy9I8PENiKakw4Rm3RAa98PXbptoy_qaM4Mg7_qA>
 <xmx:cvqsYKDZ9sotwubZ5Sfqs3X9ZHmMXpx6kA06mhKJ36xvo7tej0IixQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 01/12] ALSA: doc: Clarify IEC958 controls iface
Date: Tue, 25 May 2021 15:23:43 +0200
Message-Id: <20210525132354.297468-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The doc currently mentions that the IEC958 Playback Default should be
exposed on the PCM iface, and the Playback Mask on the mixer iface.

It's a bit confusing to advise to have two related controls on two
separate ifaces, and it looks like the drivers that currently expose
those controls use any combination of the mixer and PCM ifaces.

Let's try to clarify the situation a bit, and encourage to at least have
the controls on the same iface.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst     | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index e6365836fa8b..01d59b8aea92 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3508,14 +3508,15 @@ field must be set, though).
 
 “IEC958 Playback Con Mask” is used to return the bit-mask for the IEC958
 status bits of consumer mode. Similarly, “IEC958 Playback Pro Mask”
-returns the bitmask for professional mode. They are read-only controls,
-and are defined as MIXER controls (iface =
-``SNDRV_CTL_ELEM_IFACE_MIXER``).
+returns the bitmask for professional mode. They are read-only controls.
 
 Meanwhile, “IEC958 Playback Default” control is defined for getting and
-setting the current default IEC958 bits. Note that this one is usually
-defined as a PCM control (iface = ``SNDRV_CTL_ELEM_IFACE_PCM``),
-although in some places it's defined as a MIXER control.
+setting the current default IEC958 bits.
+
+Due to historical reasons, both variants of the Playback Mask and the
+Playback Default controls can be implemented on either a
+``SNDRV_CTL_ELEM_IFACE_PCM`` or a ``SNDRV_CTL_ELEM_IFACE_MIXER`` iface.
+Drivers should expose the mask and default on the same iface though.
 
 In addition, you can define the control switches to enable/disable or to
 set the raw bit mode. The implementation will depend on the chip, but
-- 
2.31.1

