Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05A7384CA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98D710E477;
	Wed, 21 Jun 2023 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB65A10E476
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:20:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBxko-0005HW-8D; Wed, 21 Jun 2023 15:20:10 +0200
Message-ID: <45a52563d8ebc7e8715ef363d26125b7757b50ab.camel@pengutronix.de>
Subject: Re: [PATCH] drm: etnaviv: Replace of_platform.h with explicit includes
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 15:20:08 +0200
In-Reply-To: <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
References: <20230410232647.1561308-1-robh@kernel.org>
 <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 09.06.2023 um 14:17 -0600 schrieb Rob Herring:
> On Mon, Apr 10, 2023 at 5:26=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >=20
> > Etnaviv doesn't use anything from of_platform.h, but depends on
> > of.h, of_device.h, and platform_device.h which are all implicitly
> > included, but that is going to be removed soon.
> >=20
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Ping!

Thanks, applied to etnaviv/next.

Regards,
Lucas

>=20
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/et=
naviv/etnaviv_drv.c
> > index 44ca803237a5..c68e83ed5a23 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -6,7 +6,9 @@
> >  #include <linux/component.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/module.h>
> > -#include <linux/of_platform.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/uaccess.h>
> >=20
> >  #include <drm/drm_debugfs.h>
> > --
> > 2.39.2
> >=20

