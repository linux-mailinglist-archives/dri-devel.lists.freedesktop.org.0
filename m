Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F662D0EBD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 12:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806CA6E5A9;
	Mon,  7 Dec 2020 11:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065746E5A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 11:14:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q8so14467655ljc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=yc3cVwxkyRRqeKLVGm/UJMcaxX7JBRnsuuHJWzXPbMo=;
 b=DEsBCPD5dCk7mBObOJspQd8YICrbwq6Kf7Z9W4lWO+wx4IlB6iGw5Os+TrLDirl6ld
 UVpI+Hj3eMHxQ1fYc46obk6TbIrdWRk97emppXYnXtj0tbG7+5J01GCr7CGbK54j7z8h
 G1KMee4MZVboQJbXqReZLneyYXCatx8b+J60YxedBnBwVsAs8PX6cH1WY1Hl1CnBvcym
 bv0vSzRgPu05di2Xgi2gq4nQ82RtPhuyOMeNUs5/gETif3RG7EEpQdcvPkRJjikHwure
 80GIEJctZUCzzG9jNkwWKY9DjWDADG9vhqhTlfh16oiAENgdydQ8h+T7xNpipUZc3N++
 Zhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=yc3cVwxkyRRqeKLVGm/UJMcaxX7JBRnsuuHJWzXPbMo=;
 b=sMpRIru3L+CavpvKqXbdL/LARho65GoCyaPETcLVNAMCC4/eACE7a/z2vR6+pAyKiO
 bRjCXVO0wiEMEIKYO/v7ezGdZA48Oyu+hY5ciC7mI5wMET0xJ9VRxexrnWCFAuMRLjtr
 8IBmmoVV3devGUHCDDYS6h7gnznOu+UV82PzAR/HN2YHOyBf5x86NyW7vScU1rWKzSDd
 XOdol/wjWNWhhW5qDL+U/GQFzPltlTSyhN15gUozfghQC3QGzgNrkozV31N5dXz/NwOD
 j0xM0hnX/uF/KokK1088rQ8wJvOTq0vca1w/2Sqnx/FrNCN1iytVIrq7BZpjt386JOf4
 cPhg==
X-Gm-Message-State: AOAM532hYT83lO+bmooBRAwib4hG4m2fxxDNX644k8/Q+Km4zN/4zrKV
 P0fXCQVmS1jZmYDYU9c/CV0=
X-Google-Smtp-Source: ABdhPJxnORmS9VFDeQadvTptSNHxZL/zBUcCFKW1gSSyxIiyWvCvAaqdWP8AAaXHRj1P5WakrqAcyQ==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr8523064ljk.150.1607339659486; 
 Mon, 07 Dec 2020 03:14:19 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k20sm1078025ljc.61.2020.12.07.03.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:14:19 -0800 (PST)
Date: Mon, 7 Dec 2020 13:14:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201207131401.3cf41501@eldfell>
In-Reply-To: <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
 <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
 <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
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
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============0909135793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0909135793==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6pyK.eaBqzPIRbUOyiqMOEK"; protocol="application/pgp-signature"

--Sig_/6pyK.eaBqzPIRbUOyiqMOEK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 07 Dec 2020 10:53:49 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, December 7th, 2020 at 11:49 AM, James Park <james.park@lagfree=
games.com> wrote:
>=20
> > That would work, but that's kind of an annoying requirement. I would
> > prefer the header to be self-sufficient. =20
>=20
> I don't want to make it more confusing than before, but here Pekka (I
> think) suggests to replace this:
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..5eb07a5 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>=20
> +#ifdef DRM_FOURCC_STANDALONE
> +#include "drm_basic_types.h"
> +#else
>  #include "drm.h"
> +#endif
>=20
>  #if defined(__cplusplus)
>  extern "C" {
>=20
> With this:
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..5eb07a5 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>=20
> +#include "drm_basic_types.h"
> +
> +#ifndef DRM_FOURCC_STANDALONE
>  #include "drm.h"
> +#endif
>=20
>  #if defined(__cplusplus)
>  extern "C" {
>=20
> That wouldn't change whether the header is self-sufficient or not,
> would it?

Exactly this.

This communicates properly that DRM_FOURCC_STANDALONE only affects
whether drm.h gets pulled in or not, and there are no other effects.

This also makes testing better: when you unconditionally include
drm_basic_types.h, you are more likely to catch breakage there.

For functionality, it makes no difference. Whether userspace does

#include "drm.h"
#define DRM_FOURCC_STANDALONE
#include "drm_fourcc.h"

or

#define DRM_FOURCC_STANDALONE
#include "drm_fourcc.h"
#include "drm.h"

the result must always be good.


Thanks,
pq

--Sig_/6pyK.eaBqzPIRbUOyiqMOEK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/ODnkACgkQI1/ltBGq
qqf4hhAApMaxltj0MOeaZVKUex1dtOUNMWbsOz03VT6WyU3Gapa96PtyE3gquFVF
pJKUHxFkAR8GxUKyIRL6EnCC38qzXaL4vCJ0aPyCuuTzk1zzg6kauzV+F5TtD5jw
WmFU16IkWR6AygS1+i+iAbr+5F1MaoxwU+rRNUOwF6BYRxcDbmDJ/pT/Olnq35jc
cYluux/zcr+4S6knBJAEGdKdF0Tk8nHFfGdg/bdCZLGL9M2LCUxr3pUA3Pl5XMQN
DgqU2X/Rzfmohr1dfIZIVCoh2/0odsMil8Cq6UtkkdjAHkCwlauGNSCQZ+5GjM+c
q3jsilT1sKUsAYJBuZCO/jV3lcuYVs3ymuYER4ZPXU4Q3ykFU49WS31DFFxIBmNR
2zgBnGynMzroBBEUiBcPBZoO5YMmKlXJNb1NbT3a4kojmxld1eyfmNUZp5UUNR9a
P+7ttKOY0tAPt2+c5OX0NwLw46Cl+SashoJ4Ryaz5QJmfwq/KuRLifAFbluCVeKl
nUZRaGEBsXYIo24Ly1AVaNjJ5vwTgi7Zklz1YZPdyQpG47s4SEBJeruuRG17YB7J
6P7dfnj3aJA4iI4a321MV64E5sRsi/WbZ1PaVE2yI1JybcyeZD2Bk8GbwZpkdlAR
esfVhR5MXJVzISBDvBKGNoWOPPHgdhquG/lItl+juDpSeNAdTTM=
=JTYi
-----END PGP SIGNATURE-----

--Sig_/6pyK.eaBqzPIRbUOyiqMOEK--

--===============0909135793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0909135793==--
