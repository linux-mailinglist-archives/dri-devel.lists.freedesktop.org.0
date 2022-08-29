Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF255A4D3D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB210F229;
	Mon, 29 Aug 2022 13:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4140D10F214
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1BDC52B06056;
 Mon, 29 Aug 2022 09:13:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778801; x=
 1661786001; bh=03XFcTJGiCv9x9hOMYU/IHnyg9+FpgYuQ7Ewjsv6kOA=; b=X
 c7Z5RIAZDbcktvpiPovFQfv/Y+JZDt9Or7HaQL73yJS0K4Gs5Og1xFOgCL66llUO
 AN19C9qauHvTD9elrKkpu6uU27pT+S7+BMmY8zxNEi9Z4eRSvJ7IfXJf95w5SW7B
 CVhJfNFpKTe0B6nHT1lD8RablUVX4mVkdNpB/yG7wuX3iIEeq+74faTTJ4WdJ3K9
 NRLwKnNCuIKPGysxdxJ+RfElAn8MeE63zZMUEu8Dgp4cfXpFLDlfwG2InlkmiXHe
 Pj4SOefke/2JUw+3akKRVKmqoLNKzBteC5Vp28rCeeqSGIR387lbhtUqOkRI/FbZ
 6c5vslviwQEL6X+3/9c4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778801; x=
 1661786001; bh=03XFcTJGiCv9x9hOMYU/IHnyg9+FpgYuQ7Ewjsv6kOA=; b=M
 bBgXynKSTeXOi2Bq2ciTxgZr49tswVd1B67bm33Oe+jsfieBOiGE/jghr/rQau7Q
 jfXnxj108C5/GztijwkGIyt8hYMdZOZhuqYiR5jEICLEN8FsUQiTaB/PMqTwlsDr
 m5xOhYIudZVeAWMzFDlrUNp6lw61f5HB3bp+MZ4MpyQvCPeOTH6KhjCsPzsPIAHA
 7hYNarsPIwcQLMivE+KQpBeAYDF2Ua8cyOUn61E4gzrMp+7N5RLnQQJYVTXwrao+
 jjvXGcY8QVG2ldnvaGx+pHaZO87UEnqo2O94itRw0ttGLi50emoVMQf1M7M7OY11
 ktMxMF29aSYCZnc3i2XFA==
X-ME-Sender: <xms:cbsMY8tav_vASJiMG0a2RhfTqnc7eeJpEA6EP54Nxfg16ToXDWUeYw>
 <xme:cbsMY5cmJiEu7fGKm5d0NqTroPL88gBI0_yOTjFngweFcTHha5oPOt94SKZZKpR3W
 g_Dz_JaeCTbaFUX2js>
X-ME-Received: <xmr:cbsMY3xwfuAvQSXQg_21rauIF77B9eb82JyO5UfAq1WUCZxaqUIO4ejqq0xe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cbsMY_O4GK52eoYHZLbnT_bsjaR_1tqBlWxuweDMPgT-llLT-kzRQA>
 <xmx:cbsMY8_V-MyRTXacBNfAqqtogDrDjuQvoyszW9D5f82Hy1jm6X77_w>
 <xmx:cbsMY3WfxfMHIFrbiI9fsvzLT9Dq2kCY388aZa7ABKLT0UDFxMlRSA>
 <xmx:cbsMY4l49b_7-wit-_-sp9TEtcMDm4VflLXP5Bh8BlvMe4wfea4AF6SkrvY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:20 -0400 (EDT)
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
Subject: [PATCH v2 12/41] drm/modes: parse_cmdline: Add support for named
 modes containing dashes
Date: Mon, 29 Aug 2022 15:11:26 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-12-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Ce+TyjEkD5ms8VGGkYRw7EWiyTTKy0ScuMQtAi1SOoM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+STGJ7KXdfiCpu8Ly6soUhh28WTTV9uP/32bVpCR9ya
 VT6nO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARk2eMDDOtWWM3xD1IOvu6Yy7n9E
 XnpnI6a4mdEj0moHq09aWj+0lGhmbh6am2ujO65oV/3/+qPFxaidez/2Xpil3L5COOa6z4yg4A
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

From: Geert Uytterhoeven <geert@linux-m68k.org>=0D
=0D
It is fairly common for named video modes to contain dashes (e.g.=0D
"tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names=0D
are not recognized, as the dash is considered to be a separator between=0D
mode name and bpp.=0D
=0D
Fix this by skipping any dashes that are not followed immediately by a=0D
digit when looking for the separator.=0D
=0D
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>=0D
Reviewed-by: Hans de Goede <hdegoede@redhat.com>=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index b4e1ff56b4d8..99a21e5cd00d 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2263,6 +2263,8 @@ bool drm_mode_parse_command_line_for_connector(const =
char *mode_option,=0D
 =0D
 	/* Try to locate the bpp and refresh specifiers, if any */=0D
 	bpp_ptr =3D strnchr(name, options_off, '-');=0D
+	while (bpp_ptr && !isdigit(bpp_ptr[1]))=0D
+		bpp_ptr =3D strnchr(bpp_ptr + 1, options_off, '-');=0D
 	if (bpp_ptr)=0D
 		bpp_off =3D bpp_ptr - name;=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
