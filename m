Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343665E6556
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F5D10EB8C;
	Thu, 22 Sep 2022 14:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5872510EB87;
 Thu, 22 Sep 2022 14:27:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1A2BD2B05B27;
 Thu, 22 Sep 2022 10:27:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856837; x=
 1663864037; bh=53LrYaV2mhomt8gRf9sphcJoUtcRBSDR3JTPJr8moaA=; b=A
 RfK4qb1MbOftPljiajcc1DgnXc2Gbe3U2NFvXlECK7XzZ44M4e5LvcGYLvzWUIeu
 2e2GllkQc0O+UwbAUOXMPjfhQ4w0AlzMyKGuKZbzwsmz8gHhahQfBt/+1KnS278d
 dv2MFn2udCgjq1tWrY3POLRPPwVkcZG262jfAWfvx1koAMawwwBhSy1HugslD3D2
 ScBeN5EzPHdrA1YdPEeOYttU4AblPe44x915+dYbflSVmYUjzuTDrGRoUltFdcZL
 joBVxdI5M81oAS3o26N0NMyeDKYzNhOhDmQIQPjvxmtedHaLN1Rn7CmdZ52aMQ3j
 Oz3nQlrZ5vFeH3JEFiRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856837; x=
 1663864037; bh=53LrYaV2mhomt8gRf9sphcJoUtcRBSDR3JTPJr8moaA=; b=M
 /3o+KIhg/f0A5/9Ekdl9jajH+LZLDS7nQXhvz9zqZpW3Ln68K7tGy5i0gCpFjf0l
 IOc0Z6Ptp8T28GQlG6boNtZOo88/vjdCOtoLtrwzdSTLmf9rx5cHjhAFhtL4Orc9
 EmdOnfN7YK2YBExJTbAf3Qy5xEMP8xd4iQm0X9PHLmfAraolnUXx2FW6WpzWk1cD
 mPW/oh62fg5qf+a2GTulRKXnp6x0FD8n2YRKYUupNw2nmTC0Ugfg45bAkTIK3WHE
 Axuyp3Ag81L6tn+BBJpQ0wUHVOPd868jtExtvnR7BYIfwDes10aAZESt6ar1ByFe
 drGMOfZvbPI/GnWLaSpTQ==
X-ME-Sender: <xms:xXAsYzucaiI4n1EJowHuR2fWueUJ9TXOPMij_NCBbkUWvyL4IsM7BA>
 <xme:xXAsY0ejG-iLw4iBBs0Q4BTtPLtWibkMfABfQhUpGabpFE0rJ9uh07EpW7hUDEzbe
 fSHw7y-o-BHzmEsF2A>
X-ME-Received: <xmr:xXAsY2ynSrdnbIS1eZHW18t_zEj3tuYWw2xsffkGbFqLnC6nuwPgEPKCSs8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xXAsYyO9p2HXdMCcl_aRsEO44KPbkrwpBwIq8D1dRDMLOmIMKGbTsA>
 <xmx:xXAsYz--4DrAyL7zuLceV_fFITzDqs8g4_DfoAg3BOdeGKqKNjsZBg>
 <xmx:xXAsYyU3mIGKK8sLfyZANSatwAHmOk_TIOMa7uJXhUoBWnglWJH7iQ>
 <xmx:xXAsY_Jiz1SHHnwKzoNfRhWNhcXIxhtkEaRE5N2OrW0aUTzDt0_QksUzLYw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:32 +0200
Subject: [PATCH v2 15/33] drm/modes: Bail out of named mode parsing if empty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-15-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=672; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LKwTlWbGSe8b9P99h7leZiXJ3B6Avu2KKY+GOK8gNk0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQGqpWo/719bl6wawfHuyaMrYf8mvLlTp17f8Mz13rPn
 0+Yc6ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEDt5k+GcQJHfBb7Z8itrPYLmjqz
 Kvu78x5z8iJdEvetmxZObUplOMDGftxN/+b7eSs2hS1S2Onnn3afbhZf8NjW6rTb6akyc6jQ8A
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

If the name we want to parse has a length of zero, there's no need to
compare it to the list of all the named modes we support, we can return
straight away.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index b1e800e4ed60..8d629fbb1047 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2235,6 +2235,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 {
 	unsigned int i;
 
+	if (!name_end)
+		return 0;
+
 	/*
 	 * We're sure we're a named mode at that point, iterate over the
 	 * list of modes we're aware of.

-- 
b4 0.10.0
