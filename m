Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA60698F64
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 10:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB0510E0D8;
	Thu, 16 Feb 2023 09:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CB610E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 09:11:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a9so1204726ljr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NtJ/t7fbAnL81OyINie/u/q8kziU9uvYuPl/dE8leRs=;
 b=CqCP30L6D45pzRX3UG6uH6mYnX+T/OPHHar0ykGZZzj2sVBxbBLkAWkrO9TZ7Dh88U
 xMnsJovZBB5dZnbjfvUSdyhpZQplcAaKa/hV2QsRVTuC+347mKmV9rtlGrtxvntlZU6J
 C2uOyU3eOieqpK1L8Xm13w/O7qwbJkWL2i3YQ2XDWuhxKrh5E+mzlajju97H1jDfPKex
 I6axI8NvBULOICnQGbqigsI0J+9u1M/kLnRC30nxV2uNBB6AsX7LhUanBSD8LnWhxPf2
 2lAPfXX6cSQ8YCw4Sy4pj9bGZ/sYughXAangHURumkJq1YxsXBe5EQYx0nS8kSb9OklJ
 E+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NtJ/t7fbAnL81OyINie/u/q8kziU9uvYuPl/dE8leRs=;
 b=iEmUKmAhxOH2LHTmVyHjNJqYmtcLlJo2MnnFcOcbk3Wc5YxEMyjfMOFiy5y0wkPuDi
 PuIm0x8e+cOowRzcX2n8JApyuG/njwkiH3DMJH+q/MtKpWE8Rh7EH2E7apTl5xs5+F3l
 aF6+EJf3YcljIsop2TruhdsNnuOtVW21p4nlrhfruwzccS5SEmkJDbiU3doenYczt8Rk
 BK+UrjioOCSE/gul/TivNftKXAIUT2XHtE28OUXPAo22lTLK7M1tyj7aoGGCQcprbjDY
 Cs6MLzyTt1Au+4QcxQRwWxQM/pn4yzthuxWfZP7bXBLv8kVCHNOrOlfk0SuNa0VP/qQd
 /53Q==
X-Gm-Message-State: AO0yUKWdlnhiV2XzyZstFLIbnHVWvjukl2CHIxKCCtLRJ1WwDh2FdyZO
 V5K2DOXktEQHfHLwbhg4TyI=
X-Google-Smtp-Source: AK7set+ShE5kFEYt1Mif7UI/msKtKrC3I+ma01zcUrMSsbfkT8QbzP0ukGQaBLv9H+/xuVnoD7PQbw==
X-Received: by 2002:a2e:9c94:0:b0:293:5cce:56ea with SMTP id
 x20-20020a2e9c94000000b002935cce56eamr1414821lji.47.1676538680779; 
 Thu, 16 Feb 2023 01:11:20 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m21-20020a2e9115000000b00293530f5765sm107543ljg.113.2023.02.16.01.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 01:11:20 -0800 (PST)
Date: Thu, 16 Feb 2023 11:11:10 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>, daniels@collabora.com
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <20230216111110.5d1e8e7d@eldfell>
In-Reply-To: <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
 <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/INvQRH/1JojWMoSejq72wPK";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/INvQRH/1JojWMoSejq72wPK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Feb 2023 17:03:54 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, February 15th, 2023 at 14:41, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
>=20
> > I didn't know it was at all possible to have different GEM handles
> > pointing to the same object. DMABUF import is guaranteed to return the
> > existing GEM handle, right? Why is GETFB2 different? Why does it not
> > have the same problem as what forced DMABUF import to return existing
> > handles? =20
>=20
> drm_gem_prime_fd_to_handle() explicitly checks whether the memory object
> already has a GEM handle via drm_prime_lookup_buf_handle(). OTOH,
> drm_mode_getfb() and drm_mode_getfb2_ioctl() just unconditionally call
> drm_gem_handle_create().
>=20
> Yes, it's a rather inconsistent detail. A detail which becomes very
> important when ref'counting and trying not to leak GEM handles from
> user-space. Fortunately GETFB/GETFB2 usage is pretty seldom.

I see that GETFB was introduced in

commit f453ba0460742ad027ae0c4c7d61e62817b3e7ef
Author: Dave Airlie <airlied@redhat.com>
Date:   Fri Nov 7 14:05:41 2008 -0800

    DRM: add mode setting support

and I guess GETFB2 just replicated the behaviour for no reason. Was
that it, Daniel S.? Are there other pitfalls that should be documented?

So it was long before dmabuf was a thing I believe, meaning that any
dmabuf import problems could not have been known.

Btw. does this also mean that if you use GETFB2 to get handle A, you
export that as dmabuf and import in the same open device instance, you
again get handle A?

IOW, you should *never* ever export a dmabuf of what you got with
GETFB2. If one did, one might import it oneself via GBM, breaking all
reference counting. But you also cannot "just leak" the handle A,
because if GBM happens to run on a different DRM device opened
instance, GBM would get a different handle to own.

That's... err. How is a compositor supposed to do transition animation
from an old FB to its own thing? I guess mmap + glTexImage2D equivalent
to make a copy of the old FB so one can use it as a texture?

Maybe something about this would be good to spell out in the doc?


Thanks,
pq

--Sig_/INvQRH/1JojWMoSejq72wPK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPt8y4ACgkQI1/ltBGq
qqdXNRAAiSTrlOS+r2nnZwB+yT+Dkm0Y4oc7ejwobknzzY6IpkuFoR+5qb9Xaoyp
VkRcXY9TEMvR3om5gtT11SwNPeER7Wze6X2mB/PmrE4Ta9g3V7TkNVyd3MQ22XUz
itslYsGEFmICA067hR9XP4TQ6mzbNdN0fTGAu2wAr338oguSr5bNihXdgMmdldol
6ig/pdGSetLG5r0Uhg/9DUOyUTo68fcI2j2ozV95I11XX2g1FahQ1lC3y5UD1FEL
8PHdVeCQGt2kczqirpAptlpBaoBJMF6EuyHcJcgKXgwIHSqxPzGKGRCyHzcg23Wv
vFZOKP4qpQNxuU9Q8eFkTUwfRE3T/GDARPb/SZDa4+XSCVpkc+9yPGwi9Ay1BeWR
5Vp84nRUrcq/Y6cM8FzPx8KcR1TibJW9oTeqZ+lV5jga75180EpttOpJrV74C/cs
0pZeId1stgSl+Kex+fb6bTod6SAkGdO2OgVY0lOk6xePGjr2a+dfVk9ADKuxY3Hp
ljoOSYmJtlsNd2prJchDd6D0IxP6jDSKR5O51zrkJ/EGNOXDuedoQFitatpcT0Rr
3OjaEY8WAYJH7XVHmYaXOPed7aOP5g4fChGCU3sTe+yGbR24tdULVFpTlMbM5zOf
1cOTihWX1LJGt8Wx2CrlCNa+giPISMBdSnkrZ18FnyVy28Ix9tI=
=RCgT
-----END PGP SIGNATURE-----

--Sig_/INvQRH/1JojWMoSejq72wPK--
