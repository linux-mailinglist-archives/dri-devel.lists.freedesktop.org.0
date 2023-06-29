Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEC7421DA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E84610E3C0;
	Thu, 29 Jun 2023 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4F10E3BE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 08:16:51 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so618822e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688026610; x=1690618610;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EmOHoq0NjlGwfSf0KRWjr3mKnrAiaa4B35qKB9ys4Ao=;
 b=iOA6TSTdN/LICuUXuCAWhoO/ZgVKZEG1PXamJT/tZtOU60NVpz1WHrr/S8VeJxQEkN
 Z6k2+J0nzvGePUuFk3OTvr2AbY2UfpqjnV32pawRvRLGZRrXJDrff8hLCebp1FnAiVxK
 SZgutILSOmEB332XTvsdL0ddNeL9SkJST7oStWFV36TVOWzK5WaOljsMehZy+PbIOu35
 tj163VMqFqrxP3w5Q4QFiEjjV8SYqW7sMEp7ymAEMmRIa/IY304r7l0NDI1UiUbKU2Ww
 65i5bOUk9uhwsVkhIq0+GUiKafL/lgVr9C4qGHuS1XkDgannOvwdNBI7kuxZi0ClQ+dM
 LwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688026610; x=1690618610;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmOHoq0NjlGwfSf0KRWjr3mKnrAiaa4B35qKB9ys4Ao=;
 b=OgjwS+mHH4m//Rtj0jetO3wkCQmiKUm+ejs1vzF0OGNZ/9g6wW5WC4qOGqseTo3Mt4
 2sp0sSKGVIB5zRwvtUTQe4lsG7BiHP8sHQwjADIKRgMkS7byPl0I4txc7vB4ssnd1hhL
 /TWfpZTyxUf2EWbW6FeEjJ0XU7HkL96sB0iSzQOcunbo/Xq2g/UNQGbrwYoZMTtZN88W
 LTBpNy4LCtIH0xKQ3uZOBpjVeod0k0Z701LmbYW+FU9FWBuAJmarvThlJsh/DURzNc0q
 SGZ4PKve0HfU5vtC85Ck9db/emE5aL4Q76NkV4g9gQP8UyyelD++FLPjgUvoVVQUjxBp
 jfaA==
X-Gm-Message-State: AC+VfDxJz+CiHSfSH/p+ZF+rgZU6RGZKObKL24gOtKWzOi8SASsy0GKu
 MlNEUloDugOn6FHOCqS7y70=
X-Google-Smtp-Source: ACHHUZ6tWASMU5EElpUt5ZlYlbn1bz4zUto1S1Jx7VWBomKQZCNbqAbsZy7kkSl0UdfhAx+tqC/VkA==
X-Received: by 2002:a19:9106:0:b0:4f9:54f0:b6db with SMTP id
 t6-20020a199106000000b004f954f0b6dbmr16029162lfd.13.1688026609219; 
 Thu, 29 Jun 2023 01:16:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y23-20020ac24477000000b004fb745fd21esm1675443lfl.122.2023.06.29.01.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:16:48 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:16:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230629111645.01611176@eldfell>
In-Reply-To: <9e7a97481d17439f81cf1126e497bf720638c5f0.camel@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <ELiKi1uMIZlwdApTnf2UXxjOpykcSbJ8YC8EXm-kzkHNMKHzA6iYzXTvbyyAfhqf9LGkjQSt1QErJ1m6WwglWXg9Hmh3QsG6mV84jbYTLFQ=@emersion.fr>
 <9e7a97481d17439f81cf1126e497bf720638c5f0.camel@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ft.c2Df725j+Jci3gf90iAW";
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ft.c2Df725j+Jci3gf90iAW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jun 2023 16:26:37 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2023-06-28 at 14:15 +0000, Simon Ser wrote:
> > I think we should drop the CRTC_X/CRTC_Y properties for hotspot-aware c=
ursor
> > planes.
> > The drivers aren't going to do anything with these, and exposing them t=
o user-
> > space
> > makes it sound like user-space controls the position of the plane, but =
it really
> > doesn't. =20
>=20
> I think we talked about this before. The CRTC_X/CRTC_Y properties are abs=
olutely
> being used and they're respected when the rendering is done guest-side - =
the system
> will be pretty broken if the client sets the crtc x/y properties to somew=
here where
> the mouse isn't though.

Right, but it would be useful to hear more about the "why".

> An argument could be made that crtc x/y properties should be removed on t=
he cursor
> plane in drivers for para-virtualized hardware and instead replaced with
> mouse_position x/y properties that do exactly what crtc x/y properties do=
 but make
> it explicit what they really are on a cursor plane.

I suppose this is needed to support the guest OS warping the cursor position
while the viewer has a relative-motion pointer locked to it?

When the pointer is not locked to the VM viewer window, the pointer
sends absolute motion events? Which is necessary for the roundtrip
elision that the hotspot is needed for in the first place.

Btw. this is somewhat conflicting with what you wrote as the first UAPI
doc draft. I don't see how the viewer/host could independently position
the cursor image if the related pointer device is not also delivering
absolute motion events in the guest. Delivering relative motion events
would cause the guest and host opinion of pointer position to drift
apart primarily due to different acceleration curves.


Thanks,
pq

--Sig_/Ft.c2Df725j+Jci3gf90iAW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSdPe0ACgkQI1/ltBGq
qqePkBAAq39LgzJKZPtnhalugldeF+C71v5JbzG8tAEZyonfPNDzoKd0FD2MjP37
VztzRCxg80+FYDYd19ublli7RaT4Uv+IS10cXsYOcKs32aYHG7vSEcAYMj7J2oo4
KryE/P9BZWksGvMEj3nRHLdzjCRBn5uiQhTJLSLZwSnfuzZSU4ursKS5AtwRptuo
Z63Vo/jk4+qkdl2DEWiaNx2c4my5no55gMdNB2opyelOhv9G0uiBz3+PekHiakzF
a94oGFhGF1mqi6BRav1AveAlIOaZBuOkE3pNau7eAljUIODp+P2CPb0j0Frkt3CU
/7erbKYHBoybGZaYLMfqD4bBD1li7oIx4k/qfujqTNRCLjmhsIVMrtCYgrrx0Q0o
+zTC+dHn7hEVuN7mG+dPiKkw7tk7xaSW7g/3E4mK6BoOvL1pZSjLV0IFGdFh2600
Rvq6opC/8uOXjZchKMMeHNNAXBAWm6UcXkAWqaWSgFYniKjlqnFi0wigULR4psc8
QuF00JvBwRqOzhfl8d7F2Lk7aWAx3xvCrcZP3qhtzTvt0d+eek5CW13QVmwZJ1Tp
qlkJMNO8F4mJ68XBURFzCk3Mo8jRJSpid6d3PcZtKY0YW7IXv7WxMCBmRuUhm1uS
dwFrwD2j9j2KRacjvtf1uAb2VVgnfPVTok4iEJzaL/Xax4iYGuc=
=uVJO
-----END PGP SIGNATURE-----

--Sig_/Ft.c2Df725j+Jci3gf90iAW--
