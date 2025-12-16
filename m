Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BA1CC1525
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12B10E0D0;
	Tue, 16 Dec 2025 07:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Qf0C/C2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6CA10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:37:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 079CD4E41C25;
 Tue, 16 Dec 2025 07:37:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF0AC6071C;
 Tue, 16 Dec 2025 07:37:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1002D11942ECE; Tue, 16 Dec 2025 08:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765870664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dIgkd45Ipmg0PgwvZBOt1mXie7wI+1Oex9f/Q1oPwIA=;
 b=Qf0C/C2EZHqUG98Chh4ilpgWJc0azykz734ntFQWPvGwEooFQ2ZTUrbzztVzbVCZyxo1ku
 8SMj3EzCQmXtYkPkBQ30xmts4IZ5/2WxrM8Ao/u+n+2HiUWU3fWrCwf+pcwtOPAg66WzaE
 3qXzxudn1tMx5a1GyX1MQ92KnHEDlQTgFxDmWl22jdYfYn88CT5qu8dxR7rosvGGLw7hy/
 w6ONFUOubRKZjZpYFu35dFYERPJ6Og4FAScTAUxNt7/c0hAXSobR/H0ZhbjnSkVCe1fP+s
 EfV8J3E9ojX71WEODJZ/bn4o0T+lsa5O8ukTvEjD97oDcfOoia7MIUaMkjLFAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 08:37:38 +0100
Message-Id: <DEZGWL9B8SOU.ON89J7KLA9QA@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Vladimir Yakovlev" <vovchkir@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: lontium-lt9611uxc: use irq as optional
 parameter
X-Mailer: aerc 0.20.1
References: <20251208161708.3763458-1-vovchkir@gmail.com>
In-Reply-To: <20251208161708.3763458-1-vovchkir@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

On Mon Dec 8, 2025 at 5:17 PM CET, Vladimir Yakovlev wrote:
> On some systems the interrupt pin may not be used.
> In this case we exclude DRM_BRIDGE_OP_HPD from supported operations,
> after which a polling thread is started to detect the connection.
> (the default polling period for DRM is 10 seconds)
>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 26 ++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
> index 3868ad05e011..4d550cd1a9a1 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -851,19 +851,25 @@ static int lt9611uxc_probe(struct i2c_client *clien=
t)
>  	init_waitqueue_head(&lt9611uxc->wq);
>  	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
>
> -	ret =3D request_threaded_irq(client->irq, NULL,
> -				   lt9611uxc_irq_thread_handler,
> -				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> -		goto err_disable_regulators;
> +	if (client->irq) {
> +		ret =3D request_threaded_irq(client->irq, NULL,
> +					   lt9611uxc_irq_thread_handler,
> +					   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);

This is per se correct, but while you're touching this it's a good
opportunity to switch to devm_request_threaded_irq(). This would simplify
the removal code too (see below).

> +		if (ret) {
> +			dev_err(dev, "failed to request irq\n");
> +			goto err_disable_regulators;
> +		}
> +		dev_dbg(dev, "Uses IRQ\n");
> +	} else {
> +		dev_warn(dev, "The interrupt (IRQ) is not specified in the DTS.\n");
> +		dev_warn(dev, "Check the interrupt (IRQ) or polling will be used!!!\n"=
);

If hardware without this IRQ is supported, there is no reason to warn. You
can have a dev_dbg() at most, or even nothing at all.

>  	}
>
>  	i2c_set_clientdata(client, lt9611uxc);
>
>  	lt9611uxc->bridge.of_node =3D client->dev.of_node;
>  	lt9611uxc->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> -	if (lt9611uxc->hpd_supported)
> +	if (lt9611uxc->hpd_supported && client->irq)
>  		lt9611uxc->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
>  	lt9611uxc->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>
> @@ -892,7 +898,8 @@ static int lt9611uxc_probe(struct i2c_client *client)
>  	return 0;
>
>  err_remove_bridge:
> -	free_irq(client->irq, lt9611uxc);
> +	if (client->irq)
> +		free_irq(client->irq, lt9611uxc);

With devm_request_threaded_irq() you can remove entirely the free_irq()
here...

>  	cancel_work_sync(&lt9611uxc->work);
>  	drm_bridge_remove(&lt9611uxc->bridge);
>
> @@ -910,7 +917,8 @@ static void lt9611uxc_remove(struct i2c_client *clien=
t)
>  {
>  	struct lt9611uxc *lt9611uxc =3D i2c_get_clientdata(client);
>
> -	free_irq(client->irq, lt9611uxc);
> +	if (client->irq)
> +		free_irq(client->irq, lt9611uxc);

...as well as here.

So I'd suggest to add a new patch to switch to devm_request_threaded_irq(),
followed by this one, which will be a simpler.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
