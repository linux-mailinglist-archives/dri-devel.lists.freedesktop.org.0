Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C288DC82
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 12:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2F410FA30;
	Wed, 27 Mar 2024 11:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="FQ60FFdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3810FA30;
 Wed, 27 Mar 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yqcVS9tS0F+Iulfwdo+fmCleD7lL6bAvnduFniubqA=; b=FQ60FFdj24vArt0Y1vJ1Nud6aF
 SYWXEOJc2C7d9M3XQygfO7ozy2Z/vnOm8tz6WvBCUj6Nt/yKFbYYbxgbpJHRdv4q2X1HP7mM5ZOwU
 XRAaPPwfP32+YqIG2O/l8Vq838cP7r0lTUR8qv+2uKtsBLyMO/gZdM+F/qapTi90MoKhnO/pDDDwV
 bDf/973zcDf+hMxEGkEShiPYTULdw9WvxFNrwswjtqZKKeq0LwcKsLdAW1AaB3PlDfKAtNxZTW76G
 0XwAt/eBDK1LIQz4uHntQ7Yv7PAg/tju4tPE9u/6WUbnLv+klJwytU4eqoV6S1e0afUFISewIrd1k
 aWAZqong==;
Received: from [194.136.85.206] (port=37818 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rpRTB-0001Iy-22;
 Wed, 27 Mar 2024 13:29:25 +0200
Date: Wed, 27 Mar 2024 13:29:16 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: Re: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <20240327132916.43f83069@eldfell>
In-Reply-To: <IA1PR11MB646705FED711C1F129E5C5E3E3342@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240312162600.7358e146@eldfell> <20240313113638.3ff61e4f@eldfell>
 <IA1PR11MB646705FED711C1F129E5C5E3E3342@IA1PR11MB6467.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z6jMLYSlrTMOJ3Gjd3=7liM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/z6jMLYSlrTMOJ3Gjd3=7liM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Mar 2024 07:11:48 +0000
"Garg, Nemesa" <nemesa.garg@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > Sent: Wednesday, March 13, 2024 3:07 PM
> > To: Garg, Nemesa <nemesa.garg@intel.com>
> > Cc: Simon Ser <contact@emersion.fr>; intel-gfx@lists.freedesktop.org; d=
ri-
> > devel@lists.freedesktop.org; G M, Adarsh <adarsh.g.m@intel.com>
> > Subject: Re: [RFC 0/5] Introduce drm sharpening property
> >=20
> > On Tue, 12 Mar 2024 16:26:00 +0200
> > Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> >  =20
> > > On Tue, 12 Mar 2024 08:30:34 +0000
> > > "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> > > =20
> > > > This  KMS property is not implementing any formula =20
> > >
> > > Sure it is. Maybe Intel just does not want to tell what the algorithm
> > > is, or maybe it's even patented.
> > > =20
> > > > and the values
> > > > that are being used are based on empirical analysis and certain
> > > > experiments done on the hardware. These values are fixed and is not
> > > > expected to change and this can change from vendor to vendor. The
> > > > client can choose any sharpness value on the scale and on the basis
> > > > of it the sharpness will be set. The sharpness effect can be changed
> > > > from content to content and from display to display so user needs to
> > > > adjust the optimum intensity value so as to get good experience on
> > > > the screen.
> > > > =20
> > >
> > > IOW, it's an opaque box operation, and there is no way to reproduce
> > > its results without the specific Intel hardware. Definitely no way to
> > > reproduce its results in free open source software alone.
> > >
> > > Such opaque box operations can only occur after KMS blending, at the
> > > CRTC or later stage. They cannot appear before blending, not in the
> > > new KMS color pipeline design at least. The reason is that the modern
> > > way to use KMS planes is opportunistic composition off-loading.
> > > Opportunistic means that userspace decides from time to time whether
> > > it composes the final picture using KMS or some other rendering method
> > > (usually GPU and shaders). Since userspace will arbitrarily switch
> > > between KMS and render composition, both must result in the exact same
> > > image, or end users will observe unwanted flicker.
> > >
> > > Such opaque box operations are fine after blending, because there they
> > > can be configured once and remain on forever. No switching, no flicke=
r. =20
> >=20
> > If you want to see how sharpness property would apply in Wayland design=
, it
> > would be in step 5 "Adjust (settings UI)" of
> > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/color-
> > management-model.md#compositor-color-management-model
> >=20
> > To relate that diagram to KMS color processing, you can identify step 3=
 "Compose"
> > as the KMS blending step. Everything before step 3 happens in KMS plane=
 color
> > processing, and steps 4-5 happen in KMS CRTC color processing.
> >=20
> > Sharpening would essentially be a "compositor color effect", it just ha=
ppens to be
> > implementable only by specific Intel hardware.
> >=20
> > If a color effect is dynamic or content-dependant, it will preclude col=
orimetric
> > monitor calibration.
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >  =20
> > > Where does "sharpeness" operation occur in the Intel color processing
> > > chain? Is it before or after blending?
> > >  =20
> Thank you for detail explanation and link.
> Sharpness operation occur post blending in CRTC ie on the final=20
> composed output after blending . Yes Pekka you are right as per the=20
> diagram it is done at step 5  "Adjust (settings UI)").  I  will also docu=
ment this thing=20
> along with documentation change.
>=20
> > > What kind of transfer characteristics does it expect from the image,
> > > and can those be realized with KMS CRTC properties if KMS is
> > > configured such that the blending happens using some other characteri=
stics =20
> > (e.g. =20
> > > blending in optical space)?
> > > =20
> The filter values are not dependent/calculated on the inputs of=20
>  image but depending on the blending space and other inputs the=20
> blended output gets changed and the sharpness is applied post=20
> blending so according to the content user needs to adjust the=20
> strength value to get the better visual effect. So tuning of sharpness st=
rength=20
> may be needed by user based on  the input contents and blending policy
> to get the desired experience.
>=20
> > > What about SDR vs. HDR imagery?
> > > =20
> The interface can be used for both HDR and SDR. The effect is more promin=
ent for SDR use cases.
> For HDR filter values and tap value may change.

Who will be providing these values?

The kernel driver cannot know if it is dealing with SDR or HDR or which
transfer function is in effect at that point of the post-blending color
pipeline.

If the UAPI is one "strength" value, then how can it work?

Maybe the UAPI needs more controls, if not providing all "filter and
tap" values directly. Maybe all the filter and tap values should be
provided by userspace?


Thanks,
pq

--Sig_/z6jMLYSlrTMOJ3Gjd3=7liM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYEAwwACgkQI1/ltBGq
qqcoCg/9F7rUs1SNU1cehYWcs7ZjnrbUPFcR6zF6wI1uKryRcv2WPn7HFX1nPKfv
yeIsit0cqibCs/FhD/DEUUsYo3u9qIzJA4wRZABUdUojwsMpy8bK0vhRFs6iKtZM
GKkJbZtvSmcRp2Fm0c/sO5EZiqquOXHab/obJxwrUQ6t6wrqGOXMOPaSQnmpbtkY
D/9R5We8q5JGyJ4YqMpfkyMpeTeF5Yzp6x8vrcIKHEk9WpJopPyKMH3MXV5zyVIP
LW3ZG+0XbmEfW3fHuzboAf2JcJzbHsK5wYWrMkAPVBRB+PoZGCTOH5s+mx0uD1Yg
Ow+PNtltwq7n15WoWDsiGbuiIqn4GEKmAi7vNbiDqz1QYGpx617aeO04cg1enGEX
XWNlH7TPEvhv5Thz7dt78OjuY6/SGKkfCheOQhfHadRtEf/+D3bBo62UK2YilaZD
/24m+2tDPLdnfTos1I9ROV6cxoFRZmfujy2sCbOgkjEI7dG28w0hnObjYK0oo5bJ
42H+bubpX6amjmNi1co4hD3TVpUNt2LLzzzmYH76h64vaapf4TKYap2GYtxgoFtp
RzPXI28Unlj/WJhUZA1RAK0cT1EBQJsX31ai1Kvz02HviGPtS3/7ZYhIIaI9D8aN
8wHy+45U9IYzwWTLGO1JjIFb9Cuje8Ft4SYYKRCnL9OdbVhmoAk=
=3q9E
-----END PGP SIGNATURE-----

--Sig_/z6jMLYSlrTMOJ3Gjd3=7liM--
