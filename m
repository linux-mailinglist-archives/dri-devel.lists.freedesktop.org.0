Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724A358021
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5446EA58;
	Thu,  8 Apr 2021 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974A6EA58
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:59:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 12so2896026lfq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1tLH7jT4/CjmCaWJ0Xv1OI/zigPrCCc7P343N2RfD08=;
 b=Geazh417k94SqHvMTrB+olx6vfmwjm2kS4qSQDUX76mz+PYr3agPBm7Ja75MhcK80B
 r96CY1ZNKvgWsQLZH+fm0W6xBo8d5eTU6r7lM6JVPqscFnkYhnLzPy/aDJsAwOR30KNh
 EL5Av9pgbzs/8EKRfUDfHWqD16KEm3iL0YQ3rHXE9rNfwBj8RZoRECm1i7w//5qmuwnq
 u+gA6XFWNXAIuKWJYifELJX2PD+lzM8WpVH0VO+wRKarKsv92oSt2qa+tXXAYlKG/VpD
 ePUHy/mtmmSEStO8ihkOc7nJeS1rKI0rzyDA11Syu+YqluRcUUtVkb4h/hwv5gwXL0Vb
 9Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1tLH7jT4/CjmCaWJ0Xv1OI/zigPrCCc7P343N2RfD08=;
 b=DHvHKSNfN0QA1n0Uch93oPBb3ARHZt4cj4Z621Sj4WEXPmWpnsxcowbA7oigpoS34M
 AKQEXn0cwXeI77r8A8wRohYJ/6xmbWriOD/OPyuOpd2Lv7qQ4ZuZ11qnpkQY/a7LBKwV
 3NJijgPSvcNG58bNUECzAvADkkn5FwJXsok4uKWY15MKaUU4fY+hsoxwVc44ZbOzUDPl
 OHkQMSNsBp37OQrJSW/NY71UeAIUzTraEiFWWZ1l1lkjdsFQCFVTGG8HVgRUUdd2m0zg
 tMg+nWmgloiGveLPC4MhdZi7wOpcH/ydPwISslOp1J/gqpWbZfRh0YVVXr/0ju/BWX6R
 aBYg==
X-Gm-Message-State: AOAM5325kCAX+i+HMPqhTTx8kzG9DJG78CK4FJ3iI/lBPySOhh/FjjUA
 uNZ2U/1eRhRWOkwDSALRRgI=
X-Google-Smtp-Source: ABdhPJyol+ZFYIc7SO5Eu//buV6o3GgcBE2VSBrnAxRHGqxzjxjnRNz3sVoXEe6wll+umq43bjdA6g==
X-Received: by 2002:ac2:46d6:: with SMTP id p22mr5444310lfo.625.1617875972806; 
 Thu, 08 Apr 2021 02:59:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y10sm2702859ljn.103.2021.04.08.02.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:59:32 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:59:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <20210408125919.4a83119c@eldfell>
In-Reply-To: <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, kernel@collabora.com,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0297411702=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0297411702==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/03QYDu_JQcftuoyjobV/AO/"; protocol="application/pgp-signature"

--Sig_/03QYDu_JQcftuoyjobV/AO/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Apr 2021 08:39:10 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, April 7th, 2021 at 3:51 PM, Ville Syrj=C3=A4l=C3=A4 <ville.=
syrjala@linux.intel.com> wrote:
>=20
> > > +	 * To find out the list of formats that support modifiers, userspace
> > > +	 * must use the plane IN_FORMATS blob property.
> > >  	 */ =20
> >
> > Addfb2+modifiers predates the IN_FORMATS blob, so this doesn't
> > match reality. =20
>=20
> TBH, I'm inclined not to care about this edge-case. It's already
> complicated enough for user-space to figure out what's the right thing
> to do when supporting both implicit modifiers and explicit modifiers.
> Using modifiers without IN_FORMATS is risky, since a whole part of the
> modifier negotiation mechanism is missing.
>=20
> Maybe we can just stick a "since kernel x.y.z" in here to address your
> concern.

Yeah, or we could word it less "must", e.g. "The list of supported
formats with their explicit modifiers is advertised via IN_FORMATS blob."

We don't have to require userspace to not use the explicit modifier
uAPI if IN_FORMATS does not exist. There might be other ways how
userspace determines the explicit modifiers, like a Wayland compositor
advertising those format-modifier pairs that EGL can import. Then
clients use those, and the compositor can try to import those to KMS as
well. Maybe it works, maybe it doesn't (the same even if IN_FORMATS
exists).

IN_FORMATS just gives better chances of picking something that ends up
working.

The thing userspace *must not* do is to try to use the no-modifiers uAPI
when it has an explicit modifier. But do we then have exceptions for
MOD_LINEAR?

If a buffer has been allocated with explicit modifier MOD_LINEAR, does
it mean it is ok to import to KMS using the no-modifiers uAPI or not?

The other things userspace *must not* do is use the explicit modifier
uAPI when it does not have an explicit modifier, in essence pulling a
modifier out of a hat. It might be tempting to use MOD_LINEAR in that
case, sometimes it might work, but it's wrong. Userspace must use the
no-modifiers uAPI instead.

Right?

The point of these documentation patches is to establish the convention
that:

- drm_mode_get_plane::format_type_ptr is the list of pixel formats that
  can work via the no-modifiers uAPI, but says nothing about the
  explicit modifiers uAPI.

- IN_FORMATS is a list of format-modifier pairs that can work via the
  explicit modifiers API, but says nothing about the no-modifiers uAPI.

Is that a reasonable expectation?

Is it also so that passing MOD_INVALID to the explicit modifier uAPI
(ADDFB2) is invalid argument? Do we have that documented?


Thanks,
pq

--Sig_/03QYDu_JQcftuoyjobV/AO/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBu0/cACgkQI1/ltBGq
qqdnoBAAibm0LCFEkEMwzXB8u5pblgGUWnvKer0c0lAJqSA0ZiU9kASaUo+XiRSr
nkb9+fjSe7DiSad3GAu6dwLnIT0es1YW51m2S+ovXPeKFelq8y5zvN+uEQx07x/Q
RgKZ32TvsUHwr4BTN99JCWZ+FHFwLXHqcHHxEV8XuyxrSqNvOphMS6q+3k8HsfhU
ya++eXTCidjbt5R+R3aZf8XFCm2RtPONMmzUBBe9InvwNinJCgE0VPGGtQ/zjLnj
AoyRi+cM5zJX67+F0bonRyb8F+C9QP6G690VghDnf+fYd32g3Q4qT6MMTjgwSOg9
fC4bRrYfRYy6qLhZiElKddw7+qeQ8+mAKqRrrL/plMTQKFyHFR/k5rfsfUknW0hz
AR23bzijoXw6eU7pgLypokrgq7iywF7fiVbK4vDft3fIs9hWHv3nglzyWhZSJpLn
v7GBUutuhGT0PShwQpswy9aJvj1n730+MNBLbL8pphB4HMoB9XPQ/CUlcQiMzuYF
gmDgpAV2iKw2gxzrpSuYCAj37xPlbqIZLcFKFqEqNRpuGY3ReCxVRopzyUjtOwCv
aGzuCD9WdTPOzpJZghyrjlxMataH3nZVjFoic2uLaLDjwah9hd8X6iFi1B+Au+HI
4frZ7e/Omg4M6s5viTBbbTHCh6IQTsC1F//e7yv73xKrO9dl6Ss=
=mSTh
-----END PGP SIGNATURE-----

--Sig_/03QYDu_JQcftuoyjobV/AO/--

--===============0297411702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0297411702==--
