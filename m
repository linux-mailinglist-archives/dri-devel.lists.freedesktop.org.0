Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F4082514514
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09510FBB7;
	Fri, 29 Apr 2022 09:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D5B10FBB5;
 Fri, 29 Apr 2022 09:06:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y32so12894741lfa.6;
 Fri, 29 Apr 2022 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Xslli2oC+CEIe2Dm8B8YP3vPRWQprqmevs/XUvccdmc=;
 b=h/rfavDrD6HUt54tmq3UgjY4xZZxtG5c/QKFeMoOALJV3DlIIsCin4TuvP8OAeJUea
 Znlun/8tCVOpd8T50j9JctQAGT7FqVH4hTox3CtLWB/NTmfrxPw2g+HmaUznHu2p5vAM
 Dpy5KtsipQE5DEK++erUf3UIi0l76e/PeD46sXhoLYRJrlmDa/XLY0+3SeYLkZbmPEB2
 De5StssQd+6huZNmRKIhViC9WTufD1+7LxQ5duV2XX5ODzYLXgNKkv/qrxB4ZSgyvnnx
 cLsB+mf8hRe6BKGsSCUjXrbbX34z0IFW+FS2ULVZ0S0ioBnK3K9wGQrlH6czu0nubaqR
 0eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Xslli2oC+CEIe2Dm8B8YP3vPRWQprqmevs/XUvccdmc=;
 b=A//ZHDeiDjCsTwy3rFuU2390tZUhW8wY4bcLX/8rn0984JTvIwYTegZbIsKP0qpW/b
 w9FsAnog21uckt8ithHOPWbQfamO9NPGzRkiznx6NS9iR/wbcf5QVgONW9EF8m5f/ZWP
 mwrf7tcWV0+d21TIlEjYANzetDT1iS6Bwxa0qYZS8w1JquPck67WdC9fr+ygav5Ex3vE
 gHO183yVLzw3ArjXkkXmSPcTvGGPwPT8LMuScvPqHGlLjQPtaKHIG6X3b7iwZAW2WtcI
 VL+MC2KP0z7KLDhIn7dLhnQDNQZDTcP+6c3w7bcnW1avqOR2386iEfQc4eAnZ9WFdN/w
 fMUw==
X-Gm-Message-State: AOAM532UmyMYbN/lU3Kg7mh5sM78/EAr6WnObsKkdemEQniNbz53TJ0M
 K2zqiZ3ul4jRKwmTOTEeFlI=
X-Google-Smtp-Source: ABdhPJyqGtGZrM4V/BrVb6zwV2n+CyHrxnf4IhfL+ujWo/GnkuV3CdlhwHs3aQVcjEAioAQrVsBHXQ==
X-Received: by 2002:a05:6512:550:b0:472:2aa3:60d5 with SMTP id
 h16-20020a056512055000b004722aa360d5mr9167075lfl.270.1651223213798; 
 Fri, 29 Apr 2022 02:06:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v28-20020ac25b1c000000b0047201534505sm185769lfn.282.2022.04.29.02.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:06:53 -0700 (PDT)
Date: Fri, 29 Apr 2022 12:06:51 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <20220429120651.5a39ec03@eldfell>
In-Reply-To: <vdb4oRbKTPYjAGPcmjKfhcDQbMb1VuiJwF99I3UwkwUAsyEvvq5x7yKdP0mx5tEeNc2idU_qBSlbMM4dlv7apLeDvG3PIAkvRMjwVNKZGCk=@emersion.fr>
References: <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
 <875yncezdt.fsf@intel.com> <YmlNQgaxU7fYnTh6@phenom.ffwll.local>
 <87fslytxk5.fsf@intel.com> <YmlSm/TC1a/0V00S@phenom.ffwll.local>
 <0f8e771c-bf0d-f20b-50da-dc84f760ff82@redhat.com>
 <vdb4oRbKTPYjAGPcmjKfhcDQbMb1VuiJwF99I3UwkwUAsyEvvq5x7yKdP0mx5tEeNc2idU_qBSlbMM4dlv7apLeDvG3PIAkvRMjwVNKZGCk=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NO2vwWo8=Anp2ln._F=rQh0";
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
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/NO2vwWo8=Anp2ln._F=rQh0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Apr 2022 08:59:24 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, April 29th, 2022 at 10:55, Hans de Goede <hdegoede@redhat.com>=
 wrote:
>=20
> > I believe that we can fix the new interface, the plan is for there
> > to be some helper code to proxy the new connector properties to what
> > is still a good old backlight-device internally in the kernel,.
> >
> > This proxy-ing code could take a minimum value below which it should
> > not go when things are set through the properties and then if e.g.
> > the /sys/class/backlight interface offers range of 0-65535 and the
> > kms driver asks the proxying helper for a minimum of 500, show this
> > as 0-65035 on the property, simply adding 500 before sending the
> > value to the backlight-device on writes (and subtracting 500 on reads,
> > clamping to 0 as lowest value reported on reads).
> >
> > This way apps using the new API can never go below 500 (in this
> > example) and for old API users nothing changes.
> >
> > Given that Jani seems to be in favor of enforcing some minimal value
> > inside the i915 code going forward and also what Alex said that the
> > amdgpu code already enforces its own minimum if the video BIOS tables
> > don't provide one, it seems that there is consensus that we want 0
> > to mean minimum brightness at which the screen is still somewhat
> > readable and that we want to enforce this at the kernel level.
> >
> > Which also means the weird hint property which I came up with won't
> > be necessary as we now have a clean definition of what brightness
> > 0 is supposed to mean (in the new API) and any cases where this is not
> > the case are kernel bugs and should be fixed in the kernel. =20
>=20
> Looks like a good approach to me from user-space PoV!

Yes!


Thanks,
pq


--Sig_/NO2vwWo8=Anp2ln._F=rQh0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJrqqsACgkQI1/ltBGq
qqfRaBAAnMwp1UOQ4x55M1Ye04q5+hxXjXcgiFs2VchYolTuzWkDJilHchHJQCcj
mGii5+3Xi9mpS4DsMExKB0eL6H94FaSsYP14uoPbtlSjWW7Cd5DhmCDDD9/k0ftf
UmCdo+gIDVJigENko0v0lOXgnQiSAn/Xvuf50Ifob4kThhKGqtjUnSzKhi3GP98I
KPouXnxK/EYeWK1oWAhP7YX8y608V/GZDPePvrPXgGOMjBNHppFhJulX4VGcT3ib
6Q3EmgzX9fT9Is32iGgRnC9EssXTSh5+AD+c0eTX8Dsb2wKQ26fBqVCVNnt4Aogl
lYxl55k6vs/374eN0uCkU2WUBsdEr7aMl7GWeM+pPzZmNTwIH3fntfUsAVOLcCgR
p9fEir5kueoiX6rgt0sodEqX/cl2q1VCepdlxe4L31UScPqmj0k8TszPwL11LZzV
50NxODUI3GWlafUY510XuOPvaRAi4hCPalMfThj5Nt24rnK8s3O0qsOWeN/7Hza3
mUuDdsy6l3HRVuot9/i6hBjcgVUGgC2n2fcvwEq4L6FSDuk1pCl18w+FfDX9dmIr
KF1foMfr0R12Ts9ds+dsBDfFj0al52Hm8GVxHVSPxBkaGFlb1MN7p1BkYU1BYnSH
gqK9ID/GRxIBvYt5LehBXV9V5Tv7TqqDBbnw6Q13GOJTeyHFNe8=
=TeDJ
-----END PGP SIGNATURE-----

--Sig_/NO2vwWo8=Anp2ln._F=rQh0--
