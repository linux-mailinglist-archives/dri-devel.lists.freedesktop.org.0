Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EF1C4E9E
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCDE6E530;
	Tue,  5 May 2020 06:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66FA6E358
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1588587350; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAMvD4AOFiyNiGQjo6JeJKVv4xAdRKZUMhJN2Epwr2k=;
 b=UrbW2A4nwL1bFKGDFE1I1i8N7cLMa7po2zmhqGrh0gIeffRnKbjGtVeMJmKGb/NmfJ+iJR
 JaOk7J0E7m/0i5m17hU6vN2i85jZ+UR098T6tDTNZjhyWsLsPV0gtREwOhptja2SFD343R
 xnlaraBEZl2T9l0nQSa5Q+voSBByMvI=
Date: Mon, 04 May 2020 12:15:37 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1UXS9Q.L3SJ8WOQ2MPT1@crapouillou.net>
In-Reply-To: <1694a29b7a3449b6b662cec33d1b33f2ee0b174a.1588574111.git.hns@goldelico.com>
References: <1694a29b7a3449b6b662cec33d1b33f2ee0b174a.1588574111.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,


Le lun. 4 mai 2020 =E0 8:35, H. Nikolaus Schaller <hns@goldelico.com> a =

=E9crit :
> so that the driver can load by matching the device tree
> if compiled as module.
> =

> Cc: stable@vger.kernel.org # v5.3+
> Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx =

> SoCs")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Applied, thanks.

-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 9dfe7cb530e11..1754c05470690 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -843,6 +843,7 @@ static const struct of_device_id =

> ingenic_drm_of_match[] =3D {
>  	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D &jz4770_soc_info },
>  	{ /* sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
> =

>  static struct platform_driver ingenic_drm_driver =3D {
>  	.driver =3D {
> --
> 2.26.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
