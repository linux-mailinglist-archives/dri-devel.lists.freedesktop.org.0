Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6058C313
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 07:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EE08DBE1;
	Mon,  8 Aug 2022 05:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E536E8DBDC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 05:54:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B9F1B80B2B;
 Mon,  8 Aug 2022 05:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FD7C433C1;
 Mon,  8 Aug 2022 05:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659938064;
 bh=fdGOCwmBEK9CWaxIAUwPDifSkxj7PaxAllZU82W3Ry4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDZCAORd+CDcOLkVaf1UPrSE3hL4ymPfTAuq2qSfODI7WxCqUcSnMbh3DtyhlFmJv
 7SevWPkePl6NqhsK3RYndm1t2fn+fbAom30UPqa0cR2amyetfoRRWdGx3CXGiYHDZt
 Of7afz3KYKWFNMpBPluGeh5layWLYJjc5TrLg/hYiVSPzaKx/phIj8DYFxCEetS+oo
 VPrPWivn++E8p3/wtNdfSWjzbrNpsPym6oOUjOxkAaODCg0y8DOZiS8eb0oXiG0/zS
 mkb3Gcc7zQP6MSKndbsDnnz9oUxVJbMYhXXwdUWBULqeM/HcNnDV8ZG1umR+7Q9Piu
 gsv6IZjnMR64A==
Date: Mon, 8 Aug 2022 07:54:16 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Robin Reckmann <robin.reckmann@googlemail.com>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <YvClCC4ArBEjQJl9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Robin Reckmann <robin.reckmann@googlemail.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Robin Reckmann <robin.reckmann@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XD4kyBoxfGtTDMuX"
Content-Disposition: inline
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
 Robin Reckmann <robin.reckmann@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XD4kyBoxfGtTDMuX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 07, 2022 at 11:04:54PM +0900, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not set
> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>=20
> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
> and it has to synced back to the message after the transfer is done.
>=20
> Add missing assignment of dma buffer in geni_i2c_gpi().
>=20
> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
> ensure the sync-back of this dma buffer to the message.
>=20
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>

Thank you! What would be a Fixes tag for this?


--XD4kyBoxfGtTDMuX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLwpQQACgkQFA3kzBSg
KbYMhRAArxGcGhOSEP/LoXFsoUt62gmN7SUbYALnShNEsiAAsIyfcDokRbSxVfPk
hoe7hFLjoEL+ZcARfiqvYWGbTpX6dlFx3TUdkkVkL6oyCJ/YcfvgFat7FwV0cNyP
ce2soTTDV0gDRecDLRald5RA50fdPcvcUpEhrwJDb/2JjffKXhJs4rlCOfHVUNXt
QbVwJVj54xgMeCmLrN6FsR14lTzQ5m+CnbHeDJCrKPFIxAIVIWwXvSU6lhucNYCo
lFn0Q4ZDdOnBEy2miNvvdPT0BEKxplT4SgJpD3zGjxGnFSIbO0w8kdZLvfioCrA0
s5gQxVZpHxtLtKtQruAgX8r2+JW1zSSxG8aicdX9QgNABybcYfHV4tH/CJikDLMb
VTPc8qi0HtPLMnBribfmECcHaeLzEe38gtb7aGDUG4z8wXZgePXRGfnqLtCDGykg
4Vomw99Ugc/1+XwwrpUr0JLBYqVPXq2veOsirnGo0OR3iJGajMZw4y9Tlct9AQZZ
IL7lfPhTlO2WS2rVfURyOXZCUg1/tax/RgDfzFvjJesvy9+hpZ/pq9Csl+k1b+GZ
8lbslOpKD0bM/WLDWYbrel6IH/openjxQ7M5UNusGNAnEmZPpm5QMfxsa3tjQEm7
Tv2AXDVrVjdsK4dpcqarPjowL/IJ2I8CntN4+KefRLE0ZOhthtU=
=HpON
-----END PGP SIGNATURE-----

--XD4kyBoxfGtTDMuX--
