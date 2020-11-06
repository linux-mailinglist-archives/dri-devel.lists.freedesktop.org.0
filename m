Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECC2AAE09
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310F4897F3;
	Sun,  8 Nov 2020 22:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B14A6E08C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 10:52:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 97AA15C0070;
 Fri,  6 Nov 2020 05:52:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 05:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=N9XuQ3DBW3GUsaF7SYTnC8EtrNu
 XcbHAT/ogm3d+XRk=; b=ccmPfSnO0zjKFCrvqwxNYMS/2TRa/FwDO6Ty/Bns65p
 4s6xnrutCF+jsg2/AYf/DAtKL5Bh8h4a0hlRggq8xALoTJ9/pFahWLTKWiUGt54Z
 h4/1VC8xy+qvYou9z3y7pGyfT+uY/tNkw/3rKYZJhfYpBAk7w+i66LekYtm7SXfI
 v1VFt0IqdTVMbgYtYQqNj5lBJ1p9sbRlQuh3HhmpGqQROFsXj4GgAae1RywOGDg9
 KZbqDkgVdoRqFCGsm+yZaSn18/82tErfb/RT5SyAnAennsE8CbgVdWyGWCNUmrDq
 gg8+MdTCAXT7rm1RIlPByoOQ1CMH6VkapzkwKbGakww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N9XuQ3
 DBW3GUsaF7SYTnC8EtrNuXcbHAT/ogm3d+XRk=; b=fz3sODXSrPFyTamNXseYQn
 ovOrUlMOOlINULPdklxqB8JhLLIzDlw+zXGn2KRyNQ2IRjSOGHoYHAwrTTqG8rU8
 PisyN/W6O6QyoCCtsl7Fe7v05aaVoqrPVyLqWuI3V5Qse9c3fr8nagpdMp81zl5I
 pKioTD5LHVWHG6K2gjB8uFv8x9TYuyfJ4UrLiJGofMg9Wo0DmI82yqqLG1MzzdHU
 ZxTN90SRk9V6Rhj5ejd8TihDbgJWVABM8+9PVrpHbvV/RJXN0wP4ls7lgc8lY6Ox
 W9SARrG0kNyzKUvvBMITAv6rKcJN/XppcSyhaZAoR92IgwkGbIpwgksFVswgwwcg
 ==
X-ME-Sender: <xms:AyulX_U3c_k4aZVZ_5FXi7aXHoOhp7onEwpuh-fqi9braMdeRJXTJQ>
 <xme:AyulX3kNJw5lqZK_zJwLGOeMIO6DpxmVZ54vYJh0Tm7Yaskoe5kN9TyYxn1rWcrPA
 qYoYIMep-eu5guznnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AyulX7bKp23WSuHCHFhvlaxxssRA9vttrIHLLNGeL6USanlPwthlKg>
 <xmx:AyulX6U_PGkWC5q6gD2IyBJZQ3BcALsOEkPGYWQwxQ5EQDxYrRHgCg>
 <xmx:AyulX5kbNe5ZO7TdHvRk8ndW95dQWxvN2npd_yRnTSQIM1DJhkc5HA>
 <xmx:BCulX_hvSNFcWPNue8tl7OBIJwaUD54JIXXOTJ1CkZ5S5bKFBQiqKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C463432801F2;
 Fri,  6 Nov 2020 05:52:50 -0500 (EST)
Date: Fri, 6 Nov 2020 11:52:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2] drm/vc4: replace idr_init() by idr_init_base()
Message-ID: <20201106105249.zvyd36shfec24lzn@gilmour.lan>
References: <20201105202135.GA145111@localhost>
 <CADaigPXM8NAZFAydXwcZt7ie_aK1aO8C=jqssA375sCMgU_gHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPXM8NAZFAydXwcZt7ie_aK1aO8C=jqssA375sCMgU_gHw@mail.gmail.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Deepak R Varma <mh12gx2825@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0653570383=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0653570383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpowarwxfffuey44"
Content-Disposition: inline


--wpowarwxfffuey44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 01:24:14PM -0800, Eric Anholt wrote:
> On Thu, Nov 5, 2020 at 12:21 PM Deepak R Varma <mh12gx2825@gmail.com> wro=
te:
> >
> > idr_init() uses base 0 which is an invalid identifier for this driver.
> > The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
> > ID range and it is #defined to 1. The new function idr_init_base allows
> > IDR to set the ID lookup from base 1. This avoids all lookups that
> > otherwise starts from 0 since 0 is always unused / available.
> >
> > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient=
")
> >
> > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > ---
> > Changes since v1:
> >    - Change suggested by Eric Anholt
> >      1. Use VC4_PERFMONID_MIN instead of magic number 1
> >
> >  drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc=
4_perfmon.c
> > index f4aa75efd16b..18abc06335c1 100644
> > --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> > +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> > @@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file =
*vc4file, int id)
> >  void vc4_perfmon_open_file(struct vc4_file *vc4file)
> >  {
> >         mutex_init(&vc4file->perfmon.lock);
> > -       idr_init(&vc4file->perfmon.idr);
> > +       idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
> >  }
> >
> >  static int vc4_perfmon_idr_del(int id, void *elem, void *data)
> > --
> > 2.25.1
>=20
> Reviewed-by: Eric Anholt <eric@anholt.net>
>=20
> hopefully Maxime can apply it.

Applied, thanks!
Maxime

--wpowarwxfffuey44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6UrAQAKCRDj7w1vZxhR
xUhsAQCxvwWAyRE6P1mtYodyBj0Urt6AjZf76xX/ejfIhiQPSgD/ZC5FY38xgVXy
gO16XKmOsRetlk1j6qah2BzWKkbNDQw=
=kXl7
-----END PGP SIGNATURE-----

--wpowarwxfffuey44--

--===============0653570383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0653570383==--
