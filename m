Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05B5A4D86
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042D10F259;
	Mon, 29 Aug 2022 13:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B261D10F264
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7E50E2B06083;
 Mon, 29 Aug 2022 09:15:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778947; x=
 1661786147; bh=xPKClgXEhgbZIku/wD+WYQoXLvH5DXbkNRiUTcpaiXA=; b=D
 iq1Lken6FPUNY6rixKynLAYM0aUp0Y8hCQW8/cHoIUuRCQ3MIotHbVe3Oj1Wld9D
 q8rziTtUo6iwNwmgBwzXqq8hlsXqBdtfEso3aBerfVESdHyeQPog9SiNC948Ba/n
 Wni8XNvw5d5ayPhbMvLsKHl6a0Iog8XuQsL7V55NuD+KoGyPTGWEQzWhYx9OE+NI
 LMBjNxT45iB/T/VXCqETMvc0UZ8ingxcjJBfArIhWLg2zhVQ92r69H7FbYi6Ju/E
 n/2vAMOQRnMOdXHevDd5ycfIUhYEC0dkymlW+QZO5B61Jl6x9ONqD1IZ03uCVOYK
 Hrx4UTd7Ur7hCKtXj0iTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778947; x=
 1661786147; bh=xPKClgXEhgbZIku/wD+WYQoXLvH5DXbkNRiUTcpaiXA=; b=Q
 6Ot/UO86TeWLcTnOqWGbhFftfW5ZYp54/HxY3lKQHK1wJ9ZN8Z1exXYYSbqUm+PI
 q/qjgyiU8y2EfM2n325LeqEMSsx/zJBL8HeecwCxLZAN1g5xwhCw+edHReuhiazL
 3sTfnL45HjCYBV1csTzW8thlZ1abueJGlc4SBIerk5SZR0mQ0s9oeRTxjGueuslr
 L9JVUVmuzuhLWx1waPF/tiN/ZE1aaTKyJe6Oi85QjETFz4WyXKJ29bK96oCyKT8q
 DWr0iNmd2My7ue6ymNQkakb/YdcjGIMNLCd7kW1624dlXG7lATvZBHj53+iK6WjA
 9cL5DAzdJMUXyEM1a+ngw==
X-ME-Sender: <xms:ArwMY-AOGWy_xe3mcsVdGEbPbOgLxS-QST-A-Y1rOc4oJ_DxWHOxAQ>
 <xme:ArwMY4ixfsgF-90wCRMinT5zDMFWSFgFEYsqR-GSHofiCXBIIcxhDdyNwPkZXTC85
 TEg37iycaKIV5jRUTg>
X-ME-Received: <xmr:ArwMYxkfMsLQHkkGI5PD3H2vqLxlAxdmqLQTZWkHBLLBqoBoewrfqvymdJ3L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ArwMY8wfN1WATSydQph6wejGOhCazk6AaDCuKXmfCxqUbe8AahNqOg>
 <xmx:ArwMYzSWXUOqKylzKtDsW2MZhq0Lrl-Da4Lzld55JglA5Ql7220_1g>
 <xmx:ArwMY3ZIotTAU_sGaVWkK_Tf16dzYnq1nM2uIkAXt7ITYosb5ISfjw>
 <xmx:A7wMY3K8d4gN3iSSesO6KEYa-x9QyZO4pAp_AQKivOx6SSjuHmSxO8X8x5s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:15:46 -0400 (EDT)
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
Subject: [PATCH v2 34/41] drm/sun4i: tv: Remove unused mode_valid
Date: Mon, 29 Aug 2022 15:11:48 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-34-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=WJLJuDlfN2CfTt2hGqbzVPVAYa+Qd5gtSkAkaL2kavM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxTzLnKv3fU95cidZ/cME2bzmpemL61aKH77+n3X0G2u
 nwLOdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAieocZGa74rSi88fc6b71wiKChU4
 Hag72tny67LGHlMnsacnnXinSG/3ln25P3CD2Rae+ytG+e5/bso+vSBMtZvu61rz/Ixv/W5QAA
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

The mode_valid implementation is pretty much a nop, let's remove it.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index 94883abe0dfd..53152d77c392 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -497,16 +497,8 @@ static int sun4i_tv_comp_get_modes(struct drm_connecto=
r *connector)=0D
 	return i;=0D
 }=0D
 =0D
-static int sun4i_tv_comp_mode_valid(struct drm_connector *connector,=0D
-				    struct drm_display_mode *mode)=0D
-{=0D
-	/* TODO */=0D
-	return MODE_OK;=0D
-}=0D
-=0D
 static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_hel=
per_funcs =3D {=0D
 	.get_modes	=3D sun4i_tv_comp_get_modes,=0D
-	.mode_valid	=3D sun4i_tv_comp_mode_valid,=0D
 };=0D
 =0D
 static void=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
