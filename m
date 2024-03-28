Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0488FC60
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D307C10F4EE;
	Thu, 28 Mar 2024 10:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="PsWkm28t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812710F4EE;
 Thu, 28 Mar 2024 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OFj88XgxZ0sWsCzaBI/ywTEqrSVOFXScu8fHL5rQIHU=; b=PsWkm28tOBcyd0LDUAzgfWAhp0
 uTxnZrpw3oJRX+N5G1SxfIdoTS7H8fC8sdfpcC9tTG09iJTHW96J3Qv96jYeiNgZv09C0NCa3uycj
 8OB0gsSzLUCJJkP8faZ9mF/UgTZCPbArhUWVseXtV2/ASwhZm5sRPlE3rHkcbcI7n7z/zs8FqhaqV
 c5Z7So+schT77J2p0Sdcg9ZWDHCtUkGipZCely+vk1ghw6e6aezXJMKfcM0KEGm6xk9EU5tRBWrna
 Y3rxs+KpQ27gaJWvCydajS8CpToRdsZ4ERmowy9Hcr6QNu17lSLLaDcxpLR9P2LovzJe+C1Qikruh
 eyfrCTvw==;
Received: from [194.136.85.206] (port=57710 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rpmcz-0002oH-0J;
 Thu, 28 Mar 2024 12:04:57 +0200
Date: Thu, 28 Mar 2024 12:04:56 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: Re: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <20240328120456.1447f2a6@eldfell>
In-Reply-To: <20240327132916.43f83069@eldfell>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240312162600.7358e146@eldfell> <20240313113638.3ff61e4f@eldfell>
 <IA1PR11MB646705FED711C1F129E5C5E3E3342@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240327132916.43f83069@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qvsk6kGyEzapSusOKI3/utd";
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

--Sig_/qvsk6kGyEzapSusOKI3/utd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Mar 2024 13:29:16 +0200
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Wed, 27 Mar 2024 07:11:48 +0000
> "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > > Sent: Wednesday, March 13, 2024 3:07 PM
> > > To: Garg, Nemesa <nemesa.garg@intel.com>
> > > Cc: Simon Ser <contact@emersion.fr>; intel-gfx@lists.freedesktop.org;=
 dri-
> > > devel@lists.freedesktop.org; G M, Adarsh <adarsh.g.m@intel.com>
> > > Subject: Re: [RFC 0/5] Introduce drm sharpening property
> > >=20
> > > On Tue, 12 Mar 2024 16:26:00 +0200
> > > Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> > >    =20
> > > > On Tue, 12 Mar 2024 08:30:34 +0000
> > > > "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> > > >   =20
> > > > > This  KMS property is not implementing any formula   =20
> > > >
> > > > Sure it is. Maybe Intel just does not want to tell what the algorit=
hm
> > > > is, or maybe it's even patented.
> > > >   =20
> > > > > and the values
> > > > > that are being used are based on empirical analysis and certain
> > > > > experiments done on the hardware. These values are fixed and is n=
ot
> > > > > expected to change and this can change from vendor to vendor. The
> > > > > client can choose any sharpness value on the scale and on the bas=
is
> > > > > of it the sharpness will be set. The sharpness effect can be chan=
ged
> > > > > from content to content and from display to display so user needs=
 to
> > > > > adjust the optimum intensity value so as to get good experience on
> > > > > the screen.
> > > > >   =20
> > > >
> > > > IOW, it's an opaque box operation, and there is no way to reproduce
> > > > its results without the specific Intel hardware. Definitely no way =
to
> > > > reproduce its results in free open source software alone.
> > > >
> > > > Such opaque box operations can only occur after KMS blending, at the
> > > > CRTC or later stage. They cannot appear before blending, not in the
> > > > new KMS color pipeline design at least. The reason is that the mode=
rn
> > > > way to use KMS planes is opportunistic composition off-loading.
> > > > Opportunistic means that userspace decides from time to time whether
> > > > it composes the final picture using KMS or some other rendering met=
hod
> > > > (usually GPU and shaders). Since userspace will arbitrarily switch
> > > > between KMS and render composition, both must result in the exact s=
ame
> > > > image, or end users will observe unwanted flicker.
> > > >
> > > > Such opaque box operations are fine after blending, because there t=
hey
> > > > can be configured once and remain on forever. No switching, no flic=
ker.   =20
> > >=20
> > > If you want to see how sharpness property would apply in Wayland desi=
gn, it
> > > would be in step 5 "Adjust (settings UI)" of
> > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/color-
> > > management-model.md#compositor-color-management-model
> > >=20
> > > To relate that diagram to KMS color processing, you can identify step=
 3 "Compose"
> > > as the KMS blending step. Everything before step 3 happens in KMS pla=
ne color
> > > processing, and steps 4-5 happen in KMS CRTC color processing.
> > >=20
> > > Sharpening would essentially be a "compositor color effect", it just =
happens to be
> > > implementable only by specific Intel hardware.
> > >=20
> > > If a color effect is dynamic or content-dependant, it will preclude c=
olorimetric
> > > monitor calibration.
> > >=20
> > >=20
> > > Thanks,
> > > pq
> > >=20
> > >    =20
> > > > Where does "sharpeness" operation occur in the Intel color processi=
ng
> > > > chain? Is it before or after blending?
> > > >    =20
> > Thank you for detail explanation and link.
> > Sharpness operation occur post blending in CRTC ie on the final=20
> > composed output after blending . Yes Pekka you are right as per the=20
> > diagram it is done at step 5  "Adjust (settings UI)").  I  will also do=
cument this thing=20
> > along with documentation change.
> >  =20
> > > > What kind of transfer characteristics does it expect from the image,
> > > > and can those be realized with KMS CRTC properties if KMS is
> > > > configured such that the blending happens using some other characte=
ristics   =20
> > > (e.g.   =20
> > > > blending in optical space)?
> > > >   =20
> > The filter values are not dependent/calculated on the inputs of=20
> >  image but depending on the blending space and other inputs the=20
> > blended output gets changed and the sharpness is applied post=20
> > blending so according to the content user needs to adjust the=20
> > strength value to get the better visual effect. So tuning of sharpness =
strength=20
> > may be needed by user based on  the input contents and blending policy
> > to get the desired experience.
> >  =20
> > > > What about SDR vs. HDR imagery?
> > > >   =20
> > The interface can be used for both HDR and SDR. The effect is more prom=
inent for SDR use cases.
> > For HDR filter values and tap value may change. =20
>=20
> Who will be providing these values?
>=20
> The kernel driver cannot know if it is dealing with SDR or HDR or which
> transfer function is in effect at that point of the post-blending color
> pipeline.
>=20
> If the UAPI is one "strength" value, then how can it work?
>=20
> Maybe the UAPI needs more controls, if not providing all "filter and
> tap" values directly. Maybe all the filter and tap values should be
> provided by userspace?

Actually, is the hardware just doing a convolution with a filter
defined by the driver?

Convolution algorithm (it is a formula!) is pretty standard stuff I
believe. If the hardware is actually doing convolution, then the driver
really should be exposing the convolution operation. Then people can
choose to use it for sharpening with the Intel developed kernels, or
for custom effects with custom kernels. Everyone would win. Convolution
is also something that other hardware vendors could implement.

A convolution filter would fit very well in the new KMS color pipeline
design for post-compositing operations, too.

Is the sharpening element doing something similar to the unsharp
masking?

I suppose users might want different strength based on what kind of
content is the majority on the screen. That makes it something that a
Wayland compositor would adjust automatically based on Wayland content
type (similar to HDMI content type), for example.


Thanks,
pq

--Sig_/qvsk6kGyEzapSusOKI3/utd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFQMgACgkQI1/ltBGq
qqehcg//aVO4wTWGRyqns+eeTS4cCMkr2WxrtPqzBP9TEfhG+Ts4fsx/lcgjduU/
xgWF0KlXARK+d1U+XdylwJ266wYcttc8gyOxj6rVAZMedtigTOJ29K4hb1H09sfU
oBmU66k52kC7L667nIEjmmwwHdrcFlgMQKxLl1tr4RsMZgjFyCFCy3w1XVU7mFPl
dvc+3Mn++cmXUWMMfxXLTUe28WAzsbIAMBdb9CbB7sqIbI21xR3sVVJDgZS/Aarz
WnLjSjCt6A1vPDlqtIDxfqciUDiF3+/j5zTktFbpJ96FjZoiIZGAfFwiaZM5ZbIC
HgRdVJp5rwfRsx53e0qZ55C5OR7DXjLonlJMy9h2s/dMxsLkgBQrvQ02Mf1FPdWB
10cOru9kEGIVR7zqv6hx86pz0SWDIgj+fbRpX7wjjsDSW2BiUJL7+ShNR2q6Nnlu
CFF2ASTMVg1DWjAEp9gatZe7M6gJmB9Vc/eOyfPycqM0kiN2G40N7sy+V0/N13nT
Va1izQ76mNIjmRRyJ0Ljv23XbGfq2OEHZU2D9FqJq/yoCh66h8Q9LHFUJ59Lpipf
XtXCcLtZgsqF7EV8hQHYZS4IaxFECTsTPBdupX4VQMnCHtFLA05afHW7faaAqdVy
fxYU5Q96TAnm7QQaoSVGDNX//2y3WfDQdiFGTWi2i8Q4CuFtmYM=
=mWXb
-----END PGP SIGNATURE-----

--Sig_/qvsk6kGyEzapSusOKI3/utd--
