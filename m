Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC995112BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134EE10EE8C;
	Wed, 27 Apr 2022 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3369410EE8E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:43:07 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y19so1533838ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=QHvsXNhIFddzpM/Dqc1XTmfwoRNiRNrjNY+wTZeSQ+k=;
 b=ZUeACo7unkKoUU62uRsgnU6jsT6V33FIT/8khFrhUIRKo1OBTNwErnR5xNTDaalSwR
 InNEC5nMkMA0tkhnvjFT7b05WYOFot38dA3eqG9yzs685cA43YoeLzAS00jBkriIHQQ9
 r0R0liRGhw80hSkYvMOLSvZ2FWTc9UyXfUJvVEnIxgHLixMQ/OnKmZ3rMnCDFo1y9Z/I
 zhnxFLJ+Jz6VQQ7amqG91ReupinsaYvCYnNkEJbPdlm96v5YEaCEfxJHLYlPeXolDryy
 fDk2SDaBOkiyQnTPkwVxHfgpo+1ej6Eat7cN5NmpRoti6t290VXBE5mHhmjH2gIHLHFR
 1V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=QHvsXNhIFddzpM/Dqc1XTmfwoRNiRNrjNY+wTZeSQ+k=;
 b=sMtWeFhG0TNh+j/xWo237i38Mp5lRPFFmLjIa1CUluUKcjhxtmOgujNGpcdmZtu81p
 D2s5lgZJkEzJc2XWlWtZ304UugnYQ2sdngUoFxuYcMWEQ9LGHKtweWO7K5TVlk8gAD1E
 P6FCmKwt+6Gr17gbB4Vhg6kglsJ5cUPQrHKmb8kdShBxHiO8nLQQiIS3uOQ8YBLhDtvI
 FpvzUFAv7ECe2NwuiTcGdVhnaoGIMPmjlRcfR7HO8mJcyeIXjNY2oLuxh/56cb7h49wm
 NI81lyC+v6lp1A/geXOx9EKL+gBhrMUgGisPcHWKWN4WW42j2o/m6XhfR1QEMvrqQtU1
 IzEA==
X-Gm-Message-State: AOAM532MUhJ8aLQaXSucIqiPcJgFbECFV8uZPgDtDWS/rR4DAiZmxY6G
 RdK3Lat0QPs7iTGfQOFOlVs=
X-Google-Smtp-Source: ABdhPJxNDIkXnf0hnpxvhwGPWDXYMypokB8529rOxUI9SOFiPpNp0gvRcBGzkaLthfHh9D/J0Mt9QQ==
X-Received: by 2002:a2e:8942:0:b0:24b:405d:ce6d with SMTP id
 b2-20020a2e8942000000b0024b405dce6dmr16990716ljk.270.1651045385227; 
 Wed, 27 Apr 2022 00:43:05 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j7-20020a196e07000000b004720dd5fd54sm751963lfc.170.2022.04.27.00.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:43:04 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:43:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220427104302.3082584b@eldfell>
In-Reply-To: <4313DC33-E81A-4972-90AD-7B9DD42145B8@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
 <20220425111026.485cba66@eldfell>
 <caa885ed-208a-3810-bd3e-e497e2c9ba93@gmail.com>
 <5c2a80f5-5107-4fab-4df9-b0be633fd576@gmail.com>
 <4313DC33-E81A-4972-90AD-7B9DD42145B8@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rq.UKVm=pEeIayRlj0Tn80+";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Rq.UKVm=pEeIayRlj0Tn80+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Apr 2022 22:22:22 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> On April 26, 2022 10:03:09 PM GMT-03:00, Igor Torrente <igormtorrente@gma=
il.com> wrote:
> >
> >
> >On 4/25/22 22:54, Igor Torrente wrote: =20
> >> Hi Pekka,
> >>=20
> >> On 4/25/22 05:10, Pekka Paalanen wrote: =20
> >>> On Sat, 23 Apr 2022 15:53:20 -0300
> >>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>  =20

...

> >>>>>>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_i=
nfo,
> >>>>>>> +				 const struct line_buffer *src_buffer, int y)
> >>>>>>> +{
> >>>>>>> +	int x, x_dst =3D frame_info->dst.x1;
> >>>>>>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> >>>>>>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> >>>>>>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >>>>>>> +			    src_buffer->n_pixels);
> >>>>>>> +
> >>>>>>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> >>>>>>> +		dst_pixels[3] =3D (u8)0xff; =20
> >>>>>>=20
> >>>>>> When writing to XRGB, it's not necessary to ensure the X channel h=
as
> >>>>>> any sensible value. Anyone reading from XRGB must ignore that value
> >>>>>> anyway. So why not write something wacky here, like 0xa1, that is =
far
> >>>>>> enough from both 0x00 or 0xff to not be confused with them even
> >>>>>> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
> >>>>>>=20
> >>>>>> Or, you could save a whole function and just use argb_u16_to_ARGBx=
xxx()
> >>>>>> instead, even for XRGB destination. =20
> >>>>>=20
> >>>>>=20
> >>>>> Right. Maybe I could just leave the channel untouched. =20
> >>>=20
> >>> Untouched may not be a good idea. Leaving anything untouched always h=
as
> >>> the risk of leaking information through uninitialized memory. Maybe n=
ot
> >>> in this case because the destination is allocated by userspace alread=
y,
> >>> but nothing beats being obviously correct. =20
> >>=20
> >> Makes sense.
> >>  =20
> >>>=20
> >>> Whatever you decide here, be prepared for it becoming de-facto kernel
> >>> UABI, because it is easy for userspace to (accidentally) rely on the
> >>> value, no matter what you pick. =20
> >>=20
> >> I hope to make the right decision then. =20
> >
> >The de-facto UABI seems to be already in place for {A, X}RGB8888. =20
>=20
> "Only XRGB_8888

If that's only IGT, then you should raise an issue with IGT about this,
to figure out if IGT is wrong by accident or if it is deliberate, and
are we stuck with it.

This is why I would want to fill X with garbage, to make the
expectations clear before the "obvious and logical constant value for X"
makes a mess by making XRGB indistinguishable from ARGB. Then the next
question is, do we need a special function to write out XRGB values, or
can we simply re-use the ARGB function.

Do the tests expect X channel to be filled with 0xff or with the actual
A values? This question will matter when all planes have ARGB
framebuffers and no background color. Then even more questions will
arise about what should actually happen with A values (blending
equation).

>=20
> >
> >I changed from 0xff to 0xbe and the `writeback-check-output` started to =
fail.


Thanks,
pq

--Sig_/Rq.UKVm=pEeIayRlj0Tn80+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJo9AYACgkQI1/ltBGq
qqdlCBAAlgRtFEOlIvJMr9K2rNeK8kJlGc9VAyEZxrDnyBZd8qVgg3Qea/4oAdee
ctvgoybd/mSfXCAID+fZsRwyRUGkf6egq8XmFhx+MjGxJSR0itnUAqHdBK3uiuwK
V7li9V8+Aqqw3eGOtmQBCJJFDK43Blw3H890pYdIWZX9M3esRFxkFpbDFKi2rWMJ
qNHorv6lR2ZUPqVPrgAtHS00jLkIJHN4qnyzK3u2CEPTzDY72pazt6ckElCHO58/
XiVSVSV6bYjYjCPt+X+76mSWzIgzzTwAneKZfFVXleHPwB77CZKVxSnL5I2zVMz4
eRmjV94wPvxvvpXkIkgs21WpU76yKQqJv/nfsz5Fi2CshRAq3j+db3NLxl+4jmhr
UKotILAwUUrjNwm8U+tHFDAYVrQ3N0NoZlErTflkCTr70NIinWs46THyAr77MkCF
iOryiANF9NEymqFa1ynZTye4eL/DEHhswIkxtgs6noAiLcD/qhVO3+Hb+GPR7JUc
lrYzIctkin4bK+mONrgCZQHr5FRDvXcf8XDwepoUmE7f8tqIa0+4NssRe66elyO0
FpyOoZPdWlKGfHJ5vo5M5n/UviuU11ifGBl17grS2sDZZ5LyPotYUPFRpfTKdHp/
z36YQ6pNSo2gVBCO7/JOb5FRsy6J5Ijab7bmOaXvskh/SbMCX9Q=
=I6L8
-----END PGP SIGNATURE-----

--Sig_/Rq.UKVm=pEeIayRlj0Tn80+--
