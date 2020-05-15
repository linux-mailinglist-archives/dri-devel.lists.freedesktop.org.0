Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EFE1D4D15
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 13:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4B6E14E;
	Fri, 15 May 2020 11:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDD46E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 11:52:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y3so3245596wrt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DIr7ux6BE9jAIvX8sDUWPdJPykX6F+2iyiamRKA14JQ=;
 b=klT/eUcudtyWByI6bfjzT4W0iUL3XpRmGZwKnn3o3Y70HiSN0UaHLMdm9j8YfxeyWj
 aQtek1qBSZVd1khfjyB3C7r+34KlREzVvrOaF/uP3p6Z+gFMc+qWvQ0R3O10QePbaVin
 XNXPhSgBs5uJdyVKl2C1ti5k9ROLNRdYwuUg5AGqp4ADFl0TPjlnD044DTORdqwQRkvC
 01XZQhJItZkUPCJhCFNesu2HuCrAt1k3RgrWFhy8lkru3JCaiJTpsBmEDeJrWAaBpE/p
 BZsVifq3IM+LSiL6yUvNFRJQil6pX8vCY7sJJiCrPv+nWw/J0oh2n+U+3783kWeRDDbm
 Vo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DIr7ux6BE9jAIvX8sDUWPdJPykX6F+2iyiamRKA14JQ=;
 b=CFOoADJaZkOcMVqxscrwLh8LSqZliY9JB3iFVzNrfNG93DVH5YvL1ajCv1Bf+D7eKD
 454sx+yTjSgWOWLRv/2VbKn5MD8zX/u6GphV7K9V91mfnG/muNbgrdiwMXbDZUkXAWbo
 nDrWlkdhjA97Cbf3yGk0U/n+MU8cqC8gbPe0y1HCtxh7P5h0HUfLWjgoxd6b7npOj3gQ
 ciwtt1t9l65eWzO5iW5o9NMqgVjfrMBJNdgPQBwHw2OEj29cMA2SU/FE9lzCYcV+uc55
 2YpyD3XemWl1Jf7KtD6jRa1F2g3JkZZQmelNz2aVVG0KMU5FXrwKckGgdCkLVMO7bis+
 cbkQ==
X-Gm-Message-State: AOAM533cYpgFX6JeOPLMaSf7q/ygUWzrrQ2nIGCYNAGyrjnVbZ1Xspg0
 L4jmMgpxAD0TLeSZUjtjTMzLImFm
X-Google-Smtp-Source: ABdhPJwQT3aFJ3dRQDIjDDPscRayuoa7JwHr55btCfi7kpufYT4k9Ip73t50WLGSDrbzfrPG8cL3rA==
X-Received: by 2002:adf:face:: with SMTP id a14mr3813896wrs.397.1589543551068; 
 Fri, 15 May 2020 04:52:31 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
 by smtp.gmail.com with ESMTPSA id 1sm3319506wmz.13.2020.05.15.04.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 04:52:27 -0700 (PDT)
Date: Fri, 15 May 2020 13:52:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 31/38] drm/tegra: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200515115224.GA1381339@ulmo>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-32-emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-32-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0571720165=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0571720165==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 10:51:11AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
>=20
> Just drop the suffix. It makes the API cleaner.
>=20
> Done via the following script:
>=20
> __from=3Ddrm_gem_object_put_unlocked
> __to=3Ddrm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 12 ++++++------
>  drivers/gpu/drm/tegra/fb.c  |  6 +++---
>  drivers/gpu/drm/tegra/gem.c |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6+gm0ACgkQ3SOs138+
s6HtsA/+KEWpfKLHvHEGx0XuniKhR/OWFHLWhXhC8Vaf6HCYrkbQRd2/bYSGqOx2
d7EFTjWfZiSES7Pkix0r0y5aBW1bHSZhisR6YwQIvHg02omDUEFrHKPUrveuMZU8
JpUJTGnYuM7AreLdZ5fqvZEV4C8pvB3JBxWRQWzDRCPuR9heBQZ1h349dsBRxPRj
jjk1TABlvL/Tarwxwbe8WFbpiNC/FSNd8ve4pSYcmk5AvjP+P7ksAB+N8KaX/cMf
0plOMVoEwh/LsAtNjn4R5SEsGnNFkNsRZwAQy4hjadOqG1Wn0321PNql28FKZopH
GrkL99WkLHtxkG7BO5ADylLjCSHYr3rA9bvdV3St6yu1NYnuL8vz04rG7ilrQAJZ
qzP1Os0euYTABOfhe2GnjyVLH/WwMDybLnD/1bzo+N/hjHqbKEO3wCorRRZPJnfg
f4fIdma/wWg8cBnOKx2W4/o0hu9yuAmhxsVJZb5L+MPBLr/EFu/lhf/81PRw6+EJ
EDrlubpzR0ztn8JZEx2afHWNVvtQnK4kwM416g99gPQgXceS/SjglAPSeDv+SExs
1ZQuMKmmuGWYsA8rbZnxXVWQtK0xAXkpYsHx8dJwYrhgGrPwMfnumt5QEZ/xF82r
lIPw3N8VTQTle09J+G1ZLcC5InZe67QhCWchWJnzcbC9DerouWs=
=B91K
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

--===============0571720165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0571720165==--
