Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451621CF6E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 16:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5946E93A;
	Tue, 12 May 2020 14:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FCC6E92D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 14:20:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 188so10705647lfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=0wVZmq8vuPwKdqE/baixPSYs5p16O9K8YcBF6u2/+UE=;
 b=Zm2zFtDD65Z/P7NhhGukBbkJH56W8AJUGyHO8j47F3OLrJuv1Xg3KRvAsPonRxI+ZB
 0crv15MmivTuE9vhKjg3wDYbFP21l/nw/eoZvh/BHeo3wx3Qr62Ayy9T5ou3s0+EIDYU
 eGj6sWyBehYJuuLkNoCrjxvsqdY8iaz7BXUkUBW3EXQvLtTbPvXdL+ynL54+TG2NlMJF
 jzYUA6RS7I0SRywn281ydtY9FVymMyD8XDVOekBQNc7HSOxZyDm1qpkua6G969WkuX0L
 wTTSJG4KfwLmkJ5mBA+fnvXrL6hmLAvkIp5/4jpK00pLFkyHPufB8SkEDKv/ocWkM1Ve
 LJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0wVZmq8vuPwKdqE/baixPSYs5p16O9K8YcBF6u2/+UE=;
 b=cj2PPS0pLQvdUUyPsdXX3uiJkjgQNeFgJOdsRpq3bLxkd0y28xhJk8jLTBcpUHW52F
 Y9+kDF7xr3B+BSnS2RJi/Cyt1N3aVXT+D8me0DZahD5hKlnKbi8XaL8omPitjDr+KX56
 lx3i7ku5VYwZOtU1yf/eDE3msD6ATw95dy5tE9vkL4PpsbDc/XbvmmiwZo33Ul8wFqOr
 83FWbxNz9KhhCBuqQhn7Jc9etapCzKiIlHAbgbfUBX77yJ7h/nJMTJzEAi4q6NS5HV4/
 h3S4zOCFoER1Ol+x6H3nFutSCwTnnbGg02DG1jdEmS9sDgp0S/tPiF3vFJoHDg/lkJX2
 UMTw==
X-Gm-Message-State: AOAM532aBfu8v5XXd8zqAQUgyPZbU9b4uhXqXV3ilscwF37EW7LtqZKW
 5yEz6IOKYtwXHDeOL1Go12s=
X-Google-Smtp-Source: ABdhPJxOpiQJMxBoSj8nTtfZTYCAaD353ySkCRePkOvsMT0Om2f+fnc0eutr6jFGnTKUHjW48tGqFA==
X-Received: by 2002:ac2:5628:: with SMTP id b8mr13682768lff.172.1589293237093; 
 Tue, 12 May 2020 07:20:37 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g22sm12782848ljl.17.2020.05.12.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:20:36 -0700 (PDT)
Date: Tue, 12 May 2020 17:20:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
Message-ID: <20200512172032.185de3d7@eldfell.localdomain>
In-Reply-To: <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1575011882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1575011882==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/g1P9PsSO=nIk8t4WcR19_lk"; protocol="application/pgp-signature"

--Sig_/g1P9PsSO=nIk8t4WcR19_lk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2020 10:18:31 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 5/11/20 9:55 PM, Rajat Jain wrote:
> > Hi Hans,
> >=20
> > On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com <ma=
ilto:hdegoede@redhat.com>> wrote:
> >=20
> >     Hi All,
> >=20
> >     This RFC takes Rajat's earlier patch for adding privacy-screen prop=
erties
> >     infra to drm_connector.c and then adds the results of the discussio=
n from
> >     the "RFC: Drm-connector properties managed by another driver / priv=
acy
> >     screen support" mail thread on top, hence the v2.
> >=20
> >=20
> > Thank you so much for doing this. I was following the said discussion a=
nd eventually it became quite complex for me to understand and follow :-) =
=20
>=20
> I hope the new doc text makes things clear again?
>=20
>=20
> >     The most important thing here is big kernel-doc comment which gets =
added in
> >     the first patch-chunk modifying drm_connector.c, this summarizes, o=
r at
> >     least tries to summarize, the conclusions of our previous discussio=
n on
> >     the userspace API and lays down the ground rules for how the 2 new
> >     "privacy-screen sw-state" and=C2=A0 "privacy-screen hw-state" prope=
rties are
> >     to be used both from the driver side as well as from the userspace =
side.
> >=20
> >     Other then that this modifies Rajat's patch to add 2 properties ins=
tead
> >     of one, without much other changes.
> >=20
> >     Rajat, perhaps you can do a new version of your patch-set integrati=
on /
> >     using this version of the properties and then if everyone is ok with
> >     the proposed userspace API Jani can hopefully merge the whole set
> >     through the i915 tree sometime during the 5.9 cycle.
> >=20
> >=20
> > SGTM. I have actually moved to working on something else now, so I will=
 most likely wait for this patch to get merged, before rebasing my other / =
remaining patches on top of that. =20
>=20
> We have the rule that code like this will not be merged until it has at l=
east
> one in kernel user. I plan to eventually use this too, but that is still
> a while away as I first need to write a lcdshadow subsystem which the
> thinkpad_acpi code can then use to register a lcdshadow device; and when
> that all is in place, then I can hook it up on the drm code.

Hi,

I believe this falls under "new UAPI" rules, because this is adding new
KMS properties. Hence an in-kernel user is not enough:

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements


Thanks,
pq

--Sig_/g1P9PsSO=nIk8t4WcR19_lk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl66sLAACgkQI1/ltBGq
qqc+cA//WF1FsEXXt8tcmzAjy9eTS7hFm4CR0pUXOS4Ac5Wcr+eyw2YaeUJhlCm5
kMCtdukqAgpLy2MHajqY43yrXt7z09osEcXb+ux7JhDwkjo+zFU4p6P+7xSIZKl0
3iQJMMOZZabc59aRAFUx5m1isrAf+T3kkQqPlniQjNbGEvrWd7Iyro8AOfvFblAF
xTA1+VZqguRR2mFb9/IgH9beqGR5g4dFb6qxNuz3goKJ5tho0Gr/S1pnWOlHua5x
HHrDx1aA6yNY94a/qwApBW7pMzfT1d2jHejSk0kTElcbuSoxy0SduVZOxV//nhRh
P1NiupNBGcz2APtJdgHaK2JY3f+Jz1D6y3Xrz8Z3wUtLHbbjd8iXsLBeDuNJ8XXR
yhQrOcJZ6i8D6rp9d+DVjGqPFjaVj4C69oQrhnqeL6ph79JX/9wQmo004AYaa3HK
Adj15TJAeLVxOcz8r06wpTxCpgAbBq+jyHWQwDgIew+EeH1BYpDMATsmnlz8T6BS
pREfp7zrNXhyyPEQxogCMBSoZy6jExMDUbQca9MyLITh0Vc2NTap9Us9MePzcwBj
kTwUYP+256ZYMor9x1yjK9W6cGnwGfX280OA0qYnw3gn5RTJ9lGtCUUu87Uurjp3
VwW2AZs1dmeh+hw7zD3L6QdJhufTWeXYMkpZhnZnfuyIlqogrIY=
=5qPh
-----END PGP SIGNATURE-----

--Sig_/g1P9PsSO=nIk8t4WcR19_lk--

--===============1575011882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1575011882==--
