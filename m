Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22B9E4F5C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15810EDF3;
	Thu,  5 Dec 2024 08:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FpPs2GWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B08110EDF3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 08:10:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6CABB5C6CF8;
 Thu,  5 Dec 2024 08:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB7C4CED1;
 Thu,  5 Dec 2024 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733386229;
 bh=dm+XaarJmRd4PNMM8493FEpsyQu1VayQlRTan4XCkBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FpPs2GWbGgUz5ytJZ+QuBg7XSizF7MBLb5wQ47CrA74Do8i70h2t2SfmkVVxQxJwp
 RFeHBA6N+1cKlVI8Shsh2lySUArR5RSI6914U1xBrr+bvhH7rr7cEdzsA4Rgi1d66U
 zkLJI2jbu5xXvGwGUD8mz6V+6eqzicBTjawuRRljctphJ44a5cfQaamr4YGrDaX/zh
 IbgvB4IO9782E6ZkMrskDL8DfFasy49Ius/Vc5afr1384a7Ak3SKFeTCK94J8odFfT
 MaHtfcFW9mpHPKOXqE35SDPO05JukSUMC0SYTE1DD/M4FAoBDI7at285cpbtMDTdO+
 RFuFFL23OJDcA==
Date: Thu, 5 Dec 2024 09:10:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 linux-cxl@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, 
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
Message-ID: <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ya6wyfjwhlqhd5wu"
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
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


--ya6wyfjwhlqhd5wu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
> Remvoe the unnecessary wrapper.
>=20
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/gpio/gpio-sim.c | 7 +------

I think if you move this patch before patch #4 in your series, you only
have to touch this file once.

Best regards
Uwe

--ya6wyfjwhlqhd5wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRX+8ACgkQj4D7WH0S
/k6rewf+KsN2Irmv5Td5FMMxi+83vZgDfjxwj+eoLUlf72jMXWx89mPqbHAWyq2W
DVJONM/HQoPhG9ILJDxvkaVLetBPRY7QPBSVY8bMUaDT9ljXmnbxed/NGNngiATy
r1JyYMzf3dqlGSgJl6LhRpugodssXbGiDv8oVNRtLIHFd5MLH+xlUr0CFu0KsPSd
E4NADLSFAkpDIDer3BYt19RGkXNgCrbqzP8rfGN50Q9t+xuS58qoK2oY5+jzT11a
qccGFlDCzdaHWCVsLHVwXYWN2L5mxrrm09Dv8aS/0TcFMueK4nsasVRpUAplw+Gd
j791qtNhdb4QQUhbiOamc5BP/g6LvQ==
=1ED3
-----END PGP SIGNATURE-----

--ya6wyfjwhlqhd5wu--
