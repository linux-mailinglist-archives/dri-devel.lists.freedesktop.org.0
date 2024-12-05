Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B819E5273
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 11:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8FC10E04A;
	Thu,  5 Dec 2024 10:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="guWl3kaO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C5810E04A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 10:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8731B5C706A;
 Thu,  5 Dec 2024 10:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853FDC4CED1;
 Thu,  5 Dec 2024 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733395052;
 bh=k0Ri1gJvfMPkkmwOG5H5IkESAn8lv1SqrkOcLFEGEog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=guWl3kaOoGEK+6hAPbImxmyWGcZsuvgDfS+SvtpN9yapsfB7pqHGGfp5hVdYv+Q5w
 vuRJCFOEzZPcd6Zebd/3fx8AKcwYYRIt2OSrHd1J3yxUb8h1Rom0Xy/H5DqebnGf5X
 2dcCaDOq9qqgy/7JnLhrUhhwK5k8bnLOoFX2Tzhd9Y9CvAuLbKVQ0fdaEysiLRWUwk
 SYb80dJWMM3YYx1tkOF51oLUhxScy1I23lx2EE8ZPxRTsY8jpWX6xygI0m+rKvAwdl
 2OBp+y6LpIANTG9T4G1GK6HuX4jdFpJVpP8FmAHs6E8qRz13DpF2xkEdujO4j3Rh0T
 szxkvQEuQm43Q==
Date: Thu, 5 Dec 2024 11:37:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 arm-scmi@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, 
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
Message-ID: <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
 <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ak6zeaiacfbfwyki"
Content-Disposition: inline
In-Reply-To: <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
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


--ak6zeaiacfbfwyki
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 04:37:08PM +0800, quic_zijuhu wrote:
> On 12/5/2024 4:10 PM, Uwe Kleine-K=F6nig wrote:
> > On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
> >> From: Zijun Hu <quic_zijuhu@quicinc.com>
> >>
> >> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode=
()
> >> Remvoe the unnecessary wrapper.

Just spotted: s/Remvoe/Remove/

> >> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >> ---
> >>  drivers/gpio/gpio-sim.c | 7 +------
> >=20
> > I think if you move this patch before patch #4 in your series, you only
> > have to touch this file once.
>=20
> the precondition of this change is patch #4, it will have building error
> if moving it before #4.
>=20
> actually, we can only do simplifications with benefits brought by #4.

Ah I see. I thought that device_match_fwnode only got the const for the
2nd parameter in patch #4.

Best regards
Uwe

--ak6zeaiacfbfwyki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRgmcACgkQj4D7WH0S
/k6zeggAlBhwMJaGpQIgAi04teyouKX4a/XAJG3tLwpz4YweEcrMm/fv0N42hp/d
7zUKHjQRRcVM6+TSObZ6uKEFMpac+G1YG1Fze2rNPdlf5IUOCrpKqKUaziMyvEc+
hhaccpLCXjp9gi7H7tEBDfmrR6/S3i1nnYOeDn6tYmhKVx14uA57l4Isj2h+CIax
P5d+Gq9NQl5IXDnqiEez80oo8LFhLQQIjIeO1YQM7GrbXaqoD+CfZTGXe4/woRc5
JjzksiJqSccUbPlwM+90bh5Oj0H2VARUaJTRcHTRANM4ZFTSfWCep0Wkg8DSw343
fYW4rY4vIXpWKVG9LM4j7NAoluIWvQ==
=myq/
-----END PGP SIGNATURE-----

--ak6zeaiacfbfwyki--
