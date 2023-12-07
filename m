Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E2808521
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416CF10E854;
	Thu,  7 Dec 2023 10:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4C410E854
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:05:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rBBG7-00013L-IN; Thu, 07 Dec 2023 11:05:31 +0100
Message-ID: <092107b1490b4c1b4ba5f2b60993e452c932f4a3.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: add sensitive state for
 PE_RT_ADDR_4_PIPE(3, 0|1) address
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Thu, 07 Dec 2023 11:05:30 +0100
In-Reply-To: <20231207074308.393008-1-christian.gmeiner@gmail.com>
References: <20231207074308.393008-1-christian.gmeiner@gmail.com>
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 07.12.2023 um 08:43 +0100 schrieb Christian Gmeiner:
> From: Christian Gmeiner <cgmeiner@igalia.com>
>=20
> 0x1540 is the address of 4th render target address pair (two pixel pipes)=
.
>=20
Are there any corresponding TS states for this region?

Regards,
Lucas

> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_cmd_parser.c
> index b106e8b288ad..9bf47327f436 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
> @@ -54,6 +54,7 @@ static const struct {
>  	ST(0x1480, 8),
>  	ST(0x1500, 8),
>  	ST(0x1520, 8),
> +	ST(0x1540, 8),
>  	ST(0x1608, 1),
>  	ST(0x1610, 1),
>  	ST(0x1658, 1),

