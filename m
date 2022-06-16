Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C454DD05
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26C0113A04;
	Thu, 16 Jun 2022 08:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD3110FC7F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:38:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 927C55C0859;
 Thu, 16 Jun 2022 04:38:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Jun 2022 04:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655368718; x=1655455118; bh=rM49itErrX
 wDQoHKccBZrfQyve8qGR15gJhge1O4krg=; b=4BJjmawfJBdKpSdwN780OIo1X2
 WF3227bk4eyf+w2slSC3Afp1VAyX+krH+QagRob0UVYT+H0fNvfNFeTs5Yrv24tZ
 MmayJmtuv7G3Mk/nm6ME6nK6WokMj0U3IEwlcZy18C1mC2LFmx87fScRZNjdVixB
 y3NpgG/3lHaykQLhO6jQg6OU/+OuljReg9AfnYtuvPXAqrf/wUbAXOc4c2yKvph1
 T59PeCaZnJYqdWH0HeEQWzjiZvsm5skjr7OvyxRdh2lDkN0aqaAMJOyvOMoNO4FV
 ZA+hxrzLcmWYF/2lZG5f4kKVWUqiRfOGMZp22AfcIVdH1eFTgCnWrIPV2alw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655368718; x=1655455118; bh=rM49itErrXwDQoHKccBZrfQyve8q
 GR15gJhge1O4krg=; b=gdkmPkBb0HR/YjR64U5Ob3olzyCkcg8Yt8T/K7VXaV5q
 bed1HG7r+cwP2xKLQ/iWbOwzwXt0ZUcdrPrFLrtj25GqXrRaarv5RWEBOg8DMQTJ
 jnFOJxRLQeA0eej4YgJMpsJAktNFXNue3CBHTXqP5+slu6y1klhp9XdhihUxBvyM
 04M2eO0byT7pjY/8DhhyE/2JawTjl43E+qZNb9xCAFCgJ+6qrH/KvQdvcioeau2z
 lFm+222RjKpha5h+53BxexP2otAKzytH86PmALeuclrs/+Txicqx31cvQGrbk39L
 SpFo9q8gPDDxWjusbNtLu3jA+RGILQoAkZT6Ns5gFQ==
X-ME-Sender: <xms:DuyqYocqFHqwAIPittMtm8qqxKtquYMyRCnvzeE84G-oMzE1rCA1pw>
 <xme:DuyqYqOBNac-CiseEb7p0DjDJSwZ673bVrdQj_LrI5uTME4yhblSbLYBvztkll_g4
 1B3mBhJOxtJ1tJQs-g>
X-ME-Received: <xmr:DuyqYpj85Bc1ye79t_L-qtSk3wweD4qIrED2jxU9sssrjS0wsvR00V7C3eJlx51Z7LBLAbTDwmdMf3C4OY-fRVpSRhvmtyH_LUZ58Q4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DuyqYt-Ic9hYlnV4DRjjVUcg_0GFqB2kqysY7OLnNba2hhDSlUN6kQ>
 <xmx:DuyqYktlAcLUHulc4GYA9WslO3P12D0AccfqzgASDHsZEDz0nXQKGA>
 <xmx:DuyqYkEfpMfQN8B2MeAzzQ9hDAac6PteDWzKjgceSIuweEIslTHgBw>
 <xmx:DuyqYmJIUvkkp0CU_dd7Zt0vrznt8zk2eKFPhNLPcRfVAG9HH2xl2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 04:38:37 -0400 (EDT)
Date: Thu, 16 Jun 2022 10:38:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 25/64] drm/vc4: dpi: Add action to disable the clock
Message-ID: <20220616083835.2e7jfrlicbkgkra2@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-26-maxime@cerno.tech>
 <CAPY8ntDemhFi3ZFfOE_9kxtmc7v8Wse0C+dz0xxLrBGvSPh12w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="awoppur3z5b7mj5d"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDemhFi3ZFfOE_9kxtmc7v8Wse0C+dz0xxLrBGvSPh12w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--awoppur3z5b7mj5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Jun 14, 2022 at 05:47:28PM +0100, Dave Stevenson wrote:
> Hi Maxime.
>=20
> On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Adding a device-managed action will make the error path easier, so let's
> > create one to disable our clock.
>=20
> The DPI block has two clocks (core and pixel), and this is only
> affecting one of them (the core clock).

Thanks for the suggestion, I've amended the commit message.

> (I'm actually puzzling over what it's wanting to do with the core
> clock here as it's only enabling it rather than setting a rate. I
> think it may be redundant).

Could it be that it a "bus" clock that we need it to access the
registers?

Maxime

--awoppur3z5b7mj5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqrsCwAKCRDj7w1vZxhR
xUrlAPwKgP56LmQjEztlwUxCi84perA2yrcTlE6czNNlzob8HgEAw0TYkytSsRJV
Cw9IaaGXSDdySOEQ0FAfDO5Q2soGqQQ=
=n6M1
-----END PGP SIGNATURE-----

--awoppur3z5b7mj5d--
