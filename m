Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E644D319
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 09:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBDD89D7F;
	Thu, 11 Nov 2021 08:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758E589D7F;
 Thu, 11 Nov 2021 08:22:49 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z34so12349178lfu.8;
 Thu, 11 Nov 2021 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=CvCtBEOsCEYRkd4r2T42uO/oG7cd0wzbFe9FB0+5o90=;
 b=TEd2rHr4aia/0s3pVq0t1j6NsRBgf+AzHRkSpfGWP5Hzpz6YyP/e5rNuzmMeCDZmZN
 YxdPkMMLwsNO7ZlC7Pd0RF9UMcfS/oN+buwAAKFQPLqxOlaiNvmNu6xJIsijGciFaU8S
 3MJUMAWkS6sMfM9Y6krAhh6L47eeis+qSj8KbrwIoW/FINxqW0CPY8tDLwIQzhAKyUgg
 LZi2HnWno+hm16hRf61wYyBdmPALOBOZRQUCKgyal8THzzEwZo5OetZcyhZJRuBQnLPa
 PnBBJSRwSlQpcxXUora92Ag7xg5cs/W/AEBM8ENPkbJfO9XrASjpoiLy5SzfwwoquyIw
 +UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=CvCtBEOsCEYRkd4r2T42uO/oG7cd0wzbFe9FB0+5o90=;
 b=qKuDc0vx8DdApL3Bhwf/jBJvKk9llzgJ67u0A8fvM8Z/qDfavFqndX+FrET7cBiryS
 FSwKbwQ8f3zGFWqB+iwqZxLWlaQZDDgBgKEFhekhq/2gf5QBbbZIVSiX/bqOr2yPrhdd
 HUSYE/pMSYAyvM+GKOMZLMTQi350dxhvfoJko1vfLn0Mz4p2myPr7kNzNRFNnO2apSDl
 hqR2TmsFGFz+37UoKl1xGkXpwthnSRaCO4e39uNV5gzKqBKIhydi5s604Pi9uMZh/wPd
 sl6vGz0h5bDIJHtwppIuhlfxNZLhTtyWmLhZ6KFwX4kNLwD9Z+AdORR5+YhIgwccHxpu
 MSDw==
X-Gm-Message-State: AOAM531cPsozbpMoyQ0UHSq0kkUOcX0SVK47GeP8CpYMjO+FpEepf96N
 gALv/tHV/9bs9fLbozgPHAw=
X-Google-Smtp-Source: ABdhPJwMrW/oS6Odx8L43MghXsK31e5vJCTj3kzSQtcC4CHNYgjV6j3+A+pwrgC4LtXz/2MQvDV5aw==
X-Received: by 2002:a19:ca44:: with SMTP id h4mr5041072lfj.493.1636618967633; 
 Thu, 11 Nov 2021 00:22:47 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t15sm221007lfp.181.2021.11.11.00.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:22:47 -0800 (PST)
Date: Thu, 11 Nov 2021 10:22:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <20211111102237.22e8725c@eldfell>
In-Reply-To: <c94046bc-a083-278a-c9ec-738716da889d@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
 <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
 <YYrv6Mlp0K+9pZ+A@intel.com> <20211110104924.08c3b744@eldfell>
 <YYuzGhHZiMQ79h8l@intel.com>
 <c94046bc-a083-278a-c9ec-738716da889d@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pnwx+Ox5_Jdonpj4iMJ9qNw";
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Pnwx+Ox5_Jdonpj4iMJ9qNw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Nov 2021 10:17:59 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-11-10 06:55, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Wed, Nov 10, 2021 at 10:49:24AM +0200, Pekka Paalanen wrote: =20
> >> On Wed, 10 Nov 2021 00:02:16 +0200
> >> Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >> =20
> >>> On Tue, Nov 09, 2021 at 03:47:58PM -0500, Harry Wentland wrote: =20
> >>>> On 2021-11-08 04:54, Pekka Paalanen wrote:   =20
> >>>>> On Thu, 4 Nov 2021 12:27:56 -0400
> >>>>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>>>    =20
> >>>>>> On 2021-11-04 04:38, Pekka Paalanen wrote:   =20
> >>>>>>> On Wed, 3 Nov 2021 11:08:13 -0400
> >>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>>>>>      =20
> >>>>>>>> On 2021-09-06 17:38, Uma Shankar wrote:     =20
> >>>>>>>>> Existing LUT precision structure is having only 16 bit
> >>>>>>>>> precision. This is not enough for upcoming enhanced hardwares
> >>>>>>>>> and advance usecases like HDR processing. Hence added a new
> >>>>>>>>> structure with 32 bit precision values.
> >>>>>>>>>
> >>>>>>>>> This also defines a new structure to define color lut ranges,
> >>>>>>>>> along with related macro definitions and enums. This will help
> >>>>>>>>> describe multi segmented lut ranges in the hardware.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >>>>>>>>> ---
> >>>>>>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++=
++++++++
> >>>>>>>>>  1 file changed, 58 insertions(+) =20
> >>
> >> ...
> >> =20
> >>>>>> If the framebuffer is not in FP16 the question then becomes how
> >>>>>> the integer pixel values relate to LUT addressing.   =20
> >>>>>
> >>>>> Traditionally, and in any API I've seen (GL, Vulkan), a usual mappi=
ng
> >>>>> is to match minimum unsigned integer value to 0.0, and unsigned max=
imum
> >>>>> integer value to 1.0. This is how things work on the cable too, rig=
ht?
> >>>>> (Also taking full vs. limited range video signal into account. And
> >>>>> conversion to cable-YUV if that happens.)
> >>>>>
> >>>>> If you want integer format FB values to map to something else, then=
 you
> >>>>> have to tag the FB with that range information, somehow. New UAPI.
> >>>>>    =20
> >>>>
> >>>> On the cable we send integer values, not floating point. AMD HW uses
> >>>> floating point internally, though, and the PWL API defines floating
> >>>> point entries, so on some level we need to be clear what the floating
> >>>> point entries mean. Either we document that to be [0.0, 1.0] or we
> >>>> have some UAPI to define it. I'm leaning toward the latter but have
> >>>> to think about it some more.   =20
> >>>
> >>> As for Intel hw if you have an integer pixel value of 0xff... (with
> >>> however many bits you have with a specific pixel format) it will get
> >>> extended to 0.fff... (to whatever precision the pipe has internally).
> >>> So if we go by that a fixed point 1.0 value in the proposed
> >>> drm_color_lut_range would be considered just outside the gamut. And
> >>> pretty sure fp16 input of 1.0 should also result in a 0.fff... intern=
al
> >>> value as well [1]. I think that definition pretty much matches how GL
> >>> UNORM<->float conversion works as well. =20
> >>
> >> Does it work that way in GL though?
> >>
> >> I've always thought that with GL_UNSIGNED_BYTE, 0xff maps to 1.0, not
> >> 255.0/256.0.

...

> >=20
> > That seems to match what I said, or at least tried to say (~0 <-> 1.0 in
> > float). drm_color_lut_range being fixed point would follow the ~0 side =
of
> > that. Or at least that interpretation would very easily map to our hw.
> >  =20
>=20
> If I understand you right Intel HW represents 0xff (assuming 8 bpc) as
> the largest (representable) float that is less than 1.0. That float would
> be bigger than 255.0/256.0 but smaller than 256.0/256.0.

I was just really confused and re-reading what Ville wrote originally
now makes sense to me.

So, not what Harry wrote. Let me attempt to reiterate and mark fixed
point hex values with a h to discriminate from float values.

With 8-bit:
0x00 -> 0.000000..0h =3D 0.0 float
0xff -> 0.ffffff..fh =3D 1.0 float

Then 1.000..0h is the first value out of range.


Thanks,
pq

--Sig_/Pnwx+Ox5_Jdonpj4iMJ9qNw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGM0s0ACgkQI1/ltBGq
qqeaGRAAhRImLKq35mtkl17W812Ckg3BXYaBU6vcFT/1fo9pbSTzHgoTUYc4nqSa
FsGCB5crNiokXhHxnXQKZ66w1JiEXPyjzL8q95O+U+5guMKpHgxb0O08zdyMuszX
jyEOiUu681MUxBHChKTJQQopi7IaowfVWay10hj+YCsZKAJEawP//mHtRSmjy5t+
QmYqYomDsf6w2CNOqxY5vLEAdnmGhgz37D9Ydk0SXiamXlc8a2cs3PMGec3g0477
4ldyuuo3zz8B+5hTLEmHpyk1lBb5ewaftG59nZ7Ny4Z5imbHVDrPelNtFbo8AGqA
6v/uKmEHLEsnEBfjUaZ8QEldakuk88Td4s2K5LWFknVi5lV3q07MXo1AFU4LrbBe
3XNHsGiNlc3yoSfEPaNCRAy2eXeHi7Xk4JyeEG0GLrRcoWCAYydWlsBXcI4K9zDM
idhwtLUUZj3VByH/f2e2/MWEWoIb4ZrOtNfNyTjS4x8JX8nt7IRL/hCvgOqJqwbv
eD89jfi5zrLuVfXehxC1bBWO6dN91PPtmbWYkLwebrnz0yvfDpvwUnUHJC9heFX0
O6sq+wNRQCHZHT3lMHRG48iOEmYnOVbVy156zseuY8uXH9sbkdR0mOFDrGKcMdb/
48W3hl7Z4LBg1R5+zHZZWWa0uxK9zt8AuVhqank9HWT13xyxZzA=
=WYLe
-----END PGP SIGNATURE-----

--Sig_/Pnwx+Ox5_Jdonpj4iMJ9qNw--
