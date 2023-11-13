Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F202C7E99A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA8B10E33B;
	Mon, 13 Nov 2023 10:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765E10E33A;
 Mon, 13 Nov 2023 10:01:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50a71aac023so3708013e87.3; 
 Mon, 13 Nov 2023 02:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699869699; x=1700474499; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3jtq2ud9Y+apBjv97xYp0QS106z9rRELb+qcnrfcHtc=;
 b=dQnfD8n6cYXnaSQ0toDU6zuH8ZNteDJMJQ6ahKxmyR5y/O+Form8VRwRXZ0H8YZV6n
 aSDQR2Mn3B6+ou6w+oOZEsBzUkyt6fe3hacpx0mcjQNnDlIC4g80jKg7Y8GnsSk98Ffr
 jUOiKZF7ohcxeBNjs72w+YiSTUTIX6wOFwVXJ5XBOruIimozkOTEkxYYWyBHarp3Py8o
 Y/cuiu5is0i6Fo6Y27KCoNsxIJhAFzzqlA8zZmXN+0BNU8pNmm7IctOG4fW4rMFUt2Fx
 xRlrcFTicB5xhsZKBgWzAq4GiMcgbF5z9wfZvXV93RwK5vis3uJJv79pqLzDr1DrqcqV
 /Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699869699; x=1700474499;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jtq2ud9Y+apBjv97xYp0QS106z9rRELb+qcnrfcHtc=;
 b=HkRFV9DSRTJYOA4g3IxRXoM/JauZIizwCX+0c5sHS4W0YOpS7ksJPJTH4s9QZlem9r
 xEZgTTw5S85RQhR8GnKoBoGax4KdjXS6xCMDgsGTx08eAd0SyjI4pum7F+8HMla2L7Hg
 UHNtLExXn1wYwpKVG6XLVriCIF6pqXMdjMKP5PTHDsZuVugZoO+p7o7lOCZO95LiVgMU
 kcARfF2jxRslO+gLVnn+dV0kSOA+lnzBf4/FsERpSd4tjBIZXRy5wllTQuADEhG0vEBu
 SLmNaCBaqrciojN6RbduHjQBQUy0nhGlg9O2plyIbEEYPqR+MZ5cOnv8p45oVIXnrI1C
 yAYA==
X-Gm-Message-State: AOJu0YzLWE3GWykCQ0kN080+53NDOh1yzaPAKHOG6veK1FLHMOZnSBaK
 hv/Ms4spdL1CgrnM97Vep/Y=
X-Google-Smtp-Source: AGHT+IGUAOaXjD7CB1q+ogYioch5ThBjK+TolvUSepjROo3Y6DevDsrNifBwGcY4juhuhpR6pY+xzQ==
X-Received: by 2002:a19:914d:0:b0:503:26bc:b08f with SMTP id
 y13-20020a19914d000000b0050326bcb08fmr3480240lfj.24.1699869698662; 
 Mon, 13 Nov 2023 02:01:38 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b005032ebff220sm918726lfb.103.2023.11.13.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 02:01:38 -0800 (PST)
Date: Mon, 13 Nov 2023 12:01:34 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231113120134.5791b90d@eldfell>
In-Reply-To: <76e1744e-28bb-40d3-b114-8f5a21e914b3@amd.com>
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
 <20231108181731.4fe6f5d3@eldfell>
 <43a56f81-ed15-4f44-ba38-2896df405f84@amd.com>
 <20231109112005.7b55917e@eldfell>
 <76e1744e-28bb-40d3-b114-8f5a21e914b3@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YQhHFOn6nIH+fgZ7Ue/OHrw";
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

--Sig_/YQhHFOn6nIH+fgZ7Ue/OHrw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Nov 2023 15:27:03 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-11-09 04:20, Pekka Paalanen wrote:
> > On Wed, 8 Nov 2023 11:27:35 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-11-08 11:19, Pekka Paalanen wrote: =20
> >>> On Wed, 8 Nov 2023 09:31:17 -0500
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>     =20
> >>>> On 2023-11-08 06:40, Sebastian Wick wrote: =20
> >>>>> On Wed, Nov 8, 2023 at 11:16=E2=80=AFAM Pekka Paalanen <ppaalanen@g=
mail.com> wrote: =20
> >=20
> > ...
> >  =20
> >>>>>> An incremental UAPI development approach is fine by me, meaning th=
at
> >>>>>> pipelines might not be complete at first, but I believe that requi=
res
> >>>>>> telling userspace whether the driver developers consider the pipel=
ine
> >>>>>> complete (no undescribed operations that would significantly change
> >>>>>> results from the expected results given the UAPI exposed pipeline).
> >>>>>>
> >>>>>> The prime example of what I would like to know is that if a FB
> >>>>>> contains PQ-encoded image and I use a color pipeline to scale that
> >>>>>> image up, will the interpolation happen before or after the non-li=
near
> >>>>>> colorop that decodes PQ. That is a significant difference as point=
ed
> >>>>>> out by Joshua.
> >>>>>>      =20
> >>>>
> >>>> That's fair and I want to give that to you. My concern stems from
> >>>> the sentiment that I hear that any pipeline that doesn't explicitly
> >>>> advertise this is useless. I don't agree there. Let's not let perfect
> >>>> be the enemy of good. =20
> >>>
> >>> It's up to the use case. The policy of what is sufficient should resi=
de
> >>> in userspace.
> >>>
> >>> What about matching compositor shader composition with KMS?
> >>>
> >>> Can we use that as a rough precision threshold? If userspace implemen=
ts
> >>> the exact same color pipeline as the KMS UAPI describes, then that and
> >>> the KMS composited result should be indistinguishable in side-by-side
> >>> or alternating visual inspection on any monitor in isolation.
> >>>
> >>> Did this whole effort not start from wanting to off-load things to
> >>> display hardware but still maintain visual equivalence to software/GPU
> >>> composition?
> >>>     =20
> >>
> >> I agree with you and I want all that as well.
> >>
> >> All I'm saying is that every userspace won't have the same policy of
> >> what is sufficient. Just because Weston has a very high threshold
> >> doesn't mean we can't move forward with a workable solution for other
> >> userspace, as long as we don't do something that prevents us from
> >> doing the perfect solution eventually.
> >>
> >> And yes, I do want a solution that works for Weston and hear your
> >> comments on what that requires. =20
> >=20
> > I totally agree.
> >=20
> > How will that be reflected in the UAPI? If some pipelines are different
> > from others in correctness/strictness perspective, how will userspace
> > tell them apart?
> >=20
> > Is the current proposal along the lines of: userspace creates a
> > software pipeline first, and if it cannot map all operations on it to
> > KMS color pipeline colorops, then the KMS pipeline is not sufficient?
> >=20
> > The gist being, if the software pipeline is scaling the image for
> > example, then it must find a scaling colorop in the KMS pipeline if it
> > cares about the scaling correctness.
> >  =20
>=20
> With a simplified model of an imaginary color pipeline I expect this
> to look like this:
>=20
> Color Pipeline 1:
>    EOTF Curve - CTM
>=20
> Color Pipeline 2:
>    EOTF Curve - scale - CTM
>=20
> Realistically both would most likely map to the same HW blocks.
>=20
> Assuming userspace A and B do the following:
>    EOTF Curve - scale - CTM
>=20
> Userspace A doesn't care about scaling and would only look for:
>    EOTF Curve - CTM
>=20
> and find a match with Color Pipeline 1.
>=20
> Userspace B cares about scaling and would look for
>    EOTF Curve - scale - CTM
>=20
> and find a match with Color Pipeline 2.
>=20
> If Color Pipeline 2 is not exposed in the first iteration of the
> driver's implementation userspace A would still be able to make
> use of it, but userspace B would not, since it requires a defined
> scale operation. If the driver then exposes Color Pipeline 2 in a
> second iteration userspace B can find a match for what it needs
> and make use of it.
>=20
> Realistically userspace B would not attempt to implement a DRM/KMS
> color pipeline implementation unless it knows that there's a driver
> that can do what it needs.
>=20
> > Another example is YUV pixel format on an FB that magically turns into
> > some kind of RGB when sampled, but there is no colorop to tell what
> > happens. I suppose userspace cannot assume that the lack of colorop
> > there means an identity YUV->RGB matrix either? How to model
> > that? I guess the already mentioned pixel format requirements on a
> > pipeline would help, making it impossible to use a pipeline without a
> > YUV->RGB colorop on a YUV FB unless the lack of colorop does indeed
> > mean an identity matrix.
> >  =20
>=20
> I agree.
>=20
> > The same with sub-sampled YUV which probably needs to always(?) be
> > expanded into fully sampled at the beginning of a pipeline? Chroma
> > siting.
> >=20
> > This is in addition to the previously discussed userspace policy that
> > if a KMS color pipeline contains colorops the userspace does not
> > recognise, userspace probably should not pick that pipeline under any
> > conditions, because it might do something completely unexpected.
> >  =20
>=20
> Unless those colorops can be put into bypass.
>=20
> > I think the above could work, but I feel it requires documenting several
> > examples like scaling that might not exist in the colorop definitions
> > at first. Otherwise particularly userspace developers might not come to
> > think of them, whether they care about those operations. I haven't read
> > the latest doc yet, so I'm not sure if it's already there.
> >  =20
>=20
> True.
>=20
> But I'm somewhat reluctant to define things that don't have an
> implementation by a driver and an associated IGT test.

Hi Harry,

you do not need to define those colorops.

All I'm asking for is that the documentation includes examples, e.g. if
you do scaling and you care about how and in which color encoding space
it is done, make sure the pipeline you pick explicitly describes that.
If one cannot find even definitions for such colorops, then obviously
they are not explicit.

People might not realise that there are more than one way to do each
thing. That goes for anything that is possible to program or even
automatically programmed without being explicit in a color pipeline,
like YUV<->RGB conversions.

Or is all this so obvious it does not need pointing out in docs?

> I've seen
> too many definitions (like the drm_connector Colorspace property)
> that define a bunch of things but it's unclear whether they are
> actually used. Once you have those you can't change their definition
> either, even if they are wrong. And you might not find out they are
> wrong until you try to implement support end-to-end.
>=20
> The age-old chicken-and-egg dilemma. It's really problematic to
> define things that haven't been validated end-to-end.
>=20
> > There is still a gap though: what if the hardware does something
> > significant that is not modelled in the KMS pipeline with colorops? For
> > example, always using a hard-wired sRGB curve to decode before blending
> > and encode after blending. Or that cursor plane always uses the color
> > pipeline set on the primary plane. How to stop userspace from being
> > surprised?
> >  =20
>=20
> Yeah, it shouldn't. Anything extra that's done should be modelled with
> a colorop. But I might be somewhat contradicting myself here because
> this would mean that we'd need to model scaling.

Exactly. If unknowns need to be allowed at first, there should be some
indication to userspace when all unknowns in a pipeline have been
eliminated (either explicitly modelled, or guaranteed to bypass). Most
userspace won't care, but those who would need the new color pipeline
UAPI the most will.

> Cursors are funky on AMD and I need to think about them more (though
> I've been saying that for years :D ). Maybe on AMD we might want a
> custom colorop for cursors that basically says "this plane will inherit
> colorops from the underlying plane".

Sounds good to me.

Is it really any underlying plane at that point (pixel by pixel?) and
not the primary plane?

> > Your comments sounded to me like you are letting go of the original
> > design goals. I'm happy to hear that's not the case. Even if you were,
> > that is a decision you can make since you are doing the work, and if I
> > knew you're doing that intentionally I would stop complaining.
> >  =20
>=20
> Apologies for the misunderstanding. I agree with the original design
> goals but I'm also trying to find a minimal workable solution that
> allows us to iterate and improve on it going forward.

That's all fine.


Thanks,
pq

--Sig_/YQhHFOn6nIH+fgZ7Ue/OHrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVR8/4ACgkQI1/ltBGq
qqd1uA//fXSPTDthYfETMlgM3WEHb3K7V9xJXl1xp40bAzx4ZadOBPvu8lsiHBxk
k6HbL4T+09U4wfafzYEPWX3oEOYFVDMx+WUoz9bP8L5+cicKLQWrQYbXmhWCndbp
C3aE+Un/hSZhmDCxiHDHVa9tNF+5iVe4P8xaV87TMQG9dUSQsMN6GU+IL0r5qiSv
Pk+oJNi8unMOPG8MaVRePi9NEl48hOCP84UulgZwX1nGLntOSeGPWqzExUysEKoR
urk113Oq/BYvZUcRKEwvurCozApCAWd6YJgbVe71t+J5QfkLPpuSW+Tf6b7ug6MW
Ngpf0bRvgNqx1d+l2zrNqNnXJWu8DlOD73w7uECfjRx1a9eZahl5pyfwI6lRHw+E
NLTRa6sNvrpNZM0REma9XCE5eFlV3w6eorSy4BN92n1XkZKhFpVOiwhyGoAy2NqG
uIUcBmpLuyfwm/Hxy0OkdB9oGqI+ENde2TsdG5pYZG9EgwO/doE6d+uDAAQHc1vw
nWu8bOQ/yUxIXa3YOu7Zk4C+hXhIHxr625RQpDMe5FYqYwdo/lDiRX84IfCCK9H0
2OcuVOlcnIAYGH6Zn2ykoYOXvMe1BodeHppXaK+RBNDWc7eVoyszysMextmaAm6x
TCdHzxOl2TsmE6uqMrqIwx2j+UfEPMEcdjPpvbHxePRHwNGwpv8=
=ezA0
-----END PGP SIGNATURE-----

--Sig_/YQhHFOn6nIH+fgZ7Ue/OHrw--
