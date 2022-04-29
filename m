Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2151495C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 14:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801BA10E919;
	Fri, 29 Apr 2022 12:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8F10E925
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 12:31:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x17so13743871lfa.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=GSl78hpp3mbHmRIFmHmFeA2RXuJdOpf70SiH0wvjPLw=;
 b=fyvsVAb42JhbEhVVPeP75X5KDgWh7D+OqYzCgohjjoGMQJL9QKqD0/psqwP4lLUdfI
 3lsbe0+EVM9DKgdYkGdyDm6/Ol2QVaSjcS0KXvc6MpJqxkqyedP4+4AdTx4IMcBeCj1E
 VC3Kr0IVRtD7kHAnwHtyb040F3VinZqaB/JR/ydfP/ylZ1v2nx+2G8PrDgtUG0keHmtL
 b5wtKgjv6tzwny94SyHsEP/ES7LmquFq/nVbIJLX1OkBpyOi2pE53kMAJ+ntmGMX8N2c
 h4PVliJjbc5WQeVNrvOjrMRQOohzyv1uBFxtipwHlERm8SWsapqm3B8KFhgv0IC6vJI4
 vcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=GSl78hpp3mbHmRIFmHmFeA2RXuJdOpf70SiH0wvjPLw=;
 b=fQVvPfdRR7a+PnjpJI8oqU3AR74LgjAM2fIC0a+7jt8KrDhQcO+jX1RU9FxEf0AfQ7
 3FdVbWkhRhOdxjwmweXODNWWu6v3a9MXhx/T2AWWanDRozq6d9H5Zza2LpQRNVptKWw6
 CFtUK29vkSinmD/CMJlRRQUPLTPXr69g0m1ZlqbsfdMRK2fgeOONY3ACToIRNrAPvj+H
 38kbB+meHXMs1HbnVPlHAiKBm5sjta9GX9hqOH9844M5aFqLjQxUsfkWoIfRZfLHkSLV
 PTMzkAtYrZ54dibuKTBkwKxpuDdJSZ4n4zxFIukA7n0obbTHRZ0j7cw0XmFo6Uz/l9he
 9zwQ==
X-Gm-Message-State: AOAM530UIduzk2066S0dyoLWViWmukcTBZp3a/rieqiR3zC3vW4roy98
 Z2KEsqqLoEMefKnz1q3eaMU=
X-Google-Smtp-Source: ABdhPJyGn1Ubh0VuRIae/gk+RZdu8OekksAopNiQG7SrgOvxGBALHIjNbm3AlyJk3e67qNdt1vbY8w==
X-Received: by 2002:a05:6512:1322:b0:44b:75d:ac8 with SMTP id
 x34-20020a056512132200b0044b075d0ac8mr26510893lfu.213.1651235487950; 
 Fri, 29 Apr 2022 05:31:27 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p26-20020a056512313a00b0047206a0e6e9sm228164lfd.289.2022.04.29.05.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 05:31:27 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:31:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220429153124.31ba4ae4@eldfell>
In-Reply-To: <5095c372-f326-03cf-5229-69e2aac72a02@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
 <20220425111026.485cba66@eldfell>
 <caa885ed-208a-3810-bd3e-e497e2c9ba93@gmail.com>
 <5c2a80f5-5107-4fab-4df9-b0be633fd576@gmail.com>
 <4313DC33-E81A-4972-90AD-7B9DD42145B8@gmail.com>
 <20220427104302.3082584b@eldfell>
 <5095c372-f326-03cf-5229-69e2aac72a02@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3NCzgONxX7H7=XdmaTQMPa2";
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

--Sig_/3NCzgONxX7H7=XdmaTQMPa2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Apr 2022 21:44:34 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> On 4/27/22 04:43, Pekka Paalanen wrote:
> > On Tue, 26 Apr 2022 22:22:22 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> On April 26, 2022 10:03:09 PM GMT-03:00, Igor Torrente <igormtorrente@=
gmail.com> wrote: =20
> >>>
> >>>
> >>> On 4/25/22 22:54, Igor Torrente wrote: =20
> >>>> Hi Pekka,
> >>>>
> >>>> On 4/25/22 05:10, Pekka Paalanen wrote: =20
> >>>>> On Sat, 23 Apr 2022 15:53:20 -0300
> >>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>>>     =20
> >=20
> > ...
> >  =20
> >>>>>>>>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame=
_info,
> >>>>>>>>> +				 const struct line_buffer *src_buffer, int y)
> >>>>>>>>> +{
> >>>>>>>>> +	int x, x_dst =3D frame_info->dst.x1;
> >>>>>>>>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> >>>>>>>>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> >>>>>>>>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst=
),
> >>>>>>>>> +			    src_buffer->n_pixels);
> >>>>>>>>> +
> >>>>>>>>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> >>>>>>>>> +		dst_pixels[3] =3D (u8)0xff; =20
> >>>>>>>>
> >>>>>>>> When writing to XRGB, it's not necessary to ensure the X channel=
 has
> >>>>>>>> any sensible value. Anyone reading from XRGB must ignore that va=
lue
> >>>>>>>> anyway. So why not write something wacky here, like 0xa1, that i=
s far
> >>>>>>>> enough from both 0x00 or 0xff to not be confused with them even
> >>>>>>>> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
> >>>>>>>>
> >>>>>>>> Or, you could save a whole function and just use argb_u16_to_ARG=
Bxxxx()
> >>>>>>>> instead, even for XRGB destination. =20
> >>>>>>>
> >>>>>>>
> >>>>>>> Right. Maybe I could just leave the channel untouched. =20
> >>>>>
> >>>>> Untouched may not be a good idea. Leaving anything untouched always=
 has
> >>>>> the risk of leaking information through uninitialized memory. Maybe=
 not
> >>>>> in this case because the destination is allocated by userspace alre=
ady,
> >>>>> but nothing beats being obviously correct. =20
> >>>>
> >>>> Makes sense.
> >>>>     =20
> >>>>>
> >>>>> Whatever you decide here, be prepared for it becoming de-facto kern=
el
> >>>>> UABI, because it is easy for userspace to (accidentally) rely on the
> >>>>> value, no matter what you pick. =20
> >>>>
> >>>> I hope to make the right decision then. =20
> >>>
> >>> The de-facto UABI seems to be already in place for {A, X}RGB8888. =20
> >>
> >> "Only XRGB_8888 =20
> >=20
> > If that's only IGT, then you should raise an issue with IGT about this,
> > to figure out if IGT is wrong by accident or if it is deliberate, and
> > are we stuck with it.
> >=20
> > This is why I would want to fill X with garbage, to make the
> > expectations clear before the "obvious and logical constant value for X"
> > makes a mess by making XRGB indistinguishable from ARGB. Then the next
> > question is, do we need a special function to write out XRGB values, or
> > can we simply re-use the ARGB function.
> >=20
> > Do the tests expect X channel to be filled with 0xff or with the actual
> > A values? This question will matter when all planes have ARGB
> > framebuffers and no background color. Then even more questions will
> > arise about what should actually happen with A values (blending
> > equation). =20
>=20
> I dig into the igt code a little bit and found that it's waiting for the=
=20
> channel to not be changed.
> It fills all the pixels in the line with a value and calculates the CRC=20
> of the entire buffer, including the alpha.
>=20
> I will crate an issue asking if this is intended.

I just remembered this:
https://lists.freedesktop.org/archives/igt-dev/2022-March/039920.html


Thanks,
pq

--Sig_/3NCzgONxX7H7=XdmaTQMPa2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr2pwACgkQI1/ltBGq
qqe2Pw/+Id+XFCvvA03cSTg6MCNWMhzsHkyuKuJN+NGIqvRTMOq6MghQ7y5yGees
7KnSrdyljJZMehNv3F0EUEd12FZKL7YsiKcG64zvQv+XiSAe0mbpPovOFbywlso2
hoe73FfuZ6fJ5IKzlJNefiMLk/UAfv9+2d9G9+CJnYkR0ieQznesnbLYEV4tIzSW
c1uXwGLcm2iAcrG5CLsAfvwBqZUvFmmSFNn5WTi83LoGD6kl7OmtANhrgz710VRz
odKt67ijvUS0GFCsEQLyMNMaNGTHg3Aaq1tASL+T8+8QE8opl1MnxTL0SZSFhJwd
C9nM3WIvEOj1lVHFOYvoNykW3Okx/KVEUfP51BEJMaIuN9e0LuAmdtH6tYvTJocd
+1ONbFOwekWOAFY4gt2mMR59Mlvm00rIfJyecVjS73fLHOdKB5uDOQNG8wOdZ4me
uh4QA1kJxTuPQINa6sNXvwiM7JXJOUmfRLnv3PG1/oQ+3Jt6SncjRJgHXMDQDNZ3
YDsLIJQU6w7gGBHg7q+oI2weg2PmRtuo9mWdYhaYdFteWFasalul4HvmoVH5Bb8/
y/9xuQkAamE0B/rs6nN3CIw9bfj4d+q8WmYFo3chgOyj3keB4UqJIYcsGkOe4vQ3
rMBINZ9JR77/3kGsV/V0W584N/Nq8B9E9rf3jJtvv6xBpOsTH7M=
=PbqA
-----END PGP SIGNATURE-----

--Sig_/3NCzgONxX7H7=XdmaTQMPa2--
