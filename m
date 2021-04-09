Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A63599AF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F036EC04;
	Fri,  9 Apr 2021 09:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9796EC05
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 09:44:16 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n8so8759705lfh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=saR8ydVe1/Gwk52UoOWrBEyt0OSaImrJRZ3TD1sTMcc=;
 b=UnUJSa11RIXMr4/gA6SmLGlLag09IoJmTDWdXnV2VR0/QPZf+BNGALxFB2bEihdOny
 1MdorZMB2jt8VSYBuRQgq/2aP/ggsR6tOGPb3V7U99gvskt15ln4sjwHMzFc1zgwyQzJ
 eVCX6klxaJAnJas+iTF3zOpl569I813rUlyN4AQpcFDMLkMU0ql3T4anlcrJwxW0SLxu
 rPd+tlkP/YDhPDYsxSjTRd3Xy20aGTqloN2rnGgA+cd0FD3/WqfMGB5o8+PBpvhu31QO
 gw++E7CLBuIqWBpycMuv6usm3ZnpksG1p4pEk0csYNT4KkMH96hLQRERQUSzUQoT4FYs
 mg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=saR8ydVe1/Gwk52UoOWrBEyt0OSaImrJRZ3TD1sTMcc=;
 b=X7SvWftmHzXpfdQiADPGrrzt66Bvq9V5wRHnDJUCs6ctq0JueV5atBKg6qSb1Wx+zx
 obU476oUPDjVg8omwrHTqlOw+ZUqApLuDTbPSxjowE+FY8ZX/FVVji/A99TF5yu3jJo3
 rbEb7ECa/5l5JUjG95qz+ESwZVJ/YgAhpKe8/nYWK0bbQsZ3XR3VM7WxTZpEWDal5PxW
 jsW6DmQUYYuBW2ro00T+Jy7pVMF3wKDKnwF93r/dlWF+WeeWdRGog66bjV5+HSFLQlKT
 3H/Z6KAmkhuHQQov+v5063ytCEq4dMXN7/b/uibu8AlqKsBhP6LZh3dRleXhjRKHY46F
 sW4Q==
X-Gm-Message-State: AOAM533UwWS3ocESG9pPdGgY5DSqrwoDxv1b9kBuQW7t5X3ORiEfU8FF
 ZRclzCuIS/D6So97XZyAmMg=
X-Google-Smtp-Source: ABdhPJwZz6gS79awDSRQxz/36k2HpDLpykAE4hYwzpIs2763VHZ3D6IXjsNpGx04jeiSguZDjRaUOA==
X-Received: by 2002:a19:c7c3:: with SMTP id x186mr9478125lff.76.1617961455092; 
 Fri, 09 Apr 2021 02:44:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o9sm223615lfb.280.2021.04.09.02.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:44:14 -0700 (PDT)
Date: Fri, 9 Apr 2021 12:44:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <20210409124404.0e01bef3@eldfell>
In-Reply-To: <YG8Vmsj6mtGZuf3H@intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
 <20210408125919.4a83119c@eldfell>
 <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
 <20210408165751.7488e793@eldfell> <YG8Vmsj6mtGZuf3H@intel.com>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: multipart/mixed; boundary="===============0235974553=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0235974553==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vKTKUOE5G4L08bilV_/kwAs"; protocol="application/pgp-signature"

--Sig_/vKTKUOE5G4L08bilV_/kwAs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Apr 2021 17:39:22 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Apr 08, 2021 at 04:57:51PM +0300, Pekka Paalanen wrote:
> > On Thu, 8 Apr 2021 13:30:16 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20

> > > > Is it also so that passing MOD_INVALID to the explicit modifier uAPI
> > > > (ADDFB2) is invalid argument? Do we have that documented?   =20
> > >=20
> > > We'd need to check that, currently it's an out-of-band flag in the st=
ruct.
> > > Atm DRM_FORMAT_MOD_INVALID is entirely an internal sentinel value to
> > > denote end-of-array entries.
> > >=20
> > > In practice it wont pass because we validate the modifiers against the
> > > advertised list. =20
>=20
> We don't actually. If the driver provides the .format_mod_supported()
> hook then it's up to the driver to validate the modifier in said hook.
> This was done so that people can embed metadata inside the modifier
> while only having the base modifier on the modifier list. How userspace
> is supposed to figure out which values for this extra metadata are valid
> I have no idea.

Maybe it's the difference between generic userspace and userspace
drivers? I've been having the feeling that these two have different
"rules". Maybe that distinction should be formalised in documentation
somewhere?

Generic userspace never looks into modifiers, it just relays them and
compares them as opaque 64-bit words.

Userspace drivers are allowed to look into what a modifier actually
means and fiddle with it.


Thanks,
pq

--Sig_/vKTKUOE5G4L08bilV_/kwAs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBwIeQACgkQI1/ltBGq
qqcnrw/8DRXqu+enaDY7Ts1SkwLdiYxQNtidcZqDg/GoC3rxHcukyuZIPi3GSV4q
sWrdU5ZYJ02jKuIoHweGbf1r8/BHLXqcSLbfhU7XHMVhljy1kMtbmPgg/90IPqi7
O2TWMCp+WyqYcy4azAX8oBedfu+adFbh9n0bishhYWH+rz54sV/QG8bGall11n61
8FQqhcZ+r7i2KrON+Nb24qhp5MIyUJJCba2lC4/TZLUc6FkC6lnjjh1QHP0rOSrc
PQVbvzSgVUl3W0XUwcpgCU0iCYQyGSQx7DQuv69Z2FggyMszqiuGVCR5A7iaf61i
THSNn4mPifOz3sVSPh642Assch/EZWZ/gAAAc9lpBe3ZBzNRLQCj4lC7jrr871r8
zmxyEEX84un0pCUVKx/TQAVx+yfclbmv2IJJcb2Ji9oXCGc1Et/iCV/7TR7AOLAw
VczIqWYJTQNuGSlnR6h4X9Gcnp/JiGD8TUFI6INNPtMLBR+mhuZ9gCukzMt6jb0Z
gDaOxwazFElEgPcB5dibyjQqmcS9RBXQsgOIdjcKJ3DNuL0jMYJVvip3P2C6rOo8
HcORDJGHIsHVjVX0gkwVtvi9ypmUS85RfL977n1h8Uubi0G6Jq+dszeGiVs6NpN2
eKAjWvuZv0ZjS1gOZeazjaQyGNraiREA1fPrlTPk0YVFsVEc6kE=
=PSO0
-----END PGP SIGNATURE-----

--Sig_/vKTKUOE5G4L08bilV_/kwAs--

--===============0235974553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0235974553==--
