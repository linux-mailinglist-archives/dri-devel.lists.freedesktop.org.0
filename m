Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7764F0B4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0810E60D;
	Fri, 16 Dec 2022 18:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7D10E60D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:05:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F59-0004l4-Q2; Fri, 16 Dec 2022 19:05:15 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F57-004yPo-KR; Fri, 16 Dec 2022 19:05:14 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F57-000D9p-LG; Fri, 16 Dec 2022 19:05:13 +0100
Message-ID: <e33399bfe5b761ee85cf491247773f2e2fdf579b.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/imx/lcdc: Implement DRM driver for imx21
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 16 Dec 2022 19:05:13 +0100
In-Reply-To: <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Fr, 2022-12-16 at 18:50 +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Marian Cichy <m.cichy@pengutronix.de>
>=20
> Add support for the LCD Controller found on i.MX21 and i.MX25.
>=20
> It targets to be a drop in replacement for the imx-fb driver.
>=20
> Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> [ukl: Rebase to v6.1, various smaller fixes]
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> =C2=A0drivers/gpu/drm/imx/Kconfig         |   1 +
> =C2=A0drivers/gpu/drm/imx/Makefile        |   1 +

I miss drivers/gpu/drm/imx/lcdc/{Kconfig,Makefile}.

> =C2=A0drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 587 +++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 589 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

regards
Philipp
