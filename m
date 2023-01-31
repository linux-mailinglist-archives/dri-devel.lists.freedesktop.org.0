Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A180B682B32
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C310E327;
	Tue, 31 Jan 2023 11:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4C10E2A1;
 Tue, 31 Jan 2023 11:13:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ml19so16981333ejb.0;
 Tue, 31 Jan 2023 03:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GK2x4a0LTuNtUideZJDqdEqWhjW+JT16RVerAwzqfm0=;
 b=JdQWPM8Aop/at60u0nq/7bbftwTDo35Xr8U9VXHDZJ/AprjkgheKFcvyl62AsqbMwv
 v7TkvpB6Nhh7I5U5/LOpUWb1ej8MpobyKQP5c6uefwSbpI4/uiqNG6vt4OZJgfvJtibR
 kL3QuEHsNiyzli63XK4qvN4lesEb6jAQaBd2pOavYAC+6BAtSS71VrQpimtnX11HzPe8
 G+0/HPZPgGGlUd+7EwcoVwKnM+0xIyMVONCLVNhM+nHjam1X2drvKj7CevVhxyq6rC9N
 9MB8GzCCkludcivCpEP/+n80ECOIcyBQnyuv0Qkvvev853Z+Q7vtWJiStFO5U22JBW/i
 D6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GK2x4a0LTuNtUideZJDqdEqWhjW+JT16RVerAwzqfm0=;
 b=z4mF06ujW873ZidzOyA0OLJTezLPXXjws+iyjPPQ+RScENl6q5HO/t4DVqB66KTtRB
 xJQIwQsmpPWaw7uIr9/SYL5f56ffazrg6tcf+LcxcQKrNYhqSiOCQHV9evyKajX4M2Ls
 nhoMNlaOTbxrzh6IK3YX/qjjb2nwo8u8R4nr8ewuxBq9fOr6N/7U5HvQ1pIHY6IjMGhZ
 cK9h/O+36p62rlQ0WlThjLx4fzDh3Dqbu0QkSQzfSdq+/PfkuWreWbQpEXakhlqBoYYp
 nc5lSSZPsXOOxq7ERGpkHXs4cyM2GluyaUNEHnL8hMef77Rv7T65vWVKEr9qcMNAzORt
 CLoQ==
X-Gm-Message-State: AFqh2kryd+W24CNzm28YaD0vk66flz+janDz33ThHvlxnX7kNPV2YhuP
 VId65hMITHqs+PeSQ5nPcXo=
X-Google-Smtp-Source: AMrXdXuxvUXpSvB/itKw3mminFkG1O9rmTsfhW77Feocc6IG3ZGLOQkdjFeWpSH4rBaYqKClmWm1XQ==
X-Received: by 2002:a17:906:299b:b0:84d:4394:e8e with SMTP id
 x27-20020a170906299b00b0084d43940e8emr51692941eje.41.1675163618480; 
 Tue, 31 Jan 2023 03:13:38 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o5-20020a17090637c500b007bff9fb211fsm8362668ejc.57.2023.01.31.03.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:13:37 -0800 (PST)
Date: Tue, 31 Jan 2023 13:13:26 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <20230131131326.75b43152@eldfell>
In-Reply-To: <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
 <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9ITwuKw2xysM+43.HsJ.nbx";
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9ITwuKw2xysM+43.HsJ.nbx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Jan 2023 10:06:39 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
>=20
> > indeed, what about simply using a 1x1 framebuffer for real? Why was that
> > approach rejected? =20
>=20
> Ideally we don't want to allocate any GPU memory for the solid-fill
> stuff. And if we special-case 1x1 FB creation to not be backed by real
> GPU memory then we hit several situations where user-space expects a
> real FB but there isn't: for instance, GETFB2 converts from FB object
> ID to GEM handles. Even if we make GETFB2 fail and accept that this
> breaks user-space, then there is no way for user-space to recover the
> FB color for flicker-free transitions and such.
>=20
> This is all purely from a uAPI PoV, completely ignoring the potential
> issues with the internal kernel abstractions which might not be suitable
> for this either.

I mean a real 1x1 buffer: a dumb buffer.

It would be absolutely compatible with anything existing, because it is
a real FB. As a dumb buffer it would be trivial to write into and read
out. As 1x1 it would be tiny (one page?). Even if something needs to
raw-access uncached memory over 33 MHz PCI bus or whatever the worst
case is, it's just one pixel, so it's fast enough, right? And it only
needs to be read once when set, like USB display drivers do. The driver
does not need to manually apply any color operations, because none are
supported in this special case.

One can put all these limitations and even pixel format in the plane
property that tells userspace that a 1x1 FB works here.

To recap, the other alternatives under discussion I see right now are:

- this proposal of dedicated fill color property
- stuffing something new into FB_ID property

There is also the question of other kinds of plane content sources like
live camera feeds where userspace won't be shovelling each frame
individually like we do now.

1x1 dumb buffer is not as small and lean as a dedicated fill color
property, but the UAPI design questions seem to be much less. What's
the best trade-off and for whom?


Thanks,
pq

--Sig_/9ITwuKw2xysM+43.HsJ.nbx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPY99YACgkQI1/ltBGq
qqdaMw/8D99ktVaBgznkqs1HpUTsw5cgcFCRAEPpArpvW5eGELD+/kzRVBTsl0+I
szym6fsbTvSLH/v8vv3NYepcAGxfAR4h08G7h35YY0gIAOhNKTbZGGY0mVC7gGDG
U7IRyOgF9MZ+geLTMTeQzPhMEUcU3R8FiwiEtxuOHsqE7fIYz8ZPJ9xG1TYe0o9o
f0EHtP9zxC5HVph2KsYPRPwSEIaHJAp1jGF9KbXvEe7Aenz2DVFT7H3Ir3rZmWtY
gpPkiiqRxwIQXqKAHqmdd16sTOfhrYnTvfVSUFlpwz3ayQwJOE3vhP0yunKy8n6G
cilOtm0XcXwxEsNTfIkz+w8GseYBtr96H/pZc0+w6/Odeyj8oRjEnjkgSNh+KUwU
yOBcp6Nx1cpKNhMGEzJY64N384zLEiRDzlyOfMv79B0G+nnRybR46UbP0UyEMl0/
U0jsiKb2ScdASf+DdxDTkkGLIPRsT9MBlA1eoXFos7uLCkPp/2hxwG7LMCZc+FZN
WPGEWHvKB43wRyJX77nvONChEUBiND9AXV8lT5dHcztWedclOraSEQEmHa0H/+3z
5VBHyyP8MEJbw42jGGMDPXxP/axjpPPjieBf1OkHaTWgL6qAiVHfweU5lLdJ020k
5Du9/gwj2Ehkfpo0LuMRsyDiNH/RrkFy3CFvIv3KhXadK9vxlpY=
=zfMB
-----END PGP SIGNATURE-----

--Sig_/9ITwuKw2xysM+43.HsJ.nbx--
