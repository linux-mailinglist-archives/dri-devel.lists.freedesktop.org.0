Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D96ABD48
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBF110E1EE;
	Mon,  6 Mar 2023 10:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3493B10E21E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E3635C01A5;
 Mon,  6 Mar 2023 05:49:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 06 Mar 2023 05:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099784; x=1678186184; bh=5voqj1UTp1uxxITYu9fh9Ol0FbqK4YPPE+0
 tPe4AYbI=; b=VNUmW2wV9jTVXVHAnDhDswnbqCEZ1v5c8MTh2HtMSq/qIomoB6O
 HsPsKlCMFo98vW3XcQ/TJLLWQ253Akp8cnkgoKRu7S7HuFTnVjXsByojjorebaUR
 7rAOwkB5RYRzrFzjkzW0dQIBY+P1ar0DRmt/USIK+Q4RrQE0CScUa4cQyASKYAZE
 uhiSadrrsJLotyaSCa9kYqeDBJyrQdMo4c/OD2OfhVApdVjZJZoOD0p5unq/I5Tf
 hqCPDM5HETjuzVyWsA7qeCGU4rboFfErepSLb5RQWNIDAR0mbRNMnBmV3BxwKoqL
 Cl2TA6QefOCjiItO9qLSfkLl70WBzu97aHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099784; x=1678186184; bh=5voqj1UTp1uxxITYu9fh9Ol0FbqK4YPPE+0
 tPe4AYbI=; b=c6k6muqoTRfDOzgyjuDAEJCEP+DL3APUDle1M2sJFSbI3OI5wvB
 dBCZ1EBk3YLMtdSEykFqzVffnMRD4LSHPVU2vBJBfDBPVXkvEUzmZJ5Xcp79OgkO
 ekprCX6K90+gDxsh3sGViQPUn+kQVKZgMDpSp/9jdXxcfYI0vzdX+CfZOR9cz1XB
 M88jmRX+MmaRky9y4S3dXUHoatU5wDbEk0WzJk03FcgYVdnQY+ZDmH9F7xfKCvR8
 UoSE0/cp0W1UzE2ziUtUQde3rVM8MhmGm3yx/RSs95xpBBa7qAuiq0bQkDoWoxJh
 OR8/OB9ASoytAcEBA8PO29zyi0rHT0J7M9A==
X-ME-Sender: <xms:SMUFZH9Z4s0VI0PGjjUc7fcSVrMX6sfPN2GlGsfla4aW8d0gitIQXg>
 <xme:SMUFZDtR0vAEP0tyNsj3FbVyfbNXUHBX1LweR-dHzG6vtrwjOb4LpYsgW-aBpAr1Y
 2_66_TfUgNoMMzxiwE>
X-ME-Received: <xmr:SMUFZFDwS4J8IUpm8tlW9vzaahFr5IG9jPpOyi1I76Fg-aoBNPe-jJgpNtcL9mWOToDdP8IXQPkkOeWbWf4IQ5846FJrzj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfffgeeiteevheffudfgkeetvddvhfduiefftdelheegudevgfevfeel
 ffekffdunecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:SMUFZDee4OI5KR08VoN94wJYFuZtqIpc15cHhvZGkH3TTuHbc-r-tA>
 <xmx:SMUFZMOLwDDvm28miVPt_XsGc7nlojpeJ-xSf2XRgAE68rn7UpbB4w>
 <xmx:SMUFZFlQNzLR0kTpEps-wNS0_ghDEF6Tm8BT36vIgtKM6nUDhMg5jQ>
 <xmx:SMUFZHHv1y9Lkj1PMWOeTfKPt3FJ_y8FkeHDheOCaNbtcNoQ59LYkg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:43 +0100
Subject: [PATCH v3 2/9] drm/vc4: hdmi: Update all the planes if the TV
 margins are changed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-2-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=/Ss7R3gA1j6Cq8lhyLN7QCMVAwk0YkENDxLmFGr0ejY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6Yn3L30oTe8XohdvLNKxm8HZ82ndf6syTJcq6Msg7nN
 HyV1lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCITIhn+F6UcucF6IG7TS0PevqwrrD
 VWhxonuNtaxHd9No+eG+gnzMiw/fKtVfLFV5c/z/r1s/GU7hbWm02SORoKaxyMkucfT9rECAA=
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ea22c9bf223a..522cfbc83fe4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -535,6 +535,32 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
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
+		/*
+		 * Strictly speaking, we should be calling
+		 * drm_atomic_helper_check_planes() after our call to
+		 * drm_atomic_add_affected_planes(). However, the
+		 * connector atomic_check is called as part of
+		 * drm_atomic_helper_check_modeset() that already
+		 * happens before a call to
+		 * drm_atomic_helper_check_planes() in
+		 * drm_atomic_helper_check().
+		 */
+		ret = drm_atomic_add_affected_planes(state, crtc);
+		if (ret)
+			return ret;
+	}
+
 	if (old_state->colorspace != new_state->colorspace ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;

-- 
2.39.2

