Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC849E915
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33B910E372;
	Thu, 27 Jan 2022 17:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24F410E372
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 17:33:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u24so4608481eds.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FOZAF5A3p4mhZisFzPr/R8ZIXvhN8wWDFykB6iqDaHU=;
 b=bM6hxK/jokDHdW+ADUU4VuMxMsDrBEmbiz9oig6o0z2IGYHkLZO9UxWI8L6VHt9OG0
 5z2c0RSoECTouQtt908YZlFpjzfNvXjvRkbSc+8KsDttnHV/zxfWdCzJquZ65lvfGlNX
 cfp4kVwpdOnVMNN5Z8kp0hllcKJ3kNRaMkyPgATSyKyvI36DegenpvfhLoBjaOkXaqqA
 WLNiGa0CzGHscQfxoEZqEhb8hoTjVrepdmYj1a/bK4U96oPMXieCqxBRhZColQpO0hZZ
 GSP68A1JlBn/OSpuythkak+3D+r0dYmhhplDlI9S+zbnv/3vzxtM9pMdhnDO54EeSRbe
 kEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FOZAF5A3p4mhZisFzPr/R8ZIXvhN8wWDFykB6iqDaHU=;
 b=W/6s+ow02970FMn9p97vrrFplByIW4Jw1kOoIOa/nHrWTiYEw9Q4t//j4cWT5oNIgv
 0UpVPO2drgXqWUwy9mYyNMEhEP7KVG3ZqiW4aSwyWRTIIj4owmrL5c8+h+NzQqjacfUD
 Y+KxR8qg2tZSA0Rjp1hfKAN7HwmSHISu6Au64thU8oz+ZB2t16iBwTlskCzUTXXuzbMs
 oFHexj/QRlOF2RJ8sQmC6YFfJQJ4bnHkUaM6qouW8Mcyad2vrGL7eQGLZoJUIO6luSkI
 jjG7Jx8HToC1usutmACOgyzfKe1FYBoAWAZ+e514d37v4TQCMt7yvpGOCbV99XpvJOHq
 OwrA==
X-Gm-Message-State: AOAM533qOIP6RPJh7Y1mts0y8AsULN2eOkPJy9fkfIH23obgneLtlFKW
 NmQ90CucgF8fY+cykRnDMeM=
X-Google-Smtp-Source: ABdhPJydudNeSfe6M/N389V+E7bC2CglXjpxyAdJMt5lvhmu/FwMm3H6ajx7cLpRoGlM+g7T+odVEg==
X-Received: by 2002:a05:6402:2071:: with SMTP id
 bd17mr4623584edb.328.1643304783161; 
 Thu, 27 Jan 2022 09:33:03 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id s19sm9593795edr.23.2022.01.27.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:33:02 -0800 (PST)
Date: Thu, 27 Jan 2022 18:32:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Fix hang on Tegra186+
Message-ID: <YfLXSxbdu3AbHwFp@orome>
References: <20211223144650.10335-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XW8H4TlOOnoqjy38"
Content-Disposition: inline
In-Reply-To: <20211223144650.10335-1-digetx@gmail.com>
User-Agent: Mutt/2.1.5 (31b18ae9) (2021-12-30)
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XW8H4TlOOnoqjy38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 05:46:50PM +0300, Dmitry Osipenko wrote:
> Tegra186+ hangs if host1x hardware is disabled at a kernel boot time
> because we touch hardware before runtime PM is resumed. Move sync point
> assignment initialization to the RPM-resume callback. Older SoCs were
> unaffected because they skip that sync point initialization.
>=20
> Tested-by: Jon Hunter <jonathanh@nvidia.com> # T186
> Reported-by: Jon Hunter <jonathanh@nvidia.com> # T186
> Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support=
")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/syncpt.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--XW8H4TlOOnoqjy38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHy10sACgkQ3SOs138+
s6Gw6xAAmGdmWBB58I3THIAGel1GCXIQhzP+taGfVjOMFv3ABV+zv4rujGwg3FOS
UuLmR3keYTrqonrU6mvnr4RhprY7K/g4KEsk+AJIxyI0hUkqRtcwfEl1MEDxmJ//
Y/+WgTjmINdqXbsC8wNdRG1XXTbQvIideHyB7E/rhvGiXUBiB61lF365La8DqKAy
f+PUnyuazJc25si5P5ySdRHISHiBF2/uSRfATwi65uWuvPcSS3kqxCrvQnWLcXHK
jp/NezEUvRwZzR+cPa7QD8Qtb5uv0rlTIPlE2NdMJ1jgy891q1K1MDNncSaSNzr9
QZ9xhH5BWKd3yVyn8fAPe05m6anK6ecoEzozUcSTADZhAjaz+I2KRZh83mkaW3js
P3YCThYl99+KalTSAJ+KauJ/7zC26zYraq8U9iB+5FlVgIRGwlauoF0w9lECOujS
/y6o0eohmY1umT0OPAJJv7cY3Jy9O1cpJfsmD7wfyE8RdWXu4Pu0sFUKafkYQPUA
hJ6EEouGlVM3B1cMMB/HYlSRxjecpdf7V/FSWREb9pLnKx01zRn4r0PKimkXXyeP
i/xRrRH4nkLH0Ea12UQKOOPbtV6rLUmh7ctqBJTPI0/3eIxVhxgZkPjuk8Uu/mKq
mgkk4aQU2hx9DGli2FdeGeBl0wh/i5TtxuqCUfnI1wR2A2iLPDk=
=6xh/
-----END PGP SIGNATURE-----

--XW8H4TlOOnoqjy38--
