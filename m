Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F14A3DF47
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DC210E9A4;
	Thu, 20 Feb 2025 15:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="MG9s4xAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A4410E191;
 Thu, 20 Feb 2025 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7sjjd4KuVh7sQswGRTVV8u5TUIDseOf5972SJMocmes=; b=MG9s4xAiDNsCNTakyTIBQ7wL8O
 fci6bqOnmm+Oeo2omLVzYuzrBhMqWsgyqFH753mu6HuoGCr6KR3eKLaigywQIM3i8uw35J73ddwH9
 BR7Qti//kn4i35hGWpFHkXFLfvfyhe+H3/5xvGdPz1q8Ljclcaum81l8s/i/wuvO9yKfxTY5D7S+1
 3fG/x7ZOS40NcvOkVKrMLx5a2Xh/9kC/mduVsZgUODwvA6+TdxgIMxwMGPKyVOr0irqUJ7RUswqn6
 cwLaUP+2V5wq+OuyIK2Vx/p09dVvhOhfE3s2By7MC0CNskJy0yd17Zbd6njDkof5WzZB9/PcfFp9n
 MeNmlldQ==;
Received: from [194.136.85.206] (port=52826 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tl8pD-0003Iy-28;
 Thu, 20 Feb 2025 17:50:55 +0200
Date: Thu, 20 Feb 2025 17:50:47 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <20250220175047.412ee8d4@eldfell>
In-Reply-To: <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FHtMHN9K_t5TFIWRa/qNN2j";
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

--Sig_/FHtMHN9K_t5TFIWRa/qNN2j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Feb 2025 09:28:51 +0530
"Murthy, Arun R" <arun.r.murthy@intel.com> wrote:

> On 18-02-2025 21:48, Pekka Paalanen wrote:
> > On Tue, 18 Feb 2025 11:13:39 +0530
> > "Murthy, Arun R"<arun.r.murthy@intel.com> wrote:
> > =20
> >> On 17-02-2025 15:38, Pekka Paalanen wrote: =20
> >>> Hi Arun,
> >>>
> >>> this whole series seems to be missing all the UAPI docs for the DRM
> >>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> >>> replacement for them, I would assume both are a requirement.
> >>>
> >>> Without the ReST docs it is really difficult to see how this new UAPI
> >>> should be used. =20
> >> Hi Pekka,
> >> I also realized later on this. Will add this in my next patchset. =20
> >>> On Tue, 28 Jan 2025 21:21:07 +0530
> >>> Arun R Murthy<arun.r.murthy@intel.com> wrote:
> >>>    =20
> >>>> Display Histogram is an array of bins and can be generated in many w=
ays
> >>>> referred to as modes.
> >>>> Ex: HSV max(RGB), Wighted RGB etc.
> >>>>
> >>>> Understanding the histogram data format(Ex: HSV max(RGB))
> >>>> Histogram is just the pixel count.
> >>>> For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> >>>> 25 bits should be sufficient to represent this along with a buffer o=
f 7
> >>>> bits(future use) u32 is being considered.
> >>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant=
 5
> >>>> bits, hence 32 bins.
> >>>> Below mentioned algorithm illustrates the histogram generation in
> >>>> hardware.
> >>>>
> >>>> hist[32] =3D {0};
> >>>> for (i =3D 0; i < resolution; i++) {
> >>>> 	bin =3D max(RGB[i]);
> >>>> 	bin =3D bin >> 3;	/* consider the most significant bits */
> >>>> 	hist[bin]++;
> >>>> }
> >>>> If the entire image is Red color then max(255,0,0) is 255 so the pix=
el
> >>>> count of each pixels will be placed in the last bin. Hence except
> >>>> hist[31] all other bins will have a value zero.
> >>>> Generated histogram in this case would be hist[32] =3D {0,0,....4423=
6800}
> >>>>
> >>>> Description of the structures, properties defined are documented in =
the
> >>>> header file include/uapi/drm/drm_mode.h
> >>>>
> >>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
> >>>>
> >>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
> >>>> ---
> >>>>    include/uapi/drm/drm_mode.h | 65 ++++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>    1 file changed, 65 insertions(+)
> >>>>
> >>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode=
.h
> >>>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a=
9c61b20ac6cbf5df69e9 100644
> >>>> --- a/include/uapi/drm/drm_mode.h
> >>>> +++ b/include/uapi/drm/drm_mode.h
> >>>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
> >>>>    	__u32 pad;
> >>>>    };
> >>>>   =20
> >>>> +/**
> >>>> + * enum drm_mode_histogram
> >>>> + *
> >>>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
> >>>> + * Maximum resolution at present 10k, 10240x4320 =3D 44236800
> >>>> + * can be denoted in 25bits. With an additional 7 bits in buffer ea=
ch bin
> >>>> + * can be a u32 value.
> >>>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins. =20
> >>> I assume s/SDL/SDR/. =20
> >> Yes, sorry TYPO =20
> >>> This assumption seems false. SDR can be also 10-bit and probably even
> >>> more. =20
> >> Yes but in practice majority of them being 8-bit. So have considered
> >> 8-bit for illustration purpose only.
> >> The design itself should accommodate 10-bit as well. =20
> > Hi Arun,
> >
> > if these are just examples, then there is no need to mention SDR or
> > HDR. You can say that if "thing" is 8-bit, then there are 256 possible
> > values, and we could have 256 bins or we could have just 32 bins.
> >
> > But what is "thing"? Let's see below. =20
> Sure will remove these over here and add then in the ReST document.
> >>>> + * If the most significant 5 bits are considered, then bins =3D 2^5
> >>>> + * will be 32 bins.
> >>>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins. =
=20
> >>> Does this mean that the histogram is computed on the pixel values
> >>> emitted to the cable? What if the cable format is YUV? =20
> >> Yes, again the illustration over here is max(RGB) used for histogram
> >> generation.
> >> If YUV is used or weighted RGB is used for histogram generation then t=
he
> >> mode will have to change and accordingly the data for that mode. =20
> > Do you mean that the HDMI or DisplayPort signalling mode (YUV vs. RGB?
> > sub-sampling? bit-depth?) affects which histogram modes can be used? =20
> No this is actually for user as to how to interpret the histogram data=20
> that is being sent from the KMD. UMD reads this histogram so in order to=
=20
> understand the format of this data he needs to know the histogram mode.
> > Currently userspace cannot know or control the signalling mode. How
> > would userspace know which histogram modes are possible? =20
> As part of drm_histogram_caps struct under HISTOGRAM_CAPS property KMD=20
> will expose all of the supported histogram modes to the user. User will=20
> then choose one among the supported modes by drm_histogram_config=20
> struct(HISTOGRAM_ENABLE property)
> > You should also define at which point of the pixel pipeline the
> > histogram is recorded. Is it before, say, CRTC DEGAMMA processing? Is
> > it after signal encoding to the 6/8/10/12/14/16-bit RGB or YUV format?
> > Before or after YUV sub-sampling? Limited or full range? =20
> This again is the hardware design. Theoretically this histogram hardware=
=20
> will be at the end of the hardware pipe, i.e after hardware/software=20
> composition is done.

Hi Arun,

sure, it may be by hardware design, but the UAPI must specify or
communicate exactly what it is. This seems to be the recurring theme in
all the remaining comments, so I trimmed them away.

A generic UAPI is mandatory, because that's KMS policy AFAIU. A generic
UAPI cannot key anything off of the hardware revision. Instead,
everything must be specified and communicated explicitly. It's good if
AMD has similar functionality, someone from their team could take a
look so you can come up with an UAPI that works for both.

Dmitry Baryshkov tried to ask for the same thing. Assuming I know
nothing about the hardware, and the only documentation I have is the
KMS UAPI documentation (userland side, not kernel internals), I should
be able to write a program from scratch that correctly records and
analyses the histogram on every piece of hardware where the kernel
driver exposes it. That means explaining exactly what the driver and the
hardware will do when I poke that UAPI.


Thanks,
pq

--Sig_/FHtMHN9K_t5TFIWRa/qNN2j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAme3T1cACgkQI1/ltBGq
qqc76g//SLDgRAgDtK0SBEzCcwd4IS8/VqktMCoaohEIthfdt6wSgdoSYI/R2aTr
0AFkqReFhpsodIgyvpjGNFXWOLFKRJp8VV0sy67nPmTr/z9EnnXbQ7wwFKBBS9Rf
+YNm1eqF0Kaw8h/T+mEPyBRMMGcDTsUhodhY0EtUqSROIccxeFSv3DHkDv7aW9ne
yamWmSW5pMbHuxE7ZsgOsl5CyHmoaCVGle7rs1fOWThtqmt7djKwxHCsHMujwxTC
49+WDDAl6tvmfEPWYbpZOWdVstoy22P7siSElk/aSbiUKUBgmYAxvmLQNOcQse5h
gAdJZ3keaWn2PGv6ejmgt5kX8Aw6JYSO4mSV1pWo4UeZeFQXhBihzKSqo8ALpyIF
55YIeu/JnljIZiSrQu9AkYZHB0wEU5FJ1EpFhW5+6KFHlXVbVR4cs4QASW+2D1dx
oC3MZPUjcIrzcEygWZMq1NFi5bV6HIYPddjROWzyJnq1a1jiZyPEVGWonnsieHwR
rvmT1u6UyWzb35bO4mgjdQEEbkCqoTBEjLt08MgV/WfswMlrG6mfevjOJQpx3cSr
eHZ98Di/y3WpM2jBw0AG5YDIU21H45/vF+av/jdZDqD0sNseavVAZcqdx+dvI2ug
MK1w7CDabhx9LPJDYMF+OJTskQptqshfwL8VyoTBuVyv05gw6xs=
=LMv+
-----END PGP SIGNATURE-----

--Sig_/FHtMHN9K_t5TFIWRa/qNN2j--
