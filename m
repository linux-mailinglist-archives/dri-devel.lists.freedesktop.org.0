Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40828C724C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D110E250;
	Thu, 16 May 2024 07:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HQdQplp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539C10E250
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:57:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 33AD6CE1818;
 Thu, 16 May 2024 07:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC21FC113CC;
 Thu, 16 May 2024 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715846265;
 bh=6nEVeR2xHqL+xtbx4QyEOB31XerRon6nHmu9UdguhZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HQdQplp/8vX86ut/jbMDglepohWQgHpTSGUBJw5PCnN2bj1KN+lWktM6Ew8WDG8n5
 GLYZuRwTXCu+d0aBeKS6AZSaF2+j7+yoHCeApnvQPGkmgsDc+BpbvxqiA5inLuy/Yj
 Kd+ZpV0QUCXgUhRKLdKNhE+cONsjuF5oqNwOHNdE4HaDxy06gOHkSSruALVq7MgMBH
 ctSWmpNnk1KJ402LE3GmAZlfQJtbbd2IT0kiblJ5PVYspbW+2I/w+dTWdKB7mweMIg
 In0kmbucUq4iXpyEPee1LFAv6mOPze8wfo8EJnAwYgcpbdKPjOQvtN15B8+3fSq59J
 WFc1z8GjKwpvw==
Date: Thu, 16 May 2024 09:57:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Yannick FERTRE <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Message-ID: <20240516-astonishing-tasteful-tuatara-7d29bd@penduick>
References: <20240322104732.2327060-1-sean@geanix.com>
 <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
 <b58c9073-02c6-4b5e-9082-fb11f388842d@foss.st.com>
 <44grbp56thhsbxf3i3yicsxgftbuhzebetioxfuibrpw6vbc6l@qqphfke5vgl5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="35odebnap6x5sjhe"
Content-Disposition: inline
In-Reply-To: <44grbp56thhsbxf3i3yicsxgftbuhzebetioxfuibrpw6vbc6l@qqphfke5vgl5>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--35odebnap6x5sjhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 15, 2024 at 09:42:34AM +0200, Sean Nyekjaer wrote:
> On Wed, May 15, 2024 at 08:39:49AM UTC, Yannick FERTRE wrote:
> > Hi Sean,
> >=20
> > thanks for your patch.
> >=20
> > Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>
> >=20
> > I think that a helper could be useful in simplifying this part.
> > This might be reworked when a new helper will be implemented.
> >=20
> > Best regards
>=20
> Hi Yannick,
>=20
> Will this mean that this will patch will go in?
>=20
> I still have plans to do the helper, but I'm limited on time :)

I still think we should work on the helper and merge that directly. It's
been broken for a while anyway so it's not like it's a regression anyway.

Maxime

--35odebnap6x5sjhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkW8XwAKCRAnX84Zoj2+
dunqAYDKPCmEKxonPhhitWf97oBPBxfeBTdrMIqsZGA8qieRjVX6swAQk63a86xv
MGEjr/ABgKUizwvYzV/yf1DXkDoX8hAGZLW2VxvK4KC9FZNWg2EQXreBaig7iA9r
2Te1Kbufww==
=TSXP
-----END PGP SIGNATURE-----

--35odebnap6x5sjhe--
