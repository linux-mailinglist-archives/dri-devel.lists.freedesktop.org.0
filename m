Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8473B5E37
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C296E44B;
	Mon, 28 Jun 2021 12:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403A6E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C46A7580500;
 Mon, 28 Jun 2021 08:43:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 08:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=d1cVQ0LxAMAyJ
 nyzxDwgjfC8fCmMvT2orOgAt0w6ISY=; b=WBC92/WnNTMznzvkJKMgehGHX2Rm/
 8JIapVtYWSkCTiOEiUwl+D8SGwtmUrjCpJagTIVVE2RutKSqd2LmK0SW8yk9agPb
 omCpQ23MNmUs7N8SkOzhEKVqNdtbFSjyGeDiGRhv6EH+qtss37JpsirwlkCc2EKw
 zZ5Dk9j9IWjZDkdvHk1zrt6bFV700Osur/ZV7niZtXBSMT//wfZCd/xRK5vo49G5
 YgyuAWLmS3SNIw+72TIcKKAvfmM7YZibReRj7sLWnXLY0b3yP/ibCj4ekOoX4nE+
 fLgGXBjTvpiSjcrUmjLcLYge8ZD1TOJxz1L+SbA9vFeSpnuOEkQDJDPvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=d1cVQ0LxAMAyJnyzxDwgjfC8fCmMvT2orOgAt0w6ISY=; b=OrOohehL
 Wo5w2uEmtxjp5MLxnV2fOkTWQTIqJ7YeMD/6z5ixI4bpEiHCVpDrAjmFLRtkQg0D
 bXrQzdodGGJmzqsvMiKYHwzB1oDObqJNWxa8Fm8RVd5lYkyy0974BvtATzk9ACcB
 /acvdgjxsjLhUYchytwz4c3U0p0ijf8r2fZTYa19ysTrfk5rcIx5ErJkGgxjiTD5
 3y3LSgxEWfoqbHZmnzrZukV/LtBxYd0C2SBx9qLfjgJkmcKOY0jEX5qed34qtLxU
 8CPZlKnuFpxmCIilaR7AoY5kX5e5Df+X4KL49aGgtwXPLqOOkHN+JeJmimtPZEyE
 s7fAmqO6BpGmaQ==
X-ME-Sender: <xms:18PZYGusSXvZMtph8CPAGeEu-q8Jcf6IqFTvg0MhL09VYYi8cIswWg>
 <xme:18PZYLen4LPNl0AFBsp1tz88rCwTCJL5gZbbZgVpPZb9WjpyxcLLL7VnXZuR-NJ8A
 NotfG5emjaYPnzsWjE>
X-ME-Received: <xmr:18PZYBwrarNvaScuIX4LPxPvNfwFQ9-fif1lT3ptUMsBIojspQ5H5kCQZ0Aja4ns7AD5qq3tIcmNUyhZMKULFZB-JtXM8jj1VEtv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:18PZYBPvohFVN3puCwJn2u3-O384RnKqyxGiEJsKvhemjz42M_wzoA>
 <xmx:18PZYG-h8gBlDNG56fzh6miRtpyGyeDSOL5YA4ddlbvi83XiWmP6jA>
 <xmx:18PZYJUSk_lvAJgNl4H9w8gKNVUL-0mLUnFRV0vJ7zVTmcOv6OTdiQ>
 <xmx:18PZYBd9YI2P5TlcQNywlBBbRdzPiIsaCQDYOy0Z4TmqBLDBLki8jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 01/10] drm/vc4: hdmi: Remove the DDC probing for status
 detection
Date: Mon, 28 Jun 2021 14:42:48 +0200
Message-Id: <20210628124257.140453-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
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
index 4ebe216b10a9..b8b371abf3d7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -170,8 +170,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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

