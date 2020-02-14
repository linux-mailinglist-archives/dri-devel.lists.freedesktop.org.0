Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B0160CFA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954C6E86A;
	Mon, 17 Feb 2020 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAA56E85C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1581707197; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KB1bZUahZdMxykkZApvtcfxGNo5EEXp6pqcqZ+9Y/Q=;
 b=m/G/6+eO4qdQjEzCuMTIRsZAWqUmu8d7b0F7tO+d1MPV2IuvUKI7o756uV+aNtF73xQvrL
 B4C/IMiyF2njiBqqQbNxpbLFWCwtvNGDKvAuTdaeBMNnKscn4OTNo/4bEcpSuXmzvfIvM0
 21O999aAb9OhsCVkv5Iq2yp5jLZMT3Q=
Date: Fri, 14 Feb 2020 16:06:17 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/12] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1581707177.3.6@crapouillou.net>
In-Reply-To: <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
 <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
 Paul Boddie <paul@boddie.org.uk>, Kees Cook <keescook@chromium.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Please rebase this patch on top of drm-misc-next and send it apart - it =

should go through the DRM tree.


Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> Add MODULE_DEVICE_TABLE so that the driver can load by
> matching the device tree if compiled as module.
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

Also please remove the blank line above MODULE_DEVICE_TABLE.

Cheers,
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
