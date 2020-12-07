Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF72D2632
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51C6E9CA;
	Tue,  8 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857C789AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F0D0158035B;
 Mon,  7 Dec 2020 08:39:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PYgC4c51zzJxa
 4Wstz5qKN/jzr2euBwfGyxAuWyGIzY=; b=GkJmWtSgKaCqSTkecRCG2TA1VSkcx
 C3qwFWCjK/3dygH7dv8QrsD592mXL1zkteIK6pgDotgu5r/9dONaWi5/IhzvI8+E
 elb1YAnaAvf94K5B9e55rZDWj9goE2nom9DQAcGKBioCZO06U1PArZJhw2UxCCwk
 PIAZe6PiBjKQi2te6FH/QRMfDOUmU77Pne0JEdr5yIkKJ2/I8nuqOZ767xxisfxL
 UUE5GC5X+Ex08bZJaGtNI1bUiG91jH8DlNt3wYE5IhERF7iDGbRj0scYKk1iElH6
 6ejPJTAMA06pdpFla+G0gpdN8LQgKkcarVbI6QT4ZHNy97yBCi3lDnQfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PYgC4c51zzJxa4Wstz5qKN/jzr2euBwfGyxAuWyGIzY=; b=XIUl5aBs
 RJ9t+GqtgL7ipkUieFCB5e2tETgv6FvG7Brtv9WbNE0x15adwBw5E/Sn1CiKcIVU
 rWisAYEyVkh1sPRFYtmCwJZ8+AaIIAWlJ1jDBo1jM9ZaVEfQF8SX1GCoQsaQ8kHH
 4yjyHV+tgWV5CV2q19XDkCJ3Xdcntr1tOfEi8IVfxl1yqCzz/R2Flj/f2FS+sXIL
 Xd7U3J2tUcCm05G9Isx7TIixGaEu8NSvlxjLdyIwzWOAo+byT/UGCaA2gmUIMGxL
 JiKlFhJGN7A9SqbHIf5oU8TRgDzBr6P8peJdUxnjk5g8z7zHtanp5FH3Vbjq359h
 BzU9OvglQIFCFw==
X-ME-Sender: <xms:qjDOX_D-tEcMnkNdMU2TTCvdQ1NFPuXYhsuhYM7-bh524yKab7d5HA>
 <xme:qjDOXzU6fCOkN-2G4kYekJtHJU8H4ErNjsXWLwUqlRfP9SuA933faSc3h3mrQgl6b
 dAqfzMbSnwe5KI6WDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qjDOX1CcTQRitM3LeNMHllHqzT4adu1ILkrAb1eHOZ6HI1mdHBroBA>
 <xmx:qjDOX--70VegcRlBU5WifeG9_V-4zo022RtCLX_IqqU23ElftYB43A>
 <xmx:qjDOX0HSZN1Ge3jRcEivZRKsXJP4yurzpbn8v0zawd4Pm6rPkVM5pA>
 <xmx:qjDOX8Rd0VDUamyS9FElU3dBo2DI93mM-xejJluNGB0TO7cr2rPUAQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A8EA1080063;
 Mon,  7 Dec 2020 08:39:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 3/8] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
Date: Mon,  7 Dec 2020 14:39:43 +0100
Message-Id: <20201207133948.2109194-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_connector_reset uses kmalloc which, from an API
standpoint, can fail, and thus setting connector->state to NULL.
However, our reset hook then calls drm_atomic_helper_connector_tv_reset
that will access connector->state without checking if it's a valid
pointer or not.

Make sure we don't end up accessing a NULL pointer.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5a608ed1d75e..112c09873eb4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+
+	if (connector->state)
+		drm_atomic_helper_connector_tv_reset(connector);
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
