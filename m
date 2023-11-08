Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9A7E5AFE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0410E170;
	Wed,  8 Nov 2023 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCE510E16F;
 Wed,  8 Nov 2023 16:19:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507b96095abso9010100e87.3; 
 Wed, 08 Nov 2023 08:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699460357; x=1700065157; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DfjN4j0yS8Mcdvz1G1gMqFfnxseIOFfXVoM5ZMwhhFM=;
 b=hR1Wel50cW+SK/qwFBkAMAu86KbXsASj/kslS3uEg5XNsYLFd7cumEmK4w9Gy2nLnu
 hNQ+7zeKY/xjU6Q+lzmoGZaZ7lCutx4z0Gs1EZEgxIUQPWP50wE7mASA6mPPivn/E+2e
 ohT3dLAQYNQ1pqKXJHXFfPBJK7dU+x7D2q9GtgtxRfH+w47ZJO4hfvSvhB0qmuU9jK5b
 1n5DHAHLKclQEbaWGJATxhSD6WvSynrGkcpPJhrUDZu81rH175KvI1/RbX4Tqc1V0RUv
 CBBhFja7V0DA4LTKt/HQdu7Smg4ek5KgoSaKNcQzIfZdunWYD3K4oPGeJlM6qvAQPNJ0
 KKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699460357; x=1700065157;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DfjN4j0yS8Mcdvz1G1gMqFfnxseIOFfXVoM5ZMwhhFM=;
 b=AmBE8poexwj6cUqRAQu1BE1qvWfg40OO/VBGTXN4Y3GAhZS7mS9w6SexV7mSFdipYo
 9qjuAWGgceLEtjrwxBsLTHvKpXd2rlbnVtq63pbpza7kwHVazYCYd5D3Boibntnoo4FS
 JoJp6CB7i/zXY2c9KxoRPE2okvTmazny5cn/lnn275rAOLQHFNCLDEGfPPJHcZD45auC
 oGdYM+BIqyZ1fkiED/XX7OB3fjMS9G5O1Pok3mIpELCK7oETjsu35HQR0z8kG/G8Q2dE
 7Vy3oMBKsfdBB9KKKbquCuTfhS6G0ta66Ls6l2futAVYPW0p41HMRUSqoHyVf6zaijQZ
 CSsQ==
X-Gm-Message-State: AOJu0YxGwaoAh1mI3fxJxYA/2slOuwcD4HxZXhHWPwan/pHa728X7SfA
 FWmLmfbFRtcHcgF7BGH03cY=
X-Google-Smtp-Source: AGHT+IFswLNtFLDHQucLuyOM4hIUsqnG+S/R12os70NOpadBzi8cQgFbDi31/BIN3wNsnmlnzrowKw==
X-Received: by 2002:a05:6512:210b:b0:509:dd0:9414 with SMTP id
 q11-20020a056512210b00b005090dd09414mr1617835lfr.24.1699460356984; 
 Wed, 08 Nov 2023 08:19:16 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p16-20020a056512313000b0050319d5ba7csm708882lfd.257.2023.11.08.08.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 08:19:16 -0800 (PST)
Date: Wed, 8 Nov 2023 18:19:12 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231108181731.4fe6f5d3@eldfell>
In-Reply-To: <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
 <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
 <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eE4/5xhyC3ZoiOKfl6.1Xtx";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/eE4/5xhyC3ZoiOKfl6.1Xtx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 09:31:17 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-11-08 06:40, Sebastian Wick wrote:
> > On Wed, Nov 8, 2023 at 11:16=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail=
.com> wrote: =20
> >>
> >> On Tue, 7 Nov 2023 11:58:26 -0500
> >> Harry Wentland <harry.wentland@amd.com> wrote:
> >> =20
> >>> On 2023-11-07 04:55, Pekka Paalanen wrote: =20
> >>>> On Mon, 6 Nov 2023 11:19:27 -0500
> >>>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>> =20
> >>>>> On 2023-10-20 06:36, Pekka Paalanen wrote: =20
> >>>>>> On Thu, 19 Oct 2023 10:56:40 -0400
> >>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>>>> =20
> >>>>>>> On 2023-10-10 12:13, Melissa Wen wrote: =20
> >>>>>>>> O 09/08, Harry Wentland wrote: =20
> >>>>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com> =20
> >>>>>>
> >>>>>> ...
> >>>>>> =20
> >>>>>>>> Also, with this new plane API in place, I understand that we will
> >>>>>>>> already need think on how to deal with the mixing between old dr=
m color
> >>>>>>>> properties (color encoding and color range) and these new way of=
 setting
> >>>>>>>> plane color properties. IIUC, Pekka asked a related question abo=
ut it
> >>>>>>>> when talking about CRTC automatic RGB->YUV (?)
> >>>>>>>> =20
> >>>>>>>
> >>>>>>> We'll still need to confirm whether we'll want to deprecate these
> >>>>>>> existing properties. If we do that we'd want a client prop. Things
> >>>>>>> should still work without deprecating them, if drivers just pick =
up
> >>>>>>> after the initial encoding and range CSC.
> >>>>>>>
> >>>>>>> But realistically it might be better to deprecate them and turn t=
hem
> >>>>>>> into explicit colorops. =20
> >>>>>>
> >>>>>> The existing properties would need to be explicitly reflected in t=
he
> >>>>>> new pipelines anyway, otherwise there would always be doubt at whi=
ch
> >>>>>> point of a pipeline the old properties apply, and they might even
> >>>>>> need to change positions between pipelines.
> >>>>>>
> >>>>>> I think it is simply easier to just hide all old color related
> >>>>>> properties when userspace sets the client-cap to enable pipelines.=
 The
> >>>>>> problem is to make sure to hide all old properties on all drivers =
that
> >>>>>> support the client-cap.
> >>>>>>
> >>>>>> As a pipeline must be complete (describe everything that happens to
> >>>>>> pixel values), it's going to be a flag day per driver.
> >>>>>>
> >>>>>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pip=
eline
> >>>>>> as well. Maybe it's purely informative and non-configurable, keyed=
 by
> >>>>>> FB pixel format, but still.
> >>>>>>
> >>>>>> We also need a colorop to represent sample filtering, e.g. bilinea=
r,
> >>>>>> like I think Sebastian may have mentioned in the past. Everything
> >>>>>> before the sample filter happens "per tap" as Joshua Ashton put it=
, and
> >>>>>> everything after it happens on the sample that was computed as a
> >>>>>> weighted average of the filter tap inputs (texels).
> >>>>>>
> >>>>>> There could be colorops other than sample filtering that operate on
> >>>>>> more than one sample at a time, like blur or sharpness. There could
> >>>>>> even be colorops that change the image size like adding padding th=
at
> >>>>>> the following colorop hardware requires, and then yet another colo=
rop
> >>>>>> that clips that padding away. For an example, see
> >>>>>> https://lists.freedesktop.org/archives/dri-devel/2023-October/4270=
15.html
> >>>>>>
> >>>>>> If that padding and its color can affect the pipeline results of t=
he
> >>>>>> pixels near the padding (e.g. some convolution is applied with the=
m,
> >>>>>> which may be the reason why padding is necessary to begin with), t=
hen
> >>>>>> it would be best to model it.
> >>>>>> =20
> >>>>>
> >>>>> I hear you but I'm also somewhat shying away from defining this at =
this point. =20
> >>>>
> >>>> Would you define them before the new UAPI is released though?
> >>>>
> >>>> I agree there is no need to have them in this patch series, but I th=
ink
> >>>> we'd hit the below problems if the UAPI is released without them.
> >>>> =20
> >>>>> There are already too many things that need to happen and I will fo=
cus on the
> >>>>> actual color blocks (LUTs, matrices) first. We'll always be able to=
 add a new
> >>>>> (read-only) colorop type to define scaling and tap behavior at any =
point and
> >>>>> a client is free to ignore a color pipeline if it doesn't find any =
tap/scale
> >>>>> info in it. =20
> >>>>
> >>>> How would userspace know to look for tap/scale info, if there is no
> >>>> upstream definition even on paper?
> >>>> =20
> >>>
> >>> So far OSes did not care about this. Whether that's good or bad is
> >>> something everyone can answer for themselves.
> >>>
> >>> If you write a compositor and really need this you can just ignore
> >>> color pipelines that don't have this, i.e., you'll probably want
> >>> to wait with implementing color pipeline support until you have what
> >>> you need from DRM/KMS.
> >>>
> >>> This is not to say I don't want to have support for Weston. But I'm
> >>> wondering if we place too much importance on getting every little
> >>> thing figured out whereas we could be making forward progress and
> >>> address more aspects of a color pipeline in the future. There is a
> >>> reason gamescope has made a huge difference in driving the color
> >>> management work forward.
> >>> =20
> >>>> And the opposite case, if someone writes userspace without tap/scale
> >>>> colorops, and then drivers add those, and there is no pipeline witho=
ut
> >>>> them, because they always exist. Would that userspace disregard all
> >>>> those pipelines because it does not understand tap/scale colorops,
> >>>> leaving no usable pipelines? Would that not be kernel regressing
> >>>> userspace?
> >>>> =20
> >>>
> >>> The simple solution is to leave previously advertised pipelines
> >>> untouched and add a new version that does include scaling information.
> >>> =20
> >>>> If the kernel keeps on exposing pipelines without the colorops, it
> >>>> fails the basic promise of the whole design: that all pixel value
> >>>> affecting operations are at least listed if not controllable.
> >>>>
> >>>> How will we avoid painting ourselves in a corner?
> >>>>
> >>>> Maybe we need a colorop for "here be dragons" documented as having
> >>>> unknown and unreliable effects, until driver authors are sure that
> >>>> everything has been modelled in the pipeline and there are no unknow=
ns?
> >>>> Or a flag on the pipelines, if we can have that. Then we can at least
> >>>> tell when the pipeline does not fulfil the basic promise.
> >>>> =20
> >>>
> >>> The will always be dragons at some level. =20
> >>
> >> Do I understand right that the goal of fully understood color pipelines
> >> is a lost cause?
> >>
> >> That every pipeline might always have something unknown and there is no
> >> way for userspace to know if it does? Maybe because driver developers
> >> don't know either?
> >>
> >> By something unknown I refer to anything outside of basic precision
> >> issues. Doing interpolation or mixing of inputs on the wrong side of a
> >> known non-linear colorop, for example. =20
> >=20
> > I don't think that's the case. Hardware vendors should understand the
> > hardware and exposing everything that affects the values is the goal
> > here. There will be a transitional period where the pipelines might
> > not expose every detail yet but that's fine. It's better than what we
> > have now and should become even better with time. It would maybe be
> > helpful in the future to have a cap, or property, or whatever, to
> > indicate that the pipelines are "complete" descriptions of what
> > happens to the values but we can discuss it when it becomes relevant.
> >  =20
>=20
> I agree, for the most part. But how do you then define "complete" if
> you exclude precision issues?

If someone can develop some kind of precision indication in the UAPI,
we might be able to answer that question then.

> >> An incremental UAPI development approach is fine by me, meaning that
> >> pipelines might not be complete at first, but I believe that requires
> >> telling userspace whether the driver developers consider the pipeline
> >> complete (no undescribed operations that would significantly change
> >> results from the expected results given the UAPI exposed pipeline).
> >>
> >> The prime example of what I would like to know is that if a FB
> >> contains PQ-encoded image and I use a color pipeline to scale that
> >> image up, will the interpolation happen before or after the non-linear
> >> colorop that decodes PQ. That is a significant difference as pointed
> >> out by Joshua.
> >> =20
>=20
> That's fair and I want to give that to you. My concern stems from
> the sentiment that I hear that any pipeline that doesn't explicitly
> advertise this is useless. I don't agree there. Let's not let perfect
> be the enemy of good.

It's up to the use case. The policy of what is sufficient should reside
in userspace.

What about matching compositor shader composition with KMS?

Can we use that as a rough precision threshold? If userspace implements
the exact same color pipeline as the KMS UAPI describes, then that and
the KMS composited result should be indistinguishable in side-by-side
or alternating visual inspection on any monitor in isolation.

Did this whole effort not start from wanting to off-load things to
display hardware but still maintain visual equivalence to software/GPU
composition?


Thanks,
pq

--Sig_/eE4/5xhyC3ZoiOKfl6.1Xtx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVLtQAACgkQI1/ltBGq
qqefCA/+M6Hnde9+4u0z0D7v1rLN3++VnwF9r1dOC61C/0De5kWmk7FxN1BmvNLr
0Zh/nGFzWmJLZ+uHmQZYFHqisvy0YWCbUSTso3N2rDBxufnynBPN16+YQWXo3eKs
zxZaCsMrQDW43U0dEvp6la0NkEcWVWhvpVjtjPuYWUTDdycNUz/I09rRw5uchvaK
gvwbODzRVnB9y0zLrwpE/1jUkbt2st7dj3O3Dm3PGrYknU5dZ6VUItacvF4tPpSD
3qD/EE5v2j/d+fkkYN04rh7YB9cAa+CDgg4BY2VCDtmlY+Rxyz9bf/265346W989
mlww9ttj0zCFGUgqi7qKKrCC/zlBusNT44u5judFGBBtHY21/DYwtP88I7XNDrjv
0/Pppd0mV1U0OdF6H9KDJaYn4xjpXfxrUpB2sXMpF9dP6TXwRyIYCR/EDETRxP8Y
V+m+5DE9MiGmlU0AYgxNSl8P/UfaUP+g54yFmqIX4bOOmeP8mRv/6B+47lNWWMxj
odG4WRhoONVKh/Vqe8iffyJz0OSz28Eahp5DwYfSXe3oe2zHeqZK2tp9MJt0uKJI
yNrSxXu8aWBXFxTexBToe0M2OG8F9Z1CWUJcBiWw/1BWECU2lWWl3nbK5VWUHN90
+SsPCyBbDDMpey8trTb9riSSfnGMjb5LrvV2bMo7jz7Nf7RzCVg=
=QlGQ
-----END PGP SIGNATURE-----

--Sig_/eE4/5xhyC3ZoiOKfl6.1Xtx--
