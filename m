Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8287A510
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC2910F14D;
	Wed, 13 Mar 2024 09:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="PMvig87N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBA310EF1D;
 Wed, 13 Mar 2024 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UvlGb+NMdGvOIAwdpz/kpxf4ZbYXllif2d7IIgYDSOE=; b=PMvig87Nh/Kgu7Y2DEO2Orr0tK
 7mfPJH2vG8DztovphbITGF6FbN4jLawkR2/HS38qc1q4UlXsROnGeXX+3ii7Xjw5/byXyNQHJ7Lss
 fNzuHoIkC6DfRDujS6hNXE3k+C0sMXW+RgBI87Snl6eBWZFG6DB7D49adtp1VcB5SyUW1gwsO3fa8
 FPfIWG+Kjy/K5CQPfE05LP5dl7a3tNeawRD13nrLNCX/GGIp5bMNAvF90QDdT6RBrM3N7c+PqqFul
 E5Don6TWiRNFZPnOaoFPdIcdGZ9sp8Q6Yt1kum18VRXbphrihWPolqk/uGPNai3GSI0JSBGNsnIH1
 ylee8L9Q==;
Received: from [194.136.85.206] (port=60648 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rkL2W-0003P7-2I;
 Wed, 13 Mar 2024 11:36:48 +0200
Date: Wed, 13 Mar 2024 11:36:38 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: Re: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <20240313113638.3ff61e4f@eldfell>
In-Reply-To: <20240312162600.7358e146@eldfell>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240312162600.7358e146@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iz191xy/11DCJ3UKsItxeZC";
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

--Sig_/iz191xy/11DCJ3UKsItxeZC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Mar 2024 16:26:00 +0200
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Tue, 12 Mar 2024 08:30:34 +0000
> "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>=20
> > This  KMS property is not implementing any formula =20
>=20
> Sure it is. Maybe Intel just does not want to tell what the algorithm
> is, or maybe it's even patented.
>=20
> > and the values
> > that are being used are based on empirical analysis and certain
> > experiments done on the hardware. These values are fixed and is not
> > expected to change and this can change from vendor to vendor. The
> > client can choose any sharpness value on the scale and on the basis
> > of it the sharpness will be set. The sharpness effect can be changed
> > from content to content and from display to display so user needs to
> > adjust the optimum intensity value so as to get good experience on
> > the screen.
> >  =20
>=20
> IOW, it's an opaque box operation, and there is no way to reproduce its
> results without the specific Intel hardware. Definitely no way to
> reproduce its results in free open source software alone.
>=20
> Such opaque box operations can only occur after KMS blending, at the
> CRTC or later stage. They cannot appear before blending, not in the new
> KMS color pipeline design at least. The reason is that the modern way
> to use KMS planes is opportunistic composition off-loading.
> Opportunistic means that userspace decides from time to time whether it
> composes the final picture using KMS or some other rendering method
> (usually GPU and shaders). Since userspace will arbitrarily switch
> between KMS and render composition, both must result in the exact same
> image, or end users will observe unwanted flicker.
>=20
> Such opaque box operations are fine after blending, because there they
> can be configured once and remain on forever. No switching, no flicker.

If you want to see how sharpness property would apply in Wayland
design, it would be in step 5 "Adjust (settings UI)" of
https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/color-manag=
ement-model.md#compositor-color-management-model

To relate that diagram to KMS color processing, you can identify step 3
"Compose" as the KMS blending step. Everything before step 3 happens in
KMS plane color processing, and steps 4-5 happen in KMS CRTC color
processing.

Sharpening would essentially be a "compositor color effect", it just
happens to be implementable only by specific Intel hardware.

If a color effect is dynamic or content-dependant, it will preclude
colorimetric monitor calibration.


Thanks,
pq


> Where does "sharpeness" operation occur in the Intel color processing
> chain? Is it before or after blending?
>=20
> What kind of transfer characteristics does it expect from the image,
> and can those be realized with KMS CRTC properties if KMS is configured
> such that the blending happens using some other characteristics (e.g.
> blending in optical space)?
>=20
> What about SDR vs. HDR imagery?
>=20
>=20
> Thanks,
> pq
>=20
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf O=
f Simon
> > > Ser
> > > Sent: Monday, March 4, 2024 7:46 PM
> > > To: Garg, Nemesa <nemesa.garg@intel.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>; intel-
> > > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; G M, Adar=
sh
> > > <adarsh.g.m@intel.com>
> > > Subject: RE: [RFC 0/5] Introduce drm sharpening property
> > >=20
> > > On Monday, March 4th, 2024 at 15:04, Garg, Nemesa <nemesa.garg@intel.=
com>
> > > wrote:
> > >    =20
> > > > This is generic as sharpness effect is applied post blending.
> > > > Depending on the color gamut, pixel format and other inputs the ima=
ge
> > > > gets blended and once we get blended output it can be sharpened bas=
ed
> > > > on strength value provided by the user.   =20
> > >=20
> > > It would really help if you could provide the exact mathematical form=
ula applied
> > > by this KMS property.   =20
>=20


--Sig_/iz191xy/11DCJ3UKsItxeZC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXxc6YACgkQI1/ltBGq
qqelLg/8D/kONC9wtENBWv8db4ytLVukUiy2yym55xqzgIt06RX1JbHEgUy6kKei
jErE//PBziEojOypmIxEsrSz07D1gfZmZli4BZPOw5p2Bhp4RgPEnwmd8grzV5vt
BXSrFWCppFWUJIKBQl/8z5Xjso1hZS8w14OdtbkDPUh7TDHtF9vo/bUBBWt6fg7c
XFAronLgLBwaRaVnyl7+a0hRaSg5ZRbIpviQVv3dNK3XTNtFea1CnKJOv/4sH6IT
S63a0lOmFgygpnW/TE/FE73/1gyR8QbWr7GzeXwXnfbVLMDRDOQvnVh6TezMAe5W
y9FR002hBml7A1RlFvIT5JFPppakD6V0MVJddIU6R2Wnz2WnCj1gtfoSefJPFzpU
MbPwQP+OkHDOOFcByTGpCSKmIZMZ0gy4+ti0yzlzwm2MZ2eCqM0nEDoVpM0RkMWB
kAt2nleuf7062b/DX6itOOMg0rF1Lfn+eQlpNysuPB0jKcrEhQQIE4vygrOQjXgx
E4J456A7a07dUBSX11XvD37+Z6Z+FTjWfLjH5nm8tPmVdiTIIAXvXmbhpJo4ptSF
ohKwL0CCi7uOHxsECTOtm2ih1k6eqZUHIwNYLvXXwPfx/lPHEI/B93IYuHYnXtuu
zTyMHL8m94xBHtXERv+sD3z+gs4QCap9DuGpExjfoz119ZMhCCA=
=Y8VD
-----END PGP SIGNATURE-----

--Sig_/iz191xy/11DCJ3UKsItxeZC--
