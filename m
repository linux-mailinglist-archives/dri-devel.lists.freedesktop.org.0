Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD017711B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950EF6EA27;
	Tue,  3 Mar 2020 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6E289D46
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583176920; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdwneqTr2id/gIeZNxFxbnKoAw05xVADq6/gmIhZwg4=;
 b=AqUyKD024PGi1OHtNmOIPdseDG4JSqAnMjoEWug5pu0ruALpVlC4z6ZX1ymIeD1q0aQf9b
 9AArX0blaUj+5gfaNF92anigg+B3rPch0xaYfXhL6gHleYjUJQxoiR6rkhjf58LqE8wxWn
 tgFLcqWQSGaEN9Ga4UYZDzVDcS0z444=
Date: Mon, 02 Mar 2020 16:21:37 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 3/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1583176897.3.4@crapouillou.net>
In-Reply-To: <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, linux-gpio@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kernel@pyra-handheld.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, letux-kernel@openphoenux.org,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> so that the driver can load by matching the device tree
> if compiled as module.
> =

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 6d47ef7b148c..d8617096dd8e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -844,6 +844,8 @@ static const struct of_device_id =

> ingenic_drm_of_match[] =3D {
>  	{ /* sentinel */ },
>  };
> =

> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);

Please remove the blank line above the MODULE_DEVICE_TABLE() macro.

-Paul

> +
>  static struct platform_driver ingenic_drm_driver =3D {
>  	.driver =3D {
>  		.name =3D "ingenic-drm",
> --
> 2.23.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
