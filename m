Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D325F606
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 11:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C7F89ECB;
	Mon,  7 Sep 2020 09:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A2189ECB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 09:07:34 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so15206009ljo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=N2uDttwKyoIrpuH+hXa/tBL0NbZuZcKkuToTjFlqOVs=;
 b=n58W3u6PYwzJYuucenJKBR7IMSesTgEB07nYk2PK6+Ulv6x6Vemnt6wHcY5wO6Uwkp
 MNkfQR3JB8qp6q0WRVAvDBWMsU5Vz3B0Ci+JpBF4PjljJGBiKQRBOfNi7Fvv+9Od29Uy
 afqrjLfcM55KRQLpN8shMWYSiVIiUSMDTrYlsvYv0OMNXTLEl8pv8xM+/L9pn/kSiZWl
 EfiO/Y+Yovqupfa0KRtn6O9DOnn1OvEk+amJr/SMKqu4oFUmenhahWsgWCnE24TYaBk+
 pS98T94JWFe+Z6qa0FH7lfRV58EKZrCTUFBvJwNM+uWpBjQ3XhKlXcmvKB3ROC9lKdcf
 ZSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=N2uDttwKyoIrpuH+hXa/tBL0NbZuZcKkuToTjFlqOVs=;
 b=QA/drpZPI7XNY3MtxIqyYQDR7avpctWv6/xWp+rokb2B80aOQ6fKOczclkEGQvOntJ
 j/bG/LyyzEaPJ21MZCTemsYd18hYCkoxfrsYoeUptW3ZlsgiIF90oYb8dT5fnnE9F0D+
 RyaYkI1Bnlay3quXMltAX8kThsvBYaA3j0kbvN2kYnpuEyF7F1bibJcIE3k7t9OBNUau
 L1Ux73XUauvH2JU0ofN4P7wAW15lh+HqPZxh+KmTVRc+MyzTAFZpvsNDV8lDGoJYDTpr
 wAzHNt1QGrkInhHXTNJTD/zuI85myIRqfl03FZnsl80eVP84bB5dAsassVc9HAJ1Ksdi
 GR3Q==
X-Gm-Message-State: AOAM533hRtGUv1Rpk9XD2gTgUPiytpqbdaQ8h6mHvSwJNfbMwVgXWjSR
 oMYZBhBLu9eqywEDBDa4imo=
X-Google-Smtp-Source: ABdhPJzYuQKlWnGWh39NhSnFYcOZFf8Y74UQo+5HW1MDo2aWzlP+VGnliVLuPpPrk6B5SQbAcN/q3g==
X-Received: by 2002:a2e:575d:: with SMTP id r29mr2470859ljd.4.1599469652572;
 Mon, 07 Sep 2020 02:07:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b11sm6840930lfo.66.2020.09.07.02.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:07:32 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:07:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required
 for fb
Message-ID: <20200907120728.65d8735e@eldfell>
In-Reply-To: <20200907084137.GU2352366@phenom.ffwll.local>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
 <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
 <55Yt-xRb-j_BnxyoixpIT6a4aOd2-SMetoyIVRBwOBFc98R5A3-gAcYcFo5Sjj-7TcvLdy3669gwn5eCOoOi85A2MlZaUwqpQETei77426A=@emersion.fr>
 <20200907083133.GS2352366@phenom.ffwll.local>
 <jjQkalouYz08npkZ2r2MPoXoGML4DkABCtPEZYJkHgR9dGOQCcICe_oq_rpBVnzkpxK4SwDXY9gF8zlhfMWqiWoHHpP5N08nUmo-tA3jIW4=@emersion.fr>
 <20200907084137.GU2352366@phenom.ffwll.local>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Content-Type: multipart/mixed; boundary="===============1259293400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1259293400==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p+bpVf6ZMdTrv+gVsoC7Ylp"; protocol="application/pgp-signature"

--Sig_/p+bpVf6ZMdTrv+gVsoC7Ylp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sep 2020 10:41:37 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Sep 07, 2020 at 08:37:31AM +0000, Simon Ser wrote:
> > On Monday, September 7, 2020 10:31 AM, Daniel Vetter <daniel@ffwll.ch> =
wrote:
> >  =20
> > > On Wed, Sep 02, 2020 at 02:59:49PM +0000, Simon Ser wrote:
> > > =20
> > > > On Wednesday, September 2, 2020 4:29 PM, Daniel Vetter daniel.vette=
r@ffwll.ch wrote:
> > > > =20
> > > > > On Wed, Sep 2, 2020 at 2:49 PM Simon Ser contact@emersion.fr wrot=
e:
> > > > > =20
> > > > > > On Wednesday, September 2, 2020 2:44 PM, Daniel Vetter daniel.v=
etter@ffwll.ch wrote:
> > > > > > =20
> > > > > > > > I suppose something similar happens in user-space: gbm_bo_c=
reate
> > > > > > > > without modifiers needs to properly set the implicit modifi=
er, ie.
> > > > > > > > gbm_bo_get_modifier needs to return the effective modifier.=
 Is this
> > > > > > > > something already documented? =20
> > > > > > >
> > > > > > > I don't think that happens, but it has come up in discussions=
. It's
> > > > > > > kinda different scenario though: getfb2 is for cross-composit=
or stuff,
> > > > > > > enabling smooth transitions at boot-up and when switching. So=
 you have
> > > > > > > a legit reason for mixing modifier-aware userspace with
> > > > > > > non-modifier-aware userspace. And the modifier-aware userspac=
e would
> > > > > > > like that everything works with modifiers consistently, inclu=
ding
> > > > > > > getfb2. But gbm is just within a single process, and that sho=
uld
> > > > > > > either run all with modifiers, or not at all, since these wor=
lds just
> > > > > > > dont mix well. Hence I'm not seeing much use for that, -modes=
etting
> > > > > > > being a confused mess nonwithstanding :-) =20
> > > > > >
> > > > > > Well=E2=80=A6 There's also the case where some legacy Wayland c=
lient talks to a
> > > > > > modifier-aware compositor. gbm_bo_import would be called withou=
t a
> > > > > > modifier, but the compositor expects gbm_bo_get_modifier to wor=
k.
> > > > > > Also, wlroots will call gbm_bo_create without a modifier to onl=
y let
> > > > > > the driver pick "safe" modifiers in case passing the full list =
of
> > > > > > modifiers results in a black screen. Later on wlroots will call
> > > > > > gbm_bo_get_modifier to figure out what modifier the driver pick=
ed. =20
> > > > >
> > > > > gbm_bo_import is a different thing from gbm_bo_create. Former I a=
gree
> > > > > should figure out the right modifiers (and I think it does that, =
at
> > > > > least on intel mesa). For gbm_bo_create I'm not sure we should/ne=
ed to
> > > > > require that. =20
> > > >
> > > > I guess the compositor will just forward the value returned by
> > > > gbm_bo_get_modifier in any case, so returning INVALID would be fine
> > > > too (to mean "implicit modifier").
> > > > In both the create and import cases, other metadata like pitches and
> > > > offsets should be correctly set I think? =20
> > >
> > > Well if you have a modifier format underneath, the non-modifiered off=
sets
> > > and pitches might be pure fiction. Also, they might not be sufficient=
, if
> > > the modifier adds more planes. =20
> >=20
> > In this case (gbm_bo_create without modifiers), we're discussing
> > whether we require gbm_bo_get_modifier to return a valid modifier, or
> > if INVALID is fine. =20
>=20
> Hm then I missed the use-case for a gbm_bo_create without modifiers, where
> afterwards userspace wants the modifiers. That sounds like a bug (and yes
> -modesetting is buggy that way).

I'm guessing that use case might be related to
https://gitlab.freedesktop.org/wayland/weston/-/issues/429

The weston issue is about
gbm_surface_create/gbm_surface_create_with_modifiers, but that's not
too different from gbm_bo_create/gbm_bo_create_with_modifiers?

Weston happens to have this code:
https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0.0/libweston/backen=
d-drm/drm-gbm.c#L209-230
and then it unconditionally calls gbm_bo_get_modifier(). However,
DRM_FORMAT_MOD_INVALID is handled specially:
https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0.0/libweston/backen=
d-drm/fb.c#L80-97


Thanks,
pq

--Sig_/p+bpVf6ZMdTrv+gVsoC7Ylp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9V+FAACgkQI1/ltBGq
qqcWNA/+P2oJdKRuwFukAxgZAc0yljMGNbpzs4Qxva8XIEC9uS41YTt6jjrHxEzL
usGB67o2sbvWeoshHHch3bke2W5+e2M6Z0uImml4I8jfMJsD5ZHBdz10184JZMXV
VUIfIhzjd4JaU7jNM1T7qzcZ3jytabdLUly2lptoU9ddylX69QvAMa7Uq+v9sx8x
D0Q4GJTyZmZBOieKMEMYZfNQ6vqRHCCdakS8rsnD596pq17idWL04FkYDb6wtrgc
fAPgJcOcnvO7Hd7UBz+p7O7Yp7AvmCdbngk9RfdM+8NKelz9wXNk478mNA3FyIQT
eXf4DKSpsO/aPGylAdCmf3GEH72AbVISScNEkKcbbx3NaiLP/bwmoY3nWhVLPtse
tecHSyoWVRWls4/M2Dt1VMM+UV1aUDpQt1dG6+DD4ec6fWKKt14pn83ur3KBNoHN
PNl8ftiz0NjNWYguNgsMZX22VarQTNEs3k1LXZFfje/vcb4R7l1aTJYyRxEh9ssB
VgqMCxmjhfc6LpGvaaCK+V4xUs9ZUzo6SKGe6KPM3rb+UBbG4eZkNrnpyeanN4TU
ZZ3pKoqEDGw117ePPM5LpZZ7hN8aSBJuELm7R/lmD+HcBR4a8aoeSKk6ufqdpcwR
Q/YsvxwfjEfike2U+IEPDthN91hXHoge5mOEedr4dGrTnW8euz4=
=I7v3
-----END PGP SIGNATURE-----

--Sig_/p+bpVf6ZMdTrv+gVsoC7Ylp--

--===============1259293400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1259293400==--
