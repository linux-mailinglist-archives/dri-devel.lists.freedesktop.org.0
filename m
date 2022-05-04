Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E551A206
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4510410E82A;
	Wed,  4 May 2022 14:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3F10E601
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:16:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 04852320094C;
 Wed,  4 May 2022 10:16:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 04 May 2022 10:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651673782; x=1651760182; bh=uDeyjHOeVy
 bzoqxHeyGOefDTj5BN9Fw/C/Zp18dpHTY=; b=eITRaxdgUzEU4eG/uT/+xFX6v/
 71nlFzGZ98zm0VDsv9wEpw8zzWmpQNjySjCcQCw5iOQ5fAyb6X/4Q878XhjXtCFe
 3XsBeDadmJJk/HFkpL11m/3gt8i7Yd/KjWZ447solliQpE4Se3ADe3FaQlPhbN7+
 EcgN1l3Alq+v36NETASIpfZSejdi+sIOgdZFYfqGwiQhIJNbrZOmHFqOP9NLwNx/
 uzxDRUbRtnjT5tUFHJryB0U2l+IQAcHL+WupRaj450DC5jNfURLez1cd73SpH5MN
 UjJPj3+uWrskPtHsw4UPsmiWoXsu46KV2cG069vx9AdhdllktT5a/9iuUbdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651673782; x=
 1651760182; bh=uDeyjHOeVybzoqxHeyGOefDTj5BN9Fw/C/Zp18dpHTY=; b=o
 3Z75IzsxWfdqO6p/Y3Aa7WOi1lkZnPE26Mkm3Wm4WLdAeZmZMSCNt+D3j8HnSlXz
 wetMnY10wfqtbWjxFxbTg/rEpeeLjBd77UHFrMjIjxSWnACsl1g3HkI7N7NJMpU7
 i2Sso/rAh0y348CdTRma64p4/S5r9P4vzqo27dK0G3J216klRtPyLBpMlYI2eUui
 GwBBwONIZM6m2voQVrTbG9zKFQ+ELrKDt946yintezAAZekJ37gMlWiLWaj90a7C
 6IVIBoSHIYa6e+dsQ1U769/gms4facO9Ua5txS6mer2s8OWZRspt4fVgt496wy/Y
 +tdQ8/63sYbwKSSRyc0ow==
X-ME-Sender: <xms:topyYs_b5TxUKslFiOaorGFOCnH6VIikrcdtNrGadw8RWBhu7fyXCg>
 <xme:topyYkutJN6jw4gv8MQHSKdQnYJ82QIyhhCjsMsINhlNSj8JjzV6eyhJnXbCItkap
 S54Y_dtH0r0Bm3Vhe4>
X-ME-Received: <xmr:topyYiCD00uUbzR3S8FmJFhyhiQQ6Od8q9tQcLIL1NQcKRXEEUHdWUlW5tw-xMHmEadacEzI_TRJRuZ3ZSZZ6SI4MSGUZwb6BZVPEeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
 teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:topyYscAQTesXKr79bwX9q0CZEUVRt-eptlvYEMKtGhX5u41-FfoLw>
 <xmx:topyYhPjF3NLb4gnO-V0-oXGWYFhncUa-qvvrCtKRetmNaffVOLfYw>
 <xmx:topyYmldmceDn57NqovWEYpBPd2Q3MXL_crPpYFw4sda2bZ9mdMPbQ>
 <xmx:topyYk1HMhGTgbw-J5V-JUNdDdpjBHZ7Hky046nx_vie5_SF_AU-cg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 10:16:21 -0400 (EDT)
Date: Wed, 4 May 2022 16:16:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Message-ID: <20220504141619.pib3xwsqyqysto2h@houat>
References: <20220504080212.713275-1-javierm@redhat.com>
 <20220504081030.ky57nenipnif5r2e@houat>
 <b9aebad9-30df-2906-d935-0483a5429a1a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rn4hj2f24joedluv"
Content-Disposition: inline
In-Reply-To: <b9aebad9-30df-2906-d935-0483a5429a1a@redhat.com>
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rn4hj2f24joedluv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 10:34:39AM +0200, Javier Martinez Canillas wrote:
> Hello Maxime,
>=20
> Thanks for your feedback.
>=20
> On 5/4/22 10:10, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, May 04, 2022 at 10:02:12AM +0200, Javier Martinez Canillas wrot=
e:
> >> The Kernel Unit Testing (KUnit) framework provides a common framework =
for
> >> unit tests within the Linux kernel. Having a test suite would allow to
> >> identify regressions earlier.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> ---
> >>
> >>  Documentation/gpu/todo.rst | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> >> index 127e76ee0b2d..10bfb50908d1 100644
> >> --- a/Documentation/gpu/todo.rst
> >> +++ b/Documentation/gpu/todo.rst
> >> @@ -603,6 +603,20 @@ Level: Advanced
> >>  Better Testing
> >>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =20
> >> +Add unit tests using the Kernel Unit Testing (KUnit) framework
> >> +--------------------------------------------------------------
> >> +
> >> +The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/in=
dex.html>`_
> >> +provides a common framework for unit tests within the Linux kernel. H=
aving a
> >> +test suite would allow to identify regressions earlier.
> >> +
> >> +A good candidate for the first unit tests are the format-conversion h=
elpers in
> >> +``drm_format_helper.c``.
> >> +
> >> +Contact: Javier Martinez Canillas <javierm@redhat.com>
> >> +
> >> +Level: Intermediate
> >=20
> > Kunit is fairly easy to grasp if you have some knowledge of other unit
> > testing frameworks already (pytest, cmocka, etc.)
> >
>=20
> Yes, I didn't set to intermediate due kunit but rather due the format
> conversions, since the functions are not easy to read and understand.
>=20
> And the person writing the unit tests will have to get familiar with
> the different formats to verify that conversions are done correctly.
> =20
> > Another good candidate would be to convert (some ?) selftests to kunit.
> > I'm not sure the others, but at least test-drm_cmdline_parser should be
> > fairly easy to convert.
> >
>=20
> Indeed. Maybe I would add it as a separate entr though, as a follow-up.

Yeah, that works for me

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--rn4hj2f24joedluv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnKKswAKCRDj7w1vZxhR
xZv1AQC/VDLymlERMy8+BiF13eIs4P30bQ2sgrNAlmrRBlV8rwD9GRGCMnCwtRZ2
ujcfJDOn8eY3BklODEByBqe57Ij7JwI=
=6IU7
-----END PGP SIGNATURE-----

--rn4hj2f24joedluv--
