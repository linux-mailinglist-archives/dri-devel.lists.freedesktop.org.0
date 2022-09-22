Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3005E655E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2F10EB99;
	Thu, 22 Sep 2022 14:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8D10EB89;
 Thu, 22 Sep 2022 14:27:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id E95022B05B2C;
 Thu, 22 Sep 2022 10:27:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856859; x=
 1663864059; bh=XzPimO3TGCZN1s10n/IWLqdGw90v+7NTrKZn456FDUw=; b=3
 cDVSrU93OpIfH3kSzBnshRADcY253ne+mFqS5xlLS9Iln5kIr4Daeufz49Ee+Baf
 BDEUev0tMmCFqaxQBN8uG6rp/ifCMK266Yj82znPhgKnMgoaOWvyEf6CFGWsayfn
 wpemtKYY00Yn0oWlP7op2F8lM2RqX9Ck0X8RNQBlqPK8uDAczxC3+7qbw+UZwdM3
 YfoENghlJ+NKrhRP3Pdo4TH68dYJicNcCLWp7VGYR9gI6FyQwbDETyr+eWZrZkKQ
 WWmXlHoEjN+vtlCa0QGdbnAajJiF+uSiplafJ54/bt2zCJb8GRRP7fID1r1+i6bm
 BbutW4VhRONAS8/Am8q1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856859; x=
 1663864059; bh=XzPimO3TGCZN1s10n/IWLqdGw90v+7NTrKZn456FDUw=; b=S
 0E3nnYBHeJ7HHbhQHJFNN83I+j48ocCpiFyYTUCkY0xaYfu/JkJ1vUQeEmBH2Xzp
 BaDQyyck6bzsl+W8IXK2pp3sjiGoPJ0Zs64p4DfzsuXECyHWD8mCGTz7yFarvV/h
 69M91NzDxx6AniRNdDz2tuJZjxXYXIsGOuWnH5XEigY8w8m//U8JCBgNkQQueL8d
 zKrd9/oQEM6DbOpBvlt9ghN+EPYylt+w8d5od6Yux56Aw99M6HyWvUKfXGYT6fE7
 KTR/VwdiQun/C/yE1knz/O16Qy4lFBgHNCS0umBjAIx5KJLkC5iKDaHdjM5U70JC
 62fXW14X/4GGSzTIILCig==
X-ME-Sender: <xms:23AsYxsHx0hciNtQ1DIeJa0tS7s6sGufWaPrKPoZh8Q5OkKfV40FcA>
 <xme:23AsY6dk-gs-cCggA3cOznblUwqJnaG5jv6tNZG8o_zJ6bTJgaLcC63PKkz5g4xaa
 LBeDPM1--Wkv33bz40>
X-ME-Received: <xmr:23AsY0w9X6OMwRuJpV1TlyVvxpstpfDbM3qiazd3WNZUueH2st5croTSyQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:23AsY4PNks82tFjWLX8-Mk9O5-ntyQ9iD7D6PZRFnXDlebr7kVBBeA>
 <xmx:23AsYx_3LJHak7IEghIPBBFCNmOqLp7q4QDKJeVE3O8e4iIpOm8EIA>
 <xmx:23AsY4WupWlZSUWHTPZHjcfLvLDA4LAIpGqpLKGU1r0nwSrH867aAA>
 <xmx:23AsY9LmQh6oPim8o8RdMKnwpN8AxWyk1C5F7tyD484QpylFcLuDjtZKPtU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:35 +0200
Subject: [PATCH v2 18/33] drm/modes: Bail out of named mode parsing early if
 it's a status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-18-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EPj2DquHuorBdZ9jZRn1PEir7mTLC2HDypL7NDzcn00=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYGlD+/tOLf39jmWaV5rMqdOm+HVrZ58y8IqufGommqN
 8KpdHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIv7eMDE/MlS097fyr+nQay1nXng
 pim/wtzemW2MHtJW9/L/zk3sHIsOP5ZY9Daw/blnkmbOXvO9GgYaoVcHR5ift98aYHs94mMgIA
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

The name we are given is the first part of the command line, the part
before any option.

The most trivial case is thus that we're parsing a mode. However, the
connection status uses a single character to encode what status we want
to force on a connector.

It's thus fairly easy to confuse that character with a named mode, and
our current code works because the list of the named modes we consider
doesn't start with any of those characters.

However, it's not very obvious and quite fragile, so let's add an
explicit test for this, with some comment to explain what's going on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index dc5d5bdbea7a..9cee0ad806b8 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2249,6 +2249,15 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	if (strnchr(name, name_end, '='))
 		return 0;
 
+#define STR_STRICT_EQ(str, len, cmp) \
+	(str_has_prefix(str, cmp) == len)
+
+	/* The connection status extras can be set without a mode. */
+	if (STR_STRICT_EQ(name, name_end, "d") ||
+	    STR_STRICT_EQ(name, name_end, "D") ||
+	    STR_STRICT_EQ(name, name_end, "e"))
+		return 0;
+
 	/*
 	 * We're sure we're a named mode at that point, iterate over the
 	 * list of modes we're aware of.

-- 
b4 0.10.0
