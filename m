Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9109E67CB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 08:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80B110E432;
	Fri,  6 Dec 2024 07:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o+wG9rcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0110E432
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 07:21:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABE395C6F85;
 Fri,  6 Dec 2024 07:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F657C4CED1;
 Fri,  6 Dec 2024 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733469664;
 bh=eXgkPnSuV1DLMSpxicSxCmpRMc11qSId1Ps39ZgC62E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+wG9rcYnotlrUeuc0PL7wpQWKlXXxbgXtHgvJy7YCCwHVZ9BkccRLmauWqsz+ZV/
 iY49BGCvaEwufLj74wUd4KOO2j4hv4jUIw8urqblrYMJBpAv6CgCbIU/8R6GyV73VK
 9c58t+wda7Myy5qJF2WzOXzK3/BQJ0i/AkjHXsZFMr7s3vepRv5asoxKqYToTl/hYB
 VNEio9U05OacRjqjaygqmLG9eUZQ17GF0aovEsH5OsM54NY9ccCb7HeNz79C2xEmMj
 yLXMkRkJbjJNx0ViCQboZDxE2VKg3DG3+oa6CDnctzD5D0J8giHgftdS96ghXZOqUx
 A94yQD2wKTalw==
Date: Fri, 6 Dec 2024 08:21:01 +0100
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
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <7ylfj462lf6g3ej6d2cmsxadawsmajogbimi7cl4pjemb7df4h@snr73pd7vaid>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="owd7bvwanf7sxd4s"
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
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


--owd7bvwanf7sxd4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
MIME-Version: 1.0

Hello,

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
>=20
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
>=20
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
>=20
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
>=20
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.

With the discussion that a new name would ease the conversion, maybe
consider device_find_child_device() to also align the name (somewhat) to
the above mentioned (bus|class|driver)_find_device()?

Do you have a merge plan already? I guess this patch will go through
Greg's driver core tree?

Best regards
Uwe

--owd7bvwanf7sxd4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdSpdoACgkQj4D7WH0S
/k4dIQf/Zne0n0ncNUTb3GbDwFv4sf3wAVH368SbrNYMV23ZdWpNl4KZPovf5L1+
5nMlPkc2I/CBZGE2OJcZWUhHI7cZ2ZYDHBBAf/TYhsY9f0+6wXgdi2cc+bbbQpo1
JdabxMtgPX9tQ1Rbtv6jNu1AUvx8pONwQvUe5vmIBeLFDx5+wEwm4LppEVU+x9zB
dApq6D2VfLguHwMf8HDycoa0nd0GL3R4KIJF4+taiSmhz9q+yjewqiXD2ag3fYrF
1IeZ6pnyXoaq0aTwLmXXhI6se14Q+IZIVQPRXVQ5i9A8kbsWN0Fj2LfXnnNWhmHl
YR8uP+UVLcfagxTg7ascr+SuV4OlCw==
=cpdm
-----END PGP SIGNATURE-----

--owd7bvwanf7sxd4s--
