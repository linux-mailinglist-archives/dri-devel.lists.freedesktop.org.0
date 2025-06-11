Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447FAD59C2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 17:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC7B10E6B4;
	Wed, 11 Jun 2025 15:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjaQU06M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5610E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:10:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so59214485e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749654629; x=1750259429; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6S8PHrg4XjEfujkT1575VWw1Fek905U7Rjg8vUvSE8U=;
 b=mjaQU06MmIflBzyLrexEDGbdF9yQe3hAioKYYHtgOuvdeXx8+P5MjU/z/lChyYnyXQ
 M6odQG60aX4V8DmJc/6Zl0P3INhEju1SnMr4ITmtkM9Q0vUHcFXkiF2hG5S/ygRkG2NQ
 NG/6Ha9ns2LKbMog1bqd1/9FnyCr+B5+W+RFImJnPJmeA1W6RVGHYZooAwBqXIER+9At
 Kh5sGFjT6NpWzgo8pM3uwhWXVO2XmLUVxpilCRQlsf1+OtXQfyYGo2ii05zId/ZMUnJ4
 u/uppBxrbZMe+w4ptr+c0a9WbG3t6aNG07XAxqius7w5O/lOLmZ+tRHLyGR+rFW5uNdf
 BXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749654629; x=1750259429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6S8PHrg4XjEfujkT1575VWw1Fek905U7Rjg8vUvSE8U=;
 b=WQomG//icTgb2SJQvnPi18+k8p0nVgRVx7aTNdQbWREbHPBtVoo5pJ0JJY7n5CuV3p
 lZPXi3HvssBfhK6wZuqDx44SQtoZMyE/QsxMB9erY22G+8yugS+AY7xaZ0yjS7QotLRk
 XkHAVo8qV+uhdbDkEbxZddBSWf93JjXg7uV1AIKpkt2oz6i3sjmqhPj9//Au91uTVkIv
 dgQf6RkdgXe0whR/tlD8QHYh+94XdKRi2LXk0PqONc84PudP7HkjlMPY7K/Aybco5ptz
 fhXX+In0rHJkN/ujuvYc696MgBEAB9ixlhsXJPUtVN4F9uj9fM/hu3txDsiYc5GJ3c3N
 rV3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt3tMcb2/WGdXWM9lNOKN5yBN2hpOim/AB7ERRON233R+Cm/nvO8m5I56gePbKbOMelNcR5JXyotM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTMu+7147VN/StsXiL2TXl19J26EtBSDj7ag5gEkNP8ZyeSQZs
 w5TsN+UeEH/ldPOR2IAZIwuV92taTDKIoofjgR0FG84M4DOPa44JDHHi
X-Gm-Gg: ASbGncuPBa7KGQ+DjnbuRk0mMoVNBxR5/w9aDN5zGStophhKlJ2TX4OSZAJdQUCq79G
 iXfjYc0iarpX+3/C7rtqqC1BlQV3UvIp8sPv7MkoIFYi000bWh5TM+eC5RzztpYhpcXOByO3tbV
 LnmbjFAzX09UwE/tqH8IeVBtFT7oFeC9Qnm149D83aqeSd449ZIOX/XbcLDRgJRiE+Nq1WhGO38
 lnK39XnIBJ4EH1mMcYk7Mh8ej3rupzEcypDwLEwtP/+ODoEeGLx8XkcRE3AMJVpqbNMsaSJOgAW
 av+AFwlFbMH/TF4YyLevGPWnKuMRorlJGLpm52JtuG20NWpTyUpI5OtXdo2q0OUtyeqbrmjhRiZ
 GO8FPkgTKzCvWCdUTPQIFwQO+sdu/MU/pzjOUERBpoTa6OgGk
X-Google-Smtp-Source: AGHT+IGV2tevVvnQ6RCHD0iJmFj1JTxfJOLQ/4g1Cwf7cPMViMXWr9d2Vxgox5m5bmrvt0G7XLIM4Q==
X-Received: by 2002:a05:600c:3504:b0:43d:160:cd97 with SMTP id
 5b1f17b1804b1-453248d3739mr29788245e9.25.1749654628570; 
 Wed, 11 Jun 2025 08:10:28 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323ad0c4sm15684910f8f.30.2025.06.11.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 08:10:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:10:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <c3un5kjfepprcjddchqmecik27huepuxejs6vckuqb3dshrcba@s2jcf23au62n>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eounn7ro2a5wiyxy"
Content-Disposition: inline
In-Reply-To: <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eounn7ro2a5wiyxy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 01:04:14PM +0100, Diogo Ivo wrote:
>=20
>=20
> On 6/10/25 10:05 AM, Thierry Reding wrote:
> > On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> > > Hello,
> > >=20
> > > This series adds support for the NVJPG hardware accelerator found in =
the
> > > Tegra210 SoC.
> > >=20
> > > The kernel driver is essentially a copy of the NVDEC driver as both
> > > engines are Falcon-based.
> > >=20
> > > For the userspace part I have written a Mesa Gallium backend [1] that,
> > > while still very much experimental, works in decoding images with VA-=
API.
> > >=20
> > > I have been using ffmpeg to call VA-API with the following command:
> > >=20
> > > ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 =
-i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
> > >=20
> > > which decodes <input.jpg> and shows the result in the framebuffer.
> > >=20
> > > The firmware for the engine can be obtained from a Linux for Tegra
> > > distribution.
> >=20
> > By the way, have you tried running this on anything newer than Tegra210?
> > Given your progress on this, we can probably start thinking about
> > submitting the binaries to linux-firmware.
>=20
> Since I don't have access to other Tegra platforms I haven't been able
> to test this driver there. For this I need help from someone with access
> to more hardware, I can send a version that just adds the extra compatibl=
es
> and we could see if it works.
>=20
> As for the firmwares that would be great!

I think both of these are things that Mikko and I can help with.

> > > Due to the way the Gallium implementation works for Tegra
> > > the GPU also needs to be enabled.
> >=20
> > I wonder if maybe we can get rid of this requirement. While it's
> > certainly nice to have the GPU enabled, there may be cases where using
> > only the other engines may be advantageous. Originally when I had worked
> > on VIC, I was looking at how it could be used for compositing without
> > getting the GPU involved. That's something that Android devices tend(ed)
> > to do because of the power savings that come with it.
>=20
> Yes I think this is possible to do, it mainly has involves properly
> handling the Gallium driver initialization. I'll take a look at it
> before submitting the MR for the Gallium driver.

Okay, great. But I think it's definitely something that we can defer if
it's non-trivial.

Thierry

--eounn7ro2a5wiyxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJnGEACgkQ3SOs138+
s6F92Q//f6SU6icZGjpZAWYgaEic9DvE0zJTrIzfnl6VwUmSUi/tSCoe374MyNK/
3onpN91p6PgcJbZgg93wbSc2hSgThPrn3Wxr6xVaAaCbEQ2cP3bzNTCI/q+oFrQn
FaqjgYpSO0rSzqtTlanIqpPWJ6NEBvb411fmCycBR8sreSMGqDmyvZBgzRVhLWAb
Pc93qJMc+fp3VjJ/M5tr0ffv7DimWH2f+9RyR7ydoYNZYvv+bHlcA03qNvkJZCPM
ssDQ2pOwB7Ubg0GarzpNHdpoyeh+LfxViRowTvCtbeB+wFjeZyINSO2a6c1wYzzp
rnov9B+i9akVFGZaHLkADP6FlNS6LQelzklja4Je9DPmptrtYQXFdQ+MawtH9slk
ZTm8gSpA09Jq6HdNL6J9+pCRvxlVibGf7n7acD52dFAhEx779Si+8fuNMd3KQ8/O
1+pYSGJEij/ZSuvwIEae/XNlkmXJhmDZ1vIek1bA8/JeYI7h0UmKy/x8lKsH8bz0
J6RJehIvilKS5D9J8dTp3B9Xh6p2cfx3NWX9Pwzn+4SUbQ5pWnweoT3jErTpuJmM
RwEzn2QCmsEGj32bn0v0iPj5IRlhGwlR/9SO8kZuRY0mf0AMRRS7O47wtfvbI3y8
fxsJpInNhbqBw2tPhgHb/fDt+pjd7uS2NprQtm8IldzR7o4JpWc=
=kiwA
-----END PGP SIGNATURE-----

--eounn7ro2a5wiyxy--
