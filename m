Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031D6B0ECE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354F110E689;
	Wed,  8 Mar 2023 16:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793B810E689;
 Wed,  8 Mar 2023 16:32:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D483D5C0064;
 Wed,  8 Mar 2023 11:32:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 08 Mar 2023 11:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1678293170; x=1678379570; bh=OL
 dmqZ+wBaNxA7qddBghZ19djChtoa8PmE05C1OKz2w=; b=AN3+m1K6vcJD5ngzDz
 sPRzBlWRUuoYQp7acyXautlrKA36TOkI3Ri9Sr41Vod5cy2L4XQhRTA6bF9uvxfB
 +hyPUzuv153YBiF3IT4rUtuWYz/RF64dQHQRRx9CSE8b6VFu6Dq5VYn6SXC77cAP
 VehqBnecW49F/eqYrKeWL8SfcOKg+aF9vJLdhgqtdyaD5uvIzF8ekxbmbavPuBdZ
 0C+EH5VBK6z5+/Rd/G6Egrp7iR36RzId8KZV9j8Cux9RYiEfbkEM3rURJeVR3EMc
 ORfkS1Vfllzww3l+XOwPyw8ELGuxFy5ECkafqyhFpWqlzydpQ/mh95Cu5vnsByB5
 ubcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678293170; x=1678379570; bh=OLdmqZ+wBaNxA
 7qddBghZ19djChtoa8PmE05C1OKz2w=; b=TpNdGgHV8DYRutGsEGRX3/aUTuucM
 cuLFh5Tu/pdfy6Bp58ovSAmrQGYu7XnPr9zFNsxeZtyZBKap0zG+U/pZBmAABqNK
 JUwVztZVt6ErBEoEpCyFwtEEovannerPinXJEXtiJY2nsvVthbZaYW2sALCJdHLg
 colGb5PhLJIJqHMHEBUAD9jPdHGIewVxDW5S3Vw1W+LJMfM2MOziWG+BakY4J0Ci
 c3F1rwI3TP5Bkh8fGRpSs8HCI6cbd2VLuuGBY6WF38ZriQjIVnUTDNLsFi90VtO8
 HuU2ekZnYx/9QNrZvN49mD+NfhOBKxCJ/NVU7peWqRPozYKX1dlIRhUjQ==
X-ME-Sender: <xms:srgIZPrLp5ZykcfZ3VflpPEnPcrnNXeu8P3MmgNom9-R6KcrcLeq0w>
 <xme:srgIZJqRIgU89Q3khW7tB7G_koSbP-rb4hBhizS89uxIMUy0k9eXN4qH9e4aXDhqU
 m4YjOlaykK7deqG-0E>
X-ME-Received: <xmr:srgIZMOy4PtQIQEIvHWM--p5bwscf448FDzWeZJG6_AEVAU0MiSY0B-FqcOKghuyniPWrJp310AUAp5iERU1QCoUFZpn5U8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:srgIZC677knkE7y1Nr4XFTIwLVvKrL3lMk5106LWox4b8Lp1l8fCrA>
 <xmx:srgIZO7KfKUs0y1mYm6aAZoOIMtvXgCXC4JY8GkfcPtw3cVoiAk92Q>
 <xmx:srgIZKjXwoxbCXG8nqHUP-ZSpISKDxzLvvYiBrvYpiBKjizqmAR02Q>
 <xmx:srgIZNSnFzGXXndzY7hgCilOVVJV2HMMYt_WvJqpF_umahqTQn_ILA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 11:32:49 -0500 (EST)
Date: Wed, 8 Mar 2023 17:32:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: "Zhuo, Qingqing (Lillian)" <Qingqing.Zhuo@amd.com>
Subject: Re: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Message-ID: <20230308163248.u7rvtadhlre3yua5@houat>
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
 <20230308161945.svooztnablyvm75e@houat>
 <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qkfsks6ei5ns2qea"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qkfsks6ei5ns2qea
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 04:27:01PM +0000, Zhuo, Qingqing (Lillian) wrote:
> [AMD Official Use Only - General]
>=20
> > Hi,
>=20
> On Wed, Mar 08, 2023 at 11:11:22AM -0500, Hamza Mahfooz wrote:
> > + vc4 maintainers
> >=20
> > On 3/8/23 04:34, Qingqing Zhuo wrote:
> > > [Why]
> > > drivers/gpu/drm/vc4/vc4_hdmi.c: In function =E2=80=98vc4_hdmi_bind=E2=
=80=99:
> > > drivers/gpu/drm/vc4/vc4_hdmi.c:3448:17: error: label=20
> > > =E2=80=98err_disable_runtime_pm=E2=80=99 used but not defined
> > >=20
> > > [How]
> > > update err_disable_runtime_pm to err_put_runtime_pm.
> > >=20
> > > Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
> > > ---
> > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c=20
> > > b/drivers/gpu/drm/vc4/vc4_hdmi.c index 9e145690c480..edf882360d24=20
> > > 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -3445,7 +3445,7 @@ static int vc4_hdmi_bind(struct device *dev, st=
ruct device *master, void *data)
> > >   	 */
> > >   	ret =3D pm_runtime_resume_and_get(dev);
> > >   	if (ret)
> > > -		goto err_disable_runtime_pm;
> > > +		goto err_put_runtime_pm;
> > >   	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
> > >   	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1"))=
=20
> > > &&
>=20
> > The current drm-misc-next branch doesn't have that context at all. What=
 tree is this based on?
>
> This is for amd-staging-drm-next.

I don't get it, why is there a vc4 patch in an AMD tree?

Maxime

--qkfsks6ei5ns2qea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAi4sAAKCRDj7w1vZxhR
xd/AAPkB71ZVlsaXmgv3N3XxGXAM/abwFnF9JhIQpClvj3P3tQD+PAA8Fex7MXhD
LEtOEcSBvngbEbYBl+1r0wpj7wBATA8=
=zOVq
-----END PGP SIGNATURE-----

--qkfsks6ei5ns2qea--
