Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C406A58F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247F10E692;
	Tue, 28 Feb 2023 12:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392810E692
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:24:37 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s22so12899048lfi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 04:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677587075;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=og+hVW+4s1VR60Bgrgn2cQR3lBuJA2wWgUJV+sW8qgQ=;
 b=G1CVYvRbTJqUI9yI5Dke+jdEkTyYOgZwbWHb8ZpMXG47PnkBs9wrEhuetX/dxmHAm4
 PLhS9ftnyZMhFEImWIv8WTH6ZFb/kSdZqvhB97G2All0cPaBcGiDtucd9/mJyicJSiPo
 KpwOXq8YJoXKAQcX3Vzr4N/YH6x5wK9u0tmKnTcPsQagHAspFcAAwEhTiN5gRJw1sPjb
 aL0Cle07SUU9ldFU8L3N0i1iqNzhpTfU4fBjR+RemUXo21Mll2AkrN5PCvuiBpR/PuDW
 RuiyJ2NZpSdgsNb9FkodIMZGnFCiEF/AW7VIhqb0ceqPbmoVlYCeAinTy0RpQixO4F6q
 uF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677587075;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=og+hVW+4s1VR60Bgrgn2cQR3lBuJA2wWgUJV+sW8qgQ=;
 b=fFdM8Hynz1Jwzvoe61SDw47skzoDHry4VKfYlE9V337j8FHzxZbw1m3i3s6kxAnE12
 TwjOSmXcZQ/TbRX4d+g58dcLvWncxScmpUbfmO+OrEwUYlCNzyerPgq6s4T6ygsbcsvC
 uPLIE08KZr6qmYnT1DJUmID2fK+xs3Ffdau/3udeVMweRlNS49HZgLC2Nq++d3QsE7se
 vfVnmlljRuMZagpKq+rbhcCvO2Nd3pt2xykrZmSX4zbMTyCh/1cYKgvgDF2yGh5JdpjS
 gIWILgqCXoDRhTiDe2rlBcq3g8Xs5Vot+qBVT5YMws34CopqESo+DGsfUO12inqRUxQN
 I6SA==
X-Gm-Message-State: AO0yUKXXPdoTPyC1+/A4y8w4saBAjei8wuqsqshgoVaRndOnM+wIaDo5
 fmlLBYsDHSN/28kkvPBAflo=
X-Google-Smtp-Source: AK7set/LAbfSuT63IVsXatYyPwnGH+6jAw6JZ0caOFbMIZWijuUjbMkri4aVuXRxbSQ7aYbk8RvEJA==
X-Received: by 2002:a05:6512:1024:b0:4dd:a445:e696 with SMTP id
 r4-20020a056512102400b004dda445e696mr754710lfr.45.1677587075150; 
 Tue, 28 Feb 2023 04:24:35 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p9-20020a2eba09000000b002934ea0def9sm1143904lja.140.2023.02.28.04.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:24:34 -0800 (PST)
Date: Tue, 28 Feb 2023 14:24:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <20230228142423.08213444@eldfell>
In-Reply-To: <Y/3lcEq5y2SrUYyA@intel.com>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell> <Y/3lcEq5y2SrUYyA@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ckH45mshI1PKs.mHzg7NpRD";
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
Cc: Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ckH45mshI1PKs.mHzg7NpRD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Feb 2023 13:28:48 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Feb 28, 2023 at 12:12:22PM +0200, Pekka Paalanen wrote:

> > Oh! That would be really good to mention in the doc. Maybe even prefer
> > plane props over this? Or is this for analog TV, and plane props for
> > digital TV? =20
>=20
> Plane properties would be pointless for this. CRTC properties might
> make sense. But what is more accurate kinda depends on the hardware
> design.

I meant the existing plane properties CRTC_X,Y,W,H. They can already
describe e.g. a primary plane that does not cover the whole CRTC area,
which is essentially the same as margins, scaling included even.

> Some hardware has scalers and all kinds of fancy stuff in the=20
> encoder essentially. Quite common in old TV encoder chips.
> That's pretty much where these properties came from I think.
>=20
> And eDP/LVDS/etc. also do scaling in the connector in the
> current model since that's where the 'scaling mode' property
> lives.

Ok, that makes sense.


Thanks,
pq

--Sig_/ckH45mshI1PKs.mHzg7NpRD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP98ncACgkQI1/ltBGq
qqf+JA/5AT4AJDsg0YFB+fF6h1ZWB9Zn+r7uzx3YVe1L0ydlMRQlSAnFUNpQXYvG
NDU/Tn+/RSkscODbERI57ikU/a+xrZ2RHTnJxnyT1yjERSSYz/qIJI2QwHw+SpgU
Pj66yBI1VX+pRTiG18kEiVJiSRhqFwAys+zcuwyG6N2E3TKcpJD9oYN+iG5QfR9J
Exdfgi/NQxIqihqkFCLUZI5bcH5MUb83hZnA0hmuPziM9oc+zUNm/3ceA9tHDP6Z
ynba47EPR1s7RgfPfFFAwlY6Js7NVCc7rOQIORUUlQsDGEAwY+WKAOughpdUsBpB
AzR6HkWGYXAPwFl0MatQJlK0ZEQ35XzxvWUPYPyYNnJ+tEpoOcU+SyRfpZ6zmZNg
Cl0R61SW6irTgKdQifzK73GTOxc5vd7n/Nc1cqQ9aIx/b+h7E9ycCDm7CcnMMgUf
VdPH8C58FrgzNckr3akhI9R3XhbOa2ihcVRB3N42FoK7TpgxCp22PC5APpaWLHTt
0hkX219eP+W+/wE9/A20f/Zf2E5Oen1lqr8+92Bmqo5tqK10KlecoIf6mcbT4uG8
vYBFs+Q/nFqTOLDbw3EnqUcJDpJDM/RLeXJS7KMVbHp8r2x2YuJ3Op6a/XKNQVa6
4kjGN7RRkpWPal0vf0Jb0SQd8d2xfU6jeGL6V6CL6a2Tjjdc/4E=
=chUc
-----END PGP SIGNATURE-----

--Sig_/ckH45mshI1PKs.mHzg7NpRD--
