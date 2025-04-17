Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B21A914E7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA7B10E183;
	Thu, 17 Apr 2025 07:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="l+98n7hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACFA10E07E;
 Thu, 17 Apr 2025 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=phiY14deJRI6a3x3lcvFEsIivtjBgBUNrrzrJMy7L4k=; b=l+98n7hizFNvJVcikT8dAmWdEL
 9EgniV8ASWyX5G4XinPabRXRsZ0dyrZBSUYqAxyuM9gM98x8GgbEQz+jx/Nbe73zGI0LoLRTLFxiF
 l3aSuMMTQrFtWQ1eaojWgO/NSOhnDEsMo6sSdWY9Djx4iVdmqE37JnBDS07Y5oZ8urKYy85iMhO1z
 KDldgm9oeybFPEX7Fdh5b+XvrEuBApknG3MPuEiRRlQhRMolScdnqFYcaI/cBAvlTWKbIytNTR7MG
 v/FXuN0EdxhKS0Y11XU+zs4yp+6LOJKQu3/a+cbY58FmCIQOcKF/S9crs2pGtTroDfiIRlBHf0GIP
 wNa3YR9g==;
Received: from [194.136.85.206] (port=35442 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1u5JVl-000000002m3-3lhC; Thu, 17 Apr 2025 10:18:13 +0300
Date: Thu, 17 Apr 2025 10:18:06 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>, "Vetter,
 Simona" <simona.vetter@intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250417101806.08df0731@eldfell>
In-Reply-To: <DM4PR11MB63600B85A21E03A5E6938652F4BC2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
 <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250320112309.1d9c3e09@eldfell>
 <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250327105925.1e9e8609@eldfell>
 <IA0PR11MB7307082B787829CA3569F25FBAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM4PR11MB63600B85A21E03A5E6938652F4BC2@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vewU.i/mKCy.1/0LU/QAvb9";
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

--Sig_/vewU.i/mKCy.1/0LU/QAvb9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Apr 2025 06:31:21 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mu=
rthy,
> > Arun R
> > Sent: Friday, March 28, 2025 10:36 AM
> > To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dr=
i-
> > devel@lists.freedesktop.org; Kandpal, Suraj <suraj.kandpal@intel.com>;
> > harry.wentland@amd.com; alex.hung@amd.com; Vetter, Simona
> > <simona.vetter@intel.com>; airlied@gmail.com
> > Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed =
to user
> >  =20
> > > On Wed, 26 Mar 2025 06:03:27 +0000
> > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > > =20
> > > > > On Wed, 19 Mar 2025 12:08:15 +0000 "Murthy, Arun R"
> > > > > <arun.r.murthy@intel.com> wrote:
> > > > > =20
> > > > > > > On Mon, 3 Mar 2025 13:23:42 +0530 "Murthy, Arun R"
> > > > > > > <arun.r.murthy@intel.com> wrote:
> > > > > > > =20
> > > > > > > > On 20-02-2025 21:20, Pekka Paalanen wrote: =20
> > > > > > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > > > > > <arun.r.murthy@intel.com> wrote: =20
> > > > >
> > > > > ...
> > > > > =20
> > > > > > > > Hi Pekka,
> > > > > > > > Sorry got getting back late on this.
> > > > > > > > I totally agree that the UAPI should not be any hardware
> > > > > > > > specific and have taken care to get rid of such if any.
> > > > > > > > Here we are just exposing the histogram data and what point
> > > > > > > > is the histogram generated is out of the scope. =20
> > > > > > >
> > > > > > > It's not out of scope. Understanding exactly at what point the
> > > > > > > histogram is generated in the KMS pixel pipeline is paramount
> > > > > > > to being able to use the results correctly - how it relates to
> > > > > > > the =20
> > > framebuffers' =20
> > > > > > > contents and KMS pixel pipeline configuration.
> > > > > > > =20
> > > > > >
> > > > > > While working around this comment, it looks to be quite
> > > > > > challenging to address this comment and agree that this will
> > > > > > have to be addressed and is important for the user to know at
> > > > > > which point in the pixel pipeline configuration the histogram i=
s generated.
> > > > > > I can think of 2 options on addressing this.
> > > > > >
> > > > > > 1.  Have this documented in the driver. Since this can vary on
> > > > > > each vendor hardware, can have this documented in the drivers or
> > > > > > ReST =20
> > > document. =20
> > > > > > =20
> > > > >
> > > > > Hi Arun,
> > > > >
> > > > > this is not acceptable in KMS, because it requires userspace to
> > > > > have code that depends on the hardware revision or identity. When
> > > > > new hardware appears, it will not be enough to update the drivers,
> > > > > one will also need to update userspace. There currently is no
> > > > > userspace "standard KMS library" to abstract all drivers further,
> > > > > like there is libcamera =20
> > > and Mesa. =20
> > > > > =20
> > > > > > 2. Maybe have a bitmapping like we have it for histogram_mode.
> > > > > > Define user readable macros for that.
> > > > > > Ex: CC1_DEGAMMA_HIST_CC2
> > > > > > In this case histogram is between the two color conversion
> > > > > > hardware block in the pixel pipeline.
> > > > > > This macro will have to be defined on need basis and define a
> > > > > > u32 variable for this bit manipulation. =20
> > > > >
> > > > > This one still has problems in that some hardware may not have all
> > > > > the non- HIST elements or not in the same order. It's a better
> > > > > abstraction than option 1, but it's still weak.
> > > > >
> > > > > I can see one solid solution, but it won't be usable for quite
> > > > > some time I
> > > > > suppose:
> > > > >
> > > > > https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> > > > > alex.hung@amd.com/
> > > > >
> > > > > The current work on the color pipelines UAPI is concentrated on
> > > > > the per-plane operations. The idea is that once those are hashed
> > > > > out, the same design is applied to CRTCs as well, deprecating all
> > > > > existing CRTC color processing properties. A histogram processing
> > > > > element could be exposed as a colorop object, and its position in
> > > > > a CRTC color pipeline represents the point where the histogram is=
 collected.
> > > > >
> > > > > That would be the best possible UAPI design on current knowledge
> > > > > in my opinion.
> > > > > =20
> > > > Yes this would be the best design, but looking into the timeline for
> > > > this CRTC color pipeline can we proceed with this as in interim sol=
ution.
> > > > Once we have the CRTC color pipeline in drm, will rebase this
> > > > histogram to make use of the pipeline.
> > > > We can also take up the crtc color pipeline and will also start
> > > > contributing to get things faster but since there is not timeline
> > > > defined for that activity, would it be viable to go ahead with
> > > > option2 as in =20
> > > interim solution?
> > >
> > > Hi Arun,
> > >
> > > I think that's something the DRM maintainers should chime in on. =20
>=20
> As a first step, I think we can expose the Histogram through the property.
> We can later hook this into the crtc color pipeline once we implement it.

Do you mean upstreamed as well?

How is that different from the original proposal here that I raised
concerns about?


Thanks,
pq

> A userspace implementation showing end to end benefit of the feature and
> usecase would be needed. Hope this is ok and no strong objection to this
> approach.
>=20
> Regards,
> Uma Shankar
>=20

--Sig_/vewU.i/mKCy.1/0LU/QAvb9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgAqy4ACgkQI1/ltBGq
qqc05hAAlCyVGG6Blf7aoJ4zP8yF+qJdkerJ3oay1W1UswtiJM4ybgKG7MZVC62v
UJviC9JquTffmdNGgsr+mG6HY11PiZL5pKgd9GzYvunra6w4OcwHayQm0qHgsC/V
NOLLn9LubtvMPZSslHgy65REDwiou9SfJMkMJ26qSB+vU9880/+1wbrnW/8T9QNm
EWzQK+N4ZXdqNQVhjYxGFyb7vd/PAPpZU7+p95bG/zSvHELIQYnsvyHKcZOM2opt
ejXuUGb+VqzsSx3OzEOQNgZfGSs9lghiI0kZOdxjXPJJiIQMPK6p+X0gTEtCU/67
MaAWnpyGffbAIfvGqBY1qzHlllUvr9dB4vj8vK6Vav1z5Yiuw7DwUhjBMJrpxKH2
xDw/vXqgLQbEIWhRP6QONRNK7bRcnHFL7q4qnDpRJTsoza3xuYdx2Ex1pWxB6LNA
ZnopN1/zAxi1Ey3BAcZ905O9242D+ocY1NL0CdVtT3JSnaO81onPSS3ugzjiFQzj
4Bebacd8fUsm8fHo9R5FfOM1970uPjTfpEhaEBGoFHApHyYfKxGLjuwX+2pIPbwu
A04l7Uwi1pm2UoBBryNkFrpG6p8WMUeK2Xz1p32Wri4I6WRUTnsfH7OWDzscBwCU
8ExSo3vYHxnL3sHQUSea9QsGGBhFiS/F5f5Vd+wDjZoMyXc2EqA=
=m/Q5
-----END PGP SIGNATURE-----

--Sig_/vewU.i/mKCy.1/0LU/QAvb9--
