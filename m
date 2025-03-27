Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1AA72BF6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E303F10E893;
	Thu, 27 Mar 2025 08:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="ocvEBSa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E60110E890;
 Thu, 27 Mar 2025 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fC7ZDRGv34YxgVwUkHxMb2+1nUizNI5yyU+oNqoSq4A=; b=ocvEBSa6BCPHV2cbF+BB8Kl00b
 nEq+P3+3BPxqNXEF0SKHmDCeesBxbLpYQe0HpSLfGh17S8AMQUOATBxt4k2kcVKjFNCTQAbzY3rPO
 MCrG70mCTj8qlnPqmQHVZTiODXd4LWWPObJPkOJF//9hwV7UK4drm8xP7dOU4zNfJO70OUZL7Ycxo
 jzwlUA/v1hQYQ86MUIY6Ml+QWSXyZsWA9BcHH8AISjY5S50Bp569E/BHpW1hrZWFa70kneALBtSAY
 vOQKmu6z6jbLtKMPvmD6Mh7nDjURTk/sU1R/Q0OABY2KhZhy+b8eanzecSSpNwJLO92E9lVGI93qA
 vu5H8dMg==;
Received: from [194.136.85.206] (port=38288 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1txj5J-000000007lq-3H5X; Thu, 27 Mar 2025 10:59:33 +0200
Date: Thu, 27 Mar 2025 10:59:25 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250327105925.1e9e8609@eldfell>
In-Reply-To: <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
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
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PlEXDGWVDf22GecpSmX4ZcA";
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

--Sig_/PlEXDGWVDf22GecpSmX4ZcA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 06:03:27 +0000
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> > On Wed, 19 Mar 2025 12:08:15 +0000
> > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> >  =20
> > > > On Mon, 3 Mar 2025 13:23:42 +0530
> > > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > > > =20
> > > > > On 20-02-2025 21:20, Pekka Paalanen wrote: =20
> > > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > > <arun.r.murthy@intel.com> wrote: =20
> >=20
> > ...
> >  =20
> > > > > Hi Pekka,
> > > > > Sorry got getting back late on this.
> > > > > I totally agree that the UAPI should not be any hardware specific
> > > > > and have taken care to get rid of such if any.
> > > > > Here we are just exposing the histogram data and what point is the
> > > > > histogram generated is out of the scope. =20
> > > >
> > > > It's not out of scope. Understanding exactly at what point the
> > > > histogram is generated in the KMS pixel pipeline is paramount to
> > > > being able to use the results correctly - how it relates to the fra=
mebuffers'
> > > > contents and KMS pixel pipeline configuration.
> > > > =20
> > >
> > > While working around this comment, it looks to be quite challenging to
> > > address this comment and agree that this will have to be addressed and
> > > is important for the user to know at which point in the pixel pipeline
> > > configuration the histogram is generated.
> > > I can think of 2 options on addressing this.
> > >
> > > 1.  Have this documented in the driver. Since this can vary on each
> > > vendor hardware, can have this documented in the drivers or ReST docu=
ment.
> > > =20
> >=20
> > Hi Arun,
> >=20
> > this is not acceptable in KMS, because it requires userspace to have co=
de that
> > depends on the hardware revision or identity. When new hardware appears=
, it
> > will not be enough to update the drivers, one will also need to update
> > userspace. There currently is no userspace "standard KMS library" to ab=
stract
> > all drivers further, like there is libcamera and Mesa.
> >  =20
> > > 2. Maybe have a bitmapping like we have it for histogram_mode. Define
> > > user readable macros for that.
> > > Ex: CC1_DEGAMMA_HIST_CC2
> > > In this case histogram is between the two color conversion hardware
> > > block in the pixel pipeline.
> > > This macro will have to be defined on need basis and define a u32
> > > variable for this bit manipulation. =20
> >=20
> > This one still has problems in that some hardware may not have all the =
non-
> > HIST elements or not in the same order. It's a better abstraction than =
option 1,
> > but it's still weak.
> >=20
> > I can see one solid solution, but it won't be usable for quite some tim=
e I
> > suppose:
> >=20
> > https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> > alex.hung@amd.com/
> >=20
> > The current work on the color pipelines UAPI is concentrated on the per=
-plane
> > operations. The idea is that once those are hashed out, the same design=
 is
> > applied to CRTCs as well, deprecating all existing CRTC color processing
> > properties. A histogram processing element could be exposed as a colorop
> > object, and its position in a CRTC color pipeline represents the point =
where the
> > histogram is collected.
> >=20
> > That would be the best possible UAPI design on current knowledge in my
> > opinion.
> >  =20
> Yes this would be the best design, but looking into the timeline for this=
 CRTC=20
> color pipeline can we proceed with this as in interim solution.
> Once we have the CRTC color pipeline in drm, will rebase this histogram to
> make use of the pipeline.
> We can also take up the crtc color pipeline and will also start contribut=
ing
> to get things faster but since there is not timeline defined for that act=
ivity,
> would it be viable to go ahead with option2 as in interim solution?

Hi Arun,

I think that's something the DRM maintainers should chime in on.


Thanks,
pq


> > Btw. this applies also to the image enhancement processing element you =
are
> > proposing.
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/PlEXDGWVDf22GecpSmX4ZcA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmflE20ACgkQI1/ltBGq
qqdRbBAAsk9nk8xHS7SeevQDtnHdp5T2+EMXyuXdXMNg3nKEOK6NhoOyuQMpNA5m
937OEHNC+LDLd8W+L02R5TOsSZtmPk4Y6SIuOW7v5v209f8hCcXe81sAvqIHhY+n
arLbL5xw5taN8khoBGjBM80ou+UsTQTJJ5nXBS2HUH9fmtN0imcRsWEM5h05eAeO
lzgIci4ErWFW/kjmQO9lF7gjYcrsoM9sN5b92iKS5AEN4z12FGZSKGrly9jpiZW2
2bJGdjp2Dmhe+iksixqX5maJQvr3Bmr8uJDhddCyEMSbrVp2ydP8IaSQ9WyPs45l
o3vh4WuFz+X7YDBkahpZJJjzW9n16mFHbPm1sFiKg2xyVb8ra/z3lCAMuu9qb3V9
UivSXGdZRzCRWw5PTYVxBm+FAGwY/BkxzCpI5OHCS5BTIEQu6FwCeMgYZEpvzehg
4gYruENIhaY9daGEFU39oe+MTf5XC7D+qr9+9hGfVX9fEl/LXfBZtvrPsHKO9BGa
0+5nYk1zDDHMHGaXyldXZrMltYDdK//zSl1Y6DcNVpicAtATRypUfENaBjEQl+IM
zCJcKY+oiBFetqwrO401oCT/kkysXl6g2s05JPS0eurG71xmbjkyPr4fghCpRu3J
fCWmiP/BfJY5a1yFjp/9D9zw45ccHLOn2b1QaEMsNp2/H3nl9vQ=
=8Sgc
-----END PGP SIGNATURE-----

--Sig_/PlEXDGWVDf22GecpSmX4ZcA--
