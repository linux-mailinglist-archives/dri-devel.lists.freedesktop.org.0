Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBBD1E6D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831A010E603;
	Wed, 14 Jan 2026 11:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FbIj0Ne7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030510E167
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=lr2j
 aXKLTYSemiRd4WCZWM7A71D5r7zK+ViV8cSzJ+U=; b=FbIj0Ne7HcdUaAEP0iAU
 A55rGJ0oyna5P19mF+Qqxxdtkv9Cgi3ikY/VAziIha2Ymf37Sh7GcN6qaW4QeEEo
 sBd+8Q/J4ZH0/a8KKWXi52G6yRrBYbtJHOc1MKWYeouC1RokrNbBn26LBMwcnNgu
 8T93ffuZswv71EcU6CqAiK3f2JCJOYkgcxnkvqxbylojhjxtVsYe3sxNiK670Caz
 EFvOqfSrAgjRTV+nnMfGbAdKt7v7gg/v17ziuAIKwmm1lI2cmH/CktRAautTnLuL
 iGUMHmLaorf+k2EQ1TVUaIc7xjC+XNtiOXCvHeyQm9tY2O4ji9uDHLMak36lcI8j
 2w==
Received: (qmail 2108427 invoked from network); 14 Jan 2026 12:34:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 14 Jan 2026 12:34:35 +0100
X-UD-Smtp-Session: l3s3148p1@WxbafVdI0IsujnsM
Date: Wed, 14 Jan 2026 12:34:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
Message-ID: <aWd_RtYqGyUkjQao@ninjato>
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RMEH12Dl56iOtTld"
Content-Disposition: inline
In-Reply-To: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
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


--RMEH12Dl56iOtTld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 07:07:42PM +0100, Neil Armstrong wrote:
> The I2C Hub controller is a simpler GENI I2C variant that doesn't
> support DMA at all, add a no_dma flag to make sure it nevers selects
> the SE DMA mode with mappable 32bytes long transfers.
>=20
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub vari=
ant")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>>

Applied to for-current, thanks!


--RMEH12Dl56iOtTld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnf0YACgkQFA3kzBSg
Kbb1YxAAmYs6M2P+MSlXvKQkXgfmS6UTFY09WDBcqX0ouXMPYG9zzTeTHlzkfvpK
Unobt+53hHGH1nMTnsIHOroZvR7EPWJt+myTKU9CFzS6wc3w5Su0JqaOMr1lYcT1
VaD8+QFvs6z2wJeng9NNZNDiF2LX4LaFF8zPG+i/0KdxS3QKm9YFtiL1zSPzMa7h
S8tg9AyR2lDDcxJwXThfEFj8QF74/iQw+nBJ5R/kfl4OWqDtYsv28y/t2ITpCWEM
09NKIOvyLhD/720LhLTuS7pjjHMJWynq99lYhsWOdhnD0ZZdVipiHAOxoowEZIzl
523xsVuFcLGzZLFqV2yDQU65txj6z1n/S8ycjkEiS+6pLXFvQ/Vozz1MOXz+7+1n
1AjbBFerjy8NxXHThvNYeneqx0sg9AwY79xLYa1EYTKYowlF2s8V028rCV3eIiuz
odsft7r7rqWs2I795ZeDL0EN/L0wtIJIxu6dVbJmzkExRbW5wdzyk/D8lvH6sCbt
aXcEl/DZpUyU4YCJluHyx5m/9jR7DjngfGfeYIwARk9+uqOjrjF+JFDIXguqaV4K
UUankoMGnmHJGvJNy45ttbB3QZZY4bgwcvk9WXlByMA8JlQ3aLEb7yi6T+PnCsUJ
JYqolaQBTWfCJyW/RNcRXtCDWFL4GBv2Ori4Y8rbqFTCO9B6Y+M=
=3JmV
-----END PGP SIGNATURE-----

--RMEH12Dl56iOtTld--
