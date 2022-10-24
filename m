Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA260A91D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553E610E619;
	Mon, 24 Oct 2022 13:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1082A10E619
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:15:31 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r14so31116835edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHhhh1m1Ank9pgC7SXLMOjGjiWt+7yExjFZnNqxa60k=;
 b=iBQhkfqiP8vMNzFD1+pp3Nr5/vSgodxgarna9rmg6FXxz3Y06TDvL2s/BhVRP9Ec9H
 MZ97tWHqLPNZ8gGbu52VdiFvWNdq2d/FV7eUitVqyA4uyXMwuEPUwif+bFFpsjxgRKgM
 m5UX5n4J6mXGbrb44CvgBIulEKVdNCGzeux46pA4Xy8ACkoXJM2COLrKtOZP/DteMfag
 XYwqXWYY90AccLVPNVmSbr656vLzz+EFXWeLx2h3s1jdEtAaWaaOfat+5KoLf2gNoh3p
 CrqYLW+q1NzVT7BJmV0iTn6hArR3fhtKwSuZGiLEaE9JvKxrsRy8+5jFKUxjCzxZIOET
 OU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHhhh1m1Ank9pgC7SXLMOjGjiWt+7yExjFZnNqxa60k=;
 b=JWzAis1IVHD/PnQAIXuQXZQ6Yg9ZGc2R9hg2xawAhg3y9fsZZi1vGs8Tf4aiw1LpbP
 dOI531q8QARsKb6SiKMk/aSQ3+H7KQS+Uk65eW9ORWLb0zEhzojE+VAAAzcqM2NhBOL4
 k0ar77lFTMtm6qYATLN3QS3h+ia7DQ5DRwdfmwRc2g+zdotkBDbtaZeSIYcxZmfmB8f8
 Yh3nZ8p1rB3rnVsQtTJVZ8/Pvzk+jt7yQ1rb+eqLTfTHCyjMtThuuUfA8ElCfBoN1Qzh
 Eu3qDF9zF8X8tSUiBswUPGnG6otyAjWLgVIW0wrSKtFHl7TmYLflsHFiJuYAhOZ+RGd4
 310Q==
X-Gm-Message-State: ACrzQf2aWylAsz4RzDZKMWpSnaBDaVogdCN8xjRx28Zcw9QY0r6g2EXb
 uXI+JLUyn7w0uK54vM3Hoog=
X-Google-Smtp-Source: AMsMyM60AGGuzqAkSsx5ALiyT2hDq2SbX+gt5Hfevx9ogvvaQ6UuZajA3LN9fM+GSOuoNvI/zCGpYw==
X-Received: by 2002:a17:907:3f90:b0:78d:afad:2a78 with SMTP id
 hr16-20020a1709073f9000b0078dafad2a78mr28190463ejc.68.1666617329498; 
 Mon, 24 Oct 2022 06:15:29 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm15584053ejx.211.2022.10.24.06.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:15:28 -0700 (PDT)
Date: Mon, 24 Oct 2022 15:15:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Message-ID: <Y1aP7kDi8cJUTcGN@orome>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+8zFj/rzOJcr5x3I"
Content-Disposition: inline
In-Reply-To: <20220920081203.3237744-2-cyndis@kapsi.fi>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+8zFj/rzOJcr5x3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 11:11:56AM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
> has been loaded by a bootloader. When booting NVDEC, we need to tell it
> the address of this firmware, which we can determine by checking the
> starting address of the carveout. As such, add an MC API to query the
> bounds of carveouts, and add related information on Tegra234.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>   is always 64 bits where this runs, but it avoids warnings in
>   compile test.
> ---
>  drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>  drivers/memory/tegra/tegra234.c |  5 +++++
>  include/soc/tegra/mc.h          | 11 +++++++++++
>  3 files changed, 41 insertions(+)

Krzysztof,

I've applied this to the same tree as the patch that uses it for now.
Let me know if you want me to put this on a separate stable branch for
you to pull in.

Thierry

--+8zFj/rzOJcr5x3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWj+4ACgkQ3SOs138+
s6FY2Q//bQUj39dvu/5Swb+Y6wOhHV3XtEERAJsg3FDGGZR05duhgkto+Fqf+WYs
kest5BIuQfrjuEg19XXUDMgrJ20PPfkl9PriRw0D3/yZomyS2bieEz9Tl00/7cup
SVPIunSj9lPuCRD5R8x7xCe20CFCI9SnDDEpZAbRXK11xiLxRBsEPrSS2ltJ3cIv
/6p9GT37fUtNfEOuFkGPUIW8hVhhM4aBOXv4PqyRnHzWg+MamLmNWyy6mOf/a5dt
qUs7YLas5jxgOdGAm+dLjO1ao/F6Py7pDTtIBb/akd6maRHBHexpg/cqo9UqMaT1
VE8Y4A+1nCQHIsrslIpmYg0FN+v80pIaMn20mh1OvAkwnL91ggeK5z55YgLbzm6O
Lfy6tX0VcaB0mONVoDGQ9+1uMY/A7OaGDuBFUaQeFqH8dYVM6XnFVpl7LFUwkoqy
UtcH7I0jxcmlxxuh8bYM1dsKksAtp0RsBgAyddgPReNoAyK7ZqlUbP6yyfjlWSvN
MIP9xQlmec7Al97s5RzvW2HDYWVIWQ5FeY9vZfAoeTGzBzqXLjA1vQpbJa1Wj8FR
NqCparCt6JlFKPDKHOSsja50h0605RKGJdGZS5426lNwh2hSQozsimta3ATvmfyk
jm77BUlj33ECmgTCa1THNJG7qnLjI7rLk4Z+CDadDRHh/j6VYVc=
=E8o3
-----END PGP SIGNATURE-----

--+8zFj/rzOJcr5x3I--
