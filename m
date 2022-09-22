Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00075E652C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029B10EB58;
	Thu, 22 Sep 2022 14:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861A110EB53;
 Thu, 22 Sep 2022 14:26:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4018A2B05B1D;
 Thu, 22 Sep 2022 10:25:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Sep 2022 10:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856758; x=
 1663863958; bh=nul9kf+nsMkA73YYqXmZqsBmb7KKOwrv3IixGzHTnrI=; b=z
 cJ41D1wcu9jDkb3YA6v5AMNmOUSg+beGL/22S7FuoA2FCrBDF3vR/v1HLpvD7hCs
 rkFDKR1OtDHCZ2iYWvTET+aSPnex7ycvCJ3Xowa73koy+MsCLIvwqYDjxFh7kKx3
 Mu/VO5BnZadiiXMrHevCzJUCCEeFWM+vXyeQejwvPhItxtiqXfcdCpVVGfyNBwG0
 /EaRMt569uJcpm3mFTfVDGlIZEWmezkdkVSZwtN4fclYR7NoKrZXJBBtUX9vIJTn
 5uWcAwWbs2tFxRAPX7LvKLhlv1LqZiEGZsvxw+Y2WuO3/UV6gZA4He4ErtWJeMl0
 YRMb2pwPkm2Tj5BqIpKuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856758; x=
 1663863958; bh=nul9kf+nsMkA73YYqXmZqsBmb7KKOwrv3IixGzHTnrI=; b=V
 WXCNtqFjj9afjyMLVqdgehrflK5nsUCBCMAsEx8sdgoRxXmJdHg+KV2D+tUJsdI2
 jDDUaansTrxFhHEnO1x0Ad7OcwWAuMd4tA7nTdnKhpy1X0MbuBgWTa8DlaYZqBnb
 Aa+8NyYGRcaBEkguE5/62jde5nxJwdRVVKZamwZ7XAyP+OpGp6nyxLK8anKE2GXJ
 /BKwl6Mi9BYd+l+rKM8tcHVuQq1E6GohcZbn7DwP7ONQQk09oKn+AzPYgLsQ9DAz
 R2UQ4G32eU9HRGEtIn+fVvjVtej/M+v+PaR5/4m99FdchxourRqYqPjgTSbGKwY+
 ryy3EDMJkVhGEVNcriC2g==
X-ME-Sender: <xms:dnAsY2zVx82AMqBA8GgQdQH2zm1viyBj4O_2soVj8esXki9ZXFRdcA>
 <xme:dnAsYyQDW9dKdffj4wzRKXC4M70mS7HB7WY0phnCFIsIY5hLJ-ATNK-zV0_Tbyx5p
 tX4XLIB3MAqyTV2MOI>
X-ME-Received: <xmr:dnAsY4UGI4sEaN4Qo3mvKIMJrgWP399JqHZDYJtaYHvi8b0FkjUQQFx_tXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dnAsY8iwRFN5Q9oPzAK5DLWc6Irv1c-8po1UfPoGnP2b_SWCIUSlTQ>
 <xmx:dnAsY4C5ts9gYIe3IVQWCFgle-nGInB6txKMATKWBnCYWplBtiSrWg>
 <xmx:dnAsY9KXXB6c-3KlQEvyDaPP8BvIF6qVsEp8UJifA538v4FMODCBcA>
 <xmx:dnAsYxsDXoCnqHfoWBP7uLSHsDKdY5OGAgvWTbCg9pU5K7hQH7NirOZSZxo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:25:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:21 +0200
Subject: [PATCH v2 04/33] drm/connector: Rename subconnector state variable
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-4-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=k9cAlnoIw4NgF/43YMLUlzcaGpJunDmXDutQHu2BS6w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQEmm/K2JumnxEjeN/v2r2jXRMlg00nNIk+uhr6R+Mq1
 9cnajlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkbyHDH97DzzJ2pByX/9b40afX68
 r843d3rVGI/77iRHbVjaJpiysZGR61yqyKi9Pq77bh/7exdLaCEeO9pbz/qzmFM9007tqd4AIA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is two TV subconnector related properties registered by
drm_mode_create_tv_properties(): subconnector and select subconnector.

While the select subconnector property is stored in the kernel by the
drm_tv_connector_state structure, the subconnector property isn't stored
anywhere.

Worse, the select subconnector property is stored in a field called
subconnector, creating some ambiguity about which property content we're
accessing.

Let's rename that field to one called select_subconnector to make it move
obvious what it's about.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..c74c78a28171 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -687,7 +687,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		 */
 		return -EINVAL;
 	} else if (property == config->tv_select_subconnector_property) {
-		state->tv.subconnector = val;
+		state->tv.select_subconnector = val;
 	} else if (property == config->tv_left_margin_property) {
 		state->tv.margins.left = val;
 	} else if (property == config->tv_right_margin_property) {
@@ -795,7 +795,7 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		else
 			*val = connector->dpms;
 	} else if (property == config->tv_select_subconnector_property) {
-		*val = state->tv.subconnector;
+		*val = state->tv.select_subconnector;
 	} else if (property == config->tv_left_margin_property) {
 		*val = state->tv.margins.left;
 	} else if (property == config->tv_right_margin_property) {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 23112f0c11cf..60b5662dec7c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -703,7 +703,7 @@ struct drm_connector_tv_margins {
  * @hue: hue in percent
  */
 struct drm_tv_connector_state {
-	enum drm_mode_subconnector subconnector;
+	enum drm_mode_subconnector select_subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
 	unsigned int brightness;

-- 
b4 0.10.0
