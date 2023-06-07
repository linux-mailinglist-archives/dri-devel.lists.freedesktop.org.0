Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7A272697D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4CA10E0D4;
	Wed,  7 Jun 2023 19:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EBC10E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 19:08:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A9C74C;
 Wed,  7 Jun 2023 21:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686164896;
 bh=ZOTDgtRUgCUf414TEguEdP0S//himxbkPJH1gvrQNdg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RWopiw4wojJQ/Uf5CTq9+i0UTmBrNObdz+sD+n76k16PfkmSm9N4xA+X7y4DHAySY
 hqG1IBL9IU1y/Vaw7bopZShtrygsUKB49xzSmajK9UxdO1xxtYssJvQwEnJheRf0Qt
 +Wv/WW86OEdWHgadLlbNgJZM1oXqpBte+KFrgA1s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace DRM_INFO() with drm_info()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 07 Jun 2023 20:08:39 +0100
Message-ID: <168616491938.1159722.12181260879239007363@Monstersaurus>
User-Agent: alot/0.10
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2023-05-30 10:26:39)
> drm_info() adds proper context to the kernel log message, as it receives
> the drm_device pointer. It is thus preferred over DRM_INFO(). Replace
> the latter with the former.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 91095f9deb8b..fe4d3b3c9b0c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -713,7 +713,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>         if (ret)
>                 goto error;
> =20
> -       DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
> +       drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
> =20
>         drm_fbdev_generic_setup(&rcdu->ddev, 32);
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
