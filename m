Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41F58FC01
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 14:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96775AF2F7;
	Thu, 11 Aug 2022 12:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38065AF3F1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 12:14:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C3226137C;
 Thu, 11 Aug 2022 12:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2238AC433D6;
 Thu, 11 Aug 2022 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660220091;
 bh=RsSEfgBid7+M152WD5DK7Qcyfd/tAFwT6LFK6hzX6ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OsE8pog2Yng6es7jml4aXW4m7as0lYLs90bF9iKr+1R+psn00dTtkS12cIFz3cCh2
 xywJ0+YXw40p1pQCpfQpn0DpPOc+h09alagM/gbti7pqbFWRD3KSWY2TabB4/5sj0v
 GB6b6GfyVNtdjdMfG2/lo0N99QHKir2sRU6HcA546YUbutfQM0/LKnf+uA/7D3VkJW
 82AUQYOOU5kEr2+IFgIljT+vAX3rZNPj9eDA0MSnJArmmwWwczVPWjNhnhqstXc5pn
 StJZWXUuNzdoLZ/ZTjDchC5T2pw0jWUvKH/pKdKnCiGdTsFXYSSo+BbGzdbdR9XHmd
 gP1sWiE9CLgdA==
Date: Thu, 11 Aug 2022 14:14:47 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Robin Reckmann <robin.reckmann@googlemail.com>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <YvTyt4nmOZqQYSCa@shikoro>
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
 protocol="application/pgp-signature"; boundary="bWT5sNRrWvbSSOGt"
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


--bWT5sNRrWvbSSOGt
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

Applied to for-current, thanks!


--bWT5sNRrWvbSSOGt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL08rcACgkQFA3kzBSg
Kbb4PQ/7BUKwYjOpQITlLf26s6hZcBGyYf17OjfwZTI3mATFsdX3AaDRh18mDEl5
8MhL3B7c9cy5AL7iuPQOI+K7rpyg/djLLPJ6C994uE/mvy/Uek8ReLBt/4Pry5xR
0u/f60/w9sooP86L3Y0d02eGMXJR5DwZTh+l8LdpKIA63WYrCYqGD/jXArbQN/5I
snQaD9zsnUVx94wj9v5YW7JX3/JEfiI5/hMKJRlwnn3tdPnzk/y7i0ppby8RLH0E
Pg2RMV46tTUVo+YP2565464cQjf39DIQdjcWIiaxVs8s5pkvBa5pfDecV5eAWY83
21hEWuHKbwJdGnsxiKGoa3K94fBjrUNB7dhoyoY0GsWh5JfxeirmnjmrjCYP/0FP
50nWMa7jjwmWjVgS/HWjU3DTpHDAncpogPdxjQoCuZwqWA4YjSoEqbQEb2pB+yER
ejRbrqsoDrzHJ3gvqIzGraQYDLp880KZTHZ+UbJkwxd0iisok2ISJaMmV8cRELos
P9WuOLtUtoA8MhAImGi7gL+N9DTmw3oc5N51y83ij6+CUZTiHYIaKX18yaNC2qic
/UpKqrKyarvt0at33rwt3j9M/nRw9vY2gr0YLEpc2Tsi4AuxPjsaGTWUG7Kw4hH3
PuWIC3YJn3cBP5ORPeIbuDG6/Z2glVhY5xqlMLuG1QygGfR0C74=
=B6wR
-----END PGP SIGNATURE-----

--bWT5sNRrWvbSSOGt--
