Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A11A090A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46526E5C8;
	Tue,  7 Apr 2020 08:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D321A6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 23:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586216716; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxQ4FNHucxtqXpEzbUWKv7nB1H/X9nqvlSGCL9vxYTA=;
 b=I9+8c2dcsHuftWfiAk29XRt8qbUJkOyaJ5Mz95X4XXeoTlY8xOHg7j2StmsniIJfaEGpSo
 OKt3i+FC9TtmBG6SqDT7jf8bmgYb8w36FiTe9iDGBw919VuHObE/leVrircfrqDxNcRUgP
 Qmf2e54iYK3xGnd1e9TXkE7D4LXixAs=
Date: Tue, 07 Apr 2020 01:45:02 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/10] drm/ingenic: Remove error check from fbdev setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <2N4E8Q.P9MTB5NUTGTK3@crapouillou.net>
In-Reply-To: <20200406134405.6232-5-tzimmermann@suse.de>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-5-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le lun. 6 avril 2020 =E0 15:43, Thomas Zimmermann <tzimmermann@suse.de> =

a =E9crit :
> Remove the error check from the fbdev setup function. The function
> will print a warning.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 7f3f869f57b3f..d938f2b1a96f1 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -783,9 +783,7 @@ static int ingenic_drm_probe(struct =

> platform_device *pdev)
>  		goto err_devclk_disable;
>  	}
> =

> -	ret =3D drm_fbdev_generic_setup(drm, 32);
> -	if (ret)
> -		dev_warn(dev, "Unable to start fbdev emulation: %i", ret);
> +	drm_fbdev_generic_setup(drm, 32);
> =

>  	return 0;
> =

> --
> 2.26.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
