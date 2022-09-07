Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E55AFF31
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F66A10E48D;
	Wed,  7 Sep 2022 08:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCB910E452;
 Wed,  7 Sep 2022 08:36:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D3BEF2B05906;
 Wed,  7 Sep 2022 04:36:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Sep 2022 04:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539766; x=
 1662546966; bh=Uk/WwEhqzmytlR18RAVkyP8K2TIlpgWEpQQ3SlVp9/0=; b=S
 83FzDnGva4XnGZyGoLGVJ55IfLYwS5zCQV/3sBb9T3WjW4qcg0KlW6gkQVgiwYqZ
 unsDTnPBF055FPCW3nhukz6oHSeHIhRhWFSOnqKMqM/4pLujjmCy18bmHs8/YYW2
 tCbcUiwc4oncSpqnRJxeamUwZ2jDi0tX1lEKRKndPmU/kvrvXUNfdTmN03bGjofl
 e+qDyAZ6oepMqsN9wOFGgN44LAI9GSWGVJULcF0Kx6aWOpGC1BXUHPLgPyVoRsX9
 pP+CUnQbUQScJ5WEoI568EKSZ692sLUjAMed3Gjnxeder7Gnqv/Sbv8LOeH5SU5C
 l/h+yE/GmwB6Ha5EdNlfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539766; x=
 1662546966; bh=Uk/WwEhqzmytlR18RAVkyP8K2TIlpgWEpQQ3SlVp9/0=; b=S
 I9YfeklyLtkeGnOIz3aOlXLAdWLAvYFpU3R3EgLJ/sgAl/ZFe1IQiuTdjc1SnIUK
 dwiZFkEcAAsg94bTGXJasjVGWNtz1yo9fq5hfLee1BZRFAjvucdSS8AWf1EPH3LE
 wf11pXLupwbCCInAZG6YXFMalE5UwW8JWDAqEi8VKwM0aUjN5mKILgE6Jy8gD9QO
 jgPmY9DUgVpGdW4b1S1tgGCkiTyQPi67tpZt44dINQSjK+gbD+tc7vGmKFO9OgB2
 9urHl1QmPgIpYHuJtLNukTFnSaDOaro8kI0ojGQlNMUyRrGU4tMD+fXp8pdCeTCL
 HWWDT3jaf9KVAtJGzZcbA==
X-ME-Sender: <xms:9lcYY-SnHr6PkRDPliAO_3W4lR3_ZP-2OHGaX-VQLvAEwAeRNUGEyw>
 <xme:9lcYYzxwCkRb2COzQX9Jo3DCKcLehTooBkhWtIiLbg-zqSXPH1tQb3BtJhJ7sggrY
 00KHad92ZaBB_IbSpM>
X-ME-Received: <xmr:9lcYY70J-M8JrnACmZf2NOjDJAKsqidzdQSqHvqVYF263A6Znf687pSkG2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9lcYY6Bfe4rQOrmPyn1qRXzvuKTh0ZpL548llIxbXaf27xDBzIkCiA>
 <xmx:9lcYY3g7NfJRCF573p_VqQfTMdq-MotXRGsolrvWocNoQCnpF3AsuA>
 <xmx:9lcYY2q-nldF2vQdv6X6dEjPRKRYMVRKs3-I4OSD-ROh_X3CP1R9aw>
 <xmx:9lcYY4a_zWv9j_f3p-Qv8NulihF17DXLDfJEYkcaIyjNPjwzGrsY8Xi2j8s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:36:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 37/41] drm/sun4i: tv: Remove useless function
Date: Wed,  7 Sep 2022 10:35:06 +0200
Message-Id: <166253967462.2236193.13305075023961875336.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-37-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-37-459522d653a7@cerno.tech>
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

On Mon, 29 Aug 2022 15:11:51 +0200, Maxime Ripard wrote:
> The drm_connector_to_sun4i_tv() function isn't used anywhere in the driver,
> so let's remove it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
