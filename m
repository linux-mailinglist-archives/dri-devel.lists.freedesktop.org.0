Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8A767091
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57EE10E71B;
	Fri, 28 Jul 2023 15:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CDF10E71B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:31:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPRW-0007cf-16; Fri, 28 Jul 2023 17:31:50 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPRU-002jsk-K2; Fri, 28 Jul 2023 17:31:48 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qPPRU-000GZc-0g;
 Fri, 28 Jul 2023 17:31:48 +0200
Message-ID: <1df56704377534ac68283243d0f39a9355d42c8b.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon
 hactive aligning
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 28 Jul 2023 17:31:48 +0200
In-Reply-To: <2644832.X9hSmTKtgW@steina-w>
References: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
 <2644832.X9hSmTKtgW@steina-w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2023-07-21 at 10:36 +0200, Alexander Stein wrote:
> Hi,
>=20
> Am Mittwoch, 3. Mai 2023, 13:14:56 CEST schrieb Alexander Stein:
> > When hactive is not aligned to 8 pixels, it is aligned accordingly and
> > hfront porch needs to be reduced the same amount. Unfortunately the fro=
nt
> > porch is set to the difference rather than reducing it. There are some
> > Samsung TVs which can't cope with a front porch of instead of 70.
> >=20
> > Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > AFAICS ipu_di_adjust_videomode() checks that front porch is big enough =
to
> > reduce the alignment difference.
>=20
> A gentle ping. Is there anything to do? Or is someone picking this patch =
was=20
> tested by Ian?

Thank you, pushed to drm-misc-fixes with the subject changed to:
"drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning".

regards
Philipp
