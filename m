Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E473295D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077110E5C4;
	Fri, 16 Jun 2023 07:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79A10E052;
 Fri, 16 Jun 2023 07:59:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so464701e87.0; 
 Fri, 16 Jun 2023 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686902373; x=1689494373;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/NbTNi3p50Jqj44KQpypXTfod2ZdmBLU/lTATgUJbUM=;
 b=QDKIllHUz+pntPVZHJ9l6PAeUKk60Goln/DQrejhs+e+Nm4s8Krh7lMruqxouia4Sw
 ZHxGd60eLHfMSgOYgHkOXjYf5eapvoRG2uz+VLorU/+nQdC8Lv7nMBsGZwzbmce6BAxp
 ZOQOMlZwvUujh7lcvGpbKJCQT2CIrFDGC5BztdV5287XZG8Drkw2TOq+W/VFCLbybruU
 YGVX1So+meDd4nX3+0YHDh3LO2yjEtp8pYLCQqPl5OSQef5g7lOF7uzwqFBBPmvu8rv8
 mri3O/mqiSkkzYAkdWJNPUY4oYWiqOqlYnVfLF/hfo93PBnYB4gGYoecx1FOPfvsCA7p
 cC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686902373; x=1689494373;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/NbTNi3p50Jqj44KQpypXTfod2ZdmBLU/lTATgUJbUM=;
 b=dNHXGwBjuTMGl1/aZSLwcNqmG+vZ7QEQuUZJbh92Rwj75ejVY0mDPTOAnC48w6ioPn
 bc4qQqjQ5VsCSxuYi46OjE3dsURyCnHoRHgpoyr1HNR3JeHXYXxQGEeNEFaxrMM1i1gm
 JZdMcwuC+WqLqShLwJcChjc3l6wocWXOj+7ExlH7GllCBRgIFjtELmeFJtltMRMDpmVA
 VPE1fLMyz89J9hySv3ikedXZkZFIn/lFKbUy9Ps59FLJSNoI/TLqxT1QMTYdE/7dzpvs
 5HnioZ1Va1JdQqpO3uHDjOXbb/8PlhMBS7ObcJqnoEzFXduOCJXKS77iwKx9oZGBN572
 dh6Q==
X-Gm-Message-State: AC+VfDypEFvc8Bz3wC96GBm7sWuUmIEyeQ6O5AXgN22qK3OkKHMvt5vt
 64yo7PqIkNk+L57LczBrSHM=
X-Google-Smtp-Source: ACHHUZ4G3lIJmIb6y1qZlOzYIUzJSSnq0fnn8s5HyOfm6aEbEnhLYluecGriws39Z9V1SP/INOC+5w==
X-Received: by 2002:a19:8c0d:0:b0:4f8:5696:6bbc with SMTP id
 o13-20020a198c0d000000b004f856966bbcmr539163lfd.29.1686902372822; 
 Fri, 16 Jun 2023 00:59:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f16-20020ac25330000000b004f84226f0bfsm654329lfh.26.2023.06.16.00.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 00:59:32 -0700 (PDT)
Date: Fri, 16 Jun 2023 10:59:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christopher Braga <quic_cbraga@quicinc.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230616105928.1e5013ab@eldfell>
In-Reply-To: <baa70725-89ba-2e92-c5ce-7619fbea26d2@quicinc.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
 <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
 <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
 <20230612122135.40505458@eldfell>
 <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
 <20230613112312.755ef58f@eldfell>
 <d132c9e0-d3e2-77e5-bcd6-1aef657b935f@quicinc.com>
 <20230614120006.03284f7e@eldfell>
 <baa70725-89ba-2e92-c5ce-7619fbea26d2@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hXI2x1MyIGUNJokMCvOQfyN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hXI2x1MyIGUNJokMCvOQfyN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Jun 2023 17:44:33 -0400
Christopher Braga <quic_cbraga@quicinc.com> wrote:

> On 6/14/2023 5:00 AM, Pekka Paalanen wrote:
> > On Tue, 13 Jun 2023 12:29:55 -0400
> > Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >  =20
> >> On 6/13/2023 4:23 AM, Pekka Paalanen wrote: =20
> >>> On Mon, 12 Jun 2023 12:56:57 -0400
> >>> Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >>>     =20
> >>>> On 6/12/2023 5:21 AM, Pekka Paalanen wrote: =20
> >>>>> On Fri, 9 Jun 2023 19:11:25 -0400
> >>>>> Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >>>>>        =20
> >>>>>> On 6/9/2023 12:30 PM, Simon Ser wrote: =20
> >>>>>>> Hi Christopher,
> >>>>>>>
> >>>>>>> On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbrag=
a@quicinc.com> wrote:
> >>>>>>>           =20
> >>>>>>>>> The new COLOROP objects also expose a number of KMS properties.=
 Each has a
> >>>>>>>>> type, a reference to the next COLOROP object in the linked list=
, and other
> >>>>>>>>> type-specific properties. Here is an example for a 1D LUT opera=
tion:
> >>>>>>>>>
> >>>>>>>>>          Color operation 42
> >>>>>>>>>          =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D=
 1D curve
> >>>>>>>>>          =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, P=
Q, BT.709, HLG, =E2=80=A6} =3D LUT =20
> >>>>>>>> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
> >>>>>>>> curves? Will different hardware be allowed to expose a subset of=
 these
> >>>>>>>> enum values? =20
> >>>>>>>
> >>>>>>> Yes. Only hardcoded LUTs supported by the HW are exposed as enum =
entries.
> >>>>>>>           =20
> >>>>>>>>>          =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >>>>>>>>>          =E2=94=9C=E2=94=80 "lut_data": blob
> >>>>>>>>>          =E2=94=94=E2=94=80 "next": immutable color operation I=
D =3D 43
> >>>>>>>>>          =20
> >>>>>>>> Some hardware has per channel 1D LUT values, while others use th=
e same
> >>>>>>>> LUT for all channels.  We will definitely need to expose this in=
 the
> >>>>>>>> UAPI in some form. =20
> >>>>>>>
> >>>>>>> Hm, I was assuming per-channel 1D LUTs here, just like the existi=
ng GAMMA_LUT/
> >>>>>>> DEGAMMA_LUT properties work. If some hardware can't support that,=
 it'll need
> >>>>>>> to get exposed as another color operation block.
> >>>>>>>           =20
> >>>>>>>>> To configure this hardware block, user-space can fill a KMS blo=
b with
> >>>>>>>>> 4096 u32
> >>>>>>>>> entries, then set "lut_data" to the blob ID. Other color operat=
ion types
> >>>>>>>>> might
> >>>>>>>>> have different properties.
> >>>>>>>>>          =20
> >>>>>>>> The bit-depth of the LUT is an important piece of information we=
 should
> >>>>>>>> include by default. Are we assuming that the DRM driver will alw=
ays
> >>>>>>>> reduce the input values to the resolution supported by the pipel=
ine?
> >>>>>>>> This could result in differences between the hardware behavior
> >>>>>>>> and the shader behavior.
> >>>>>>>>
> >>>>>>>> Additionally, some pipelines are floating point while others are=
 fixed.
> >>>>>>>> How would user space know if it needs to pack 32 bit integer val=
ues vs
> >>>>>>>> 32 bit float values? =20
> >>>>>>>
> >>>>>>> Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These=
 use a common
> >>>>>>> definition of LUT blob (u16 elements) and it's up to the driver t=
o convert.
> >>>>>>>
> >>>>>>> Using a very precise format for the uAPI has the nice property of=
 making the
> >>>>>>> uAPI much simpler to use. User-space sends high precision data an=
d it's up to
> >>>>>>> drivers to map that to whatever the hardware accepts.
> >>>>>>>          =20
> >>>>>> Conversion from a larger uint type to a smaller type sounds low ef=
fort,
> >>>>>> however if a block works in a floating point space things are goin=
g to
> >>>>>> get messy really quickly. If the block operates in FP16 space and =
the
> >>>>>> interface is 16 bits we are good, but going from 32 bits to FP16 (=
such
> >>>>>> as in the matrix case or 3DLUT) is less than ideal. =20
> >>>>>
> >>>>> Hi Christopher,
> >>>>>
> >>>>> are you thinking of precision loss, or the overhead of conversion?
> >>>>>
> >>>>> Conversion from N-bit fixed point to N-bit floating-point is genera=
lly
> >>>>> lossy, too, and the other direction as well.
> >>>>>
> >>>>> What exactly would be messy?
> >>>>>        =20
> >>>> Overheard of conversion is the primary concern here. Having to extra=
ct
> >>>> and / or calculate the significand + exponent components in the kern=
el
> >>>> is burdensome and imo a task better suited for user space. This also=
 has
> >>>> to be done every blob set, meaning that if user space is re-using
> >>>> pre-calculated blobs we would be repeating the same conversion
> >>>> operations in kernel space unnecessarily. =20
> >>>
> >>> What is burdensome in that calculation? I don't think you would need =
to
> >>> use any actual floating-point instructions. Logarithm for finding the
> >>> exponent is about finding the highest bit set in an integer and
> >>> everything is conveniently expressed in base-2. Finding significand is
> >>> just masking the integer based on the exponent.
> >>>     =20
> >> Oh it definitely can be done, but I think this is just a difference of
> >> opinion at this point. At the end of the day we will do it if we have
> >> to, but it is just more optimal if a more agreeable common type is use=
d.
> >> =20
> >>> Can you not cache the converted data, keyed by the DRM blob unique
> >>> identity vs. the KMS property it is attached to? =20
> >> If the userspace compositor has N common transforms (ex: standard P3 ->
> >> sRGB matrix), they would likely have N unique blobs. Obviously from the
> >> kernel end we wouldn't want to cache the transform of every blob passed
> >> down through the UAPI. =20
> >=20
> > Hi Christoper,
> >=20
> > as long as the blob exists, why not? =20
>=20
> Generally because this is an unbounded amount of blobs. I'm not 100%=20
> sure what the typical behavior is upstream, but in our driver we have=20
> scenarios where we can have per-frame blob updates (unique per-frame blob=
s).

All kernel allocated blob-related data should be accounted to the
userspace process. I don't think that happens today, but I think it
definitely should. Userspace can create a practically unlimited number
of arbitrary sized blobs to begin with, consuming arbitrary amounts of
kernel memory at will, even without drivers caching any derived data.

It does not seem to me like refusing to cache derived blob data would
really help.

> Speaking of per-frame blob updates, there is one concern I neglected to=20
> bring up. Internally we have seen scenarios where frequent blob=20
> allocation can lead to memory allocation delays of two frames or higher.=
=20
> This typically was seen when the system is under high memory usage and=20
> the blob allocation is > 1 page. The patch=20
> https://patchwork.freedesktop.org/patch/525857/ was uploaded a few=20
> months back to help mitigate these delays, but it didn't gain traction=20
> at the time.

That is worrying.

As a userspace developer, I like the idea of limiting blob allocation
to DRM master only, but if the concern is the DRM master leaking, then
I'd imagine process accounting could at least point to the culprit.

Trying to defend against a malicious DRM master is in my opinion a
little moot. Untrusted processes should not be able to gain DRM master
to begin with.

Hmm, but DRM leasing...

> This color pipeline UAPI is ultimately going to have the same problem.=20
> Frequent 3DLUT color block updates will result in large allocations, and=
=20
> if there is high system memory usage this could see blob allocation=20
> delays. So two things here:
> - Let's reconsider https://patchwork.freedesktop.org/patch/525857/ so=20
> frequent blob allocation doesn't get unnecessarily delayed
> - Do we have any alternative methods at our disposal for sending down=20
> the color configuration data? Generally blobs work fine for low update=20
> or blob cycling use cases, but frequent blob data updates results in a=20
> total per frame IOCTL sequence of:
>    (IOCTL_BLOB_DESTROY * #_of_blob_updates) +	=09
>      (IOCTL_BLOB_CREATE * #_of_blob_updates) + IOCTL_DRM_ATOMIC

Good questions.

I have no ideas for that, but I got a random idea to mitigate the blob
conversion overhead:

What if we had a new kind of blob that is targeted to a specific
property of a specific KMS object at creation?

Then the driver could do the conversion work at create ioctl time, and
store only the derived data and not the original userspace data at all.
Then there are no unexpected delays due to allocation or conversion at
atomic commit time, and the memory cost is optimal for the specific
usage.

The disadvantage is that the blob is then tied to the specific property
of the specific KMS object, and cannot be used anywhere else. I'm not
sure how much of a problem that would be in practice for userspace
having to create maybe even more blobs per-plane or per-crtc, or a
problem for drivers that have a flexible mapping between KMS objects
and hardware blocks.


Thanks
pq

--Sig_/hXI2x1MyIGUNJokMCvOQfyN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSMFmAACgkQI1/ltBGq
qqdoNRAAjRG9T5x3VN9AQjxlUBZ4Mvj/kjGE/p4lFNPyQyOkh4wUj9leRioDUzCs
112VC9yJgk8t+sFA4+vMUKbudyptG0jyPCgDuM3cPriYq8iZgTthAc7ngX8mJiOg
+JOjB5knrpJdOm63Sx606gHfls2eiPc0MRx7+sdGPRR4nGn6muSoYYzhRZ1CZKEi
hUF90oLH7j9hJqhvmWZWe7zDizAFlJuPImxbQAMW6/H3/pQ6xy8AxpLpZB0stazD
bcrC4WvlSy5390ESumXaepZB4ot50mzVETnb2SUy+BIw+GleRb+HnLu9SeB0YAtH
J6uDdix9DtkErogvZSx1LZ7cta7zauImq32hxdz/4GfV+XRFzBqpWvsvbqLX4X0g
/eadZBM91FrJ2C6DRPvwyytvOO+k5PvzFJjq2WRebH6PXopwLdgELokwy00mPC3d
KM0i5HHMSxaZIPBQwAV0g60R06sEJGZ5FLc/MzKLbgC6P9czblX68n06qXR+1jli
CKcGAK+BYg8vpcW7hOhAyVFm2S3fQlfOvZIx/ne90BkxfJ8izKJFP3vQJOHk+r1a
+PITd+riCiCoA48nEsNf+i3Jwqvvf7lBXyJQBaS+xmmflGwjUD1JnOZdBrlg1nFU
J1BHKWcQdlV+2PTZIqSM5uzdW+5fzBmFOtDT11wAl86er8LWDPE=
=GjFu
-----END PGP SIGNATURE-----

--Sig_/hXI2x1MyIGUNJokMCvOQfyN--
