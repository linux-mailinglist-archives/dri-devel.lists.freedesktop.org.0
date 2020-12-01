Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B62C99D6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF116E4C4;
	Tue,  1 Dec 2020 08:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510776E4CA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:47:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z1so1593548ljn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 00:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eFciGfZ8gBTe0kVSk8d6z32xm2elKo84gCzqFPfCHKU=;
 b=B0v1/yuYUIM7QFDK1Y8iRAEsNvuNECG1escQSvxkyR+zN+5FY7fOSegcN6lCkSd2wB
 Chutmmxxgq+YbhgaCf1lHdtyclhWSCDCAndu9nE3mfb0LsZlbUCkeMuaCulPGEzTpqKU
 BDLBDOXvNZTBzq0WH0vGoZcpQmdFVUO40JnlkQPcUcYLRVpf/LlFPfkosv49WAM6Jj0+
 6VutaAYknaXowCyfGRTIOK5vsvojgI//R16h9HdMQ3uRSr94NfQyqbOsaUtIfht8HhBB
 dUudsOazSIVKwDpGFttnO33S0j4gB0xo+aGlEtFlxC1h8qFbDkAwVBA+FSWAGYQ3GZ8A
 r6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eFciGfZ8gBTe0kVSk8d6z32xm2elKo84gCzqFPfCHKU=;
 b=RA6l9KmzDXFofz2GKWUDuAhMAHXsznUXcC+g7ZRTf8QBSyGc3FnAWcAXf3jVnCx1hZ
 CV6SKuvaPkNpsg1Rxo2Xz53UC0SlKEkrdI/Hcv/T3y9C2Q6HLkWiCIo5NXp7Ad9Uq2BW
 uTRkNXcsJsVkBnV6duAEKsqFBaylh/MtK3U/AAKQ7AdYC2mSV7KdohQwwr6Z9kBA+S4G
 IoUoHoXQwHaqJwHfJ+GmfIxvn8JF8wcp7sxYTTBHUQe0T9YlIoBHNY93G3fyWBWxBsR3
 7PBOCNez8o9wwrQBPYWPFwQLuJlpSrt5cI610F9Vq3IirFjhe8GTIw1WPRSULkM9aGft
 t3Og==
X-Gm-Message-State: AOAM531kNjsqTeL96GeDBny1frFAkEj4mPm9qvUvL7nlJLQL1su/vtYo
 8y8Wa55y34GpnTgS0FwEkdk=
X-Google-Smtp-Source: ABdhPJx924Z/WI+MYVQSbLmPjrdSURNZTj1wLGTiPZIdf51n9i05Tkg0qbrHrL8WL1gmkvoaAWg6FA==
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr837987ljj.32.1606812423709;
 Tue, 01 Dec 2020 00:47:03 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u18sm128801ljd.107.2020.12.01.00.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:47:03 -0800 (PST)
Date: Tue, 1 Dec 2020 10:46:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <20201201104659.4c250d7b@eldfell>
In-Reply-To: <mIkeaGvvD78FCgaiPQol6Kurxl1_qb3W5WU1hCf6KFNt0JkSRkN71TbNEy9wC4dLyWHW6dPFynuBY4Nw4xNNM6f2gLSxB0d3Hc87xErbL-o=@emersion.fr>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
 <20201130131326.7ac87605@eldfell>
 <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
 <20201130132446.79fffe6e@eldfell>
 <mIkeaGvvD78FCgaiPQol6Kurxl1_qb3W5WU1hCf6KFNt0JkSRkN71TbNEy9wC4dLyWHW6dPFynuBY4Nw4xNNM6f2gLSxB0d3Hc87xErbL-o=@emersion.fr>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: multipart/mixed; boundary="===============0588916324=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0588916324==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9Us6k/4P6+vaX7NKLKWwpGt"; protocol="application/pgp-signature"

--Sig_/9Us6k/4P6+vaX7NKLKWwpGt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Nov 2020 12:20:08 +0000
Simon Ser <contact@emersion.fr> wrote:

> CC Daniel and Ville
>=20
> On Monday, November 30, 2020 12:24 PM, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
>=20
> > > > Please record the justitication for that patch in its commit messag=
e.
> > > > "Can't" does not explain anything. =20
> > >
> > > Yeah, sorry about that. I'm just annoyed by all of this get_connector
> > > uAPI, so I don't really want to spend a lot of time documenting why
> > > it's so gross. =20
> >
> > But I still don't understand why the kernel cannot be fixed to do the
> > right thing that most of us assumed it should be doing: probe
> > automatically so userspace never needs to. =20
>=20
> My understanding is that it could maybe be implemented this way, but
> that it's not the way it works right now. So someone would need to go
> through all DRM drivers and implement the better behavior, then could
> restore this doc section.

Right, so that would be really good to explain in the commit message.


Thanks,
pq

--Sig_/9Us6k/4P6+vaX7NKLKWwpGt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/GAwMACgkQI1/ltBGq
qqd3KhAAs6I+tVdXQtWYFl7VL6grE4qXwUDSXc4mw0ywcc1vxr+oO55v8IQEXWqc
uXX2IaKwDkz7TNFv/YMZekC2ovXpULbU5cjtNS/UGXcNjU3mDMrVy0aSPNAKspCR
QP3N/OvO0vqmo0cqpZImj1uQKxTVDdrQqMSuymJrdyv4BltdIOYis0kWeqKNVvKJ
eQYXjmtdBlwtVFuloOlSkFybH+FfoRfTc0aR1NO+gShEwNBn4xhrmtkGvJzmKHyh
PT0IMf1M81r19Xu8l8YPtzZEhfzFOTnQcD2F9zcCgmbkjeP1UnckrLHhITuP9NFx
Lzy6cMiyVVDamwDCafW43xFkNXKx1bEHye+gcjD7ikkjiZfj9QOJpg1fph1ad4hh
z/fgY4HP27nSk9GJJFNihdCyWuR6VzfpojICxIhQQlYAJ3tB9xM4tgVrN33T3Hbo
gX24MIjasAsHHkQliF2oSgu4Mrf2A2cj+psu5HLG/Sj/AhHzZWNkvUVd15M7PBSc
JVwRmt9/9ABBG7N/ob0OzUuNM7bqGyCJ84iHC9+6380X6WYrLsvz9u+DCgFnsG9o
FfUzbPxebsapPEEUaGeOa07PEw4weKc6g80lQdTGUTNdrU9kovRCpglnpJJKJ4It
FakzU132SJc6Nmoxt8SyHTXAFuzg9EhWUQ1/+OvO8x5w9CJB5JM=
=EfrL
-----END PGP SIGNATURE-----

--Sig_/9Us6k/4P6+vaX7NKLKWwpGt--

--===============0588916324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0588916324==--
