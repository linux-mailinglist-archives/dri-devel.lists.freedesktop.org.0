Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A69D8408
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 12:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663910E051;
	Mon, 25 Nov 2024 11:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=alyssa.is header.i=@alyssa.is header.b="c90JJLCI";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="A6/y35E4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 11:06:06 UTC
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770AD10E051
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:06:06 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 44687114016D;
 Mon, 25 Nov 2024 05:59:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 25 Nov 2024 05:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1732532353; x=1732618753; bh=vELmZ6h5/W
 R8FUIBqjgkR3JyDZpXfibSEKTzNXo0PKM=; b=c90JJLCI4edzPLg5dWJgRO/1My
 rr5WD58UrXkwPvFlInUY6ywDB18wobpLs0CjH83N7EcKI3qnCIU/ouVb9TS1IJ0b
 CxBLYptFjhEFIU4a8LjgK7C80Y2wcufJwlgdo3ubKUsrnQZA91EtIMSG9xp7+gcQ
 N8lwnxlPDLsBWqz2B0OOPF4Nv7JQYpv4bCJuzV/7NIu2DT+mEhwsNApIrxnKslYY
 zkkkH9rhSKZ0SjEwiuHFdIkWxXf6yEJtF7FBBAMIdbtgsf8GpBGLGItjxaYOpRyZ
 FmNPJ2Kc83ZJI3Y1oCLAejVfWI6NiaE+jE2WhomqTow1MbkHvK0l42fXp8Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1732532353; x=1732618753; bh=vELmZ6h5/WR8FUIBqjgkR3JyDZpXfibSEKT
 zNXo0PKM=; b=A6/y35E4V3cGRS0rydyKwxi+NhHhDg3XeC58Aif/8V6US/eNFR+
 KczeAKb8eV+AgIEMAaYYLyqb/gsJ3APMTY7ffYlCE4GukfHPpCpuAiS0WjgCCGSL
 6PX0UAhbgiK4ZYq+KJctVShwr3FI3Z7N39JAyITd2zHewaOprGJV72RZryQ69Edk
 E4iHSmMpUiG9luVPHbLxB2krj7m5mhyRtXC4C9zM+ioA4UNIjCGal8HxXNMRBE59
 Jq5aFPf6U2LLmm2PW4TKNXf3bg6nkJtM8Di4psCVzMZStcIZAourjB/065oTtEKg
 5uhnroyftaoCp/ryYs/8JH+ozh4rogiFw6A==
X-ME-Sender: <xms:f1hEZ-uYNuQNznk4Q4BK-HRo5Eo6146u3vX_ALXgeGyG3Sgqrg6zSw>
 <xme:f1hEZzdaPEPSDFnCkNpPhff8z8pzRsC4Xfll-nd44gJBT3WXv1wTC1UKYM6wxASwv
 P0djAECJQC0fVUNmg>
X-ME-Received: <xmr:f1hEZ5wr1K239oOoWX1cRtKWTcVp5mu8gM6giT5O-ddmCauBevYx1WbnhiK5fH09Ty5QS5YOuP90O46ME4SszHjuNX_y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeehgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
 hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttdejnecu
 hfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtf
 frrghtthgvrhhnpeeiueffhedutdfgvdfhheeghfffieetudetfedvleejkeefgfethfej
 leejvefgffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhspdhn
 sggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimh
 honhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgt
 ohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtph
 htthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgv
 rhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpd
 hrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhho
 sghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngh
 eslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:f1hEZ5MlOGN19hlyUd3BEa0sl6JZKhiRrTFZMQsdhR7tKY4aPNFUcg>
 <xmx:f1hEZ-_VcQreC6h5MyaKrdMWkcixfgr2RXIxqaUtbz0g55wH56PWOw>
 <xmx:f1hEZxVt57Ookf_L75dzHov89-kkb8HWgqoRdtqVk5fwO_hvkorSwg>
 <xmx:f1hEZ3fhg70bw7tKd4GURNCwykSpp7d0JBaLG2EmdZ9FARNO1r2ZNA>
 <xmx:gVhEZxf-zRCGuZ1f4UXuN9F-523JqMDm9NRY8nlPLxSaEsStKrrwuBSd>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Nov 2024 05:59:11 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id 2C51FAAE7; Mon, 25 Nov 2024 11:59:09 +0100 (CET)
Date: Mon, 25 Nov 2024 11:59:09 +0100
From: Alyssa Ross <hi@alyssa.is>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
Message-ID: <gu2ec3gb7q4zty4kmte43xwk7wjvcfzqjcs5x2jikwxjhuxeuo@xep7bkh3p77i>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7trqukwkfsltihs3"
Content-Disposition: inline
In-Reply-To: <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
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


--7trqukwkfsltihs3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

This still has the bug that I originally reported at:
https://github.com/AsahiLinux/linux/issues/258

On Sun, Nov 24, 2024 at 11:29:25PM +0100, Sasha Finkelstein via B4 Relay wr=
ote:
> +static int adp_probe(struct platform_device *pdev)
> +{
> +	struct adp_drv_private *adp;
> +	int err;
> +
> +	adp =3D devm_drm_dev_alloc(&pdev->dev, &adp_driver, struct adp_drv_priv=
ate, drm);
> +	if (IS_ERR(adp))
> +		return PTR_ERR(adp);

Here a child device of pdev->dev is created.  It is not a MIPI DSI
device.

> +
> +	spin_lock_init(&adp->irq_lock);
> +
> +	dev_set_drvdata(&pdev->dev, &adp->drm);
> +
> +	err =3D adp_parse_of(pdev, adp);
> +	if (err < 0)
> +		return err;
> +
> +	adp->dsi.dev =3D &pdev->dev;
> +	adp->dsi.ops =3D &adp_dsi_host_ops;
> +	err =3D mipi_dsi_host_register(&adp->dsi);

Here a MIPI DSI host is registered, with its device set to pdev->dev.
It is expected that the child devices of a DSI host device are all MIPI
DSI devices =E2=80=94 see mipi_dsi_host_unregister() and
mipi_dsi_remove_device_fn().

This means that, when mipi_dsi_host_unregister() is called, which it
will be as part of unloading adpdrm, it will try to find the MIPI DSI
device for adp using container_of() (via to_mipi_dsi_device()), but
there isn't one, so it interprets some other memory as a struct
mipi_dsi_device.

For me, this causes a null pointer dereference.

> +	if (err < 0)
> +		return err;
> +
> +	adp_disable_vblank(adp);
> +	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +
> +	err =3D adp_setup_mode_config(adp);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D devm_request_irq(&pdev->dev, adp->fe_irq, adp_fe_irq, 0,
> +			       "adp-fe", adp);
> +	if (err)
> +		return err;
> +
> +	err =3D drm_dev_register(&adp->drm, 0);
> +	if (err)
> +		return err;
> +	return 0;
> +}


--7trqukwkfsltihs3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCZ0RYcwAKCRBbRZGEIw/w
omiCAQDFbLv/V2AeCjaFrUuZNO0UNVfDsiju+X9BOieYsiXW6gEA6iIPEMmZ2ebP
a5lcHWKNnJQEBENr0ObRCau2mIuWXAQ=
=l7W4
-----END PGP SIGNATURE-----

--7trqukwkfsltihs3--
