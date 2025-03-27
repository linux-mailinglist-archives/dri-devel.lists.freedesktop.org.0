Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE5A73633
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A07110E91B;
	Thu, 27 Mar 2025 15:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="hJoTS/8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243C710E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tfs9Yes2fcD1eKvhhjyLSR++FzYpfPE/O8Cy+i9EosA=; b=hJoTS/8pdWlu8Ky6n46bqsg4JQ
 8bOluoEHMGEw1liE13dpA9OufYWYHT5pMjdqem1BHAW8BeuYKTKoRCQO7w+Lnpx0pqzEHMhlIEl2d
 oGU/8WJpczuuTnFnPy4O8rYFpIL/j+NYR1kqh3cDPUUdzIjSZ+VEbebNiBYF/zH3mA0/r+6dxuGnZ
 cet/6bNj4NBBjKiAVG34vYT0GWLP+k0J2U5ZpPar5w+NXSdA7CW75yqcxZXBGOYRGHr+2ujwftsZk
 kV/tFseCObnD7LQDRP2ODLd0uWaxIVRDOunxUudQf8/6i/iY0seG0W+vKeAIyXkXhpebz8JJeGFUd
 JrZQpbvA==;
Received: from [194.136.85.206] (port=56794 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1txpdC-000000004ev-3hkq; Thu, 27 Mar 2025 17:58:58 +0200
Date: Thu, 27 Mar 2025 17:58:42 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Vishal Sagar
 <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250327175842.130c0386@eldfell>
In-Reply-To: <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
 <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8xj0q8BybcrD9nuYSufXAhB";
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

--Sig_/8xj0q8BybcrD9nuYSufXAhB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 16:21:16 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
>=20
> On 27/03/2025 11:20, Pekka Paalanen wrote:
> > On Wed, 26 Mar 2025 15:55:18 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >  =20
> >> Hi,
> >>
> >> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> >>> Hi Tomi,
> >>>
> >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote: =20
> >>>> Add greyscale Y8 format.
> >>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> =20
> >>>
> >>> Thanks for your patch!
> >>>     =20
> >>>> --- a/include/uapi/drm/drm_fourcc.h
> >>>> +++ b/include/uapi/drm/drm_fourcc.h
> >>>> @@ -405,6 +405,9 @@ extern "C" {
> >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /*=
 non-subsampled Cb (1) and Cr (2) planes */
> >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /*=
 non-subsampled Cr (1) and Cb (2) planes */
> >>>>
> >>>> +/* Greyscale formats */
> >>>> +
> >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* =
8-bit Y-only */ =20
> >>>
> >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> >>> the number of bits in the FOURCC format. What do you envision
> >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')? =20
> >>
> >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> >> not required, but different fourccs for the same formats do confuse.
> >>
> >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> >> possible, and if not, invent a new one. =20
> >=20
> > Hi Tomi,
> >=20
> > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> >=20
> > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > defined by MatrixCoefficients (H.273 terminology)?
> >=20
> > That would be my intuitive assumption following how YCbCr is handled.
> > Is it obvious enough, or should there be a comment to that effect? =20
>=20
> You raise an interesting point. Is it defined how a display driver, that=
=20
> supports R8 as a format, shows R8 on screen? I came into this in the=20
> context of grayscale formats, so I thought R8 would be handled as (R, R,=
=20
> R) in RGB. But you say (R, 0, 0), which... also makes sense.

That is a good question too. I based my assumption on OpenGL behavior
of R8.

Single channel displays do exist I believe, but being single-channel,
expansion on the other channels is likely meaningless. Hm, but for the
KMS color pipeline, it would be meaningful, like with a CTM.
Interesting.

I don't know. Maybe Geert does?

> I think that's a new argument in favor of Y8: Y8 means Y-only, so the=20
> meaning is more explicit.
>=20
> How I see that the display controller would deal with Y8 (depending on=20
> the HW):
>=20
> - Take the Y value as a greyscale value, if the HW supports greyscale=20
> format directly.
> - Use the Y as YCbCr (Y, Cb-neutral, Cr-neutral), and use that if the HW=
=20
> supports YCbCr directly.
> - Use the Y as YCbCr as above, and convert to RGB in the usual way.
>=20
> And as it's an YUV format, the limited/full range applies, which I=20
> believe is not usually applied to RGB formats.
>=20
> Does this make sense?

It makes perfect sense to me.

The KMS color pipeline is defined in terms of full-range RGB, so if any
of those KMS properties is set that might make a difference, the driver
is forced to go through RGB, regardless of the hardware signal format.


Thanks,
pq

--Sig_/8xj0q8BybcrD9nuYSufXAhB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfldbIACgkQI1/ltBGq
qqfh2RAAhOM+bKvO3B8xMCJj8yzRAzg7uZBqEpipXSpfQREv9cagIt6l+D4//+Mu
5p1/WFPrn6VqhuV5aEIaeB4Ad3PwLanxj1q0waGGa2248jIDvV1B7CQur8Ax/yDl
PhKBmObKAhnZuDcjMAGsspyg594L3Xw/tBqSnQiPi4wx59YZ0YgioE58huKx11Yg
3AF/05bLBewV5MSWaXKFkYQDq/w47/++Vw/uxmnVz73u5kfO9WohWFp2dgdVBISw
GLNOtwII2qXfjUZtbsDuxksAK6WMqEUViMoQF3C2Eb6CvYV6W45ODkx0XatTmdHC
wm2JlRQO2xXb1wKmO6mGMITL5vs2jfGQJqx2ABM/t7KQWYS0EWVcSF3kyvBEhN3T
xi5JdIB4ASv35VV67bivHulogzqFQErgeTQS/Qsl5s8IbHkXsIxixH9H0rj0r+az
gA7lBmhGRCR/UVwkhO4z1e0kx1V5Xt4lI+dOKERNGcwV3a2HaEyRjse0IoTfl+5j
Gu0QAy7aIlg1ck/OdNirhAAYhP1ElMr8ZOtuv4VgfTvARb09mdQ94+K/ouUvOcah
u6gD4YYjePH66K5Odv1nuh/MiWPGhEvaVvE4h2Izx7uY9lCqnLUC54LnWK8DYbcp
TF/HUyBikm7vdWcNbdVDW/+COMfmsI8D3Y5TWGY1HOSTTz4brjM=
=q1s8
-----END PGP SIGNATURE-----

--Sig_/8xj0q8BybcrD9nuYSufXAhB--
