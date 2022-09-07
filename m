Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228EC5AFF1A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8937410E44E;
	Wed,  7 Sep 2022 08:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41410E437;
 Wed,  7 Sep 2022 08:35:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7AC182B05918;
 Wed,  7 Sep 2022 04:35:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539723; x=
 1662546923; bh=XtpH72LLeOODARQH975rw/eGQbAac3PJLEwt3wnZ2X4=; b=m
 pzJWGSDxIbVtIUC15PpQOmuYDu516L7RQwUprYjNIt/MWnKmJFdeIxG6kSt8GjY1
 a4wYCWj/OOtuUk9eMBcrDmalu0p09rS9lvC/eJPWpkwyFo+DE52SZDOdsKiZWQ1H
 FS51suYsiztbZe8eFjUwruNSs6SGCbEiv0vq9q/VgUgflsgQvR8+79UssZ/xkA4M
 VCvNbxifqiFhk+GiVM/K7rJLL5bd3wIWBwOVRXmsRDj9YwdvB9ZAdfN6od/Sg8c3
 TuoTJ5Fk51eDrF8bR9ZF7T5Bbkwr8ae+EiPhT596DRh/7kRABN+SJ6dTfDRAEUbr
 DsYQqeLkkf5JtsblSfLnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539723; x=
 1662546923; bh=XtpH72LLeOODARQH975rw/eGQbAac3PJLEwt3wnZ2X4=; b=w
 ldE0q/yK2ji3VyWU44VEOIPYMeL1BOLJhFuC+uuYLL5WuTpA0fvRLH/VQC/UKiUr
 dGaK59BCjplH0e/jNkcTLo9FwGBD/e6gBLSm1Sfn4zvshqKrjMzynLaLX821a/LN
 OFIC0+JbOVXOGIPJow/+bVWGcXEFk+DWdJqhbZCi24PXnxHSSohySrH1xBbIi/B7
 T+qKZ7fok8CDkopX0HchlFqo6xW4gF3O47fndrTwmq+eUNSqryD0kgrFSyELsYtS
 im18KhPjpzwO6eCeyhsAeqNhYPG7UvmOkRZweG69UidF85HTA0WLZBCO7eiHmKnM
 ezVIwqT+3kAEZls+nYGzw==
X-ME-Sender: <xms:ylcYY4P1vsunl-8qdFSHSt6qqmfYlCGb6ryiqXyD5NBqvt6E1rWnlw>
 <xme:ylcYY-9WnIdDTUZ51028C_g1xWHacvduBrMxxaZIeQnni0vhp3cs2U_esv9v6K3wd
 CDpToxjB0otmDFlamw>
X-ME-Received: <xmr:ylcYY_QVYJGET9-GoKoStaDANd-byZVr07BuY0BfSu1ljMcXwxoQunO3klQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ylcYYwv9dVMRfbGhOE1qa9TyzDKMffwuGBCFMMJO5GsgI8xLkeXhWg>
 <xmx:ylcYYwdk_JZDUkK-GpHS1vSwHWuVzZvBmCLpRBLQTVIWVMo8sE_eTA>
 <xmx:ylcYY019r9R17tCujqHN9ChJ4KFZVW2ZKCYZ0ytZotrh8tIeS0qTlQ>
 <xmx:y1cYYyGSCiUzc8hpeEp0_N-SmwCG1Gj0XsMGm-7fRqjVlePDXjC5IpZqgzQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Karol Herbst <kherbst@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 25/41] drm/vc4: vec: Convert to atomic helpers
Date: Wed,  7 Sep 2022 10:35:00 +0200
Message-Id: <166253967461.2236193.14869531626404570044.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-25-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-25-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:39 +0200, Maxime Ripard wrote:
> The VC4 VEC driver still uses legacy enable and disable hook
> implementation. Let's convert to the atomic variants.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
