Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690044A8361
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1A10E79B;
	Thu,  3 Feb 2022 11:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0282C10E697
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:54:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0EF1B3202133;
 Thu,  3 Feb 2022 06:54:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 03 Feb 2022 06:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=s+Y2ZiopchstFksww4kKEqLWAwhxvqMcV9SRrB
 2kjys=; b=wCffuXzwxhU4DyyVSDXybRye3/9twpV7U+KZeFHB8wwR9awUWZsqFJ
 B19ZX6bq345VugbFmzjPnD9eihmD3dOxcAgs0IKCsW7kvRJ1A3fWLKUmuM0n2vL8
 qjc0dMKN9W/HEGgjJWZ0ITWjVw5sqkFzTZqh/wUwOBJXuuUpbtJB7ZCjYUMrBykM
 mIMEP2iEHOCGJr+CU1z1rimCheEno1taW0/1WrlWh5HB6gRI09xXpZbvn+vGS1Gz
 2PloJQCZVJ+23m5l1VYPTGo0wLI8bb6wuiOi1IqT0O0+j2S9IB3OTkLUOeduo7fu
 Inw7Lki62HHCKz1Z1dwXSdZSejUvC8zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s+Y2Zi
 opchstFksww4kKEqLWAwhxvqMcV9SRrB2kjys=; b=OI7SglzZIoLyfwXW+swlyY
 SomY3BJjRKStk6fYZ7Qa64xyBWvDqrt168q3pcuj8SgDIJ1dwrWLIbguiWLyBszy
 vZYbF+tODkQLucP+3f/bdzNfqtBNq5KPTPSbHkpUgdAGr3YTC3ELevTY1JhodEPD
 85C7/sAG6/Iq2WqvgYNF1XZnKNFOjeNdHWtK4p8ych0YvVX+KBW/WZZ0ulT8J2IT
 YSs2lr5oXlFBbDIZ2YEMoTot4zzKcaKTKW+yyn1wl8iWqUgFqGj61K7Xvr1vCdFt
 y5YBesGGxmKilL8UjgZZvvT7oWCzebcSMPsHTuyl5ZEBjrGypVkOklRkJ81DYWGg
 ==
X-ME-Sender: <xms:bML7YYGnDMezujabyg9MeKenTZhjOdcY0xDASlTE9Lxy9OS1o5vwmw>
 <xme:bML7YRVUw69GkyBh6neSFBDn4XfruXpPliGvZQ6svROuOXJyiB5Mx41v5lXzTbX-J
 vK2SsN5fWOyhydawQ0>
X-ME-Received: <xmr:bML7YSIDcgRq0ciSq93hzlTGYp2oGWcdx216aT18bdG-1YLUEGGw_7IotPZpy8YNMDhCUFho69DPVncyhVwCTo9PdU1XXMdcNflNO0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephedvgfeujefgfefhleefjedtteduvdfftdetgffgfedtgfffkeelfeejvdegiefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bML7YaFNl_fnLIueincSEQjRw4bnOlcyCptANyOFYZQo5R_Eb4Kg_w>
 <xmx:bML7YeV32sVx_yJ45-en1P_CgxPFOCD3arLA6BTMig4RwFI6zMIKrg>
 <xmx:bML7YdNmvyOeurKVmkYcuEAyNBir8slzxDirrK3TyQHsPkDzHiSFWw>
 <xmx:bcL7YQLvZpVJmAmdNf7m4Hv-eOUoB1XK8h1Fp7ONuorYunu1GISSxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 06:54:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Always set RGB444
Date: Thu,  3 Feb 2022 12:54:16 +0100
Message-Id: <20220203115416.1137308-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, Matthias Reichl <hias@horus.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to fill the drm_display_info structure each time an EDID is
read, the code currently will call drm_add_display_info with the parsed
EDID.

drm_add_display_info will then call drm_reset_display_info to reset all
the fields to 0, and then set them to the proper value depending on the
EDID.

In the color_formats case, we will thus report that we don't support any
color format, and then fill it back with RGB444 plus the additional
formats described in the EDID Feature Support byte.

However, since that byte only contains format-related bits since the 1.4
specification, this doesn't happen if the EDID is following an earlier
specification. In turn, it means that for one of these EDID, we end up
with color_formats set to 0.

The EDID 1.3 specification never really specifies what it means by RGB
exactly, but since both HDMI and DVI will use RGB444, it's fairly safe
to assume it's supposed to be RGB444.

Let's move the addition of RGB444 to color_formats earlier in
drm_add_display_info() so that it's always set for a digital display.

Fixes: da05a5a71ad8 ("drm: parse color format support for digital displays")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-by: Matthias Reichl <hias@horus.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..f5f5de362ff2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5345,6 +5345,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
 		return quirks;
 
+	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	drm_parse_cea_ext(connector, edid);
 
 	/*
@@ -5393,7 +5394,6 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
 			  connector->name, info->bpc);
 
-	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
 		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
-- 
2.34.1

