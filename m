Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA285E6555
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524710EB8B;
	Thu, 22 Sep 2022 14:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4810EB8B;
 Thu, 22 Sep 2022 14:27:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C17B02B05B28;
 Thu, 22 Sep 2022 10:27:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856845; x=
 1663864045; bh=xSm1H/SvLOO84UTCPZaxyASkQdYRdGizK9EhDQqVUIE=; b=f
 7nQe8WpUbPbNHBxZyNsg4pvSmHXiHjCjDwBQfCbCldC2ndc6an6c+8+Hzh2JI7Yk
 l4FTAlNgzoq2PY0y6hORuVzojPbJH+dBVlC0OCc6fTuBUofhd1XabwKOisKL6kDg
 xvbcoJgwrPbtEcgWkuYbkRH8fz/rcSBNqNm2ZQIyzjqwp/RFNS4EGsdxNNUYw6Li
 O+FFH24AQeebjKV2/GZKm/Xu+OqOBUroRpp/Lca6CIFvDk24OPUqlVjyWkGg6oE1
 sc5Nwld+5wnjOvhgahCrgipInV3ltbx0sdj095yQQuT75TVHyavqkqOXi5nsn3ai
 w6c8l1KThDV6H4da2jy1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856845; x=
 1663864045; bh=xSm1H/SvLOO84UTCPZaxyASkQdYRdGizK9EhDQqVUIE=; b=L
 KE0hx6dOosf71MT1/AFhqd2FZNyhM7GcIOL+JGmgJiuqRQwruhfh/IuDEzyHdWFW
 U0oFdscqLRXqpbWEqaVm504KW/oYl5qVAGuWUi4mHtugfFQrlYFLKaqpRZbGAcoh
 tJrVDryw7Tq+e/KFjj+pJHXxAxbWOtzhRnlRuEx1ECtDb15wqnbUiocy+tuF1kJ+
 bm0+ArCKAxIvvVXL/6BrNGJzqHx8iE7oU38m0yrYbRjYnvwcj0Ydkv5H8eCkiREh
 X7rM/ZLRQfIejPphdBaAN0ve7Bgq8+PQYC/itosMvjSTQgv1ZRxi6lsrWSTySYGu
 po/eujcsWZe1Yqd6hNdkg==
X-ME-Sender: <xms:zXAsY-4SFx2zRAuXIwM1VxLW21V3ImLo9TWoRvz-JJt4vyHY2yDF0w>
 <xme:zXAsY37_Mj2IuMPwSrDcnH7Kw3zVvuB5hv1c1ygX0bjX-HbUSg6pGhFHU58UsKMmD
 PzAGYBFIs5WeZ_0ahw>
X-ME-Received: <xmr:zXAsY9dUyqMozkXX32MEmMlWzs4UotmSqQBxtuYvKP6MiXGRAhd9E1xMzc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zXAsY7K1dnKiZb8Vl3QvZzYRvNdQfhUuvtB2OwbEBSLEwh2qf2AOLQ>
 <xmx:zXAsYyINJXzZhg4tXoNHtiZPGD8gW9jh6eCcY-iX95ZUdpXRegs0wQ>
 <xmx:zXAsY8y_0T1u7-JZRa_6pvPiavHDoQ_ufuzVZpltvj6Yrd2kDfmTNQ>
 <xmx:zXAsY41FGjdUVpu6m-azS5bFMDEmYBLrPjLv8XaLR18hVVR5vLZ5tKR7fmM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:33 +0200
Subject: [PATCH v2 16/33] drm/modes: Bail out of named mode parsing early if
 it's a number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-16-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=shGH9ck7c+L41qD2WH9TMF8BbPwoWC/90AbR/JV60RA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQGFs9Nu79OYOVE4ojXPs7nd9zlbaO6p+tCY2StWbXlx
 8GldRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZSvZ/hn6HFxvfrjBIl1jK2H3B+5a
 DbGrfj0aYefr7rurp/g03Xf2b4w5nxeKvCDm3bc2mnbvuUMjUWnIjVuSV4r6vF9K3BkwtH+QE=
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

If the name we want to parse starts with a digit, it's not a named mode.
Thus, there's no need to compare it to the list of all the named modes
we support, we can return straight away.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 8d629fbb1047..ede5b094da4c 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2238,6 +2238,10 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	if (!name_end)
 		return 0;
 
+	/* If the name starts with a digit, it's not a named mode */
+	if (isdigit(name[0]))
+		return 0;
+
 	/*
 	 * We're sure we're a named mode at that point, iterate over the
 	 * list of modes we're aware of.

-- 
b4 0.10.0
