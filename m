Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F360FAC4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 16:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6625210E040;
	Thu, 27 Oct 2022 14:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6ED10E661;
 Thu, 27 Oct 2022 14:48:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 496062B067A5;
 Thu, 27 Oct 2022 10:48:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 27 Oct 2022 10:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666882098; x=1666889298; bh=EMHVw/1mWO
 qDGWgRNnt71JLIAB5d8DBNoNqXLsvKU7M=; b=qYaABOD/6/gyr5ZwIwzuctxdoA
 cZvMJWsqod3PM6zdyc6EhwySoKjWb51W7OWErvj0xzRtO355BaBN3gev2CJ9+xDz
 pmiddSAh+8TSbJ9abH4AMr44GkZxMt/Eynzp3rChB0yxHwkQSXjvs7xAPZalIZYt
 NKr+HToyl+QwrwTbL1CYzD6WtsRZN81bA2My7SXO4LYTfMxZeJ9AtW/93MdsVEFG
 fQiq3tx/TE8XvHflc1U1DTcDD2aUGYYHQ/Dr9qqjfUJ/txbl02rpaFLrySlxvRrs
 QstBYAbzaO5eDiQrT04H0tsArxtGvHlQmcgwLWlTJmTw2gPW6Gv97UePq7Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666882098; x=1666889298; bh=EMHVw/1mWOqDGWgRNnt71JLIAB5d
 8DBNoNqXLsvKU7M=; b=VHw5rmg+0l/N+/Ubj2/AgkxYow6yKWtQTrqvtsLZf3Nz
 SPmW36BMRmDgHmSeK7La+1CzrWp3MFm815tW+vlapc1+huSqryYY9c3pX9kQ6nsw
 OjTMDDiZPJRBgVOCBhLzbf/XATYnqUo3bMgxIB6NpB1OBMgPB07ZdFkjTbEoR/aI
 YjjHGhbu6Lpu8zldInz3d4xWh4snuEPuXP/3JMm4M86pKI1jUQrpqEhJi+ngi8OM
 o3WaWRIa/lBSvTGvHS5aGHxn4BEI2cmCRG8OG0E3nZdmo7Ar99je+A0TCqI5btuI
 PpoapNPsiyfRayOUaZlbVfYdVE+N7sZQR3DPjyE0/g==
X-ME-Sender: <xms:MppaY3Ye7jspwqvimy3GhVFPrM0xkPd9WG7WBNcIv3OFKCjkrUM4lA>
 <xme:MppaY2YYfySPAw0TLbsKpWW_P5_vAkyv80bY_2q8HF_yAM6Nd5KKaeX47F23HxIDj
 Yti2UugCCE_mlxYNjU>
X-ME-Received: <xmr:MppaY59fcaPS9eaKxg_gXkEgCzIdsrbqJgYTHAUFJ8WnOL0y0x5o7ezBp4j7-EowmVjtLmTlxS86hV8RCrIiPG_3PQYU8AP1Jwuc46dMGibCTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepudekvedvheehueehhffhfeetiefffeegffeugfekteffveegveegjeetiefg
 gffhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:MppaY9r8pcCkYlKmiSuqu1BkASuxTTOICZW-LzkTBf4HmCZubUl_3g>
 <xmx:MppaYypJFIl1ANsyg4AtC0jooUZ2UydaomZKX6MvFsfy4RhHylPEAg>
 <xmx:MppaYzR__fZrnMxRc4pF8lr12juPKVJYpH7oFAp1rRWvr8YA_8f4aw>
 <xmx:MppaY7arkaiI7c84hln3Fl1qMKsEjfMboKfNANCRBXmlVjJabhnvJ4Blzvc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 10:48:17 -0400 (EDT)
Date: Thu, 27 Oct 2022 16:48:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
Message-ID: <20221027144816.55nfbdigv6sdtzte@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <Y1a2Eb1rwMyk35v+@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hryfgyrshov2vr2z"
Content-Disposition: inline
In-Reply-To: <Y1a2Eb1rwMyk35v+@intel.com>
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hryfgyrshov2vr2z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 06:58:09PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > I've discussing the idea for the past year to add an IGT test suite t=
hat
> > > all well-behaved KMS drivers must pass.
> > >
> > > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > > that are being used to validate that the drivers are sane.
> > >
> > > We should probably start building up the test list, and eventually
> > > mandate that all tests pass for all the new KMS drivers we would merge
> > > in the kernel, and be run by KCi or similar.
> >=20
> > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > first, that already gives us a mechanism similar to what we use in
> > mesa to track pass/fail/flake
> >=20
> > Beyond that, I think some of the igt tests need to get more stable
> > before we could consider a "mustpass" list.  The kms_lease tests seem
> > to fail on msm due to bad assumptions in the test about which CRTCs
> > primary planes can attach to.  The legacy-cursor crc tests seem a bit
> > racy (there was a patch posted for that, not sure if it landed yet),
> > etc.
>=20
> I think the safest set to start with would be pure uapi validation
> stuff. Anything that interactics with real world hardware is a much
> tougher cookie.

So I guess we would remove kms_cursor_legacy, kms_lease and
kms_tv_load_detect. Anything else?

Thanks!
Maxime

--hryfgyrshov2vr2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1qaMAAKCRDj7w1vZxhR
xdbNAQDGvgGpaGi63FdPVXHQVx7tjRK8xRj050ueihu9seFNNwD/etyKgSasZzS3
jth4BRXcplPHLioNVqAJFfF+4iZ1EwU=
=UgYb
-----END PGP SIGNATURE-----

--hryfgyrshov2vr2z--
