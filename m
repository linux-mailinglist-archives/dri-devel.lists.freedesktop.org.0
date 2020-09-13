Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE4267F66
	for <lists+dri-devel@lfdr.de>; Sun, 13 Sep 2020 14:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E536E182;
	Sun, 13 Sep 2020 12:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5436E17F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 12:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 474D9FB03;
 Sun, 13 Sep 2020 14:00:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESA5FQ6H5NID; Sun, 13 Sep 2020 14:00:15 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4503E45DBB; Sun, 13 Sep 2020 14:00:14 +0200 (CEST)
Date: Sun, 13 Sep 2020 14:00:14 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/panel: st7703: Make jh057n00900_panel_desc static
Message-ID: <20200913120014.GA10607@bogon.m.sigxcpu.org>
References: <20200912033809.142773-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912033809.142773-1-yanaijie@huawei.com>
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
Cc: megous@megous.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sat, Sep 12, 2020 at 11:38:09AM +0800, Jason Yan wrote:
> This eliminates the following sparse warning:
> =

> drivers/gpu/drm/panel/panel-sitronix-st7703.c:156:26: warning: symbol
> 'jh057n00900_panel_desc' was not declared. Should it be static?
> =

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index c22e7c49e077..7c07a8fc8506 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -153,7 +153,7 @@ static const struct drm_display_mode jh057n00900_mode=
 =3D {
>  	.height_mm   =3D 130,
>  };
>  =

> -struct st7703_panel_desc jh057n00900_panel_desc =3D {
> +static struct st7703_panel_desc jh057n00900_panel_desc =3D {

Can we even make it `static const`? With that

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

Cheers,
 -- Guido

>  	.mode =3D &jh057n00900_mode,
>  	.lanes =3D 4,
>  	.mode_flags =3D MIPI_DSI_MODE_VIDEO |
> -- =

> 2.25.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
