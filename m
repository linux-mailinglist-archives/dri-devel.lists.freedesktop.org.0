Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B594548E853
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2910C10E90D;
	Fri, 14 Jan 2022 10:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07D10E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:28:14 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1n8JoZ-0007TH-K0; Fri, 14 Jan 2022 11:28:11 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1n8JoX-0006cp-EB; Fri, 14 Jan 2022 11:28:09 +0100
Message-ID: <936f9c0c1de0fcf485b8f5e7a9e1a07b04d0b040.camel@pengutronix.de>
Subject: Re: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Jan 2022 11:28:09 +0100
In-Reply-To: <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, 2022-01-12 at 17:46 +0000, Biju Das wrote:
[...]
> +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
> +{
[...]
> +	dsi->rstc =3D devm_reset_control_get(dsi->dev, "rst");
[...]
> +	dsi->arstc =3D devm_reset_control_get(dsi->dev, "arst");
[...]
> +	dsi->prstc =3D devm_reset_control_get(dsi->dev, "prst");

Please use devm_reset_control_get_exclusive() instead.

regards
Philipp
