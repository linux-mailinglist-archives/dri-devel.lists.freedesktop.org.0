Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82D2D0C18
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D035E89D43;
	Mon,  7 Dec 2020 08:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6006489D43
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:51:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s30so16902736lfc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4Escz8OZJ9uQkwstW6gXeQKEZpva1KmLBfoE27HZji0=;
 b=km9kxQLA0wB9wG7PXUDoI8flM6wIlY7uF1WYz7o67vnucRjEr4AUdvCbqavo+aptnq
 a7SD6sSv6EPmwu92o2K7sU/tYt6pOiZlJHiED5pmqVn6vGTTfMQvH0Opzr+ixGEs70iK
 Cl+zvJDZeq/pTTybHh7nSZKbz0ECXM1oFtb9cRZhq3lTLzU7QQX5FHyKCie2i9hhGVaL
 TqGsc/veo8ptST503CvKos2PwrZlIOfxuol6BEo1AXqWUnr2FdzUVI/507dgDyBKH99p
 vH8HopxfJpHFEHUPQrr8Azk/fP/feeJnjQSZafctaGZdpA8Mrmh6b2TLn3y8aqlI/7jo
 VW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4Escz8OZJ9uQkwstW6gXeQKEZpva1KmLBfoE27HZji0=;
 b=SQpayzjeK5lxr9lyGtAllmCCh7y84X2qno/cjv8GA5ro5SuEkbJ93zUTT1BNJ/6IEu
 qcmWokQUhInheixnqwZBWsp5qWQMi4Iqrb4ZCpJxXoamJTnBN6WsD6cZCPsIPo1SbtzT
 lV93RYOrbgPcEFoWGvOCI9zehI1fjoMZBuz0e9FPkwhP5ykOLq87LJIUxEWuroWc/1yW
 BWC7qFjMVEWTkqA3yPRhpFgFZer10NPwJlazM+Z46TT5KOGwVTjcYpBtjAH8tCvn6iYX
 8OmaZ3RdUnrKHhnKbPZPZtFIh+706LS5nsvARPV5iChq2yXerh9U9fEKs6xl9yF+HBR2
 Mhvw==
X-Gm-Message-State: AOAM532Wj1OJb9mFbt6nbAwBOcsegAmALXblPzFjb8RIuBleoCFRaYgX
 /l6Rj7+B6oLdzbo5clxIW08=
X-Google-Smtp-Source: ABdhPJy92Z1k2jZdZb43UUU7GuyERjb4m4n91/4Vo9X6Kvm2bH4lMfvU/RpBoP8FdznKc6zR47kWrg==
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr7802902lfc.452.1607331073663; 
 Mon, 07 Dec 2020 00:51:13 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v63sm531746lfa.89.2020.12.07.00.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 00:51:13 -0800 (PST)
Date: Mon, 7 Dec 2020 10:51:09 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: James Park <james.park@lagfreegames.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201207105109.599273be@eldfell>
In-Reply-To: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============1879329094=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1879329094==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GJE+ATgd1yTgJU/6Epw.5ZC"; protocol="application/pgp-signature"

--Sig_/GJE+ATgd1yTgJU/6Epw.5ZC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Dec 2020 11:07:41 -0800
James Park <james.park@lagfreegames.com> wrote:

> I could adjust the block to look like this:
>=20
> #ifdef DRM_FOURCC_STANDALONE
> #if defined(__linux__)
> #include <linux/types.h>
> #else
> #include <stdint.h>
> typedef uint32_t __u32;
> typedef uint64_t __u64;
> #endif
> #else
> #include "drm.h"
> #endif
>=20
> Alternatively, I could create a new common header to be included from both
> drm.h and drm_fourcc.h, drm_base_types.h or something like that:
>=20
> #ifdef DRM_FOURCC_STANDALONE
> #include "drm_base_types.h"
> #else
> #include "drm.h"
> #endif

Hi,

my point is, any solution relying on DRM_FOURCC_STANDALONE will fail
sometimes, because there is no reason why userspace would *not* #define
DRM_FOURCC_STANDALONE. Hence, #ifdef DRM_FOURCC_STANDALONE is
completely moot, you have to make the headers work in any include
order when DRM_FOURCC_STANDALONE is defined anyway.


Thanks.
pq

> On Fri, Dec 4, 2020 at 7:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> > On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te: =20
> > >
> > > On Thu, 3 Dec 2020 21:45:14 +0100
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > =20
> > > > On Thu, Dec 3, 2020 at 7:55 PM James Park <james.park@lagfreegames.=
com> =20
> > wrote: =20
> > > > >
> > > > > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > > > > intentional, right? Should I put all the integer types, or just t=
he
> > > > > ones that are used in that file? =20
> > > >
> > > > Yeah that trailing _ just slipped in. And I'd just do the types
> > > > already used. I don't think anything else than __u32 (for drm fourc=
c)
> > > > and __u64 (for drm modifier) is needed. =20
> > >
> > > Hi,
> > >
> > > can that create conflicts if userspace first includes drm_fourcc.h and
> > > then drm.h?
> > >
> > > I would find it natural to userspace have generic headers including
> > > drm_fourcc.h and then DRM-specific C-files including drm.h as well
> > > (through libdrm headers). I think Weston might already do this.
> > >
> > > The generic userspace (weston) header would obviously #define
> > > DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as well.=
 =20
> >
> > Hm yes that would break. I guess we could just include the linux types
> > header for this. And I guess on windows you'd need to have that from
> > somewhere. Or we just require that users of the standalone header pull
> > the right header or defines in first?
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > =20


--Sig_/GJE+ATgd1yTgJU/6Epw.5ZC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/N7P0ACgkQI1/ltBGq
qqcXfA//d5YFsMV0r7oS1fL9p0q45Q73aGEtiMxBXuuDov4ORZ73c+1ySRbLrmWx
DTFvpko1VMM8AnmSbsgNKypAV0gVC6ayc+6QnJ2Pi+o+6GLSECkbRRKxGf4I3/g5
tK7DRc2BPVFzUN2wyu+op7TR1G2KEChznyETFaiD5ysQCUS9IVGX9tLUfCPBsEmT
DsPIu6sRigDzTfrdY/nHHtRpPYJfDLFwnCCaBUtYlRLYAjwJ23FSHBeOK39Rdspv
7S8ghzIF8GRRE9lO0P8sxnGTBp+BBvOsrxhfPABWGLWcz1S3JGYn50KVqpgWqkG4
tAC5TqZhNkTHT69y3hnc9N7T6IB0oNoOKP2Mpof21L3RMsoRL/+hY0AsMLE7bs8+
oHXhxHDbxTRjFRoPXrEQmP9i/ryRaOVJdCfhx+ZaHYBJPAh3ERwhLi6cg//DeV5K
Wr7BVSkO7c0zeQNU3fIAAoQGoKQ6SCB71QnPalE2buEAY9imBzHrJ+1o+Vq/58QU
Y+RbsLSXprARevoMe/r2E9G7NtmElEKWT0OIyK6sVs9BYJb0AyjMW5qnRYj3faUl
Gkz1+aMDdH3gRwxmF8b/S86jnFpt6vT9egMAanqk5eW0Yk41J0d+GHc/xmUEkCly
YbWyBgxjgPgTDi91aRfT4ctA2QSWZmSIpmH5+gAJLowzXbL0EEs=
=RKOP
-----END PGP SIGNATURE-----

--Sig_/GJE+ATgd1yTgJU/6Epw.5ZC--

--===============1879329094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1879329094==--
