Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF82F807E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3031B6E0CA;
	Fri, 15 Jan 2021 16:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36B6E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:19:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a9so6391021wrt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RpPzCnEbM+BB2d0m/Im6aUAG378bIlXPBSFsfBiF574=;
 b=RPaR/6hRCHnQ+gNnGZUeyaSC7TR4yqISHD0xfkduKwlk82dBmjI4mUQgka9fO5b4wT
 25GiDs1lxVr/QYgX1RayfBYK03F24bAcKBxkm1EO6v2pG0OZU8T4aT4CWjZRSqHQT5n1
 Xfdz6MDRd45r6/1I9n7EQfHkNcAr7VcL+e3f9eWmK9J3ZjcyxQ36/iV3MwCKXqAHTC3M
 64tWZ4S5NCCy/c+pmj9Hew4C/h/oMdGT+jT1odw7QBYT1LUrZ2OAS5L7z0/hjai7Vrvq
 RLgE197yc8+HCb2Y+bsHrMkp+a24hCtZ+d8QH2Y3bvK4a5gEn/oavXouwnoRZFNklGTF
 QMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RpPzCnEbM+BB2d0m/Im6aUAG378bIlXPBSFsfBiF574=;
 b=shlCmpRV6ZAoyv+YOkC7cNRSkuIHr+gAXxii0bQ9YlgR7ES3KpHbTZxkxwOSyxJgcm
 qQplWsa8zusvKT3ASgGC0TlTnDMm68QR7pm23E1ImnIKhg4PGmHhK6DCTgxefrY0gik8
 sjaB/A3n64Z/HqYXIJNnsTeCbJCC1OUXMhhYSvJVPwJaLYdcj/tLk0Z025zOlWUihn/M
 Gqc4yFsQTaEUPLNlpxUnjOrwqHbqXAcxWjo++dPZYoa2+fFahjU07aJnyLXDKDrN87ot
 aEzTUfQ3APC2xp8yVfTKrywVA6XiXXo9m2n1VdxZqd3Yte4xvNHqCxrZB23ByA8KRCiz
 JiEw==
X-Gm-Message-State: AOAM530FeQ8us4kLwLLT0b/SCeF/6Sa6fGSAEj2rYHFSR7DDS+kxlrDz
 dunh2EqjpU3LIcQ2PGeFZ84=
X-Google-Smtp-Source: ABdhPJxI/1qebtBMwV2A+7PnO2NFrZmWL3t2YplgpKTfiyhRtly+Trpe3P6Tv9qFmY8toLqkl/zyhg==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr13912820wrq.5.1610727570409; 
 Fri, 15 Jan 2021 08:19:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id h5sm16133986wrp.56.2021.01.15.08.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:19:29 -0800 (PST)
Date: Fri, 15 Jan 2021 17:19:28 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: gr2d: Correct swapped device-tree
 compatibles
Message-ID: <YAHAkAnLEboum9xa@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-3-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210112181421.21293-3-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
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
Cc: linux-tegra@vger.kernel.org, Anton Bambura <jenneron@protonmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0779714541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0779714541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="viLLSfZxethDFzaM"
Content-Disposition: inline


--viLLSfZxethDFzaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:20PM +0300, Dmitry Osipenko wrote:
> The device-tree compatibles are swapped in the code, correct them.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--viLLSfZxethDFzaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwJAACgkQ3SOs138+
s6GwPw/8DVDOcrQKCDjZUKlO07aWrNYD93d4elWbRwvEDxCxV2IuXlFEUjBLG8nE
xieMld7kojjJFAFSDMDzt7sjGtK+5toejnhRZmPToAO2sNT6eTXTz4vhTlYXy0XS
VRgwPfWJGdXh/3+Jr+KrhBM/VPDsb7d4+y/GbKPpcloTDtDzfoAC4SBqREutq081
4nZ30PjaBr4Wuu86Mpep8O8nRgTDQgiBHcX7kkZsuSR34K4gEnIdZSoA0fPOp1kS
xtfdwVvco9riVGEvwwiHuEkF/UQkvv8K5ySXmD3USuVw6AJD5yA2Hn6DFvrnTQEw
lz/5jBC46A4VsgzRRitnJw8Txx6vbZpS3KAXXkdHpKdIWn4LvzsmOrbDaA0zGw5A
peFOsHQGbUfCUjFuPyxg0Z9ZC4/3ZeZIs268jG96bihI9cg8rSYDYx+8oMxnvp8O
lJ1bi+HZLNr4YwXTQt2I8Qo7nm1qvSuBIAV7MwbXjsnPZToott2+nlvRJtcOT+0A
GDbB2AEbrkm6ITGEFYwChGD9NYD0REw1fD7RPLVgrvPbWiCxc44y2RMMA+rQK0Xk
ZHgefvzI3pUtaY7gYs3jb2bP+naKXXr3F69aNelV4OIKU4RqSGF8zBxoV4z13W82
JPQCGl0s1h+oQwfKCuphcYDYBesHgvLKiVqeMRZz1Igr110B01E=
=WKK7
-----END PGP SIGNATURE-----

--viLLSfZxethDFzaM--

--===============0779714541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0779714541==--
