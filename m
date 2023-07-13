Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753775297E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD3310E73F;
	Thu, 13 Jul 2023 17:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596E10E73F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:06:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so1055465f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689267975; x=1691859975;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=an5raNvxoxoV2C+mXn71hpYX2DC/7JVk8F8J1Q1H/54=;
 b=JremP8eIlTrlSCCS4VWP8b7YlAzz98Ap623ZNpibPCqe/6OIXgx+sMGixKz+t17HZL
 4m/MHaumlOy2aakYXoi/KJheWwvwaDrOT5g2Acoqrlb5T2uhkW2WvfypTwtxQJc9DQnQ
 h87Ux3DaTVGr00nDZ5LCbFkgq3rjUVUM3a+PQ/jvH5Jdw991y9mjzPkc9yCtq5tjgLy4
 XObM8Ul14KTDKgYfPIP56TO6s3P6O+6XD0EmIj1/0BCC41mRdPqmxQXbEWlmhD7uhk90
 Czqt2UOd85UFYVuFdbQNH1u6nm/kd4sDMv8F88RQ9ig+sNj+U+4a3ZZ7KLO1iHr/cWdk
 LalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267975; x=1691859975;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=an5raNvxoxoV2C+mXn71hpYX2DC/7JVk8F8J1Q1H/54=;
 b=eSc5XrCAVLz6H80hDfnTVkvKvdCoEtLxtW9e1bu52m1yRDfhKWLLCmPelUdMHm/Dw+
 i8n5WlQRv9+c1dMRcOLI26iAHyeSTkYeBQPutRLyPxtxkUMd8vZeRLj9zcC36XG7ehMP
 j5/9PMJ7nFdXN73oZ0ZxckeV3HIa3HOboqUqbzH0/8rw1zDqsgf6zMmnpUooRs1k9yrE
 UDQ298ROIPVsEk8D+NWuVSKiy+UHUyQHOPrLQ+09HWKjwywObgaDKeRlm+zB6KihoyBg
 48VS6V5RiKRCNIdYNu1RPz7bYtjK2aBa6rnSq/LyFw4elcss7fu9E3QzMrmvI8ZiKLha
 0qbA==
X-Gm-Message-State: ABy/qLZ+8OHNG5XvDyaEnGGItKunyhY16g7BTaQ9rFMehf86JkGeNP1G
 7gxX+R8Henlh16nHfOQyd1A=
X-Google-Smtp-Source: APBJJlEPlH0TSNMD8S9HqhAc0d31bttn0SqbdbnLgyLnVc+6iis7K7RQ8iOxkCHEUC92wQ8vS0zc7A==
X-Received: by 2002:adf:ef44:0:b0:30f:c42e:3299 with SMTP id
 c4-20020adfef44000000b0030fc42e3299mr1744647wrp.60.1689267974480; 
 Thu, 13 Jul 2023 10:06:14 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 bs16-20020a170906d1d000b009930c80b87csm4288115ejb.142.2023.07.13.10.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:06:14 -0700 (PDT)
Date: Thu, 13 Jul 2023 19:06:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Message-ID: <ZLAu5fy7bCUJjvMs@orome>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
 <20230713153936.k2m6aj34vptj5vf7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J09nvNMCNZesz1Bf"
Content-Disposition: inline
In-Reply-To: <20230713153936.k2m6aj34vptj5vf7@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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


--J09nvNMCNZesz1Bf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 05:39:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Jul 13, 2023 at 10:41:45AM -0400, Sean Paul wrote:
> > On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > But even with the one-patch-per-rename approach I'd consider the
> > > renaming a net win, because ease of understanding code has a big valu=
e.
> > > It's value is not so easy measurable as "conflicts when backporting",
> > > but it also matters in say two years from now, while backporting
> > > shouldn't be an issue then any more.
> >=20
> > You've rightly identified the conjecture in your statement. I've been
> > on both sides of the argument, having written/maintained drm code
> > upstream and cherry-picked changes to a downstream kernel. Perhaps
> > it's because drm's definition of dev is ingrained in my muscle memory,
> > or maybe it's because I don't do a lot of upstream development these
> > days, but I just have a hard time seeing the benefit here.
>=20
> I see that my change doesn't immediately benefit those who are already
> at home in drivers/gpu/drm. So it's quite understandable that someone in
> a senior role (long time contributor or maintainer) doesn't see a big
> upside.
>=20
> In contrast I think my change (with its indisputable cost) lowers the
> bar for new contributors to drm. IMHO that's something a maintainer has
> to have on their radar, too, and that's easily undervalued in my
> experience.

To be honest, DRM/KMS is quite a complex subsystem, so whether dev is
struct device or struct drm_device doesn't really do anything to move
the bar in either direction.

Thierry

--J09nvNMCNZesz1Bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSwLwQACgkQ3SOs138+
s6F6MQ//bWrSwRE1kznZLL4X/MYVm1Tkz+54mBbZCa5T1clHLsXeWuc5gzt1YCJR
89sn7N6RgmpT7TmOWKpa0g2gahNDRZzow5dO4A8hZFDkdebFlDbCBnOZ/iIl6Ia/
7uiidWvB4eK0giACE29zGhmroP7Oe0pXWExQODe5d178IphZe1r0UVSM4Ajcse+W
1H+MA5PIvRiQQgPUHweKt8TPrI46oVQbwqkbMs9ZS3ZOK7vDgbzo+k39b7iJ/Q4P
kE++grlTfSClnldgRFOOrh2YeRStgukZwexXJ+9GtwN1S+fl3MaZcY1HfAbgj1Mc
qKu7O2LGv+MJOLg0M4gcBbTLMDkYmW/92SziKttipx5gqYz38JyZviPVj5VdMt97
gFstEzz3e+rLG0+4bECdlo1AmiORh0qHAB7h2lnvabLJRNdctMQXZbVVwB38Mbom
eh/CjllBIKebCtVNoR+1ePYcKhz1apWAkIYhXvVKLpsZFnf2kZVqd1erIgzKhFej
f1ZWUtznLqoMjgJJdH/ewzOvre1JSbYT4Hpl9C8X2fn4MpEDO8INUHh6TiIiLLDz
cPZxN45ozaiEaQLrFBqfke32YO4uX/yx74UI4PmkskUu9R4QOGELzbKNHXljz3Ke
aXz/haK7a2tAGLsSsuyGqEuMfKm+6sruRJVSoIxiH0qFlp69Twc=
=i9k/
-----END PGP SIGNATURE-----

--J09nvNMCNZesz1Bf--
