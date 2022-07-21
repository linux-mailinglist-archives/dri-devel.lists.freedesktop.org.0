Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30E57CA18
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A54A11A2F9;
	Thu, 21 Jul 2022 11:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FECA11A2F9;
 Thu, 21 Jul 2022 11:56:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA36C61B53;
 Thu, 21 Jul 2022 11:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C87C3411E;
 Thu, 21 Jul 2022 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658404605;
 bh=bQi+xZq9b9DToWtN6MtK9Eyx2oVXPsN/YNsJApzwPXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r9NvCZHAHtXI5zVzVvnKkmsqZVsKfhdPIPnASOgzTo7PexDO/+J6R0Cytrc4sHc1F
 lOiUzAoTX5qkasHi55O3pWUVejl39Zg+ZHpkU4rDhA9ITfR0cIRWtYRyEMyAF+JBrS
 0OQlVDCeR6Lii1osz8YYTMQUtV9IzocfTMk0t/4XcLkJvmbq6HDshTtaoP5SbeW7jC
 R4hm+Ne4pCCTkQspJ7avyF2QtKCiLCLhZI5C2nTCjcGoEPQs9HxbK79b8R159hnyuH
 O5x4+tyGI4U6RyzRFUydhUdDuJ2B+6oH76X6ospfT/MdnY4Giwv3PpN8t9RAIU0kTT
 e3hgDYESt60PQ==
Date: Thu, 21 Jul 2022 12:56:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <Ytk+9W0Ur1ibqtw8@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <Ytk2dxEC2n/ffNpD@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9EvVpXRtaCTHvahb"
Content-Disposition: inline
In-Reply-To: <Ytk2dxEC2n/ffNpD@sirena.org.uk>
X-Cookie: Killing turkeys causes winter.
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
Cc: quic_sbillaka@quicinc.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 quic_aravindh@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, sean@poorly.run,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9EvVpXRtaCTHvahb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 21, 2022 at 12:20:31PM +0100, Mark Brown wrote:

> You could add a way to specify constant base loads in DT on either a per
> regulator or per consumer basis.

...and also note that this is only an issue if the system gives
permission to change the mode in the constraints which is pretty rare.

--9EvVpXRtaCTHvahb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZPvQACgkQJNaLcl1U
h9C4Swf9EuzQYYxQIE3HdaloWAtNQHqp+O9hc6A5uGIlqvQ0+1hCyKTNm/0LdZTB
a2quGYwotizns28XjF1CPNAa80hvUgC2z4eyze8DKnSBm8LVAOcSkhI25xY+rwyn
V43nJzwu8lvtoSb/imoh28i22Zw26qMB4equfXXQtysXS3jyGy8uVEyqBbuNTx/f
WFnEh2yYmdz6HlIFGfXLtV6eWFi6rf8pLpzg1h3JV1nKvW3SKmJ4U4G/FnfqvNZ4
h8DE4YK2Vzy3VadPRNwuSAZYwl+RXXlVSoQbQZbdD4itSVcdt62rm/hdZ6727nMn
wAihahnCrAecenK9FFwbCTZO+0LMYQ==
=i7fU
-----END PGP SIGNATURE-----

--9EvVpXRtaCTHvahb--
