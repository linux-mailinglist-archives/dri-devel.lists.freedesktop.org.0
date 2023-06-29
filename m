Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50137420FB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 09:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B897910E15B;
	Thu, 29 Jun 2023 07:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8BB10E15B;
 Thu, 29 Jun 2023 07:29:40 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so5121471fa.1; 
 Thu, 29 Jun 2023 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688023776; x=1690615776;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uqzYTrdPD4vbemfyu8eoAm1tg2yh7fiY9wJETEZ7F28=;
 b=cXEEymKD1WNa45KrHFMTk1CuRbjaI7vhUxlXcrmat5ARGRz4jI3sDTiRMZZVef0phQ
 fFaVjwRm3d/heSYo0x66HIyi9d0v4MZD+c5AwiAcpW/3kglJHZGID/BNdfcR0vBZv+2e
 EMIrkpfVihi5VAU++yMAJAZqe6qPGQgDXvl+CFYjmyc5zbEQbsdgq8uiI+cQvpd66m+N
 oWH7hlGtqhhdNcARLee5j1pbP/sZg5hoQh5EQ86nGFE3I+2KOon3ZXTh5+yLuPMG+uIJ
 XmKLlmxHFfLIyggfFfZqesAZNiP0A8UL32qLG/oecGKpOf8tvRfCmF/mO8JMcwDF+d4W
 xmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688023776; x=1690615776;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uqzYTrdPD4vbemfyu8eoAm1tg2yh7fiY9wJETEZ7F28=;
 b=hMbNfxYM5j58GFqhVcvnGv8JF5a+NAjhkBsp07zdpxig5xJ4+amlB13zGWqquLxp7z
 2MKEZP+S8e/0pzaloHcsTVzoYyIUTaikZy7KfXgy238r/i1UGLfScb9nEs2ox2pHiiSC
 9/U9HIpBfkJBpBsgMSBkhSW0oTAsZsK2/EIl7Ff84fxSqxTfQ17DskC3ezFNusUcLY04
 FzqssD2Bb52U+SJn7gaPXJhWw6mTLANE8e1dCFsUzw/s0iATupkhacV92IMplvWHDeUJ
 s/LbrClPo7LbcpxflmwKsnfEjy0iOZ7Kci8M7GhkufOprWqnXCJqx0EEJaeKHuchILJP
 u1UQ==
X-Gm-Message-State: AC+VfDwNZ0tqoM9tSwNnHwn7+gQsQY4Yr2IgNG3xi1ZFd6HEZ12R/YdA
 UirQC7CL53HLaMMWokcERIQ=
X-Google-Smtp-Source: ACHHUZ7wnEL/1jDFaM8stFx/R8zjf53vc47nrJgpdJdvlQRMgALdgIJJYkkK09Oatpg45wKS1++dpA==
X-Received: by 2002:a2e:94c1:0:b0:2af:1817:26e1 with SMTP id
 r1-20020a2e94c1000000b002af181726e1mr24897055ljh.30.1688023775972; 
 Thu, 29 Jun 2023 00:29:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i23-20020a2e9417000000b002b6cba03427sm27286ljh.79.2023.06.29.00.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 00:29:35 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:29:25 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <20230629102925.71b5b6ad@eldfell>
In-Reply-To: <af4058fb-9744-87c8-bf9c-85cf78a97095@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <20230627105849.004050b3@eldfell>
 <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
 <54f194fe-ab7b-247d-600b-6da8f5c57dbf@linaro.org>
 <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
 <20230628103451.118c0d76@eldfell>
 <af4058fb-9744-87c8-bf9c-85cf78a97095@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GvcJ4bJU1YyhWucAGmk+Hru";
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
Cc: daniel.vetter@ffwll.ch, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GvcJ4bJU1YyhWucAGmk+Hru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jun 2023 09:40:21 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 6/28/2023 12:34 AM, Pekka Paalanen wrote:
> > On Tue, 27 Jun 2023 15:10:19 -0700
> > Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >  =20
> >> On 6/27/2023 2:59 PM, Dmitry Baryshkov wrote: =20
> >>> On 28/06/2023 00:27, Jessica Zhang wrote: =20
> >>>>
> >>>>
> >>>> On 6/27/2023 12:58 AM, Pekka Paalanen wrote: =20
> >>>>> On Mon, 26 Jun 2023 16:02:50 -0700
> >>>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>>>    =20
> >>>>>> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote: =20
> >>>>>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >>>>>>>> properties. When the color fill value is set, and the framebuffer
> >>>>>>>> is set
> >>>>>>>> to NULL, memory fetch will be disabled. =20
> >>>>>>>
> >>>>>>> Thinking a bit more universally I wonder if there should be
> >>>>>>> some kind of enum property:
> >>>>>>>
> >>>>>>> enum plane_pixel_source {
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0FB,
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0COLOR,
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0LIVE_FOO,
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0LIVE_BAR,
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0...
> >>>>>>> } =20
> >>>>>>
> >>>>>> Reviving this thread as this was the initial comment suggesting to
> >>>>>> implement pixel_source as an enum.
> >>>>>>
> >>>>>> I think the issue with having pixel_source as an enum is how to de=
cide
> >>>>>> what counts as a NULL commit.
> >>>>>>
> >>>>>> Currently, setting the FB to NULL will disable the plane. So I'm
> >>>>>> guessing we will extend that logic to "if there's no pixel_source =
set
> >>>>>> for the plane, then it will be a NULL commit and disable the plane=
".
> >>>>>>
> >>>>>> In that case, the question then becomes when to set the pixel_sour=
ce to
> >>>>>> NONE. Because if we do that when setting a NULL FB (or NULL solid_=
fill
> >>>>>> blob), it then forces userspace to set one property before the oth=
er. =20
> >>>>>
> >>>>> Right, that won't work.
> >>>>>
> >>>>> There is no ordering between each property being set inside a single
> >>>>> atomic commit. They can all be applied to kernel-internal state
> >>>>> theoretically simultaneously, or any arbitrary random order, and the
> >>>>> end result must always be the same. Hence, setting one property can=
not
> >>>>> change the state of another mutable property. I believe that doing
> >>>>> otherwise would make userspace fragile and hard to get right.
> >>>>>
> >>>>> I guess there might be an exception to that rule when the same prop=
erty
> >>>>> is set multiple times in a single atomic commit; the last setting in
> >>>>> the array prevails. That's universal and not a special-case between=
 two
> >>>>> specific properties.
> >>>>>    =20
> >>>>>> Because of that, I'm thinking of having pixel_source be represented
> >>>>>> by a
> >>>>>> bitmask instead. That way, we will simply unset the corresponding
> >>>>>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, =
in
> >>>>>> order to detect whether a commit is NULL or has a valid pixel
> >>>>>> source, we
> >>>>>> can just check if pixel_source =3D=3D 0. =20
> >>>>>
> >>>>> Sounds fine to me at first hand, but isn't there the enum property =
that
> >>>>> says if the kernel must look at solid_fill blob *or* FB_ID?
> >>>>>
> >>>>> If enum prop says "use solid_fill prop", the why would changes to F=
B_ID
> >>>>> do anything? Is it for backwards-compatibility with KMS clients tha=
t do
> >>>>> not know about the enum prop?
> >>>>>
> >>>>> It seems like that kind of backwards-compatiblity will cause proble=
ms
> >>>>> in trying to reason about the atomic state, as explained above, lea=
ding
> >>>>> to very delicate and fragile conditions where things work intuitive=
ly.
> >>>>> Hence, I'm not sure backwards-compatibility is wanted. This won't be
> >>>>> the first or the last KMS property where an unexpected value left o=
ver
> >>>>> will make old atomic KMS clients silently malfunction up to showing=
 no
> >>>>> recognisable picture at all. *If* that problem needs solving, there
> >>>>> have been ideas floating around about resetting everything to nice
> >>>>> values so that userspace can ignore what it does not understand. So=
 far
> >>>>> there has been no real interest in solving that problem in the kern=
el
> >>>>> though.
> >>>>>
> >>>>> Legacy non-atomic UAPI wrappers can do whatever they want, and prog=
ram
> >>>>> any (new) properties they want in order to implement the legacy
> >>>>> expectations, so that does not seem to be a problem. =20
> >>>>
> >>>> Hi Pekka and Dmitry,
> >>>>
> >>>> After reading through both of your comments, I think I have a better
> >>>> understanding of the pixel_source implementation now.
> >>>>
> >>>> So to summarize, we want to expose another property called
> >>>> "pixel_source" to userspace that will default to FB (as to not break
> >>>> legacy userspace).
> >>>>
> >>>> If userspace wants to use solid fill planes, it will set both the
> >>>> solid_fill *and* pixel_source properties to a valid blob and COLOR
> >>>> respectively. If it wants to use FB, it will set FB_ID and
> >>>> pixel_source to a valid FB and FB.
> >>>>
> >>>> Here's a table illustrating what I've described above:
> >>>>
> >>>> +-----------------+-------------------------+-----------------------=
--+
> >>>> | Use Case=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Legacy Usersp=
ace=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | solid_fill-aware=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Userspace=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> >>>> | Valid FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =
=3D FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D valid FB=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | FB_ID =3D valid FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
> >>>> +-----------------+-------------------------+-----------------------=
--+
> >>>> | Valid=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| pixel_source =3D COLOR=C2=A0=C2=A0=C2=A0 | N/A=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> >>>> | solid_fill blob | solid_fill =3D valid blob |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =20
> >>>
> >>> Probably these two cells were swapped.
> >>>     =20
> >>
> >> Ack, yes they were swapped.
> >> =20
> >>>> +-----------------+-------------------------+-----------------------=
--+
> >>>> | NULL commit=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
> >>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D NULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D NULL=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>> +-----------------+-------------------------+-----------------------=
--+ =20
> >>>
> >>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | or:
> >>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D C=
OLOR
> >>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | solid_fill =3D NUL=
L =20
> >>>>
> >>>> Is there anything I'm missing or needs to be clarified?
> >>>>    =20
> >>>
> >>> LGTM otherwise
> >>>     =20
> >>
> >> LGTM too. =20
> >=20
> > Hi,
> >=20
> > yeah, that sounds fine to me, if everyone thinks that adding a new
> > property for pixel_source is a good idea. I just assumed it was already
> > agreed, and based my comments on that.
> >=20
> > I don't really remember much of the discussion about a special FB that
> > is actually a solid fill vs. this two new properties design, so I
> > cannot currently give an opinion on that, or any other design. =20
>=20
> Hi Pekka,
>=20
> It was discussed in the v3 of this series, but we came to the conclusion=
=20
> that allocating an FB for solid_fill was unnecessary since solid fill=20
> does not require memory fetch.

Hi,

it just occurred to me that the pixel_source property could be replaced
with the rule that if a solid_fill blob id is 0, then use FD_IB. Or
vice versa. But if someone then adds a third way of setting content on
a plane, it would result in a chain of "if this is 0, then use the next
one" and only if all are 0, there is no content.

I'm not sure if that's better or worse. Both designs seem to have the
same backwards compatibility issues, and the exact same impact to
legacy SetCrtc ioctl. Maybe pixel_source property is easier to document
and understand though when there is no "if this does not exist or is 0
then ..." chain.

So, pixel_source is fine by me.


Thanks,
pq

--Sig_/GvcJ4bJU1YyhWucAGmk+Hru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSdMtUACgkQI1/ltBGq
qqdiohAAtO5ykRix1okiXt75at5s1H1a9Pi7N+i3A7DYHhvTr/8XVK0ZFbSIUJtM
ZIBbBjwSLfFenfxtpOIuHqbdkOnL/53+oZIj0sj6dWd8Q/9xShg5vN4pk/PDGXMu
h3ZODT43XNNOdr6QoDcRsSlMaXqBTZ/8pcb2b1g4eywf/C3mzPAQmweTwRdpFUNB
surcvG54bv0u2yXcYxb/k5bcRRgrlUHIl9ceKy39yQWRFWoJ0PsrcbyILv1fj5+Y
gWG3rNAtSv8X/d692YAyqQNLEgvOdmn2Tn4r4k1kkbrcExr1baiujMJBOBVQ1h9Z
LwHrnt1yEUqD+fNQCg8r9nbiInxpJwFPhd/RLvJNp0y7/jSOGR8KnPuz5D8mzekI
ueCYDn7zSMJEKUO+sbu34qN528wUtcEolN1wgLyHfjsyNrXB1KTWbTDXxMeePFJb
jHxMLMNafmRIOgwkaqKsWr3NyMhzGqizIK3e/RTzrpmzR8fVFcjnevRJman3AJPM
qDD4c9HT8Uo71FKighIxfd2Rkh9IwTHCfVbRxJKj69vxuY2ZnyKzGNWz0/argPzO
Lcize1A6T5sSjqruZgJZblBFyucc7Qp9iFBlu/6IVfQy+ArnjbKgyALsmCVyPTK9
rkdMi93xWvfDhhLBfIa5ZWV6S2Ggyzw6JQhGzMP/hPE9ruCfjkI=
=ve1K
-----END PGP SIGNATURE-----

--Sig_/GvcJ4bJU1YyhWucAGmk+Hru--
