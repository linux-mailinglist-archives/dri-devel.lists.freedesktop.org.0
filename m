Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3845A4D2A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1010F207;
	Mon, 29 Aug 2022 13:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41810F200
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0808E2B05FC1;
 Mon, 29 Aug 2022 09:12:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778754; x=
 1661785954; bh=wC1MCSMyamp+ianAX1wM6m9oLjQ/Jokt+gcamRRc2nc=; b=a
 r/767dE+02wlc8UfKbricPWsWDIA1SqfERwC5cOBvHG47iiop6R8a8R2LxI4b4jh
 0hJhmpzDmNRY2jOw2y1EcWSjRZ3dHA3ecw/DxlrVBDmPN8s+nV0+Vbpf16v7h9Jz
 0UVUylYYSv2jBWJuP7DgYeJx8RZs0/m5aUwDZRVSD9bP3MZmec7vTRqvdRy0PxX8
 LQFTLeTP4a4R6VVKtl9op32qYaW7l1kAiiOWzUSClvAN/6Kt4X33uM3sRSvzvnVa
 X/nKyZsX5AALni0MRSG6E9YnDFS64Zgln9U0Ze3ngu83SZt33OGXv6gE2I6vAhS6
 BIR0aD+00E/R6L0atU/YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778754; x=
 1661785954; bh=wC1MCSMyamp+ianAX1wM6m9oLjQ/Jokt+gcamRRc2nc=; b=V
 xB2TkUS2Gg3GAX6vzHidiTQP+yruJJx2eSEcnC4Os87sepZFX+z+IKlMP+9+FeRK
 hFIfnLxpGdk+rkBPPdwhmf4DlShUCwkT+NowCh5MqGZa/ANUnwPMxvA1D4+fx56Z
 4ioW6x5wfO9h5pSWSpwHI9MGA9YmLbnAegsQxjAdxtNUdqfjzuZug7AFfKIbcBlv
 YmXaGz07DK7UguLGZR0oGgUWtBa1gEHdDkYhG8c/INpJochNBGFKuJBr/NCS9CAR
 scy4FbQzB5+NOKU//RZcz3FvAo+g0eZNMKCNEKTVh1N17Tb3e2naJHJ6t5B8FSKD
 W9HRbj7pYCXUSx659vHwQ==
X-ME-Sender: <xms:QrsMY8L4O4L2ZiPhf5yTBhwKDQsRCx_jangWS7G13Zw47EN4XJKT_w>
 <xme:QrsMY8JS1Sux0aOaqll_ctTwNMKt6e5gjokGTgRYfJP03kmozbq-W_iQ6jJ9AjkLi
 bkKC-RzX2ysOyHkEO4>
X-ME-Received: <xmr:QrsMY8vgZtD_1ivb0MZqoDSiN-QBmL9iHTUFJqrrbyzuelmpOTtdEZFyjepO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QrsMY5aEy7OzLkVPszG9MPsXMl0eMhNSWnCGjEmsWJv-K6_SgdnqaA>
 <xmx:QrsMYzb8UfGy7w2-5T_GKbbD71ZeAJB0s733eezJEsRX9QDK2l9sMg>
 <xmx:QrsMY1CDLz92ZRw8bMZj2cA0OHcr4yCJ6aCueUu1rxCD9dwrSR6HkA>
 <xmx:QrsMY9xgezmZiiJZE0el7VhGKN_QcB3y4K3hoBf5s10NgAKeIewliU1EwUM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 05/41] drm/atomic: Add TV subconnector property to
 get/set_property
Date: Mon, 29 Aug 2022 15:11:19 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-5-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=2320; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=keMkoQHm0yMChbpLobWpiICEXyJzAsMIi/15U14W+ng=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+S1/dbq5VfKfn60+2hW4dng1dt7tYpCBZtU/LgL34i9
 0V/dUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlY5zEyfCuwzJXcwqU5Wb7XzPdWf4
 HYybIfL/Xe1uz8WPCez+I4N8M/lQ/3pD80hn07G3I4mfmbwOSuD+YX9r+5KnD+0owFDkbO3AA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subconnector property was created by drm_mode_create_tv_properties(),=0D
but wasn't exposed to the userspace through the generic=0D
atomic_get/set_property implementation, and wasn't stored in any generic=0D
state structure.=0D
=0D
Let's solve this.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c=0D
index c74c78a28171..c06d0639d552 100644=0D
--- a/drivers/gpu/drm/drm_atomic_uapi.c=0D
+++ b/drivers/gpu/drm/drm_atomic_uapi.c=0D
@@ -688,6 +688,8 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,=0D
 		return -EINVAL;=0D
 	} else if (property =3D=3D config->tv_select_subconnector_property) {=0D
 		state->tv.select_subconnector =3D val;=0D
+	} else if (property =3D=3D config->tv_subconnector_property) {=0D
+		state->tv.subconnector =3D val;=0D
 	} else if (property =3D=3D config->tv_left_margin_property) {=0D
 		state->tv.margins.left =3D val;=0D
 	} else if (property =3D=3D config->tv_right_margin_property) {=0D
@@ -796,6 +798,8 @@ drm_atomic_connector_get_property(struct drm_connector =
*connector,=0D
 			*val =3D connector->dpms;=0D
 	} else if (property =3D=3D config->tv_select_subconnector_property) {=0D
 		*val =3D state->tv.select_subconnector;=0D
+	} else if (property =3D=3D config->tv_subconnector_property) {=0D
+		*val =3D state->tv.subconnector;=0D
 	} else if (property =3D=3D config->tv_left_margin_property) {=0D
 		*val =3D state->tv.margins.left;=0D
 	} else if (property =3D=3D config->tv_right_margin_property) {=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 60b5662dec7c..1d5e3cccb9e3 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -693,6 +693,7 @@ struct drm_connector_tv_margins {=0D
 /**=0D
  * struct drm_tv_connector_state - TV connector related states=0D
  * @select_subconnector: selected subconnector=0D
+ * @subconnector: detected subconnector=0D
  * @margins: TV margins=0D
  * @mode: TV mode=0D
  * @brightness: brightness in percent=0D
@@ -704,6 +705,7 @@ struct drm_connector_tv_margins {=0D
  */=0D
 struct drm_tv_connector_state {=0D
 	enum drm_mode_subconnector select_subconnector;=0D
+	enum drm_mode_subconnector subconnector;=0D
 	struct drm_connector_tv_margins margins;=0D
 	unsigned int mode;=0D
 	unsigned int brightness;=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
