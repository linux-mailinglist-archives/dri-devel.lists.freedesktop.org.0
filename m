Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A84A6A276
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE93510E392;
	Thu, 20 Mar 2025 09:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="ueEAV4VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D46310E21F;
 Thu, 20 Mar 2025 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KN0E1CtHzZMDFASPHUIAGSz4ovHioQCvP87HdG+MCYk=; b=ueEAV4VVIDrxUOgYxofthsesUC
 l2ob61vxkQJDXF1zT5nvHlTTL66ZNsQH6GN/ADFmLJVVVlh6pT0E6dR5+sbqLuJxhVtGcBZIb3OnM
 NtCHo2w1LoVzO+DP5BqOgWAGrmLtBeENYpJfDWTrKeshRXYSA6uuyCNR17y42qMoQI1Wn5MJhoLZo
 VDfa3h7iC6HiUlOCIsRmwX5wI8CxdeqjjoULqO48qW3YYeIUhNcP3GAhSjY09C6nIvf7spPMz4eU3
 EKYn18ddrQul+wIurFmtwxfMumolSLGf3smtM+0Jkt5cZAtDCcjVjMXoSY+rJ8Vi2AhQNm5HRcGb3
 s6WT6PKg==;
Received: from [194.136.85.206] (port=56058 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1tvC7S-000000002s9-2d18; Thu, 20 Mar 2025 11:23:18 +0200
Date: Thu, 20 Mar 2025 11:23:09 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, harry.wentland@amd.com,
 alex.hung@amd.com
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250320112309.1d9c3e09@eldfell>
In-Reply-To: <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
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
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3GKph_Dx//rGj.d.uPd=lXT";
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

--Sig_/3GKph_Dx//rGj.d.uPd=lXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Mar 2025 12:08:15 +0000
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> > On Mon, 3 Mar 2025 13:23:42 +0530
> > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> >  =20
> > > On 20-02-2025 21:20, Pekka Paalanen wrote: =20
> > > > On Wed, 19 Feb 2025 09:28:51 +0530
> > > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

...

> > > Hi Pekka,
> > > Sorry got getting back late on this.
> > > I totally agree that the UAPI should not be any hardware specific and
> > > have taken care to get rid of such if any.
> > > Here we are just exposing the histogram data and what point is the
> > > histogram generated is out of the scope. =20
> >=20
> > It's not out of scope. Understanding exactly at what point the histogra=
m is
> > generated in the KMS pixel pipeline is paramount to being able to use t=
he
> > results correctly - how it relates to the framebuffers'
> > contents and KMS pixel pipeline configuration.
> >  =20
>=20
> While working around this comment, it looks to be quite challenging to
> address this comment and agree that this will have to be addressed and is=
=20
> important for the user to know at which point in the pixel pipeline confi=
guration
> the histogram is generated.
> I can think of 2 options on addressing this.
>=20
> 1.  Have this documented in the driver. Since this can vary on each vendor
> hardware, can have this documented in the drivers or ReST document.
>=20

Hi Arun,

this is not acceptable in KMS, because it requires userspace to have
code that depends on the hardware revision or identity. When new
hardware appears, it will not be enough to update the drivers, one will
also need to update userspace. There currently is no userspace
"standard KMS library" to abstract all drivers further, like there is
libcamera and Mesa.

> 2. Maybe have a bitmapping like we have it for histogram_mode. Define=20
> user readable macros for that.
> Ex: CC1_DEGAMMA_HIST_CC2
> In this case histogram is between the two color conversion hardware block
> in the pixel pipeline.
> This macro will have to be defined on need basis and define a u32 variable
> for this bit manipulation.

This one still has problems in that some hardware may not have all the
non-HIST elements or not in the same order. It's a better abstraction
than option 1, but it's still weak.

I can see one solid solution, but it won't be usable for quite some
time I suppose:

https://lore.kernel.org/dri-devel/20241220043410.416867-5-alex.hung@amd.com/

The current work on the color pipelines UAPI is concentrated on the
per-plane operations. The idea is that once those are hashed out, the
same design is applied to CRTCs as well, deprecating all existing CRTC
color processing properties. A histogram processing element could be
exposed as a colorop object, and its position in a CRTC color pipeline
represents the point where the histogram is collected.

That would be the best possible UAPI design on current knowledge in my
opinion.

Btw. this applies also to the image enhancement processing element you
are proposing.


Thanks,
pq

--Sig_/3GKph_Dx//rGj.d.uPd=lXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfb3n0ACgkQI1/ltBGq
qqcwpxAAtATk5CekEZ5Yqh8jCQRRt6av6rARAR0oPrjtNT3ePc6bpSDMjxeFylqF
oMNF2TCiw+v3eX6L6pp9MA71+BAJzY5NQBSi7Tc0aW6a5JneKUvQZ7OuVMtRdlLa
BmVpsBcS7Kdi7jjkQK+gVXIn/0H8UuyGyCWC+57fT34Ad246nvOyLcWlNBRlm4NR
bgWkzbKFXXiCv43eI9xpx5wodewOclNdZl/REHo+aHT+vKbcQc7DuuKNQe4efJ25
vV0WkTyzuJPeqBDd8XbSx5NDqk+41WNNluPyU7nqP9W2Ap2Qh6Zh5FzrUU9K06e+
g0D4KPMO5hxIOjxbhV4U8T4hLsm3BEdL1YO3s/a9l1Qa71spel41/gbs4z1PIasv
JUbe0JMf8bl6rSKeQCl+xDiIhYyYg2+BQADjaYL8C87tq8yOJ3KdV1oltEgPp39c
itHwnWg8dFlyi4hfvnn3xgJBh8paBLoHXtHyFfTOCWc1LbAvgIwiMuKksu8EQdPo
QfA14Utiml2Y+v+eBrFVi/nhspLIV9dlOyUYLamjwSbNpsnhfRx1/n6RyAw84Q+G
LDJAEcL58DbqBhask0UXARSqWaDJXtxuhGMNq/LSwgoW8ZfSagp/VDln/e2YToR5
vXv0rDOIlSxrtz9wAEzC7Crhm72ImK3ORs45MTHe2BV6wYkNdvc=
=G0D+
-----END PGP SIGNATURE-----

--Sig_/3GKph_Dx//rGj.d.uPd=lXT--
