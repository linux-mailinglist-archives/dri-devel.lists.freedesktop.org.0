Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893C49B637
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4F10E3E4;
	Tue, 25 Jan 2022 14:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5601210E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:29:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B3B965C01A4;
 Tue, 25 Jan 2022 09:29:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Jan 2022 09:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=zkBm/4ZltxxjQFZ2KTdj9lKGrDgPS/EGZfBlNJ
 PoI2k=; b=G7IZ1MVKyBRQVB7nixFIaCmcBEARgoR92y6bGKOKanDVAD4X8jqfsa
 lE/p88+FUSaOUQLnIwNz5MMoTyJm4exedCQ97+vqaqw1bUGdTDDGQj8fX76V5Wq2
 0NBiXukW5/Bc26/ICkLMrAJmi2xK92ulFozNA0x2Eb5ACyORtHrALqMt1PfHJ/H/
 +vrkL8OsQIwgytcbYA7+rebMaxJ8Mz7fNhOH8cuzT1+nGofZ5mf+iposeFmm1355
 cOUCTXZDZtdI32VW0Ov490hsu4mJKem2dtzVPF0y+gP9CZ6Fdk8c34av4k94F2Fu
 26VxIZ9ZKhaV9BOhcuZqja92+abFRWqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zkBm/4
 ZltxxjQFZ2KTdj9lKGrDgPS/EGZfBlNJPoI2k=; b=LXPUvWMZ7oP48HTENVPGyv
 fRjtfSBAHM569uGewIawARsgqamP+L+32aGiosLoNd97JZ7fcymjjD1OGxTKKALi
 xNQ5ujW6pdF7xQk5JxGwdB5JhXyiLeEb+2Cl1PAzh4QHy5kAvTvQtPnltJp80XBw
 bdSUzR0GhJWQ1SF1g1tIg/KHGrto5mBX3JMZuMXBb7T2OmFIfIjFBT9s6aRYcZ63
 UUplMsZ5v/lLS8P/RSoKQOF1lB6ecaz0LpPDz+MGMrAkZ8UqS7DA2PEuVN7vUxD8
 vZRMjZlByj3U25gPZ34ybqJHCfw4BD+Igtaq+KwPBe10aCzzLwlEg2dRCri8oFwA
 ==
X-ME-Sender: <xms:SwnwYeeqWkJriRWAU5XPV840QzWUb5-n63sbs0xfjP7myzfxbcf1_A>
 <xme:SwnwYYNqEN3JtexrIa4khiGGzH7UoRt4ssEFBpghe4dNY5RoJQMLLsc0iGhD5GSfn
 OuWR8GZp-vxX7YRN6g>
X-ME-Received: <xmr:SwnwYfhj06GnznSggf1TNZxBhWzwN1WUJZh4Q3z2dDLmVKw5WXr6YLPECwDkqjqvbt3vf71KMeyttTxgWWQ96HQxtvSoRhvA7afdHng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepueeggefgudeigeekfeffteehtdejfffhgeffueeftedugfeuffdvffdtveegleeh
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:SwnwYb_MVVBf3Jqgw1SebswL66NeusS172i3yC0jTsmZePsHZ2z0WA>
 <xmx:SwnwYauL0-iWU9R2pszKqWAs58SKkAyydPiTbc_bTQBfEtssstZJuQ>
 <xmx:SwnwYSG2GL6eriD5O4T0-oeXNjS7Sh-aOv2XAGN8jilIb1JEM6B61w>
 <xmx:SwnwYeiXdEpDoFqi4V6E3leE-Rkw5wJXsIcOJX0Ty-C7j6VWlzK3Rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:29:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
Date: Tue, 25 Jan 2022 15:29:28 +0100
Message-Id: <20220125142928.750258-1-maxime@cerno.tech>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though we have the other drm_display_info fields reset, the DC
modes are missing.

This shouldn't be an issue since it's explicitly reset every time a new
EDID is parsed.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220125093251.594772-1-maxime@cerno.tech
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a504542238ed..a7663f9a11d2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5340,6 +5340,9 @@ drm_reset_display_info(struct drm_connector *connector)
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
 
+	info->edid_hdmi_rgb444_dc_modes = 0;
+	info->edid_hdmi_ycbcr444_dc_modes = 0;
+
 	info->non_desktop = 0;
 	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
 
-- 
2.34.1

