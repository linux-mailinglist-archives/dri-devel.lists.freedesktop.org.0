Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E164645E5E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8911D10E3D9;
	Wed,  7 Dec 2022 16:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B1910E3E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 906485C018B;
 Wed,  7 Dec 2022 11:09:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429348; x=
 1670515748; bh=Mq5aA9U7Au9SdBfuWfKmxSGYdNinh4Uk6f7mzeVUm/Q=; b=P
 3HnIVad3ldAmGacbFk19Z05sKhm666Pnd92ETbHaCLQ+grTy+tupXG8MDAoH2jD9
 kkS0fNenD+w+c7uuqd4WZiZaVHpkVr4Bf91VZbG1XOBz6hLarrxJJkN/iSTzmQvj
 r5OBEJq6SD92WaxYIb1CSrOcTUT+uhJ8vd09hesBegJFEWwDDlRjwmY2CQ5s2N7q
 t3s5YQyS4GzsmuMhgn1fVCNbI0QBmRt63iIPJAbBe9P4F+FWxq8UwdteV+uNwH85
 lRCRs5BQe+XP4aDjmuSmIi2b6UVSij2vsha6GFZolnqsrh58Q8ypdOT2vdZfbj9T
 zHAtGkcpWGJY0P9341vAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429348; x=
 1670515748; bh=Mq5aA9U7Au9SdBfuWfKmxSGYdNinh4Uk6f7mzeVUm/Q=; b=U
 E7DqAG5wNvreHLmbQKJLUDqmHNM4ne9xtUZJMLO0IlyZErU6W/rXBR8hUvPNAWp8
 QwLPeV2QN5xQJjgBCqqZY61GTo/vwNXh+h7e50l0vlTFqKafLpstu+s6QZbDNVLH
 CeEDYecA6Fhl5gAuSGPhMTVeX6/8y0oVaiJ8fRxdS+vHGyKfPFtFubPNiH23JBTJ
 QJleyaGavSAlq70R+VJ1VegoIFDGFGIv2vabaBt7mWPfEmlYA8ttZ97nzSlM6QQn
 O8tgJVA10TV1flGw7BfOcFgcOXdiW1WLwVlRfaHHW/DUpoabPdLawRa27PPxeWGA
 XnIyc3wxCfCIMytAgiv9Q==
X-ME-Sender: <xms:pLqQY95aSVBpuw49bq9tQWsrhhSSfyxE7PmNZMRCzwRKLXpAFkiNBw>
 <xme:pLqQY65AfaclrMvmWuZDJYNC6bLyqdMnAXDd8xkfWY7hxZRxsWLhPT8UnRBQMjk0x
 NLNoHdrz587XW0k77Q>
X-ME-Received: <xmr:pLqQY0c2OVRLyZ0HPQdqGcrz8ba8e3YoTzOzrBYX-VXDVvD3VxFeeswSTziBTMyDYmHzMSLDxFS-cuVMfMprc8sqrR1SGterbyiFwgMC1FF_Dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgffegieetveehffdugfektedvvdfhudeiffdtleehgeduvefgveefleff
 keffudenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:pLqQY2JSdyNB7jwIar2iy8S4h4IzdkROCHNHqhvtB5bsFzvTzlotlA>
 <xmx:pLqQYxLkbXhRTsNFXmbLyV2xp4ePWJ2iX57dQ3k23UlSpsib-OQ6Mw>
 <xmx:pLqQY_zjMF__-m1VmeUqOUqN3QdVwLizTi8CupxxeGsMF5ukfggyhA>
 <xmx:pLqQYzhQv8I26D3YPbgOuJsRcu99vNFEW-ySOh2fwaBeEBehCl3p_g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:45 +0100
Subject: [PATCH 1/9] drm/vc4: hdmi: Update all the planes if the TV margins
 are changed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-1-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=XInLZaSZElEYW1YjY5hSU2D+3FpWCp2LOTFzMps4gHo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgVNS1OXe2KQbFTBoy7yX/DpP3vP570eJlPWrfSwXvJE
 ncu7o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNRWMDIcDDd4XkFe9qa2U+ffniu9W
 HX11DNj7OspUznvJ3rrnpP/QHDP/UNc/aZmO54vk1Wu5l/of0+zi+flzDM3PTrxb8jPiKd59kB
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On VC4, the TV margins on the HDMI connector are implemented by scaling
the planes.

However, if only the TV margins or the connector are changed by a new
state, the planes ending up on that connector won't be. Thus, they won't
be updated properly and we'll effectively ignore that change until the
next commit affecting these planes.

Let's make sure to add all the planes attached to the connector so that
we can update them properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 12a00d644b61..0eafaf0b76e5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -522,6 +522,22 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	if (!crtc)
 		return 0;
 
+	if (old_state->tv.margins.left != new_state->tv.margins.left ||
+	    old_state->tv.margins.right != new_state->tv.margins.right ||
+	    old_state->tv.margins.top != new_state->tv.margins.top ||
+	    old_state->tv.margins.bottom != new_state->tv.margins.bottom) {
+		struct drm_crtc_state *crtc_state;
+		int ret;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		ret = drm_atomic_add_affected_planes(state, crtc);
+		if (ret)
+			return ret;
+	}
+
 	if (old_state->colorspace != new_state->colorspace ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;

-- 
2.38.1
