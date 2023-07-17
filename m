Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A442C75601B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832F110E21F;
	Mon, 17 Jul 2023 10:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427B10E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:09:10 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLLA7-0001GZ-S3; Mon, 17 Jul 2023 12:09:03 +0200
Message-ID: <9741d5820a54707f13c099570901dd4d474548f7.camel@pengutronix.de>
Subject: Re: [PATCH v1 0/8] drm/etnaviv: Various cleanup
From: Lucas Stach <l.stach@pengutronix.de>
To: suijingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <sui.jingfeng@linux.dev>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jul 2023 12:09:00 +0200
In-Reply-To: <73307b1e-1e0e-6265-0344-171d2700e495@loongson.cn>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <73307b1e-1e0e-6265-0344-171d2700e495@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

Am Montag, dem 17.07.2023 um 16:36 +0800 schrieb suijingfeng:
> Hi, Dear etnaviv folks
>=20
>=20
> Would you like to review this cleanup patch set ?
>=20
> I am asking because I'm wondering that
>=20
> if I should re-spin my other patch from the code base
>=20
> which *with* this series applied or from the code base
>=20
> *without* this series applied.
>=20
>=20
> I think this series looks fine, is it acceptable?
>=20
I've gone through the series and left some comments. All patches that I
didn't comment on look fine to me. I'm generally in favor of taking
this series.

Regards,
Lucas

>=20
> On 2023/6/23 18:08, Sui Jingfeng wrote:
> > From: Sui Jingfeng <suijingfeng@loongson.cn>
> >=20
> > No functional change.
> >=20
> > Sui Jingfeng (8):
> >    drm/etnaviv: Using the size_t variable to store the number of pages
> >    drm/etnaviv: Using the unsigned int type to count the number of page=
s
> >    drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
> >    drm/etnaviv: Remove surplus else after return
> >    drm/etnaviv: Keep the curly brace aligned
> >    drm/etnaviv: No indentation by double tabs
> >    drm/etnaviv: Add dedicated functions to create and destroy platform
> >      device
> >    drm/etnaviv: Add a helper to get a pointer to the first available no=
de
> >=20
> >   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 100 +++++++++++++------=
-
> >   drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  14 +--
> >   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   7 +-
> >   3 files changed, 77 insertions(+), 44 deletions(-)
> >=20
>=20

