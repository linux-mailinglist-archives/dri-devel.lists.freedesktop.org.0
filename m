Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22EF574CC4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D462010E8FF;
	Thu, 14 Jul 2022 12:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5198E10E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 12:05:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B091B5C010C;
 Thu, 14 Jul 2022 08:05:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 08:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657800325; x=1657886725; bh=z9JGX3WYg8
 qSUVdxPVCA3ZSucgUasCEe2LQ+hsE4C7o=; b=EHlNW//ncwj5VA6509vbawPOUp
 rebeEtqQ4Kjn8tmOUz+yzJUkFxBfjElLC3+uA0ez1OBtTA2C5ahcIuxrfKtpp5L9
 QSwRYHHJU0A1uzC+akW73MPYVnOaoD0t6ibWW7uS4apbAmQCFsO4Zegd6BjSvkEQ
 Ltsx1VZM/tX7/pk6hqW88m1D4EA7ti5xD0F5FtoZuiFlvQwOm8yWF6QdSvZ5PM24
 Thmkxa7nmvM2jjngF1q7kCwtCuz0xA3x9yR4VNv67NQlKJiOY2js4vuoaWavfMlX
 DLnT2BHgUU/+YpsfCW3tzUODWhvuVIh1g91XKA4YCdduOOtU5Sn+z98tlxsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657800325; x=1657886725; bh=z9JGX3WYg8qSUVdxPVCA3ZSucgUa
 sCEe2LQ+hsE4C7o=; b=ENlxGBeCs9Rii2bTDAWgilVwPbJxidOqhw6UQ5PX9qdL
 aQb9VI3dcSeNiFa79VtR+80DGQhkjvF8iKSb0aAgiuJkBJl33a+xReRax5A8CvFu
 NdYOnGsKXKJsPrvhV+6rPmzSgFwnOIOkiYmP1rjaNa2gLimH7lNZzig5sqb+1WZg
 WLvN2ywOCykRsVayevUUy7iv9nX/7Ed4LR2zEQXvUpKbRPV+gsRCt6SQjBCGARew
 Qb3qicl+Aybt5+kBw3YOJIzP5MaIPMDsWnoiUyoG/JVNOw5aSh9mT/fsfl5RORFG
 WIgbMMnxldsxpT18MLWsxapXft+afMUD/ydvYu4hBQ==
X-ME-Sender: <xms:hQbQYk7SC9Pzwiurupeuop92X0SvfVbjJCqnLFBbf4eUmTH-jOaBVw>
 <xme:hQbQYl672EajW_x44D-v_s5vIPSOVIDdtU3TR2F03S_NXHJ7XBfpVjCM14jz79EKf
 ixbiSoV9vhfPcgdZZ8>
X-ME-Received: <xmr:hQbQYjeTphgqqVzyDliLPTjYp4E2HqDnnI9dTxCCYx8n4eJJ_LG25fWR9KOW9Q9XVwZSct6Yywo2qiGU2ABQ_KqvNpkOJFzhO6b6ZJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hQbQYpKEx9TkHRt9E6eyeyqE4J_mw4XbXlvBMsyckfj9aaT2jT6vKQ>
 <xmx:hQbQYoJi6uj1nCk6m4sq4yjbcV-j79GQ2hAcAu_1QuX4ztNWF5YdsA>
 <xmx:hQbQYqxZC83UTJMh2E5Jl4xob_OLNP_r9gGApKsecKsj7rUstm0zpg>
 <xmx:hQbQYn-3DByjp4Au3ImwbY9FIIjq0dCGaVWrKlcyi75ECA2SJj2PEA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 08:05:25 -0400 (EDT)
Date: Thu, 14 Jul 2022 14:05:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/5] drm/modes: Extract
 drm_mode_parse_cmdline_named_mode()
Message-ID: <20220714120523.2ibuglzcpfft7bel@houat>
References: <cover.1657788997.git.geert@linux-m68k.org>
 <1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cfdrodthvbsx4umx"
Content-Disposition: inline
In-Reply-To: <1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cfdrodthvbsx4umx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 11:04:07AM +0200, Geert Uytterhoeven wrote:
> Extract the code to check for a named mode parameter into its own
> function, to streamline the main parsing flow.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--cfdrodthvbsx4umx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtAGgwAKCRDj7w1vZxhR
xaekAQCgEPA4kKV6SU3Q9qtc3D1mMn/I1haIY71SInV8jcjRkwEAqI7YtvLfMN7K
46v5Ze3Asm9RyxsnYG0RMriAmIPlCgM=
=RWIG
-----END PGP SIGNATURE-----

--cfdrodthvbsx4umx--
