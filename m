Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE6A4BAAA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251410E39E;
	Mon,  3 Mar 2025 09:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="Lx5e3eZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A054C10E376;
 Mon,  3 Mar 2025 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=80/OgjPCUMohPvjuwH22wc4dIQD9tG9Qqp9P60+4tIs=; b=Lx5e3eZHewsFWna0Y/Ol4VERTj
 Zd67oUn9S9GiwBJquBefvUn52zNMvG0d+GFGMk6kzgECxnqorKhxUIyF3l5xMnUWhRb7RTHRc47Tz
 JY0Tw79l0q65KxbSedeLdMuevd9dPWz6VpfVKNEES3rkABcPawSRFmaPmQdKypACFyklLqpNTnbHJ
 LSZ0WMgg0/AovnntHteK/qVAN/UIDQ9VtZStKMbzw75sHNCBMVRvYwGGPHYMkaTV01gsl9qritDUH
 6xuj1RwxMS/zayt48LMs8DodaeP2H94FeRyV2MVitAzt1wi6bRmjf5SewyTQ7bumyTFpz3DtNPIAV
 xf/rkKmw==;
Received: from [194.136.85.206] (port=52212 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1tp1yF-000000004EM-1tG2; Mon, 03 Mar 2025 11:20:19 +0200
Date: Mon, 3 Mar 2025 11:20:10 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250303112010.469b9685@eldfell>
In-Reply-To: <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9og.cFFIVezjtsa4lWHoxxI";
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

--Sig_/9og.cFFIVezjtsa4lWHoxxI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Mar 2025 13:23:42 +0530
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> On 20-02-2025 21:20, Pekka Paalanen wrote:
> > On Wed, 19 Feb 2025 09:28:51 +0530
> > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > =20
> >> On 18-02-2025 21:48, Pekka Paalanen wrote: =20
> >>> On Tue, 18 Feb 2025 11:13:39 +0530
> >>> "Murthy, Arun R"<arun.r.murthy@intel.com> wrote:
> >>>    =20
> >>>> On 17-02-2025 15:38, Pekka Paalanen wrote: =20
> >>>>> Hi Arun,
> >>>>>
> >>>>> this whole series seems to be missing all the UAPI docs for the DRM
> >>>>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> >>>>> replacement for them, I would assume both are a requirement.
> >>>>>
> >>>>> Without the ReST docs it is really difficult to see how this new UA=
PI
> >>>>> should be used. =20
> >>>> Hi Pekka,
> >>>> I also realized later on this. Will add this in my next patchset. =20
> >>>>> On Tue, 28 Jan 2025 21:21:07 +0530
> >>>>> Arun R Murthy<arun.r.murthy@intel.com> wrote:
> >>>>>       =20
> >>>>>> Display Histogram is an array of bins and can be generated in many=
 ways
> >>>>>> referred to as modes.
> >>>>>> Ex: HSV max(RGB), Wighted RGB etc.
> >>>>>>
> >>>>>> Understanding the histogram data format(Ex: HSV max(RGB))
> >>>>>> Histogram is just the pixel count.
> >>>>>> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> >>>>>> 25 bits should be sufficient to represent this along with a buffer=
 of 7
> >>>>>> bits(future use) u32 is being considered.
> >>>>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significa=
nt 5
> >>>>>> bits, hence 32 bins.
> >>>>>> Below mentioned algorithm illustrates the histogram generation in
> >>>>>> hardware.
> >>>>>>
> >>>>>> hist[32] =3D {0};
> >>>>>> for (i =3D 0; i < resolution; i++) {
> >>>>>> 	bin =3D max(RGB[i]);
> >>>>>> 	bin =3D bin >> 3;	/* consider the most significant bits */
> >>>>>> 	hist[bin]++;
> >>>>>> }
> >>>>>> If the entire image is Red color then max(255,0,0) is 255 so the p=
ixel
> >>>>>> count of each pixels will be placed in the last bin. Hence except
> >>>>>> hist[31] all other bins will have a value zero.
> >>>>>> Generated histogram in this case would be hist[32] =3D {0,0,....44=
236800}
> >>>>>>
> >>>>>> Description of the structures, properties defined are documented i=
n the
> >>>>>> header file include/uapi/drm/drm_mode.h
> >>>>>>
> >>>>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
> >>>>>>
> >>>>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
> >>>>>> ---
> >>>>>>     include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++=
++++++++++++++++
> >>>>>>     1 file changed, 65 insertions(+)

...

> > Hi Arun,
> >
> > sure, it may be by hardware design, but the UAPI must specify or
> > communicate exactly what it is. This seems to be the recurring theme in
> > all the remaining comments, so I trimmed them away.
> >
> > A generic UAPI is mandatory, because that's KMS policy AFAIU. A generic
> > UAPI cannot key anything off of the hardware revision. Instead,
> > everything must be specified and communicated explicitly. It's good if
> > AMD has similar functionality, someone from their team could take a
> > look so you can come up with an UAPI that works for both.
> >
> > Dmitry Baryshkov tried to ask for the same thing. Assuming I know
> > nothing about the hardware, and the only documentation I have is the
> > KMS UAPI documentation (userland side, not kernel internals), I should
> > be able to write a program from scratch that correctly records and
> > analyses the histogram on every piece of hardware where the kernel
> > driver exposes it. That means explaining exactly what the driver and the
> > hardware will do when I poke that UAPI. =20
>=20
> Hi Pekka,
> Sorry got getting back late on this.
> I totally agree that the UAPI should not be any hardware specific and=20
> have taken care to get rid of such if any.
> Here we are just exposing the histogram data and what point is the=20
> histogram generated is out of the scope.

It's not out of scope. Understanding exactly at what point the
histogram is generated in the KMS pixel pipeline is paramount to being
able to use the results correctly - how it relates to the framebuffers'
contents and KMS pixel pipeline configuration.

As a simple example, if the histogram is recorded before CRTC GAMMA
processing, then changing CRTC GAMMA will not change the histogram. Or,
if the histogram is recorded after CRTC GAMMA processing, then changing
CRTC GAMMA will change the histogram as well, assuming the content
stays the same. This makes a fundamental difference to how the
histogram results should be looked at. Userspace needs to know whether
the differences in the histogram over time are caused by changes in the
content or by changes driven by the userspace itself.

In the CRTC GAMMA example, it's not just whether changing GAMMA
directly changes the histogram. GAMMA also changes the units on the
x-axis of the histogram, are they optical or electrical for instance.
Those units are important, too, because the ideal target histogram has a
very different shape depending on the units.

> I feel the rst documentation as suggested is missing and is creating the=
=20
> gap. Can I go ahead create the rst documentation and then repost the=20
> series and then we can continue the review?

I'm not sure why you are asking? Of course, I guess.


Thanks,
pq

--Sig_/9og.cFFIVezjtsa4lWHoxxI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfFdEoACgkQI1/ltBGq
qqdcxA//YgbOXNOpq5YX8ssE8mfJ4t9ULNbekEc5z4gsrrwir0MVIk7FaF87O/iQ
XmmcNPY7WvPfIZc8YUuXMmQwyCy0vvVnG8hZpRCHIfPXKA8HRIIYfnDPVZtbSLxg
tZTPatIeHxzP+RRXvoDOtjG5m8IAMFiuPZHW9mLdhiQkJPyQR2ocfYT1H/TRaht9
hIqkzTneMp57irrBSOfnzob//HPW5rppQlmb2m/cG7pMupMMqQjaVU6GqVLi7/XE
Byl0xk1e6mgZqMlVfcW/GcUemsxGJZJa4fmEaH+lwjFhKQwav83Qrj5gRO0Wa62j
dVz1hOaiNZKWk/QkzBbSwsGMP8Lr+Tz1NwaQ8/tkeI9MLgmqckWOvsSfvmtOlcY6
L2OsLEsjGoLlUrujfINqLMQmetBsQ4u6TJXU/cESYY2bAl3l6sK5/YaXWhkXIXqj
bNi2eWK2fyBm5iTSJ2Law5T51+BB6ApT2nvuhhQ+bxt9xjPOzwq/AEDSDfD7xnp6
mcNsqZrD7+BOgGOdmKfY1PSInWjwtrgelUAJs5rg1o8EZgpEMhJDkCmoLCbF9LkH
+R3/D1QP2/4ts3irzmgbUcmnQxoUpwh3Ai9TDutmvAMYaAwt41iBotso/Dpzrasm
6kmzpQzGfv5vsa0I7OT4OeFnjOi6GeSqYWoekF7ru56LJIzkbec=
=PZy6
-----END PGP SIGNATURE-----

--Sig_/9og.cFFIVezjtsa4lWHoxxI--
