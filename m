Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C94DDB8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AB110E9EB;
	Fri, 18 Mar 2022 14:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2E510E9EB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:21:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 393323201DFB;
 Fri, 18 Mar 2022 10:21:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 18 Mar 2022 10:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=JdbdOBlKB49jb2nrphcKT44xOINnms5GB3sKzc
 O2L1k=; b=iEk7z0Zuxe+6HVX82QUUaCPSjmVdSopv7dIdwLb3x5Xky+97A91Y7A
 hn1ywKTebamGBnLcPwG9dw5ivA1F6SXrpf+6ZaAtOKjGX2O9xxlsYNvyxMtbOF/0
 bKoe+xGXMpmOsakZvSNS7Qmgf4P4VVMKsDyaF+t1QMd29fAg7/comaKs91nZIjud
 AtUEnUJ0Hy9mzBvqJ2QD4zXH4tDsJXjTteQxTPxcI7175dPrfyrA7LXsOo2S2VgC
 yEZuCClLRsK9vfU9MS2XxuDUhkc963V9c73oPqyUOGEDODNuev1vpwvm0WWG/5ut
 RIKzDzNb3nKLTtdz+lr/yar+OHjlsTQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JdbdOBlKB49jb2nrp
 hcKT44xOINnms5GB3sKzcO2L1k=; b=VbVHzMOA+5WVjK/pCHB5HSM2CjFkOuO9q
 9kS8Q0SvuyyHRr7z7T4M43CERjgqxZdS4nua0axLoQvX2mnbqrGxtpQeH0e+eNeW
 uyYdf5KgyFam2fSiI/AgL1qbEBDHEH0OQ8Cil8WY46TYo6Vap8i48Hck2gUitGSV
 1OhRk0AdiJghYrFcFOcgGfZbZ944dz591Z1XPeslEk+TMrmf3KKvcwYrty29/xU3
 WIO8l+Gubu2luOg+NdjVhiTuvJF1544hM9juVzgQWLdQOifEu838gGunDrLZdxzO
 CsYLu/Y4PoGroNm5v9GqcHAHpohD5N316SRixKnajdK7fwxSzZ3ow==
X-ME-Sender: <xms:fZU0YkXxZenZ5MGhE-eB77o9eVkIWOkuUr9dawIhlXbuu8sSqJkRZw>
 <xme:fZU0YonUvYDfuFOJXgTQzUG76IcFqfHzwlCCIAyx_5DiXf4ROrxH77eWL5QWLDohE
 il5hOFIyS6yIu5b9zk>
X-ME-Received: <xmr:fZU0YobschH9IBpb2fZZyLmtDh41wQHD1Iu__Gn4SnWeqqBn2bywYg-GQGSZTMImORt6MNfXQDi5hsr7dc3zS0JSuX3ANL14TO7wSGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:fZU0YjWF2jIgYsBFbkbfCwpna-T17k3bLBAvWCrFd3mU8ahSAoHiCQ>
 <xmx:fZU0YukZ2PkOMIvXl78dPO_OiZbkfjGe3Eh4ecs5UWz6gG1wUDHYjw>
 <xmx:fZU0Yof6_PnqujkBGD5dWKaucN2hX-tevpARc93zwMXS1VFoF_JHrQ>
 <xmx:fZU0Yo4CbvhAoEvYRBaFCbZZKfOsqZapYoK93I4eipQBIGPQeLwA1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 10:21:48 -0400 (EDT)
Date: Fri, 18 Mar 2022 15:21:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
Message-ID: <20220318142145.kwq46bf6exgce6wu@houat>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
 <f94c0f44-36f1-e1a9-5963-5da0bafb8c90@redhat.com>
 <YjSMWDFxTeJZZ/CB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4yi27rkk2xdb5y6l"
Content-Disposition: inline
In-Reply-To: <YjSMWDFxTeJZZ/CB@smile.fi.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4yi27rkk2xdb5y6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 03:42:48PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 17, 2022 at 12:39:57PM +0100, Javier Martinez Canillas wrote:
> > On 3/17/22 09:18, Geert Uytterhoeven wrote:
>=20
> > By the way, you should probably request commit access to the drm-misc t=
ree:
> >=20
> > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
>=20
> Does it really work? I tried and no one replied to request.
> Keeping silent is a bad service. If people don't want a person
> to have such access it should be well communicated.

I don't see any issue on Gitlab to request commit access, so I'm not
sure what you did exactly but it's not surprising you didn't get any
answer.

Maxime

--4yi27rkk2xdb5y6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjSVeQAKCRDj7w1vZxhR
xdn2AQCSuox1BSswX/dLm7nf6lTTrTUpEBZ4xfuzRQ/oH6MulQEAwBzsEAQemfKE
hwdglbnvcWh/TFhjzCLDLVjZ5mpHigQ=
=M2cQ
-----END PGP SIGNATURE-----

--4yi27rkk2xdb5y6l--
