Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D42D0E56
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FBD89364;
	Mon,  7 Dec 2020 10:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838DA89364
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:45:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j10so14416025lja.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 02:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dtYeAIz/Tlm34/zugzB9i++IzBupGAArbI1GeokfBr0=;
 b=EazD7IaZjKO4rP/671DjJeyG65KGY+YwW5djuaUZw0tvSYuHv/pc5If5WGy8aE5q5X
 7OAwYNn6F76y4oFeISWX/0cUecbOO4SRWuHcOqrw2s40DIHUapzyNZf2lJraPI4fFIGD
 Cb0f833NF+ZMy9esSup/o8RDw1RstmZlWgdd/w4i/FTIe+AckhM3DGlYLVWfnzwLIF9y
 dhyqaLeFuTQLsOjr5s5mLC4W62obk6XAfr+7QO92D+hAqK8xMa6ZG7ssRP//PQhvSR6t
 wh9RoiN8A0dBAzBU5a3Z7yTj6F6VFjuF9u/FPk9ZYYvH86T3WqDiIrxPn6B9TOzYH+rJ
 UjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dtYeAIz/Tlm34/zugzB9i++IzBupGAArbI1GeokfBr0=;
 b=in0uYDC5CqHxl/PACjX15oiyeWhfK5K1d/RJjbGjg+3u2xYdKoj5MiakQekEJve6ze
 yAo3lwpEa0dc0NU35ASJnIqDzje8hjPToZShDiRdOkYLpEjbOXs9dROti6D0uLMieJkX
 G1ZC8SyBWwDoY9hpDTLDkoncTK8L8ksW9uN7Oo1jIqX+UibzOTlYBezsbVkUvEQvhCCB
 66EOl0zUE4Fsroj/RCmbwfw+lzcTeYJYs4TuXpEkCdxf2yPBjFqtSO+AQnTuCYINMqVh
 6WvM4SEN7D1OB2EGzqEcSVTVluSqisb3AAc9t8kEk8DCWXwxRnthZhFYdRHw22llShxH
 Q3GQ==
X-Gm-Message-State: AOAM531G1UlRK8FTX+2U1c/OJdjtbsVd6s+nYCz66W9Id23ZHTVyYOBF
 pkKVZr6Cx1QRihjlUIpaH88=
X-Google-Smtp-Source: ABdhPJzcoXsRYfafrO1JYk/RLgjTKfaHehYWFLsTA8AL/tbpfoY1M5T5da3WBcWXmpJMhEM78y7Y7Q==
X-Received: by 2002:a2e:81cb:: with SMTP id s11mr1646582ljg.377.1607337904962; 
 Mon, 07 Dec 2020 02:45:04 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n13sm1132540ljg.64.2020.12.07.02.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 02:45:04 -0800 (PST)
Date: Mon, 7 Dec 2020 12:44:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: James Park <james.park@lagfreegames.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201207124454.42b87186@eldfell>
In-Reply-To: <20201207123514.65e4b868@eldfell>
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
 <20201207123514.65e4b868@eldfell>
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
Content-Type: multipart/mixed; boundary="===============0152851378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0152851378==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UjzOL3_JVOw/oRdG7UjG5qp"; protocol="application/pgp-signature"

--Sig_/UjzOL3_JVOw/oRdG7UjG5qp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Dec 2020 12:35:14 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 7 Dec 2020 01:08:58 -0800
> James Park <james.park@lagfreegames.com> wrote:
>=20
> > I'm not completely sure what you're saying, but doesn't drm_base_types.h
> > (now drm_basic_types.h) make things robust to header order? The patch i=
s in
> > another email. You can also see it here:
> > https://github.com/jpark37/linux/commit/0cc8ae750bfd9eab7e31c7de6aa84f2=
4682f4f18 =20
>=20
> If that is robust (I don't know if it is, I haven't checked), then why
> do you have #ifdef DRM_FOURCC_STANDALONE in it at all?
>=20
> Like Simon said:
>=20
> On Mon, 07 Dec 2020 10:02:36 +0000
> Simon Ser <contact@emersion.fr> wrote:
>=20
> > In my compositors I'd like to globally define DRM_FOURCC_STANDALONE
> > (to make sure I don't miss any #define) but I still may include drm.h
> > in the same files as well. =20
>=20
> If any project #defines it globally, then what good does checking for
> it do? Why not assume that everyone will always want what
> DRM_FOURCC_STANDALONE would bring?

Sorry! Now I got it.

DRM_FOURCC_STANDALONE is a promise that the user is not relying on
drm_foucc.h to pull in drm.h. Nothing else. That's fine.

But then, the code in the header should be literally

#ifndef DRM_FOURCC_STANDALONE
#include "drm.h"
#endif

without an #else branch.


Thanks,
pq

--Sig_/UjzOL3_JVOw/oRdG7UjG5qp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/OB6YACgkQI1/ltBGq
qqfRFA//fyzD/qQNmgs/ZVVt/vyXI/hLrjKLQa+QqMKS8VOBPGsfS4M9/b2lofNa
ayaBpIOdr8CI+E/bzKTaMg1kugOFgDmKLQTFUSGE8m2JmnCoMjHY6SWSXwoGEABy
aeydSGGVu0kDlQwJLe0c0USdss27xEgWfrXir0lWXWTROxzN2XUFeAJ+MSK19G+l
1b2RJ8KlGIwFw2HLDhdqeWDusLh3K5D73nFrz++/2lilnC0YMllSW3BMzfX/S2uV
uJ4XfrVBHrrdoGD66DhvQMhgH6zjcATtk+Ne1oq5XNNsr6hjRymaw9kj5co+zghH
f4kPM+aGroY/V6+P20Iv6MsZWX9efIE19AUiSJK1QUQeE+5Ix9JcXJFFnBtKmuem
+0exS9twLVDrs2rsy978pokdkCqCvcntlgwnEF+8Ajij85GyRyYCq0aEmRzmOxF0
QwlvO1ZKqOl7XYyb0TH3LGvV2oRFqhifrYqLtnHAh5pI8OIzDOpBNN5xM4zP4utO
egIppaHxTQjLGMzlGJpQlnpxzy+M4CCRrPrT5x5y9h+qL0M8eeBFEDzWoRZQt9+T
22j/XqE1RdnuGbSi5CIAJM98d2QgF2Xxe+2qMAoGotkQuy5a+jyZblxeEeESQvAw
fWXeMBmEgY32FNXQBm6Dzx/DDEr145N16F7nyOQClXbXPvQNrsk=
=zqa5
-----END PGP SIGNATURE-----

--Sig_/UjzOL3_JVOw/oRdG7UjG5qp--

--===============0152851378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0152851378==--
