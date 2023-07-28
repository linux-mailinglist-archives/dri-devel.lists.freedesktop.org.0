Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C21766FC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A818510E6AB;
	Fri, 28 Jul 2023 14:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68A10E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:47:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPOkf-0001kI-5L; Fri, 28 Jul 2023 16:47:33 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPOkd-002jMt-Kq; Fri, 28 Jul 2023 16:47:31 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qPOkd-000FNm-1H;
 Fri, 28 Jul 2023 16:47:31 +0200
Message-ID: <0698fe16001e58f040b87af52416e4fe2903f12d.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon
 hactive aligning
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 28 Jul 2023 16:47:31 +0200
In-Reply-To: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
References: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
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

On Mi, 2023-05-03 at 13:14 +0200, Alexander Stein wrote:
> When hactive is not aligned to 8 pixels, it is aligned accordingly and
> hfront porch needs to be reduced the same amount. Unfortunately the front
> porch is set to the difference rather than reducing it. There are some
> Samsung TVs which can't cope with a front porch of instead of 70.
>=20
> Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
