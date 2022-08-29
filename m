Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF325A4D48
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64B10F236;
	Mon, 29 Aug 2022 13:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090CD10F22E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:14:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 0476E2B06062;
 Mon, 29 Aug 2022 09:14:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778841; x=
 1661786041; bh=yoaENtujWDk2YoyUfMlWzPbfHesL4mBWigqPk9djZvs=; b=f
 d9mQL3XqdfvxkmnIOAr4zeHb8+fyR98wQCL6yRhZGsZL9hiDIpvmv0HpX8Txvql7
 Q9bWee+eLxH+EEYGTgo8BQYBI4j7bQj301VJI0O7r/aJkvkb8BcyJStBMYEiidYm
 txaVLVN5SVmtC20Y7sQBbZJRB3iuQNY7pVbUDLifp73Wzqr6u2kHsDhNubXQcqEl
 vHI15lEijNN1+rlj2tEKQtinuk5QKUw+CN2JoHBEGhC0rbiWKA7u4G4enTH4udVa
 hbNqiM7x+6F/u0vaZSfW1VfFmqQB66uefjwPJoPFVUGl0jFcGKnbjDa2wNoI9F1N
 uw6FSQ0vZ/jYKqLZOLB6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778841; x=
 1661786041; bh=yoaENtujWDk2YoyUfMlWzPbfHesL4mBWigqPk9djZvs=; b=d
 Zk9nwZmUpnx+HmXyKpkJCVr7ucshcCzqh0RWAW2vVqikaUE2XhsiK7xDEofNcCxb
 9Y5RET5Qfpp5DZ+6+cqHcrH+4/nJf44AYd5SEYfmuMVD13Nc2ZjszQNFRxdz7g0W
 +zBpYpFxVQmo7o3jwrROWksR2nyR9PPjEnSdu7ASowlbkh7NaErSymJdsT6lPi6m
 118EvdFCzeVvycRHKD4pmzh3yP9QBIzJ9+2p4oQ88cDwCX8B7lq1g8Rp86SVd63G
 ORYTQSzlsNiwTeLRbI4zyVxa1WBoHojra06jN5Lh++GMVM80DOc8ik4FqpGuPH6J
 CFLeI1nT+Z/NIz77Z1yfw==
X-ME-Sender: <xms:mLsMYzDY7jXexFNkm617fj3SANggZaDmQ94vKX0Tb3-WFy52uw48vQ>
 <xme:mLsMY5hII8F1IqQ03qu1XVk_23US0_iDkkNRf9otQJUqP4MqJksLk_ftayqA9ZYv4
 v_YU_NjjuKp0DoVMJA>
X-ME-Received: <xmr:mLsMY-nQvqLIlO16hoIJch4AHhXzwpkY5cj7Ek6PHpl28lvh3BQsiE5IaDSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mLsMY1y1n6SVjuUdhToUIWfOCIKkG6IuIDinUY11zIk6MLyfrw0fRA>
 <xmx:mLsMY4SkBMplSM0gdeJl0oVGscW_NrbxLi1p_HDSMje61lv4hyCqgQ>
 <xmx:mLsMY4ZAX9IDWbruNd-tYW384PkvVDLwI0QdaAk4Ru7MXnsVgIUdpw>
 <xmx:mbsMYwKjjHZVlJYCK6NPN206XpiWizW0FbJcWPYZEgUXmmfoOTsEXWQUXTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:59 -0400 (EDT)
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
Subject: [PATCH v2 18/41] drm/connector: Add a function to lookup a TV mode by
 its name
Date: Mon, 29 Aug 2022 15:11:32 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-18-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=aZsDW2fSgZ75fEDwwGs+4i//mN9OlBrWjoxn+bTDlQ8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxQ0Od59aMvJeOlf+r7704+U5q/Xu9L2p4hudt7KdeN/
 3luBjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyEK5yRocE8o/WP67Zfy0uWT3M43j
 7bX/L3IbvtpSs1/CPaTl3bvYbhf16R29Onf/1nFLmkX1/6/Of5hpmyDR03D3me3PUwKfsqExcA
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

As part of the command line parsing rework coming in the next patches,=0D
we'll need to lookup drm_connector_tv_mode values by their name, already=0D
defined in drm_tv_mode_enum_list.=0D
=0D
In order to avoid any code duplication, let's do a function that will=0D
perform a lookup of a TV mode name and return its value.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c=0D
index b1fcacd150e8..0fe01a1c20ad 100644=0D
--- a/drivers/gpu/drm/drm_connector.c=0D
+++ b/drivers/gpu/drm/drm_connector.c=0D
@@ -1003,6 +1003,30 @@ static const struct drm_prop_enum_list drm_tv_mode_e=
num_list[] =3D {=0D
 };=0D
 DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)=0D
 =0D
+/**=0D
+ * drm_get_tv_mode_from_name - Translates a TV mode name into its enum val=
ue=0D
+ * @name: TV Mode name we want to convert=0D
+ * @len: Length of @name=0D
+ *=0D
+ * Translates @name into an enum drm_connector_tv_mode.=0D
+ *=0D
+ * Returns: the enum value on success, a negative errno otherwise.=0D
+ */=0D
+int drm_get_tv_mode_from_name(const char *name, size_t len)=0D
+{=0D
+	unsigned int i;=0D
+=0D
+	for (i =3D 0; i < ARRAY_SIZE(drm_tv_mode_enum_list); i++) {=0D
+		const struct drm_prop_enum_list *item =3D &drm_tv_mode_enum_list[i];=0D
+=0D
+		if (strlen(item->name) =3D=3D len && !strncmp(item->name, name, len))=0D
+			return item->type;=0D
+	}=0D
+=0D
+	return -EINVAL;=0D
+}=0D
+EXPORT_SYMBOL(drm_get_tv_mode_from_name)=0D
+=0D
 static const struct drm_prop_enum_list drm_tv_select_enum_list[] =3D {=0D
 	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */=
=0D
 	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index bb39d2bb806e..49d261977d4e 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -1943,6 +1943,8 @@ const char *drm_get_dp_subconnector_name(int val);=0D
 const char *drm_get_content_protection_name(int val);=0D
 const char *drm_get_hdcp_content_type_name(int val);=0D
 =0D
+int drm_get_tv_mode_from_name(const char *name, size_t len);=0D
+=0D
 int drm_mode_create_dvi_i_properties(struct drm_device *dev);=0D
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *c=
onnector);=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
