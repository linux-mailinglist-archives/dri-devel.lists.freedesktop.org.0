Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E87E3852
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C80410E501;
	Tue,  7 Nov 2023 09:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3E10E501;
 Tue,  7 Nov 2023 09:55:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so6927123e87.0; 
 Tue, 07 Nov 2023 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699350948; x=1699955748; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1aEuwo+VXEeNgKifSkM8HayWX9h/5AxXdKOutICeiyg=;
 b=TS0OVDwDQR150sdGHS4WOJquZxS8ad+bXQrRhmSVLNIkTNRbbAWK784S+6OPOLNYpH
 ZtEi+IIAORsADwdWFHpkFPFAVjnMwhrkweKa+HKH5hKrlgrVoycHZnwV1876EU0ZQfBP
 2L/aBn7PbVflkJODydCfpbitYNGJWYkK8llgoAmB6dQKT0URW7wFCwyVQMqLL9fU2Zvg
 QQCJcVKQWHQJHS8s4HU9SfgvNyydhv57gMFMGq1UFdWXyeD0tGE2EhvUzJeRi+IrYEI+
 fiUlHPlkpPu0Ab26sFGYsTpHhj2eLGmRNLMCZfjUrq+NNK+JdcCDN0qdFlgRMOfIHre6
 I1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699350948; x=1699955748;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1aEuwo+VXEeNgKifSkM8HayWX9h/5AxXdKOutICeiyg=;
 b=wkg/vCvPQ5j/ST1JC/nLqB1YuTDyrjIHiXoNDmPCK7uFNShsGoPLc56fIdMuGvKhbh
 /dOdseQf6BsfMFR9X4h/p+325CgitZ0xy38D1rZNsgsNSmjOuw1+w5rBoMnLrRO7oCJQ
 ctJSWl6bEuKoqIrmE+Q7DIaXpdOvuMakGos5r8HfSnflBFv9QJNDK8/yRW93hAViYSs4
 Ljvdz7yCp3UuEDoNNhNf4EFf93DKpn9PwFAJN39MX9F2V8VRfw9OA5WBlNmJNEa4MjU2
 pmxCcKYIP5JOysxGw7bzSexSRg7tUujwsJOPPdUxoIXAF/uAAtIyxiVSACjafLh0wqrZ
 xkIQ==
X-Gm-Message-State: AOJu0Yys8VlSiyt+QlTltcUhen33gHL2B/LQtLKD9dW34VZCx+5Ce43W
 HoUhgifys0MxG5+gnnu7ezI=
X-Google-Smtp-Source: AGHT+IH6bTqDXWAJRqklo5KQxh60M+wSCbKmxhxtaoNRxJRhiiU+tBxKMVL80XerIVT8J+pj36CyeA==
X-Received: by 2002:a05:6512:401d:b0:503:3787:f75a with SMTP id
 br29-20020a056512401d00b005033787f75amr29364343lfb.62.1699350948152; 
 Tue, 07 Nov 2023 01:55:48 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05651206cd00b0050804a97f01sm294458lff.160.2023.11.07.01.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 01:55:47 -0800 (PST)
Date: Tue, 7 Nov 2023 11:55:43 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231107115543.7fa6e5f2@eldfell>
In-Reply-To: <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6EEGafMN6+scu=xaSJkz6ln";
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

--Sig_/6EEGafMN6+scu=xaSJkz6ln
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Nov 2023 11:19:27 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-10-20 06:36, Pekka Paalanen wrote:
> > On Thu, 19 Oct 2023 10:56:40 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-10-10 12:13, Melissa Wen wrote: =20
> >>> O 09/08, Harry Wentland wrote:   =20
> >>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com> =20
> >=20
> > ...
> >  =20
> >>> Also, with this new plane API in place, I understand that we will
> >>> already need think on how to deal with the mixing between old drm col=
or
> >>> properties (color encoding and color range) and these new way of sett=
ing
> >>> plane color properties. IIUC, Pekka asked a related question about it
> >>> when talking about CRTC automatic RGB->YUV (?)=20
> >>>    =20
> >>
> >> We'll still need to confirm whether we'll want to deprecate these
> >> existing properties. If we do that we'd want a client prop. Things
> >> should still work without deprecating them, if drivers just pick up
> >> after the initial encoding and range CSC.
> >>
> >> But realistically it might be better to deprecate them and turn them
> >> into explicit colorops. =20
> >=20
> > The existing properties would need to be explicitly reflected in the
> > new pipelines anyway, otherwise there would always be doubt at which
> > point of a pipeline the old properties apply, and they might even
> > need to change positions between pipelines.
> >=20
> > I think it is simply easier to just hide all old color related
> > properties when userspace sets the client-cap to enable pipelines. The
> > problem is to make sure to hide all old properties on all drivers that
> > support the client-cap.
> >=20
> > As a pipeline must be complete (describe everything that happens to
> > pixel values), it's going to be a flag day per driver.
> >=20
> > Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
> > as well. Maybe it's purely informative and non-configurable, keyed by
> > FB pixel format, but still.
> >=20
> > We also need a colorop to represent sample filtering, e.g. bilinear,
> > like I think Sebastian may have mentioned in the past. Everything
> > before the sample filter happens "per tap" as Joshua Ashton put it, and
> > everything after it happens on the sample that was computed as a
> > weighted average of the filter tap inputs (texels).
> >=20
> > There could be colorops other than sample filtering that operate on
> > more than one sample at a time, like blur or sharpness. There could
> > even be colorops that change the image size like adding padding that
> > the following colorop hardware requires, and then yet another colorop
> > that clips that padding away. For an example, see
> > https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.ht=
ml
> >=20
> > If that padding and its color can affect the pipeline results of the
> > pixels near the padding (e.g. some convolution is applied with them,
> > which may be the reason why padding is necessary to begin with), then
> > it would be best to model it.
> >  =20
>=20
> I hear you but I'm also somewhat shying away from defining this at this p=
oint.

Would you define them before the new UAPI is released though?

I agree there is no need to have them in this patch series, but I think
we'd hit the below problems if the UAPI is released without them.

> There are already too many things that need to happen and I will focus on=
 the
> actual color blocks (LUTs, matrices) first. We'll always be able to add a=
 new
> (read-only) colorop type to define scaling and tap behavior at any point =
and
> a client is free to ignore a color pipeline if it doesn't find any tap/sc=
ale
> info in it.

How would userspace know to look for tap/scale info, if there is no
upstream definition even on paper?

And the opposite case, if someone writes userspace without tap/scale
colorops, and then drivers add those, and there is no pipeline without
them, because they always exist. Would that userspace disregard all
those pipelines because it does not understand tap/scale colorops,
leaving no usable pipelines? Would that not be kernel regressing
userspace?

If the kernel keeps on exposing pipelines without the colorops, it
fails the basic promise of the whole design: that all pixel value
affecting operations are at least listed if not controllable.

How will we avoid painting ourselves in a corner?

Maybe we need a colorop for "here be dragons" documented as having
unknown and unreliable effects, until driver authors are sure that
everything has been modelled in the pipeline and there are no unknowns?
Or a flag on the pipelines, if we can have that. Then we can at least
tell when the pipeline does not fulfil the basic promise.


Thanks,
pq

--Sig_/6EEGafMN6+scu=xaSJkz6ln
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVKCZ8ACgkQI1/ltBGq
qqeqlA/5AcGhYV+afJkAKRqYcdhc1jZdT1G1D93UE9dJ1GC+dvVoB1W7vLA0k2QM
jHCqBq4TvK1HBAGEY7FVgEjkqfrQb1qK2T+L4fW3KMdp5thdv8OhOICSXmpy5++4
kgODo/S3hT5jikOENCS6BFASuxRvHk0WDZYVl2mOcdwPsjqLgvqUq2M6jH/MOi09
6HjPIcjxSwCUtJXQI3yMRGuIqcQkU+c44acKqpOsr762BtiV1FAHzp4luKumk0ze
zAy9e2WnNe5wqVdnktm3M481e0l3hPIl0ip/LbYqe5+pAt/7qGIrHMWpf+nbVRY6
79KrdTb48XGhLN1p5zLDrHy8xSmUhTjkxBPqmzH7fY+5tEeDFrvzfHuwSaF+6aEv
Y1I9cLX/yE2t11vU8D/qT2DOZmLkb4fhV8dITICubm0By5kwkDrwdMvvP/GW+Iff
jpq8mXch0joburzS5LNTPbidlI+OIF8FZ8PP959Wz/pkUQnY9u69mGenJL7I1NqN
ZfhBtdbNHaP6Cs1RLHxM77+whE+AcRM3ORd1Smv41GIO+9F3A83JMveitK53ARge
44WN+pM7rvzezLJ00E8Yg/12+ttF8TAXVu/SBOrPpiJ7dkWW0fXNPhc8dddmcPIC
e0UeBv9Heix2f5l5rdQ/iDNILxLMuo7DpPmGaoFkVPcs9UHDb2I=
=uXom
-----END PGP SIGNATURE-----

--Sig_/6EEGafMN6+scu=xaSJkz6ln--
