Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9143C48C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123A46E58E;
	Wed, 27 Oct 2021 08:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71A76E57E;
 Wed, 27 Oct 2021 08:01:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id i26so1358194ljg.7;
 Wed, 27 Oct 2021 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=k+ZBVZMUHUS0QBw1eod8j1Tny9/4WbmtgVORgPSjzLQ=;
 b=HSumfE3LRsCXD0OotIqj3uEMtieOyylBbfvoVoPodR32ybIgNQn8/gZCipZstY76Kw
 7XH+KBiw3b2mjrDuS2d93p39hkoFsCGJ5Cgr6eHrF7/bro5NwtKF32E1BsAhuZM4j509
 Es4zfziAhJU0SifbTCQKiV8tmOV0CBLTd1GPqbm/0Ai1dsoMRki2up9M6mPaDIEwb/fC
 0j3lcF+arIZE5f3taywY7+RKryijM35tYkqQPNhrlcloZ919tmm7kOaJrPrPgITz0wNB
 F3y2CoGGcwh6awJVZEbwU/cwpsoKK0f/rOZNe1AH82SeKKmf5XEUN8NZ+R9bM0WMWtRf
 hQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=k+ZBVZMUHUS0QBw1eod8j1Tny9/4WbmtgVORgPSjzLQ=;
 b=jQgM7PXlioTPi25qsxEhrgcpj/cEjeQPjlMgAZ47YavTYioIqrVeUKMwhI5fx9NOXp
 rzk6AZy5QgzFZ0Dnqg3RW85A4FzXOguojY5r+n96zePE1ZVxLb94WQTVge+7TwMyC+7e
 x4SemV9EJeSLdkuwa7iIBePih/LZg3UxoQbN9IEaKvcjnQmqNV1Z42XL1eiEUUPQnZjn
 oV/hOLURuMpcF2qurmHq9pou0PXo5RihaWh9Pxy2aSuYu5N7IqFc/V+oOStc0mB6kAH+
 QAd+t3w3oSX86uKwCGdNwZzYpON5oyzKdSx7rnGbEGGlsJmt/Q4hY7DdNVyep4ff8hNH
 qsiw==
X-Gm-Message-State: AOAM531TtPoP1t1ItwmeT/N7USxVWwdcsV6CdpJplML+F3xn2gg07L6P
 DGjOH/1lls2bHo5E2MxFuxo=
X-Google-Smtp-Source: ABdhPJyKPVQp9Pc7Sm9i32EQHPSgntasCa2nu9unEdvzZL/sgIq5H3z863K6xsFgPcuSNKSkBMuFMw==
X-Received: by 2002:a05:651c:1784:: with SMTP id
 bn4mr31511351ljb.521.1635321668163; 
 Wed, 27 Oct 2021 01:01:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q7sm1365765lfu.172.2021.10.27.01.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:01:07 -0700 (PDT)
Date: Wed, 27 Oct 2021 11:00:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: "Shankar, Uma" <uma.shankar@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "brian.starkey@arm.com"
 <brian.starkey@arm.com>, "sebastian@sebastianwick.net"
 <sebastian@sebastianwick.net>, "Shashank.Sharma@amd.com"
 <Shashank.Sharma@amd.com>
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211027110057.72db81fa@eldfell>
In-Reply-To: <2df20264-6800-56ec-3ec7-5a319c9c2296@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
 <20211013113046.7ace2dbd@eldfell>
 <8c1d39bf5d034595aafd8937df259547@intel.com>
 <2df20264-6800-56ec-3ec7-5a319c9c2296@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u/k5LVEbp.ig2bsmdJkBhd9";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/u/k5LVEbp.ig2bsmdJkBhd9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Oct 2021 11:36:33 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-10-14 15:44, Shankar, Uma wrote:
> >=20

...

> >>>>> +
> >>>>> +* Plane CTM
> >>>>> +	* This is a Property to program the color transformation matrix. =
=20
> >>>>
> >>>> No mode property here? Is there any hardware with something else=20
> >>>> than a matrix at this point? =20
> >>>
> >>> Not that I am aware of.
> >>> =20
> >>>> Should we assume there will be hardware with something else, and=20
> >>>> have a CSC mode property with only a single enum value defined so fa=
r:
> >>>> "matrix"? Or do we say PLANE_CTM is a matrix and if you have=20
> >>>> something else in hardware, then invent a new property for it? =20
> >>>
> >>> I think this should be good as we have this for crtc with no one comp=
laining.
> >>> There may be hardware with fixed function operation for the CSC but=20
> >>> then its not a matrix and it would be pretty hardware dependent, so=20
> >>> we can leave that from a generic UAPI. =20
> >>
> >> Ok. And if that eventually turns out to be a mistake, it's easy to=20
> >> invent more properties. =20
> >=20
> > I feel that is what would be required. This is just another instance of=
 what we have at crtc level.
> >  =20
>=20
> Would a userspace client ever want to use both CTM and 3D LUT?

The only reason I can think of is to keep the 3D LUT size (number of
taps) small. I suspect that if one can use a matrix to get close, and
then fix the residual with a 3D LUT, the 3D LUT could be significantly
smaller than if you'd need to bake the matrix into the 3D LUT. But this
is just my own suspicion, I haven't looked for references about this
topic.

IOW, it's a question of precision - the same reason as to why you would
want a 1D LUT before and after a 3D LUT.


> We could add a mode property to CTM to allow for a CTM or 3D LUT or
> we could add new properties for 3D LUT support.
>=20
> 3D LUT might come with shaper 1D LUTs that can be programmed in
> conjunction with the 3D LUT. 3D LUTs operating in non-linear
> space require less precision than 3D LUTs operating in linear
> space, hence the 1D LUT can be used to non-linearize the
> pixel data for 3D LUT operation.
>=20
> FWIW, AMD HW (depending on generation) can do these operations
> (in this order):
>=20
> 1) 1D LUT (fixed or PWL programmable)
> 2) simple multiplier (for scaling SDR content to HDR output)
> 3) CTM matrix
> 4) 1D LUT (shaper LUT to non-linearize for more effective 3D LUT transfor=
m)
> 5) 3D LUT
> 6) 1D LUT (for non-linear blending, or to linearize after 3D LUT)
> 7) blending
> 8) CTM matrix
> 9) 1D LUT (shaper LUT like above)
> 10) 3D LUT
> 11) 1D LUT (generally for EOTF^-1 for display EOTF)
>=20
> Not all blocks are available on all (current and future) HW.
>=20
> I sketched a few diagrams that show how these might be used by
> a compositor if we exposed all of these blocks and should
> really try to add some of them to the color-and-hdr docs
> repo.

Yes, please.

That pipeline looks pretty comprehensive.

Btw. how about YUV<->RGB conversion? Where would that matrix go? It
needs to operate on non-linear values, while a color space conversion
matrix needs to operate on linear color values.

> >>>>> +	* This can be used to perform a color space conversion like
> >>>>> +	* BT2020 to BT709 or BT601 etc.
> >>>>> +	* This block is generally kept after the degamma unit so that =20
> >>>>
> >>>> Not "generally". If blocks can change places, then it becomes=20
> >>>> intractable for generic userspace to program. =20
> >>>
> >>> Sure, will drop this wording here. But one open will still remain=20
> >>> for userspace, as to how it gets the pipeline dynamically for a respe=
ctive hardware.
> >>> Currently we have assumed that this would be the logical fixed order=
=20
> >>> of hardware units. =20
> >>
> >> If we cannot model the abstract KMS pipeline as a fixed order of units=
=20
> >> (where each unit may exist or not), we need to take a few steps back=20
> >> here and look at what do we actually want to expose. That is a much=20
> >> bigger design problem which we are currently not even considering. =20
> >=20
> > I think most of the hardware vendor platforms have this pipeline, so we=
 can implement the properties which include all the possible hardware block=
s. If certain units don't exist, the respective properties should not be ex=
posed which will make things easier for userspace. =20
>=20
> I think the color pipeline should be modeled in a way that makes
> sense from a color science standpoint and in a way that makes sense
> for compositor implementations. Fortunately HW design generally
> aligns with these intentions but we should be careful to not
> let HW design dictate KMS interfaces.

I'm so happy to hear that!


Thanks,
pq

--Sig_/u/k5LVEbp.ig2bsmdJkBhd9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmF5BzkACgkQI1/ltBGq
qqcKDA//VwqeDxcZCYyTarwsWG9HWOhQNqyaB7z9pAz1rR5oSc+vf9d56B4WsKYk
B6u88lpuCE8M+zvAKRv90dEHVmAW7Nn6U6lRxb0vA+WOFViNnyhP4gKUYuOJEK6W
7UdJf3u77ErJ2DUsZpQXvZhQhYEwIjowsVr1QSRbUdp+EfD0NmjVg5juJFp7QE65
1N479VaIM+hWKSFLjpHIhlqLUJpwKT3B3LvcVQcYnH3i/hLWIJbZU2yJid9/oMM/
3tmSsnB6DToqdCVk1Wa3c8S3d4FAFDDIVk+W0TShJ0G0VFiHEsYdqnH8CYeCSSKH
EdSfJr/jh/RKTeen3uDF/7KzhQDAGJALMavFDDyq9xi92e2arnOH248theKGKxRT
+lB19EDZgPmnU/CnBfYS9OhAmMuhSubCm1Hiuf49leoGyg/h3tL8b4H0KDfdqGIV
gJPww7Rl5vf7aM1dkikYZr7IfjFzkhjk1WoCJ40e/vu2spUD25nflWgxYcSMY8PV
Na+ctl96ZtN05g/w7otH6ulWgjy4ONUp0glNeDoaPmSFP11AYBxPc7sL/rOafACG
N19URSsF8SX/ZOofTFC6hdGdj+4ZMpZWOtq10VqrlgvCJf+AJH5d6UxwOSZRu3l3
PAVSAV1ptp5gRn99MicPyx3gXZtXMP0A4TlsAkqsgNgzWI2OYsI=
=WDPj
-----END PGP SIGNATURE-----

--Sig_/u/k5LVEbp.ig2bsmdJkBhd9--
