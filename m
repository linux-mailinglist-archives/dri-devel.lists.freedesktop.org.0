Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34209427177
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 21:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1F56F556;
	Fri,  8 Oct 2021 19:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AD46F556
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 19:36:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e12so32842715wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b1rZWiqQzmNj+NqTVFA45dmnunj0XY71rhazJGucrSM=;
 b=EgE0zVt0ebJbLWWSLeyI4QnNd/bgcE1MuJa7qIeh11N3+fJVLToED04dGK66rPGhJo
 7gGMSwI3tci8zXvf84XCVOS4cNrqy7EvtXo1cjcMexN1Q5uOCPwwUK1gAnrSTnmBSCr/
 A8N3te0nWmxY8VBI/LLzW+j0XbGNlkDHGUAjGCBDLX5sX2qSdiKoFCFW9P2lHKH98bok
 STwwTx+I9eNXaQzcxSt6H868+m8m0pwi3K03U9Up4+iDvQRKxiRoC3CxtrnNByHOdMeb
 veUbfF+W6o38hq6ml/EkJWOpx3JMDK36ID955FNifuynSkKibkIzcW2V4qT2aukQFgXg
 p+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b1rZWiqQzmNj+NqTVFA45dmnunj0XY71rhazJGucrSM=;
 b=fNUDjQjNfOEy1SGt6C3GkosrQlj8wHDu1GnSyAXQXm2xVYHzuUXt0b4ZbQc3slHZNa
 jOpBbGS3GURrCbdbwu+PYyL1G0sFZQ6oYGRc7dZBAptSE5qC39not8yqrT8l3zWLuMwz
 DMz50Q8LfZ9D9EnfMtRleEHDQytI0OwoSR9Sa7RWQucNGE0yApI4Vz59pZS102zMdrJ9
 qOntuBi52RXg0bgz5Vd0V+lHtaKnECvgj0LdKYwoxj1epGPWK+k3isM8P91MlPTd2zRu
 0mnqYG2uDCPHYHP17tRcz9tnnurQHFrU34saLkWZDxo8BtqnzS5KWV5vJ1ahxlChNx2q
 wMTQ==
X-Gm-Message-State: AOAM532hUF/Wo1iRvSRj9qMyfjnNf6k6tm54VvxIZayvlnGmPflF/zWI
 40/jZkSfEwqt/Ma4VrjPnjk=
X-Google-Smtp-Source: ABdhPJxnEFh9XuPLcWk5ofRvfii4olskeD/CURIi3ywT8uQk4y6FJUKHLgTQFtjhLn1kUfWcgBk16g==
X-Received: by 2002:adf:a310:: with SMTP id c16mr6348947wrb.319.1633721762060; 
 Fri, 08 Oct 2021 12:36:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e1sm249320wru.26.2021.10.08.12.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:36:00 -0700 (PDT)
Date: Fri, 8 Oct 2021 21:35:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
Message-ID: <YWCdn11xFQ32Wt8G@orome.fritz.box>
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2x2WiGY/yCMBO0jh"
Content-Disposition: inline
In-Reply-To: <20210929222805.16511-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--2x2WiGY/yCMBO0jh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
> bridge that requires a precise clock rate in order to operate properly.
> Tegra30 has a dedicated PLL for each display controller, hence the PLL
> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
> output. Configure the clock rate before display controller is enabled
> since DC itself may be running off this PLL and it's not okay to change
> the rate of the active PLL that doesn't support dynamic frequency
> switching since hardware will hang.
>=20
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>  drivers/gpu/drm/tegra/dc.h  |  1 +
>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 12 deletions(-)

Applied, thanks.

Thierry

--2x2WiGY/yCMBO0jh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFgnZ0ACgkQ3SOs138+
s6FqRBAApniEtWPtkEJHYg3VNRrfr1nUcpA/CUMtGisgXFpxR50I29Jky0ndTU6Q
E9xgU4AOc1esJ3IC+sZdF4wpXpo+DsSeKTOBP9D5nS95MRZhq0t7RFyhXY4iyNdm
cuA1c7uGf7v+gqcvV3bq2kgaxsfCByDJFwdFE492EyJPtzslYJBhKEB0ff3u61uC
f4JoE1FcKfe3gH5plS+Ecse5Q66BZqr557I8nRsW63IAKP/sMPrS+qTjLVrBvz6r
uEOEtPGKEv4h7lafEovEeIJB6VG9A1QDcL6UkBN0VLPe76KuqTzR6hUWkuEBKbVQ
8yPaRjz92PvtFTc4LS6IV68ZbVkUeyi8BwFXQIHDFYSpQy6IJ+6XLIuTLTf1TwrC
++0Qi/Uv6Exl7h6jaG0UCBPIs/99E1E8C8ebz/FxxZCdc0WyuwGzVRqmX2UBk1dT
4Hkfz2OKnU3Go/GL3WHJEvz0c90WcVXZ4SjbnrCCDw3BAooX+A4+IohW+zl1h8BV
F5NWufTzILMxesVkBcntr5YwaOTay5mE2EQqm29Em8v9kKCKpyCAjELEOD4oUiJi
gbsTphQJZkmMDpfhmA2cRrGDBUr/yuIx5c5EFjx88l1g7gOACrXOd3uQUB2DPuPc
7tUn2HNst6/ZHvnjshHIhNso2DMXX72yPAg1+r6OAOgm577H978=
=yvhH
-----END PGP SIGNATURE-----

--2x2WiGY/yCMBO0jh--
