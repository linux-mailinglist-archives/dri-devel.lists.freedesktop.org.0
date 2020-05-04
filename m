Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3341C3381
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553486E32C;
	Mon,  4 May 2020 07:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E72889F82
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 01:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1588555991; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3kVnM/pt0oggUIsiHNmQoFutX1dSCYY6TB3Lm6oLFE=;
 b=mxItMKtRyij5x/wPWOz13FGJPQjbal6rSoJWpgE2O0yRMR788cFDS8oY/lU7J32gz/QGX9
 wZTwogoNRBP8FYfj7KyPbrYAqfdVnWIPCIzTR9T3oCM4x5478uCuGUeYjZPuPKUYltHhOe
 hRlxtN57Okse4d6QbeTj8le1efh8CVs=
Date: Mon, 04 May 2020 03:32:58 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v3 2/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <YM9S9Q.3YCM1LVLIS2O3@crapouillou.net>
In-Reply-To: <02c8f35fde969fd852a62740b4fa8a01c53b79ef.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
 <02c8f35fde969fd852a62740b4fa8a01c53b79ef.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2020 07:17:19 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 mips-creator-ci20-dev@googlegroups.com, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,


Le dim. 29 mars 2020 =E0 19:35, H. Nikolaus Schaller <hns@goldelico.com> =

a =E9crit :
> so that the driver can load by matching the device tree
> if compiled as module.
> =

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Please add:

Cc: stable@vger.kernel.org # v5.3+
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")

And re-send this patch alone, then I can merge it ASAP.

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 6d47ef7b148c..bcba2f024842 100644
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
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
