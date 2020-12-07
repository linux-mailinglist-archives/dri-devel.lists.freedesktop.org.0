Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E82D0E16
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7DA89B22;
	Mon,  7 Dec 2020 10:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B823B89B22
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:35:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f11so2193809ljm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 02:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=pPsBW1dC2cEs03ZvicTFQzi1yezdChQEsgY7SF8sHf4=;
 b=J5eTkFfS/9ceF6E7N5X0Ue9l65UR70n9XpezH2VpurzfqBmyjUXSOG8IU/Gx8h5LaT
 QNAGYKwuObVXwgt6B3w1xxRQ8BSrQUzREUEXoc/lbAYlugrB7MNK15or+ShE0+RVtiY6
 L5zGu3b0i68YHgNwSW+G5djvR0czSKDeYCJO0k5CGJoZaWxswJuPEotLmj52psD7KETZ
 FhB5mBwj9P9uyQFYun4GlNOqxtqbUWNkQd5HzQpzC16lJNbadLEPXL0syyAmbDC++kxO
 D2qrDaiwiI1JspTWZCH9JFw3rap/6X6cK3cLQnogF66vBoy2gP3srwiunnVOzqTWeWH4
 sKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=pPsBW1dC2cEs03ZvicTFQzi1yezdChQEsgY7SF8sHf4=;
 b=jSzf4RbZNoSLgRovCHPthKECtt8rLOnJiuKfDGoL4eHD0XIV+LSPDbqGJjV3n9jlYJ
 Omq0xlp+q3MvfdEDFcBUOnXxXxswgjBNjWxV+R/5m0uRv3Br77F/IEoknB1GjiM6c9h0
 bq8dzQ7X06mJV4QW4p0aJGE8izZ+8nSN0uMRFGHWmgYrgwCUjwKfmVbwq1UcutyUuS2F
 9e6akrkrOGF5+Iimx5+ifQCDIU9X/ee17lu/282LnnJ3yAP5Cw2nvjLMzQ/O3LN+fU90
 FjWH3HCmv1zy7LxNbHFzGdMtTcJYl7QG4I39ifH32A4uMC6HeT8qTaYIvrbdqr7p6RUy
 iTtA==
X-Gm-Message-State: AOAM531MUsMmu0k1EAOl3Sn1YIkDIhzX5Mi6eFwGZFzplWKNmu1XOyhB
 5OQtmI4xSLHZ27HNjYqVIJE=
X-Google-Smtp-Source: ABdhPJynnesLWBplmPFHGjDnZ/01X6KXbOP6Lx2GxGnpaGvQ8UUXH+ksm0FENBTypvAU5KhgpFfdOg==
X-Received: by 2002:a2e:8e76:: with SMTP id t22mr8523609ljk.10.1607337318066; 
 Mon, 07 Dec 2020 02:35:18 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v4sm2862391lfg.200.2020.12.07.02.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 02:35:17 -0800 (PST)
Date: Mon, 7 Dec 2020 12:35:14 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: James Park <james.park@lagfreegames.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201207123514.65e4b868@eldfell>
In-Reply-To: <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
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
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0572469116=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0572469116==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KNmryKX_xyPyTLMpJxfSHtN"; protocol="application/pgp-signature"

--Sig_/KNmryKX_xyPyTLMpJxfSHtN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Dec 2020 01:08:58 -0800
James Park <james.park@lagfreegames.com> wrote:

> I'm not completely sure what you're saying, but doesn't drm_base_types.h
> (now drm_basic_types.h) make things robust to header order? The patch is =
in
> another email. You can also see it here:
> https://github.com/jpark37/linux/commit/0cc8ae750bfd9eab7e31c7de6aa84f246=
82f4f18

If that is robust (I don't know if it is, I haven't checked), then why
do you have #ifdef DRM_FOURCC_STANDALONE in it at all?

Like Simon said:

On Mon, 07 Dec 2020 10:02:36 +0000
Simon Ser <contact@emersion.fr> wrote:

> In my compositors I'd like to globally define DRM_FOURCC_STANDALONE
> (to make sure I don't miss any #define) but I still may include drm.h
> in the same files as well.

If any project #defines it globally, then what good does checking for
it do? Why not assume that everyone will always want what
DRM_FOURCC_STANDALONE would bring?


Thanks,
pq

>=20
> Thanks,
> James
>=20
> On Mon, Dec 7, 2020 at 12:51 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>=20
> > On Fri, 4 Dec 2020 11:07:41 -0800
> > James Park <james.park@lagfreegames.com> wrote:
> > =20
> > > I could adjust the block to look like this:
> > >
> > > #ifdef DRM_FOURCC_STANDALONE
> > > #if defined(__linux__)
> > > #include <linux/types.h>
> > > #else
> > > #include <stdint.h>
> > > typedef uint32_t __u32;
> > > typedef uint64_t __u64;
> > > #endif
> > > #else
> > > #include "drm.h"
> > > #endif
> > >
> > > Alternatively, I could create a new common header to be included from=
 =20
> > both =20
> > > drm.h and drm_fourcc.h, drm_base_types.h or something like that:
> > >
> > > #ifdef DRM_FOURCC_STANDALONE
> > > #include "drm_base_types.h"
> > > #else
> > > #include "drm.h"
> > > #endif =20
> >
> > Hi,
> >
> > my point is, any solution relying on DRM_FOURCC_STANDALONE will fail
> > sometimes, because there is no reason why userspace would *not* #define
> > DRM_FOURCC_STANDALONE. Hence, #ifdef DRM_FOURCC_STANDALONE is
> > completely moot, you have to make the headers work in any include
> > order when DRM_FOURCC_STANDALONE is defined anyway.
> >
> >
> > Thanks.
> > pq
> > =20
> > > On Fri, Dec 4, 2020 at 7:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > =20
> > > > On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen <ppaalanen@gmail.com>=
 =20
> > wrote: =20
> > > > >
> > > > > On Thu, 3 Dec 2020 21:45:14 +0100
> > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > =20
> > > > > > On Thu, Dec 3, 2020 at 7:55 PM James Park < =20
> > james.park@lagfreegames.com> =20
> > > > wrote: =20
> > > > > > >
> > > > > > > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > > > > > > intentional, right? Should I put all the integer types, or ju=
st =20
> > the =20
> > > > > > > ones that are used in that file? =20
> > > > > >
> > > > > > Yeah that trailing _ just slipped in. And I'd just do the types
> > > > > > already used. I don't think anything else than __u32 (for drm =
=20
> > fourcc) =20
> > > > > > and __u64 (for drm modifier) is needed. =20
> > > > >
> > > > > Hi,
> > > > >
> > > > > can that create conflicts if userspace first includes drm_fourcc.=
h =20
> > and =20
> > > > > then drm.h?
> > > > >
> > > > > I would find it natural to userspace have generic headers includi=
ng
> > > > > drm_fourcc.h and then DRM-specific C-files including drm.h as well
> > > > > (through libdrm headers). I think Weston might already do this.
> > > > >
> > > > > The generic userspace (weston) header would obviously #define
> > > > > DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as =
=20
> > well. =20
> > > >
> > > > Hm yes that would break. I guess we could just include the linux ty=
pes
> > > > header for this. And I guess on windows you'd need to have that from
> > > > somewhere. Or we just require that users of the standalone header p=
ull
> > > > the right header or defines in first?
> > > > -Daniel
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > > =20
> >
> > =20


--Sig_/KNmryKX_xyPyTLMpJxfSHtN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/OBWIACgkQI1/ltBGq
qqewLw/8D+a/ipCJ0v+AcEqnh0NmjvdG03JOBVCcj+b18fC9RY7d05sO5MhUyHPD
Z4HzU3jVnoM5givNjegUB3Rbz3fYTad1XRIPXoV/YUP0pQfWgJQbxPdL/f0ko9XH
nL3uvH+RLnYWAocHw9iO1Y5aHATpbxuKFkbtPiakLqDUsU04Ek4/TsOWJnSv/N11
2D7/nkjq4EGGrMflf9tSJw4BdN+FVTckvsPkAGF5DLB+Ck0ZCL/8+6maPTBYqbBo
hteJDnLUEx2aBNOX3x2dXisfDeQF4JeApCw7xKRagTyhdvUybt281okc4HegUUG7
CCBCGHtOrLPa1mt64uvWOxAUwgasdeegBrKiL+MV6ispgfM3u+n1soTXExPCM3DD
BoLgZF0YY6BsoJpiMnu9dFBSv7qXx1BgP1wzSgj8f4Z17ZewcUP2w15RbsmtMrlV
MMemsIcWblkkey7/8Oz6YAVFDMb0HhpZv8uHzFN+ffA/pU5RWEHNmrmZ3NapTBVY
I0GyCk81KQaoEcAaDgDX+Af/oULn3d3didi4MxoYiKo9ztMcps6zkMBke5WDvIFK
CUYJLc/Kkakqf7LSYt8FNzOqSpxgZcZiigskfT4gzfNFohBycnjnla+AeImn4dQX
Hv2vp81wFhTNOw5S3fAdnDvXihE4PZb97RLTOW1isg/ggHwsWQI=
=ymvX
-----END PGP SIGNATURE-----

--Sig_/KNmryKX_xyPyTLMpJxfSHtN--

--===============0572469116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0572469116==--
