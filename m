Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8397C59F5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 19:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFAC10E231;
	Wed, 11 Oct 2023 17:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0210E231
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 17:04:24 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qqcdA-0006Ez-NP; Wed, 11 Oct 2023 19:04:20 +0200
Message-ID: <8201caf4102cbb81ea15e87713a165590b11a684.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/5] drm/etnaviv: Various cleanup
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Date: Wed, 11 Oct 2023 19:04:19 +0200
In-Reply-To: <20231002111207.513297-1-suijingfeng@loongson.cn>
References: <20231002111207.513297-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 02.10.2023 um 19:12 +0800 schrieb Sui Jingfeng:
> v2:
> 	* refine on v1 and update
>=20
Thanks, series applied to my etnaviv/next branch.

Regards,
Lucas

> Sui Jingfeng (5):
>   drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
>   drm/etnaviv: Fix coding style
>   drm/etnaviv: Add helper functions to create and destroy platform
>     device
>   drm/etnaviv: Add a helper to get the first available GPU device node
>   drm/etnaviv: Using 'dev' instead of 'etnaviv_obj->base.dev'
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 93 ++++++++++++++++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++--
>  2 files changed, 67 insertions(+), 38 deletions(-)
>=20

