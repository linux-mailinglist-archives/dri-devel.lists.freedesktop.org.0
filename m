Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01916877FB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9401A10E18E;
	Thu,  2 Feb 2023 08:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E7810E136;
 Thu,  2 Feb 2023 08:55:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr8so3858581ejc.12;
 Thu, 02 Feb 2023 00:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=a1g3gv1Hl3N5LGdCYzOtD6z7Fcw+ZjAa3DdBevDx/90=;
 b=KlAmx0/mIVhQEKa15m/1jFeiDtDeTuOcNjdspIV4B7hUEWlLAuKE/qmtJ2/bzgXx88
 +f/KFCMkLmEFX1ax/KVc6NSv2vTbXtEswVjygwOxBTMmCy1lQImgtNg8bKnNPCsGsl29
 /q1/u3T94zPugP5oweHyfo1nOwdcwQQi5YG82O6LIYhKpIoPRHxodZp5JCwSgqp9Y5w6
 jgE0PEcbT9X/GZn4LG/zVepjWGHVW1JVrGlj9fgeRa94Y9KiQxP2RByLHkmb20AYqlMu
 dKwKCg8J2GGcp/R/5EqfOe+2ZBAFQfDejuNGNUXkmV8AoHl/bFFE+VT7y3Yb50qMQ42T
 KH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1g3gv1Hl3N5LGdCYzOtD6z7Fcw+ZjAa3DdBevDx/90=;
 b=dpc/5QufGCM9IB89CfLHhWsREcZArBy0wqzrtkujEEh4WXe3yQvIKIobupEbS+sB/J
 nftpYLiZrYyMaWoXJkh1x2KPMU+QFVVLzuaEqdW+jqdLtTDIIvo6rn3LWIoj/qZ/6wnr
 77vwKozGZ7TMcWls4pe4DniQ/rOxxRa41EJ3SQyxctLzAcAgJZlYm/I3ZVSv92lVqhNo
 eS+sPktaLzl/JEVxo+Y1pE/LOSZYkDXih9kezX52Ik5+Q44nce6y6JsXYwPRzsZPD0Om
 zm06rXcZhfJqp3+slnEMvs6eXBd/x4QtaqnGhcKJYLC3OJuyHRto0gI9A72/kwDSET6l
 /Akw==
X-Gm-Message-State: AO0yUKUBA/pr5LpnmiW8ue80Cy9iBKmYXSmiUY/ImNMcb3o87tykeJv3
 u3dbOJEwkPEzUAXwc/lzdeA=
X-Google-Smtp-Source: AK7set+qNBThjibhYcfSVvB7FZLi/Q/bWBADekmsnbkfu5rFaNR1cyS2M1EnGvRnPVwhN0REyqVO8g==
X-Received: by 2002:a17:906:f159:b0:859:1d78:765 with SMTP id
 gw25-20020a170906f15900b008591d780765mr5031053ejb.11.1675328149168; 
 Thu, 02 Feb 2023 00:55:49 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05640210c200b00499e5659988sm10755157edu.68.2023.02.02.00.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 00:55:48 -0800 (PST)
Date: Thu, 2 Feb 2023 10:55:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <20230202105537.1ae1f459@eldfell>
In-Reply-To: <5376994b-99f6-0f48-139f-6e622a8b0778@quicinc.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
 <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
 <20230131131326.75b43152@eldfell>
 <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
 <20230131144913.5ff840dd@eldfell>
 <5376994b-99f6-0f48-139f-6e622a8b0778@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S5Rbc_MESbWzj8b23qGYLI8";
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/S5Rbc_MESbWzj8b23qGYLI8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Feb 2023 18:06:41 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 1/31/2023 4:49 AM, Pekka Paalanen wrote:
> > On Tue, 31 Jan 2023 11:21:18 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> >> On Tuesday, January 31st, 2023 at 12:13, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
> >> =20
> >>> On Tue, 31 Jan 2023 10:06:39 +0000
> >>> Simon Ser <contact@emersion.fr> wrote:
> >>>     =20
> >>>> On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@g=
mail.com> wrote:
> >>>>     =20
> >>>>> indeed, what about simply using a 1x1 framebuffer for real? Why was=
 that
> >>>>> approach rejected? =20
> >>>>
> >>>> Ideally we don't want to allocate any GPU memory for the solid-fill
> >>>> stuff. And if we special-case 1x1 FB creation to not be backed by re=
al
> >>>> GPU memory then we hit several situations where user-space expects a
> >>>> real FB but there isn't: for instance, GETFB2 converts from FB object
> >>>> ID to GEM handles. Even if we make GETFB2 fail and accept that this
> >>>> breaks user-space, then there is no way for user-space to recover the
> >>>> FB color for flicker-free transitions and such.
> >>>>
> >>>> This is all purely from a uAPI PoV, completely ignoring the potential
> >>>> issues with the internal kernel abstractions which might not be suit=
able
> >>>> for this either. =20
> >>>
> >>> I mean a real 1x1 buffer: a dumb buffer.
> >>>
> >>> It would be absolutely compatible with anything existing, because it =
is
> >>> a real FB. As a dumb buffer it would be trivial to write into and read
> >>> out. As 1x1 it would be tiny (one page?). Even if something needs to
> >>> raw-access uncached memory over 33 MHz PCI bus or whatever the worst
> >>> case is, it's just one pixel, so it's fast enough, right? And it only
> >>> needs to be read once when set, like USB display drivers do. The driv=
er
> >>> does not need to manually apply any color operations, because none are
> >>> supported in this special case.
> >>>
> >>> One can put all these limitations and even pixel format in the plane
> >>> property that tells userspace that a 1x1 FB works here.
> >>>
> >>> To recap, the other alternatives under discussion I see right now are:
> >>>
> >>> - this proposal of dedicated fill color property
> >>> - stuffing something new into FB_ID property
> >>>
> >>> There is also the question of other kinds of plane content sources li=
ke
> >>> live camera feeds where userspace won't be shovelling each frame
> >>> individually like we do now.
> >>>
> >>> 1x1 dumb buffer is not as small and lean as a dedicated fill color
> >>> property, but the UAPI design questions seem to be much less. What's
> >>> the best trade-off and for whom? =20
> >>
> >> By "real memory" yes I mean the 1 page.
> >>
> >> Using a real buffer also brings back other discussions, e.g. the one a=
bout
> >> which pixel formats to accept. =20
> >=20
> > Yeah, which is why I wrote: "One can put all these limitations and even
> > pixel format in the plane property". It doesn't even need to be a
> > variable in the UAPI, it can be hardcoded in the UAPI doc.
> >=20
> > Please, do not understand this as me strongly advocating for the real FB
> > approach! I just don't want that option to be misunderstood.
> >=20
> > I don't really care which design is chosen, but I do care about
> > documenting why other designs were rejected. If the rejection reasons
> > were false, they should be revised, even if the decision does not
> > change. =20
>=20
> Hi Pekka/Daniel,
>=20
> Looks like the general sentiment is to keep solid fill as a separate=20
> property, so I will stick with that implementation for v4.
>=20
> I can document the reason why we chose this approach over 1x1 FB in the=20
> cover letter, but to summarize here:
>=20
> Allocating an FB for solid_fill brings in unnecessary overhead (ex.=20
> having to allocate memory for the FB). In addition, since memory fetch=20
> is disabled when solid fill is enabled, having a separate property that=20
> doesn't do any memory allocation for solid fill better reflects the=20
> behavior of this feature within driver.
>=20
> We also wanted to avoid having FB_ID accept a property blob as it would=20
> involve loosening some drm_property checks, which could cause issues=20
> with other property ioctls.
>=20

That's fine by me, thanks!

> Also, re: other plane sources -- FWIW, I have tried implementing a=20
> source enum as Ville suggested, but ultimately dropped the change as it=20
> would require userspace to set properties in a specific order (i.e. to=20
> enable solid_fill, userspace would have to first set FB_ID to NULL then=20
> set SOLID_FILL).
>=20
> I'm not sure how much of a can of worms that would be for userspace, but=
=20
> if you're fine with having that as a requirement the I can re-add the cod=
e.

There is no ordering between properties set in a single atomic commit,
they all apply at the same time. Therefore the kernel code needs to
consider the whole new state set as a single entity.

If userspace splits changing those two properties into different atomic
commits, that's a userspace bug. It would not work with atomic
properties already today, where you need to set half a dozen properties
to update one KMS plane.

The only complication I can see is the legacy KMS UAPI, non-atomic.
They will change FB_ID, but they cannot touch the solid fill property.
I guess that needs to be special-cased somehow.


Thanks,
pq

--Sig_/S5Rbc_MESbWzj8b23qGYLI8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPbeokACgkQI1/ltBGq
qqd8qg//WHiS/LMMdiZdNPbVPI6QsrAKY4jtQiqBeD3WqKukwiYewQWbUm9iHOVo
uk25IRahB4MVC/YGQupvp7LJPskLwoMIrCrh5EkVto+zag2Q/3MmkCU+EuUaVxZm
ZFOxiQtkZRistBfzZzJmUbnh069tRoe3nrPanhJOh+euJJTjb8z+t1eWCFOxQinJ
Bn4XVhCf2zdvMhlZKl4sLCHvaQ4lNT2VEvxxecQ6Lq6E0f2bcpXaBqlbsUfxDYBV
QJ8cJbNTTNmuEkHwmj6igTnieOmydRiyN+Hmt76lHc3ziGjs63A3y94Bc16QEn/r
s1Xfa+2XAOTpqk+9FyzvkbBm4DwOj1ji1aS+Pnnq3zt7923qj4kRKV0sKnyfXA6o
K5jwUsT96xuSo7l0ynd68r0bZLYmZZtykP2D7w4y0tCTBLtPWY5HwEiYdec1SPhA
mLMhSUQTRXqqkUijq7s5G/M+1I8sZ7aiadRjULc8NJ0I3xTaxY0yt19SWCkPajsT
ZsjQ8RGEHspFDjX9ssL3/nmW3rHvmgJOLZbjAW41GtzwJJpwlHHL2g5OmLhmE7AN
rXpbTq3WoQOE3TLyh5rRixATbXXtFWZ/e5BuONzknw+08ESOYYdBq1B/qjpKu+di
dB5wfU18zBBo6LE3J/MJePxETmELEjI7F+GKkW9iRhEJgz9CuG8=
=zrah
-----END PGP SIGNATURE-----

--Sig_/S5Rbc_MESbWzj8b23qGYLI8--
