Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF971A72C45
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 10:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8510E0A8;
	Thu, 27 Mar 2025 09:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="ITYKxTqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D9310E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JU4/icC0hvYiBOpH3iwRYJX4sGi+rIAQ7BftR572tJA=; b=ITYKxTqAR40rqKTMwplWpDaXow
 r3qHr4rD5Wj8fBNEPZco+Xl6vprGkB/hqIxEuA6kDhWULMGYI6VlnkGqkBdk5gsJ7KALvGfHu0MEb
 uYbLGGPSlufuNyGWZe/0Pur5KEnjzGSSoKi6NiV9+oeGqDJW7juQCd4BlsU3ncJCtFziVKacBtNwm
 95WAEnce6y1kExgkFy/gCniWe32METmUaI5hVjSP8QgtHJME7wZdLiMgmhjzcKbuPNj7hxeW+WuId
 p6KIGoiOFnukfkQXKfDVXz4WE+MD14UE3aW00g8G1nVydeCg2yGft6K1dpOTm5Ad2R1D6edt4rxbs
 LXxT7ITA==;
Received: from [194.136.85.206] (port=56402 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1txjPu-0000000030Z-0Ps2; Thu, 27 Mar 2025 11:20:50 +0200
Date: Thu, 27 Mar 2025 11:20:46 +0200
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
 <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250327112009.6b4dc430@eldfell>
In-Reply-To: <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7H.ebBBVZVPLEOgRm0td_vf";
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

--Sig_/7H.ebBBVZVPLEOgRm0td_vf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 15:55:18 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
>=20
> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > Hi Tomi,
> >=20
> > On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote: =20
> >> Add greyscale Y8 format.
> >>
> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> =20
> >=20
> > Thanks for your patch!
> >  =20
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -405,6 +405,9 @@ extern "C" {
> >>   #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* no=
n-subsampled Cb (1) and Cr (2) planes */
> >>   #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* no=
n-subsampled Cr (1) and Cb (2) planes */
> >>
> >> +/* Greyscale formats */
> >> +
> >> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-=
bit Y-only */ =20
> >=20
> > This format differs from e.g. DRM_FORMAT_R8, which encodes
> > the number of bits in the FOURCC format. What do you envision
> > for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')? =20
>=20
> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's=20
> not required, but different fourccs for the same formats do confuse.
>=20
> So, generally speaking, I'd pick an existing fourcc from v4l2 side if=20
> possible, and if not, invent a new one.

Hi Tomi,

what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?

Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
defined by MatrixCoefficients (H.273 terminology)?

That would be my intuitive assumption following how YCbCr is handled.
Is it obvious enough, or should there be a comment to that effect?


Thanks,
pq

--Sig_/7H.ebBBVZVPLEOgRm0td_vf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmflGG4ACgkQI1/ltBGq
qqcO2g/9EZWxU+HEEjkcp6sBdtsEXoxxcQS7YSdte9kmkzftSWAmE5trU1Gzal7P
V+xWdRTjV+Q/6mVxIIQNUxvqUc4cvBX2Y3M5AFnQWggknuJaWW/7rwNtbaiLqeQh
3kEOB0u9mpso+ihKFiM706ToIUZ94KAaH7v3MFDwRTuYXezYleM3dkYD+qSTzaEr
M+gxITFBD3xQRmHljO+HjFbuV0v0nKvJceuMOYuKJDcn+Y0OZ/E5t+vtZGVfaeex
FEcbDMhsQ9lO0qtDIzHAd2Sh/h/BwWj8LbZt5MEwgqqlOV9wTRDd0fmHUGxzZIi7
W137DaRmqhNmwXqRSdlDhswQeA5jS+RAP8E9H4EqETb1vKsV+hoADs55lT9dybCQ
37AS29zJ1uSkLfwxLchtaQJatnmA947gPAHE3dAJMJjUkZgcJGfWqpV/uUFwf0zc
KNqHzeoGC5nubuNTEBRtHSO6oT7+vlkjdmi+pRGScGtB/1r2Be02pwwUbJB8pNAw
pKGXMKBVImOandJLIsS0Gg3bIxcuwEq3hAjQ2YN61t50Le4qomLejZUVB6UuLFGL
jZNkJAGN8K2xdelcTgI5rCykFNVNLf1jaLKO+WzIykV1LP2tx1ns44eSjZJheVM4
Y/F9qMUePotwSrpk4H/8rfKkEsBNrUWeQg6IW1qTZKuSyapzUaQ=
=J7tR
-----END PGP SIGNATURE-----

--Sig_/7H.ebBBVZVPLEOgRm0td_vf--
