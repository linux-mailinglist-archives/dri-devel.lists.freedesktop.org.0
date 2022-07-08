Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A756BCCC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C3D10E3AF;
	Fri,  8 Jul 2022 15:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C6410E3D1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 15:12:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id va17so1790484ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iabJoYkjfq3/3xZK9v0EWEIYt27jDfDh2p6JWkdNFu4=;
 b=AqeIt+X/57fnInVt+8EXAZFuO064omExQfTcNiHUKA9xESgwkVvl74upScYNsAdiGr
 4P5ww0+4uvVSvsQPXNJkH1nYNYHAPjfRGcoDB4OL6Qh5mbUsbC5RuBMJh8a9Ke5+y9rU
 4y7uR+n21wXslBm4IM93T6+UGmVu183ZXyH2DLaG8NgZLsIhu3WhgLn0uiVbyYVRKmCy
 Wmlzg6Jsb4U9OK53qelBZoZGdL6SENdb9EvHmv8CTn7adtTR2BTTPmy8HbDjapSy+vjU
 S4UyRt9rBoyAl5XvH/ydKMIp71HpFxtG0GPfow9YgwSsUS11wD4z0jS1C+BtWzDNE62M
 rnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iabJoYkjfq3/3xZK9v0EWEIYt27jDfDh2p6JWkdNFu4=;
 b=LF6okJTffKL0nSGex/VqiDfdAUzereoIriwOEz5dx9SHPYLnBgZtbqbFoFn37g/Ym4
 CnLpwYIUmy2Eh6adzb57eYa9vdB2lnI/+jZdv7ZTGcYCcTjFXdAeG87dBAiOrMYd4Kw6
 3TMaE0sl6BBrKnA+pTqIKAK0BopLfT3KWIbM0KSU6L0COxGTouMgEB/ZYnHBi/dzqStD
 c4b4y092Gi95yV2W7bsthllUJ9p0r9KxxT+oWL8TqvWUpBkBcpoj3m5RT++ROUiJyg9p
 BuzmFXHxaGXZ6fFJzjwPqJQ9e1T5214Zdpc4FnUOlm3X1mvAqfBYSHXne6emJLVbc//X
 oAhg==
X-Gm-Message-State: AJIora9deHhwX2ADJD8EKMRbN4W9Qj6gnflvDA9Uh0Zhve3oeXkhJTov
 VFyO3PlMjg5UE52rua5X1KnNnrCnsoE=
X-Google-Smtp-Source: AGRyM1teRBLIsqxs8bfR7rwyDEiOkElkxnrW4MDwThQFlqHvMMYUNu0aZttJMp04EolUIzQUuqQOBg==
X-Received: by 2002:a17:906:c048:b0:718:ca61:e7b9 with SMTP id
 bm8-20020a170906c04800b00718ca61e7b9mr4061773ejb.120.1657293120070; 
 Fri, 08 Jul 2022 08:12:00 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 kv22-20020a17090778d600b0072b21cab5a5sm1335011ejc.133.2022.07.08.08.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:11:58 -0700 (PDT)
Date: Fri, 8 Jul 2022 17:11:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Message-ID: <YshJPZMMlZVl5i51@orome>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
 <Ysg/7u5gRiDbEm5F@orome>
 <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TdDXjrDRy7AveTVw"
Content-Disposition: inline
In-Reply-To: <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org,
 mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--TdDXjrDRy7AveTVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 03:44:09PM +0100, Robin Murphy wrote:
> On 2022-07-08 15:32, Thierry Reding wrote:
> > On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
> > > Conditional registration is a problem for other subsystems which may
> > > unwittingly try to interact with host1x_context_device_bus_type in an
> > > uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> > > typical system already reveals plenty of entries from enabled but
> > > otherwise irrelevant configs, so lets keep things simple and register
> > > our context bus unconditionally too.
> > >=20
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   drivers/gpu/host1x/context_bus.c | 5 -----
> > >   1 file changed, 5 deletions(-)
> >=20
> > Applied, thanks.
> >=20
> > Do we need this in v5.19 or is it enough if this gets into v5.20?
>=20
> It's not strictly a critical fix, so I think 5.20 is fine. I plan to post=
 v4
> of my bus_set_iommu() series next week as the hopefully-final version, but
> at this point I think it might be safer to hold off actually merging that
> until early next cycle, to give it plenty of time in -next.

Alright, I'll send it for v5.20 for now. If things change we can always
backport to v5.19.

Thierry

--TdDXjrDRy7AveTVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLISToACgkQ3SOs138+
s6FLKBAAkw6SEiVZsl95AEj/egqGdizSq7N3RWr6sIggW+KUltCmuS6hgBZmciHs
V7mEGovB5Ah4MVzcWk6MUZ/i19ehPS6gUK3uSY/rOUKNucUIaFQJ40zYjJ2YLsSM
ai5WEzlBJCQDUfSug84o0ECWSF0RfYFoezjTKOcX1aax2nGWznyJIXm2LY4HA7Yx
qO40VNXGJCzEtRPIQGT9kY1S/TpRE83Ipp92a9Enp1l4fulhvA2Xwcoi0gxPUYVk
2+aZA0nK505Oxg1bmagY5Z7fIKL+Qe3xmGsRIcDU1VQ9hAwlEUif0cnc8nWHyjou
Ht5I/DJvdoai2ZjyI+pcSy6oTGg8xGpArPwEvmcj6rup74c+A9rG+myqCoEz69J9
aQhSHEdc949W9RFvG12JHL5HeUVtJY5nHucHeYb0daXnywJUm8NMtTuOMGEw523b
sUH4mJ3ThmPC/5L4+OxRH9vBouBJrEAsdSBWz8mz3WgMoXXG9Z9NXg0KhI+qEcev
cTae9mQegcQcZsZ6o/QQMwMPCxv+daC/NRAUAWQe2r5eN/VN4e/9XfMuHkGF981n
X9hT/OwT+lGbfgYGbLhR5koXET51D8fQEgAo/LeONAXKQKyWMT4zzVEqNwK6tktf
j2XL+HPpBKglEnfURm8jUKE3NzhlefbKQKAwYBHb6gBwN+LqEy0=
=pA2R
-----END PGP SIGNATURE-----

--TdDXjrDRy7AveTVw--
