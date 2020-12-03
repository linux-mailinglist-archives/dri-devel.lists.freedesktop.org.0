Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72862CD207
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 10:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7D56E09E;
	Thu,  3 Dec 2020 09:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E386E09E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 09:05:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q13so1609908lfr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 01:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=BP6j1ZGca/R5STUK5f4oazm4Py+6+dzKKUm8lmvNb+c=;
 b=anrmtb2VSm2YFhC3+DLCTfimOiOyuKdMnZr1XB7Gc5YPnflwePDKR69It0RdwMNapz
 vqeYIE60fHlRR+6EjL8/PvpnJcNK6+E1YlyZPJnyeENW0/2IaEccPt5pynawnQBnoUl5
 h2rC9CgprjRCHa0+1raKmTrMcEBWeTF1zAVm+uEcsDgqjJsQaiOdkoDtRHJcXwJcvpTR
 fO7iUL6Iy4r5xoKwy3ORNQb/l3iX20o1aYcpWqWQnZ83hbqtz1VoHA0e8CX6oVYFbZsx
 ZGSsI/CdLCfsouzn80C5cdbA4lZ5Vs02+IrOsmUp7BBv3YP66ZvVDOgZ8NxakHEG386B
 dTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=BP6j1ZGca/R5STUK5f4oazm4Py+6+dzKKUm8lmvNb+c=;
 b=I++2PWOMsFP30aPBc8YtKcKBc6OnmkiCcQvzxTH3qIhXttuzHuGcsa18YlKwvQJJ+H
 KDulP+oPP0US/tBGb2OJKxL1cUdefMeG178Y9bwsb4fCH26a9esX+qcy0SJ43OX+RCHA
 fusbMkBKc86EuVgTC8bkTjPMj6l7unyOPuBeVIZLx8zBCYNKoLR7UbAPGzLuy6QVnQ81
 rYb4FRMukc+CnW1dVlK5dxcve34pkYBqubE/xFNVnl5OY1EbY/pJy4OEwo2Kov/q7Ciq
 7ZHRJbFmtf/dwfLgOngI6EZIh/Hpw/r2FRd1G1kg8LrO0s83i2sypl1Q73yFom5NFncu
 PG4g==
X-Gm-Message-State: AOAM5334ZJTETBOOY7G0j9XdAk5p9vxHwdSQD+g8e0e/OA4O3qBczWOk
 qZjqrPWgxXL0k4GFxAUzO6A=
X-Google-Smtp-Source: ABdhPJyJ556WcZJNeNZkdI+Lk3IReWdEc74yluRV8d7w9CBJGPFTYmW9noM5isePG5bDgybYgL9dAw==
X-Received: by 2002:ac2:5311:: with SMTP id c17mr942299lfh.22.1606986308769;
 Thu, 03 Dec 2020 01:05:08 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 65sm286072lfd.266.2020.12.03.01.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 01:05:08 -0800 (PST)
Date: Thu, 3 Dec 2020 11:05:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201203110504.05982f76@eldfell>
In-Reply-To: <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
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
Cc: Michel =?UTF-8?B?RMOkbnpl?= =?UTF-8?B?cg==?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============1803361651=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1803361651==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ApSa3OM4J4svmz75CG+8DF3"; protocol="application/pgp-signature"

--Sig_/ApSa3OM4J4svmz75CG+8DF3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Dec 2020 23:25:58 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> Also kinda disappointing that drm_fourcc.h includes drm.h and isn't
> standalone, but I guess that sailed (at least for linux).

Hi,

FWIW, libweston core needs drm_fourcc.h too, even if nothing would ever
use DRM or need libdrm otherwise. A stand-alone drm_fourcc.h
replacement would make sense, although distributing it through libdrm
would still make libweston require libdrm headers at build time, even
if it doesn't need libdrm.so. Not a big deal, and I don't know if
anyone actually builds libweston without DRM-backend.

Inventing yet another pixel format enumeration just because you don't
want to depend on a specific piece of other software really sucks, so
libweston went with DRM formats as the canonical enumeration. And
Wayland protocols use it too - Wayland clients rarely have any use for
libdrm otherwise.

Maybe a new header drm_formats.h that is what drm_fourcc.h should have
been, and make drm_fourcc.h include that to be backwards API compatible?


Thanks,
pq

--Sig_/ApSa3OM4J4svmz75CG+8DF3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/IqkAACgkQI1/ltBGq
qqfxLA/9Gd/Mgy/18io9J4oMuTNRRaeuawCPoL6/vUgLvd0LBIFo4IjrmAV6fKOj
U6zHf5BtPEEF14QmPxOU6w44NSoyY3kAnZkeUHcjEUQTbn7nfPxA6v0R0nTK8L/B
tD1Dj0+4eUL6f9A6Xw+rOMieK8Gai/Dsc4n/veYijoCtv/6zfVMxFmhOyMgXzsg4
muWAS/BDPAzJYX6B/2GWTfu0DDd3U9V846kfB7ZpE7vCZnxoL7DGPQ6b8J5nt8UQ
+iAd5dLEbKdHKN5oazjN37mdkJMRb37/yAEQvoN6mh/H8c7IQz8sr7vpxOY5CYDz
7H+dkKbDPGCOWIhRoiYU99YkQ076RC9fnQkWqDEqimake69X34khDZBO66HhZjzS
0FRDWbApyCna9IsWXh/i2LmhDLj0ucIkUoCcYzYi0dJuaBOw9ldGZRlLnCCOn+pj
uBURuWH7rBVEsOYWZjGrtqPs5GM2JNWKgaknCB7OCXAc/M4JFNn4BBvBILiPElgD
4ketFzAN24Phe/w8YwBG62LrT6T1pAu2GCmLW8L5n+kkNcf4rE8iwPV8SXIz+hSb
85D7SrDQH/+XkH4S3bbPqxaM2YmNdGqdGQx6NtlMOjKjUnjTP7dwfZCSc9k+Qua6
Q5NsZyMGUbY3Bq6SFVSvFyjTS6JS2NGQW9CjVMf++8JpEwUKrhs=
=QarK
-----END PGP SIGNATURE-----

--Sig_/ApSa3OM4J4svmz75CG+8DF3--

--===============1803361651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803361651==--
