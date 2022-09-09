Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BBF5B39E5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5C310ED6D;
	Fri,  9 Sep 2022 13:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6C710ED6D;
 Fri,  9 Sep 2022 13:54:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bs13so1910343ljb.8;
 Fri, 09 Sep 2022 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=fiPO+CKZGk0WuU4z4Ak7rEYkwLgCpBf6u6KBQdKd4Cw=;
 b=YnnH39gHzLKvn/zggnhYQbSJyEMH533YVHY/Rv9RILqU27VrYLmhCC+WD3ENhBNWL9
 RLvNheyyFHKZEBOL0U+/0rrdp5/d03nDkPUTiMqap+ak5XNywg9koaBhLx4IM7f2Jtew
 xJNqfS9YYWO2cdG540lKS+efSkb1wzHWctEdkPnh9jIgIpyvOdlPP2Uprcd3twDZ8sFP
 2NpJGPWdZF7BKjZyga6xqOFCxE8+rtBFwyFwySQnpF15ns17Fi0GwljkHUEl//QAoXrj
 4ScbhjysSzBF++DCrieEVBwPbEK0WV1yC25P+QWWSnLzB5lQUeDgQkUXw+ylBo6Lbzw8
 boyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=fiPO+CKZGk0WuU4z4Ak7rEYkwLgCpBf6u6KBQdKd4Cw=;
 b=Ta0jmi2E7s8uL5SdKgbZVVItHqCa7pOCp/G1pIiFEbqvyu9GT24DgdHCwOmjDRlZt/
 ovqH2W4rFyoWl5AZldsIqVcCYi8loWldQ+oibDHHrMgFN8XnRj1rzeOzE6h0mMk5DWsc
 /pIC9r0Rlf7aMzxV/b55lb0DrP/N1hf9iNFcs4wGuE6m8VC3e/Tbvj0zTo/c+7rLngsZ
 ioPjJAAwmrANKuGBJZwlZ9M7jOWM/sOAdIbpXnsabXMfOJYMx9EUrP5otunQNJH21tlO
 8u2/uCAI2HGxaMVr0F75hjluP+lTxEJWf9cotHcIdG5v+q8ecxlj1FuRS7Ouni1tNXaE
 qOdw==
X-Gm-Message-State: ACgBeo36o/Q8hbULr3tRNpxISD3C8UaFMYXPpAoUj7n5sYmWSYYwLW03
 qtIoIeKM9WEmsQ+mx9htDuI=
X-Google-Smtp-Source: AA6agR4cRFp/C3mCKxWNl8ZDMRh7C/sLuHaTFT/1t0+g/pnhMouw1RQ3UfRwr5ZIV3WrynmiWmw+Fw==
X-Received: by 2002:a05:651c:884:b0:268:dc11:cc1a with SMTP id
 d4-20020a05651c088400b00268dc11cc1amr3772065ljq.466.1662731637960; 
 Fri, 09 Sep 2022 06:53:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s28-20020a056512203c00b00498fe38ea1dsm82032lfs.300.2022.09.09.06.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:53:57 -0700 (PDT)
Date: Fri, 9 Sep 2022 16:53:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20220909165346.51e92499@eldfell>
In-Reply-To: <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/75J.7BvgGTcW./iD3HEU4mI";
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
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/75J.7BvgGTcW./iD3HEU4mI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 09 Sep 2022 13:39:37 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, September 9th, 2022 at 12:12, Hans de Goede <hdegoede@redhat.c=
om> wrote:
>=20
> > Phase 3: Deprecate /sys/class/backlight uAPI
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Once most userspace has moved over to using the new drm_connector
> > brightness props, a Kconfig option can be added to stop exporting
> > the backlight-devices under /sys/class/backlight. The plan is to
> > just disable the sysfs interface and keep the existing backlight-device
> > internal kernel abstraction as is, since some abstraction for (non GPU
> > native) backlight devices will be necessary regardless.
> >=20
> > It is unsure if we will ever be able to do this. For example people usi=
ng
> > non fully integrated desktop environments like e.g. sway often use cust=
om
> > scripts binded to hotkeys to get functionality like the brightness
> > up/down keyboard hotkeys changing the brightness. This typically involv=
es
> > e.g. the xbacklight utility.
> >=20
> > Even if the xbacklight utility is ported to use kms with the new connec=
tor
> > object brightness properties then this still will not work because
> > changing the properties will require drm-master rights and e.g. sway wi=
ll
> > already hold those. =20
>=20
> I replied to this here in another thread [1].
>=20
> tl;dr I think it would be fine even for Sway-like compositors.

Furthermore, if other compositors are like Weston in their KMS state
handling, and do not track which property has already been programmed
to KMS and which hasn't, and instead just smash all KMS properties
every update anyway (it's also great for debugging, you always have the
full state in flight), anything changed via sysfs will be immediately
reverted.

Therefore I think there is a high probability that the external or
sysfs controls just naturally stop working anyway, even if the kernel
does not remove them first.


Thanks,
pq


> (Also note the utilities used right now are not xbacklight, but
> brightnessctl/light/brillo/etc [2])
>=20
> [1]: https://lore.kernel.org/dri-devel/bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe=
1wMd_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=
=3D@emersion.fr/
> [2]: https://github.com/swaywm/sway/wiki#xbacklight
>=20


--Sig_/75J.7BvgGTcW./iD3HEU4mI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMbRWoACgkQI1/ltBGq
qqfMfhAAjziPK0D4Akgfhx43sP5NYIdbofs1QLmC7f1whzvnv0uFpv88d2DVN1Uf
vY3zRApBc7uEVYbfsuuBbGuV70ny4BA6F0TxpBXVtZb6Hx3BnZCXZxpWEbVaGnK5
WKcRWFcv9NcklFiNmZbvB5SXUVULUj28f4cOukw5QB9fX2x1IbSV0Mnh/93vwWb3
7Jdbe7M1M4Upve+umksCpf+qJlb1+IjRnzioRVg604ZyECZWRFw7NMJ2YeIT6570
Tfm5hWjESMg7FwyKiEuTsMDYPgvxYp1ezX3uo6hriVPG/eIqxWk6JZWBsRqLtN19
NXAWg5MM2B63WhgcTqlCuFt1B5kS271E7e3cbNlCDMG+SYK4QjtRTtYCjfywpJPi
ir3PgrpqF9yPuT5juwNtYpXGndhZOVvSTgEFGHBBGm1YQXJ3fRDiXrydOZjKlOC/
oRIgznLLWE1EKz5bwZocdaEGc1K8DrRn2QXtV6VnTI5MWrtEwfp+9WWE1YjoVX1e
Z2EjKxmxvVf6x1MkbBXadhdUeydfxzpYe9jjbTOwHvACfAfzP/urHarDPRaNOEuY
8WU1giYrOI/uS35zOMxST1rcGDKEieQqooJXo+5xasjIA10qBvhovHykMEqnlTOA
Owmnq+D2XoBF+n2+Q3ztMOAJ8XJMTtwcGlVtxf915/SnxbgsJ6c=
=eZp4
-----END PGP SIGNATURE-----

--Sig_/75J.7BvgGTcW./iD3HEU4mI--
