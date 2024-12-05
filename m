Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714E9E529A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 11:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030F10E087;
	Thu,  5 Dec 2024 10:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VnMLmm3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DB810E087
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 10:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA7545C7273;
 Thu,  5 Dec 2024 10:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73D7C4CED1;
 Thu,  5 Dec 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733395319;
 bh=NZpLIj+aF6yV18wyiV+hZZsvH1NLZeOx7bLmfti8dgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VnMLmm3tlYwB1Ys4r5Vn/PjbwurVtHQJbu2Sp9+upCl8vyYMiKZJtRNZi9p41s3dd
 +QwXcCDWaVNsFDd7tYDQKJycBt3wIkC592WOq5c2OCWOox4WrIqAu/bKBeyRsi9N93
 T1aLVwyzqHihZ94hruw1akFGxr+cDy3yHC2zrIbMFU3LuOjZrbl8eYf2Xf9teq8jxz
 2r20V8p90hvV6R/o7HM9bEiRQkiL/bJUld2qbg2DALga5ZVfRhhR8QSVihRYtnbPZN
 Wqeewe7ZalHOUg6pZrwnuZb9WoFgbLJW6wGDJL2UxBTqsu9BZIZAp8fWpe9+R5mTX7
 45eztKwfLgngQ==
Date: Thu, 5 Dec 2024 11:41:56 +0100
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
Message-ID: <h4pndknfwvck5yjnbs5rdmrxkqeksfxldwj4qbjqyvdzs5cjbf@i4afsjsg3obw>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7cmlxza5fdv22slz"
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


--7cmlxza5fdv22slz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
> index 07933d75ac815160a2580dce39fde7653a9502e1..1a1a9d6b8f2e8dfedefafde84=
6315a06a167fbfb 100644
> --- a/arch/sparc/kernel/vio.c
> +++ b/arch/sparc/kernel/vio.c
> @@ -419,13 +419,13 @@ struct vio_remove_node_data {
>  	u64 node;
>  };
> =20
> -static int vio_md_node_match(struct device *dev, void *arg)
> +static int vio_md_node_match(struct device *dev, const void *arg)
>  {
>  	struct vio_dev *vdev =3D to_vio_dev(dev);
> -	struct vio_remove_node_data *node_data;
> +	const struct vio_remove_node_data *node_data;
>  	u64 node;
> =20
> -	node_data =3D (struct vio_remove_node_data *)arg;
> +	node_data =3D (const struct vio_remove_node_data *)arg;

You can just drop the cast here. But maybe that is better be done i a
separate change.

>  	node =3D vio_vdev_node(node_data->hp, vdev);
> =20

Best regards
Uwe

--7cmlxza5fdv22slz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRg3IACgkQj4D7WH0S
/k6XGAf6Av8yk2DAhSYXPrLn/Ud4m0Je4HKR7wDERTkoucUo/owwlaJH19v3/SEN
BoXiIS4oqDNVJbzYsEPr2ZJQLZUTvBMyzKLJ4oNU1RzaivgdSipCPyK6I0OAHNui
CtQI8qTG+gSxHLhoEeFCl2kcnUCtV4nGeXk44by5/Mu3CkC/pXRfbRn7iLrDX34F
XHQ9MMrA6tMoRuStbxo3xHkRI7CkjOJVO6hWgv6PPAoKdFb63QX7jdTrZQTIoNtP
2SMqVunbF87nTNTOQZWDCN1E3vELVsVjs6YsrlJeMYI9Gs7tcbVD4OHKUvrtSf86
UHoREl5N4LOf8l+HqvTaxQnH6pb+QQ==
=qufa
-----END PGP SIGNATURE-----

--7cmlxza5fdv22slz--
