Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C60431E29
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 15:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321F6EA2E;
	Mon, 18 Oct 2021 13:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BB66EA2E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:56:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t2so41655068wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ooh8xy1o0eZVm8LodhjQadtOCGvJsUvk+tIL6iaJCMA=;
 b=WX2YlDanFpIyfDOAFuLOlEXPyJ2WruxRZCsiJ1nZj5KKKf8dhrWYG3EM3lpbjQHg7J
 Wnz0pA5IJU32V0S8hipRY9Zow56ZkdfYALwT6MtdZ1R+4YKrdFkLZ1L4KqeqiJJJWdPa
 8atnOMS3pgEs2d/bfg5TujZB/mr8wipLcFIfhzlNDQx7ND1NsBWcriwuoe5KKtjcu+/x
 OAPHo6S0cueNtQs5/EeoXokooXD7H19j4hAEXR+7L7oYum+d2YtTcW7U7hht32YF980o
 4e82FbRpEr0WjTTL2IH/bNGAeuqcuG3W/ja7nJ5JRGLKtDyJWOpCDuj6doVFMU4x2xBY
 cEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ooh8xy1o0eZVm8LodhjQadtOCGvJsUvk+tIL6iaJCMA=;
 b=m08aePF9Mfiv/rVrMu75hYx6tluYudtrrO0ZlPNIX/JcHR/ZS+nolHIxbQtfleQvjP
 FzGyvGiIaR89HhaO0AUCwt4fx0tbC5mH/9gT0++eWb/k0WNoM92UhUxts/I+ouFQx1+1
 kcv5dHOTPRxFw2aZW4vSsK1cyWs0jS/TUxflNogfd2iiVqcofikBkY94DtN2AfCqwVYp
 No74rkdXPTgif7gTn1QFmaiIM4fuJLJ6y/JVwC3Oo3nafwG/udzZIs+NVaPH3XZ95f+c
 Ra9/g3cVjVyrHLHxPeSNaTGkjwd9ewf/ubDpGSoW55z6ZXScN0dmKh76PemhDIcXGImS
 T++A==
X-Gm-Message-State: AOAM532KYGQwqjugs3Rz/2ePahPKcieO6uhC6KwkN8IaPKeK/yULJ1au
 vQMT7Y56aWGEUXDH5xm4sZ4=
X-Google-Smtp-Source: ABdhPJzOa0iEN935FLwUlLzFLgjTTp636rZR321KHGh8ALm9P+znqwL1m5XfaswuUMqAtFGzd4LncQ==
X-Received: by 2002:a5d:6410:: with SMTP id z16mr11753421wru.354.1634565401896; 
 Mon, 18 Oct 2021 06:56:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id j206sm15639001wmj.23.2021.10.18.06.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 06:56:41 -0700 (PDT)
Date: Mon, 18 Oct 2021 15:56:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: mark nvdec PM functions as __maybe_unused
Message-ID: <YW19GAWY5ERnSZ7Q@orome.fritz.box>
References: <20211013144148.2208472-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SIz/mzrlb6EwMjfb"
Content-Disposition: inline
In-Reply-To: <20211013144148.2208472-1-arnd@kernel.org>
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


--SIz/mzrlb6EwMjfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 04:41:36PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The resume helper is called conditionally and causes a harmless
> warning when stubbed out:
>=20
> drivers/gpu/drm/tegra/nvdec.c:240:12: error: 'nvdec_runtime_resume' defin=
ed but not used [-Werror=3Dunused-function]
>   240 | static int nvdec_runtime_resume(struct device *dev)
>=20
> Mark both suspend and resume as __maybe_unused for consistency
> to avoid this warning.
>=20
> Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--SIz/mzrlb6EwMjfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFtfRgACgkQ3SOs138+
s6F41hAAnsX3GlRbrAKlFAvpLqbBgE62IAisdMeL1RKwu0HpkBBhKqdo5dqjui+r
P1B9e+DP2HxvICgbje3wAWU11Xh2HG8YefdA9QBZpwGH5SVRQRsteKVom39vdB2f
YjZusbsMD0cucypBW3EOdw7UXsy64v0Vg5dvv3TfXR4WYkQCOacCzQrxLMp81tPw
0Zb1xjkPLMpkevZwTuV7cBJB7lVQS+JuvyXxKiRgbHjqm5YnErlA5KFFXRp+jxAC
c1qHKx5UG9a3Lmp8Rt4BIQCEX7nFDUxQYBRb212Mx2EvFzEvM5uQO1u6SkMK9Iw5
ZRaFD3TmcAVOTQ9vrfQ8HWq5n5jCGHx2FynjqJeQC+qxRtx2iXjO/MPWxyLKbMbs
6KamG04yYmdICx3VCLEijSBMwkpjGju1xPCyd83GGVawRm7pzqLqlw4rVoyz3RE4
i6W0N4spcamHgK+3sOR6wz2I8cp9jYKFqijecenS/RBc85kbcH4BhnCyxL1fXDbS
nJRIDfSJj/K8WkTxnYQ6nWMFMwwXsyEllR4X4JGugxwGRfWJNfNmgJxpOyHGxQc+
o72AtLYyUJaJWE9Jf0OGIoI7EoZ/OIsxcHUQt+WiIpswl6u0qVxEclfsr34jpyaJ
MTDtJ7zFO7ML5Vb/6smNbkpWkTh6uzlHAsId9eU1Uk5311F3VQA=
=NRLn
-----END PGP SIGNATURE-----

--SIz/mzrlb6EwMjfb--
