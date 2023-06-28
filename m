Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682267418DA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 21:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2165A10E38E;
	Wed, 28 Jun 2023 19:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0145E10E0BF;
 Wed, 28 Jun 2023 19:28:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 192CA61423;
 Wed, 28 Jun 2023 19:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A167C433C8;
 Wed, 28 Jun 2023 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687980536;
 bh=U3CiIpbdXP9wNzGVwWMHZsWJg9IDmcP4COsGLHzA98I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6O5mb+b+FbKgvp7CgPL92BUVQpp6oLRh7P4cNidrOiPopWBT7jZLKfxppzL+e/wC
 YpW+PK/6UC0rjbeMy+nDwAk3QNKadtcjKPj+z7qrwb8KXq5B66IXTPPkVD0BzXug2a
 ldWo7aJ1jAMIC2o7P6UVYqhxZsY8WRX/H3qQRv5eYyQ+56+xrbJdiwylBma7+GmZbX
 nx9wori/kYySGIIoImlvkIxyysA6Ej7j28NY0ySkhaHh3FZ95BR0n2E5AypIRLX701
 SGXR8LJCaz2aDR/zRTS9L3+cL+b7C6Zx8EqpeErLMEQbJjfoIxtxInA50kB1eIKVAH
 92yTBJSgpFwAg==
Date: Wed, 28 Jun 2023 20:28:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
Message-ID: <76e2f865-1a37-4517-b343-6aaea397fcf7@sirena.org.uk>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
 <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kQk8yOxh2L4ELHY6"
Content-Disposition: inline
In-Reply-To: <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kQk8yOxh2L4ELHY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 06:29:46PM +0200, Konrad Dybcio wrote:

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017, 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */

Please use a C++ comment for the whole thing for consistency.

> +static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
> +
> +	regmap_update_bits(vreg->base, REFGEN_REG_BG_CTRL,
> +			   REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_ENABLE);
> +	regmap_write(vreg->base, REFGEN_REG_BIAS_EN, REFGEN_BIAS_EN_ENABLE);

For the enable and disable operations we use a mix of _update_bits() and
absolute writes with no FIELD_PREP()...

> +static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
> +	u32 val;
> +
> +	regmap_read(vreg->base, REFGEN_REG_BG_CTRL, &val);
> +	if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
> +		return 0;
> +
> +	regmap_read(vreg->base, REFGEN_REG_BIAS_EN, &val);
> +	if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
> +		return 0;

...but when we read back the status we use FIELD_GET().  This looks like
a bug, and given that one of the fields starts at bit 1 it presumably is
one - FIELD_GET() will do shifting.

> +static int qcom_sm8250_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
> +
> +	regmap_update_bits(vreg->base, REFGEN_REG_PWRDWN_CTRL5,
> +			   REFGEN_PWRDWN_CTRL5_MASK, REFGEN_PWRDWN_CTRL5_ENABLE);

This is a single bit in a single register so could use the standard
helpers rather than open coding, the sdm845 does need custom operations
due to having two fields to manage.

--kQk8yOxh2L4ELHY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScie8ACgkQJNaLcl1U
h9BFuQf/fMCCOMztrpFchcXBVHLAZ4XQP2PrReQVE2ABs4SF0QVNDnJsYjUXNTpE
2O+JaH93JIQSkecrOsrApfSqVa4LBPRCxIzq31xLDAznEZunlA0kQ4YTL6anwvzv
mYbN09WonkkV68VH30YtOLBt6mp770bQH4lGHVAByz29l/vyCnd5K40eU96h0jn6
iu2D/kiu9BrTop6KhAg+mn0UcUye0WhlWwk7lJaD0f+kRrrZCfgu1XgLkCLBToIb
g1Wq/9qsJyZKLGDN5wG0xqy3+ibze8MklbqDYpYRoARQ0lizukDo/JN2S4QOaO04
FO/nDHP1ck+ETUxEz77OhU8HDWQANQ==
=/8RN
-----END PGP SIGNATURE-----

--kQk8yOxh2L4ELHY6--
