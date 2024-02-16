Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA38577C2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E0C10E21D;
	Fri, 16 Feb 2024 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="CcmsHjWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBA210E411;
 Fri, 16 Feb 2024 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Fbzp3gSvOknwiKu5ZEsEJYpJCaCvuMggAeqwHbLDew=; b=CcmsHjWhdx/TI1JhuigqDhMjrq
 ENg+Y1XhxmQCrVadjnh7X0Iw+M0EzR5FwggP3trCeWvBXBby1J5asN33528ctLa81KuEiE89iENvE
 wCbV1gjs1QKLNVsP/EvuZ3kX4NNfozDo75mVRtaC4wFBHyrPG/8Qca2T2QL17St5D3G/EXJxWNQ+9
 oEhmvoVSyjgExQpOOCo4VPfM/OEOOCx9hGIsAd9X2kxXNlYP6NTvLC80OW3ZOSAdNLxefGzuD/8ii
 tb4xH88OVTOry6QjYq60IJONGpFsPznYMB63ZvC+A9SZPbqJhMRy+LBVtzL1bUu/TisohEcN9GZi1
 RhEcrIog==;
Received: from [194.136.85.206] (port=38292 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rathl-0006fq-0d;
 Fri, 16 Feb 2024 10:36:21 +0200
Date: Fri, 16 Feb 2024 10:36:20 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: Re: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <20240216103620.33deabb1@eldfell>
In-Reply-To: <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cZ7.UGIY1.XAE0XM6h4znm5";
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

--Sig_/cZ7.UGIY1.XAE0XM6h4znm5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Feb 2024 04:28:41 +0000
"Garg, Nemesa" <nemesa.garg@intel.com> wrote:

> It is not intel specific and the goal is to have a generic API for
> configuring Sharpness, accessible to various vendors. Intel currently
> offers sharpness support through the Display Engine, while other
> vendors seem to support Sharpness through the GPU using GL shaders
> (Vulcan/Open GL based).=20

Do you mean that all vendors use the exact same mathematical algorithm
(with only differences in operation precision at most)?

If yes, good.

If not, then we need to know where exactly in the virtual KMS color
pipeline the operation happens, whether this can be generic or not.

Does this also work the same regardless of pixel formats, dynamic
range, color gamut, transfer functions etc. on both plane input and
connector output configurations?

> In terms of sharpness intensity adjustment, the plan is to provide
> users with the ability to customize and regulate sharpness levels. We
> suggest setting a minimum and maximum strength range from 1 to 255,
> where a value of 0 signifies that the sharpness feature is disabled,
> indicated by a u8 data type. For now we have mapped the strength
> value 0.0 to 14.9375 to 0-239 but as the datatype is u8 user can give
> value upto 255 which is gets clamped to 239.

Naturally you will need to document all that, so that all drivers and
vendors do the exact same thing.

I did not see any actual documentation in the patch series yet, e.g. a
reference to a specific algorithm.

As Ville pointed out, there was also no specification at which point of
the virtual color pipeline this operation will apply. Before/after
DEGAMMA/CTM/GAMMA/scaling in plane/blending/CRTC?

Is the property being added to the list in
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-crtc-propert=
ies
or where-ever it belongs?


Thanks,
pq

> We are also open to have alternative scales, such as 1-100 or 1-10,
> as long as a general consensus is reached within the community
> comprising OEMs and vendors.
>=20
> > -----Original Message-----
> > From: Simon Ser <contact@emersion.fr>
> > Sent: Thursday, February 15, 2024 2:03 PM
> > To: Garg, Nemesa <nemesa.garg@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Subject: Re: [RFC 0/5] Introduce drm sharpening property
> >=20
> > How much of this is Intel-specific? Are there any hardware vendors
> > with a similar feature? How much is the "sharpness" knob tied to
> > Intel hardware? =20


--Sig_/cZ7.UGIY1.XAE0XM6h4znm5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXPHoQACgkQI1/ltBGq
qqdijxAAlNioQxoeVqHpBPu147ymVB7UnfY/U5gSvff/16qEk7J+L1kAGQgURcPT
vbv4TqHKFIAMgDKY6pzd+OF3t54b9jcMDoEsFxHwVdp37dJLaq+F9yaWLWDYg3UP
V8MRJXBxoWa0zjlSdCSBf1JubisMr/HiMdShpKqt3TzPQGjU7aLP6qu5YFYPEDQC
ZNKZyw38jjsnANK8vcBKytF3+kK5VLybrXLRbjFTdAl3VjS9QfvczrK2pZ27HOxe
wVAKWmqRKKr4VLsJGCfXgWtH8zG2WeGYhCOLoIZ23SJoi1aZXhXv0vH4o6kf4xhq
c56OiGRJrMJMt6MzhPG23CSWmwD3/drWiP0Pd2sfjPXvf5QlDi2LTffQbF+b1H3J
FByYHpPo/X6z7dF1SIXLlLyiGovqFbQWuS3TCrWkxgSO9ck3Top0yTMUnBU8I8WL
0eaiMMANwp/pE8YA7ktxDdUe8rMCYmh8IVbiGctq3AE9HddX/bg48DL9TBhfJ2Hb
WZBDwF/3S46NrxImBlDlROI8UW0TkEkithSFriJtfGI581vCB6XcX13qw5u8UYIZ
8LVu/Z93DE6vV25X3oqxKrCgVxh/ZyCkM5g/7VNzTFQiDyaajT6wtOBqoO75iHtC
1+j09x0cDc9xn4UGJtdENz8SLvSli8J4p90sh4atnfkh7cEv/0s=
=LWXR
-----END PGP SIGNATURE-----

--Sig_/cZ7.UGIY1.XAE0XM6h4znm5--
