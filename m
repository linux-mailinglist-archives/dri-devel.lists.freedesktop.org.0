Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677A781581
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 00:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7210E086;
	Fri, 18 Aug 2023 22:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6BE10E086;
 Fri, 18 Aug 2023 22:47:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D06A363A4D;
 Fri, 18 Aug 2023 22:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5936C433C8;
 Fri, 18 Aug 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692398846;
 bh=GERRINsAE4jFIhYWdb4073xkrV0e7fJw3JwzPleFkGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cyuL5Iht3FYQhRsQPZ882/GmkeF4L5szu8lARMrLLwnl/0ywm7mtvMs22mHQfpQEV
 PfMAoZI9wLWJ88CsiWMyPcyIZlbf2PVYElReCYpEyqPx79/9xEz0p2o24WJqS7cfEd
 3ppg3GlffC8lgib60tR67hmDMT96+jDVyO7khBg5IfTrrrzO8vR2si+EvKu7D/bwFl
 BOQJwbKJE47igkOtaP04PX5ASifTwmFRyzEb76CWj1pq1lFsCFcdYnoSNsmw3bbopA
 jb4Cy2tCBGbxN1MIv7KK7Nkz6ZeGN4hzis7MN6B2iZymCsTslqic6QQ0etjZshT3RI
 t7o66s2q1HFRw==
Date: Fri, 18 Aug 2023 23:47:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <1b53ea1e-3522-43db-a7db-dd4b460f0bc6@sirena.org.uk>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sBznzgBGlLdaocvC"
Content-Disposition: inline
In-Reply-To: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
X-Cookie: Your aim is high and to the right.
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
Cc: alsa-devel@alsa-project.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Emma Anholt <emma@anholt.net>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, ath10k@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 iommu@lists.linux.dev, Andy Gross <agross@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dmaengine@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sBznzgBGlLdaocvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:32:28PM -0300, Jason Gunthorpe wrote:
> It turns out several drivers are calling of_dma_configure() outside the
> expected bus_type.dma_configure op. This ends up being mis-locked and
> triggers a lockdep assertion, or instance:

Acked-by: Mark Brown <broonie@kernel.org>

--sBznzgBGlLdaocvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTf9O4ACgkQJNaLcl1U
h9CQkgf/U+glO2B163vQwi/fCAxSj8fyw/4Fx89WMOmUEwj0C05hkeR75k8U4pW8
4U0vPSpT0yaPcjKGpztFpE3uMIf/40CZ1SbbKuvZ4RcYoumOqLIWVcQzYmEiQSml
M4NjnYXvs3xppLRtxlnWYCzwmvijPoQfs/Ot1VBn9TsoGz70YwLD3JfjHXnztUHF
y9wAVvMF5OgDayDuWedbuh63H4kRGS7LIhIu9cPgnV14RWL9SmYat6UKcto2FePd
th2ai/d8CMoJ8oHV7BOaf86sQXul26EvMiWSqgyc9uGX/ag9RYCA465U/QXlVQZc
M7hwZKW9rlZZsKXxSdbNPklRZ/Mdqg==
=cHW/
-----END PGP SIGNATURE-----

--sBznzgBGlLdaocvC--
