Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C933A4BAD6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B208913D;
	Mon,  3 Mar 2025 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="pwJeRG+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9558913D;
 Mon,  3 Mar 2025 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LwbSnaacoiJ1tf1QkAGtvJTTnl5irw31jTvUm2dYEck=; b=pwJeRG+Ql/v7To57SrcbD8tzS2
 xtqG0aacX+wfpGGwHRhG8Jn2z4afMta0bg6+015erl5P3ataL2RiL3ybO9Uedw6tFecEX7+9Pe75t
 cn1mamU+oSJBIjQx6AY8dtQnvU5bnTL/cwrmcYyzU6Otd6yv1DtJq7RX5UURX6534VXWGPiOyt3yr
 LEgILAfMSnoxjqWLxwdrfvbcj7naSPc6iJQEZOJjeLcfUicxYMTV/+3rQkFFS2VeObCLvgUSdXqfK
 wsyQIh55LLmz8JMNv8LZYTNg34NiSU86hvdx0AoOxSJbxElUYpJ0p3TdQ7OJds6hh69tbty8h/eVQ
 KQRc434A==;
Received: from [194.136.85.206] (port=36910 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1tp2Ai-000000001xE-3d4b; Mon, 03 Mar 2025 11:33:12 +0200
Date: Mon, 3 Mar 2025 11:33:11 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250303113311.0f65f7b2@eldfell>
In-Reply-To: <ac4aca52-2822-4b01-95b9-cf66ff6d8107@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell> <20250217142750.7da2dcb8@eldfell>
 <ac4aca52-2822-4b01-95b9-cf66ff6d8107@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FLjnla.zh0Y9tEIlvkXHG2=";
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

--Sig_/FLjnla.zh0Y9tEIlvkXHG2=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Mar 2025 13:22:29 +0530
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> On 17-02-2025 17:57, Pekka Paalanen wrote:
> > On Mon, 17 Feb 2025 12:08:08 +0200
> > Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> > =20
> >> Hi Arun,
> >>
> >> this whole series seems to be missing all the UAPI docs for the DRM
> >> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> >> replacement for them, I would assume both are a requirement.
> >>
> >> Without the ReST docs it is really difficult to see how this new UAPI
> >> should be used.
> >>
> >>
> >> On Tue, 28 Jan 2025 21:21:07 +0530
> >> Arun R Murthy <arun.r.murthy@intel.com> wrote:
> >> =20
> >>> Display Histogram is an array of bins and can be generated in many wa=
ys
> >>> referred to as modes.
> >>> Ex: HSV max(RGB), Wighted RGB etc.
> >>>
> >>> Understanding the histogram data format(Ex: HSV max(RGB))
> >>> Histogram is just the pixel count.
> >>> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> >>> 25 bits should be sufficient to represent this along with a buffer of=
 7
> >>> bits(future use) u32 is being considered.
> >>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> >>> bits, hence 32 bins.
> >>> Below mentioned algorithm illustrates the histogram generation in
> >>> hardware.
> >>>
> >>> hist[32] =3D {0};
> >>> for (i =3D 0; i < resolution; i++) {
> >>> 	bin =3D max(RGB[i]);
> >>> 	bin =3D bin >> 3;	/* consider the most significant bits */
> >>> 	hist[bin]++;
> >>> }
> >>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
> >>> count of each pixels will be placed in the last bin. Hence except
> >>> hist[31] all other bins will have a value zero.
> >>> Generated histogram in this case would be hist[32] =3D {0,0,....44236=
800}
> >>>
> >>> Description of the structures, properties defined are documented in t=
he
> >>> header file include/uapi/drm/drm_mode.h
> >>>
> >>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
> >>>
> >>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >>> ---
> >>>   include/uapi/drm/drm_mode.h | 65 ++++++++++++++++++++++++++++++++++=
+++++++++++
> >>>   1 file changed, 65 insertions(+)
> >>>
> >>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h

...

> >>> +/**
> >>> + * struct drm_histogram_config
> >>> + *
> >>> + * @hist_mode_data: address to the histogram mode specific data if a=
ny =20
> >> Do I understand correctly that the KMS blob will contain a userspace
> >> virtual memory address (a user pointer)? How does that work? What are
> >> the lifetime requirements for that memory?
> >>
> >> I do not remember any precedent of this, and I suspect it's not a good
> >> design. I believe all the data should be contained in the blobs, e.g.
> >> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
> >> for returning histogram data to userspace, but at least all the data
> >> sent to the kernel should be contained in the blob itself since it
> >> seems to be quite small. Variable length is ok for blobs. =20
> Sorry forgot to add the reason for choosing u64 based ptr in the UAPI.
> This histogram is related(something to do) to the color. drm_color is=20
> also exposing the rgb values as __u64 pointer in the struct=20
> drm_mode_crtc_lut

struct drm_mode_crtc_lut is used in the ioctls DRM_IOCTL_MODE_GETGAMMA
and DRM_IOCTL_MODE_SETGAMMA. The pointers are used only inside the
ioctl call for copying the data to/from user, and they are never saved
for later use in the kernel. That's the fundamental difference. KMS
blob objects OTOH are by definition saved in the kernel for re-use.


Thanks,
pq

--Sig_/FLjnla.zh0Y9tEIlvkXHG2=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfFd1cACgkQI1/ltBGq
qqeo3A//cW2DpzJ5cnpk4w1FBY1FJvSfRw2QlfAT+kHfFRcbAM2BMurKNeQx4gRu
GYD0jpKo8Ma5gloimMoI5pQg9Q7SmjYXLXPb9OSZoeWay/c8zeqMhiEL6055UvHx
/fH2Cl86Nm6NwdrNwPqzznOcmlAHUidR5EQm1LJ5GFz2kS5QNbm3/lA30CV56ks5
oUuRE2ND7FzMZJZrb+P5KYNqogDQDiYa6L6nkA7DAMQuQQUGttAQ8HHIINwjObC5
InCbdPlUYgEqdjGOf6j7lOnqUl4GVjQJYBYyHenrTm68PtGKRZNu/2e33L60GEI4
tAPvV5p9EiNYIvBviBzDhF9PeKLIORNStSfh0gDJ3pyk2TGx+Bk8OeAJesGlt4fS
CiyjPJ2OUHFB8viVkDuSJocyXRoTgLLKYLM/0/xkmojlsVV4Wc3tIZQYbMC47JQF
M+AEKaeCz01of0KaZRE0YFrrA9WwrMxXZBMDyIaGW3m/XD/gxQSW/fWxpZ6fdKQt
grcruO5FEsZo1BxhQQ6ehZ76tPmoqUTbH3jZ3ksIpD0W8uD3CodKFYW7UgUnasEr
TYCpfXkuFcKMrsXI0I7ncpy/2nbvdqIgrQXbeb0uRS2k8ggFP1I9TigtbCc6fV+z
7BErMR5YUagbX20yG2PTPpOr40HD4wYn012Zmjq5Hd8uPDSd7tI=
=MYY2
-----END PGP SIGNATURE-----

--Sig_/FLjnla.zh0Y9tEIlvkXHG2=--
