Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1A37927B
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 17:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DED6E4A6;
	Mon, 10 May 2021 15:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270C6E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 15:21:34 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7iv-0002cI-4A; Mon, 10 May 2021 17:21:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7iu-0005mZ-S0; Mon, 10 May 2021 17:21:32 +0200
Message-ID: <16c54eaf5d8319321f2df9627e8ee362d73a9e2c.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx: ipuv3-plane: fix PRG modifiers after drm
 managed resource conversion
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 10 May 2021 17:21:32 +0200
In-Reply-To: <20210510145927.988661-1-l.stach@pengutronix.de>
References: <20210510145927.988661-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-05-10 at 16:59 +0200, Lucas Stach wrote:
> The conversion to drm managed resources introduced two bugs: the plane is=
 now
> always initialized with the linear-only list, while the list with the Viv=
ante
> GPU modifiers should have been used when the PRG/PRE engines are present.=
 This
> masked another issue, as ipu_plane_format_mod_supported() is now called b=
efore
> the private plane data is set up, so if a non-linear modifier is supplied=
 in
> the plane modifier list, we run into a NULL pointer dereference checking =
for
> the PRG presence. To fix this just remove the check from this function, a=
s we
> know that it will only be called with a non-linear modifier, if the plane=
 init
> code has already determined that the PRG/PRE is present.
>=20
> Fixes: 699e7e543f1a ("drm/imx: ipuv3-plane: use drm managed resources")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2: Add proper subject.

Whoops, thank you. I've replaced the previous patch.

regards
Philipp
