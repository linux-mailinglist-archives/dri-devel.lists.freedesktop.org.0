Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151678350E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 23:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF8A10E11E;
	Mon, 21 Aug 2023 21:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE310E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 21:58:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0AEB6D5;
 Mon, 21 Aug 2023 23:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692655037;
 bh=VMSPjv2DqGuGsHsm746vd5bo2vG27BOcjVtyo3EUlKA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sfe0FVG6n0ULilznKrPzLdYEwDIDhLlRdtXB5qXOWLfUDSvEfYhmL/6A/MiI5LfU7
 I7PEd6olEnvLl+Wt5ZzO4TVg3evrWZT/+IZYXDav/LZqsnYhgwBw9lxymu9WSw2rT/
 UDQDzg88j+JQWFx5PWSM04TJvpbsVKZH5+mjXCSI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230816105642.20419-1-wsa+renesas@sang-engineering.com>
References: <20230816105642.20419-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: use proper naming for R-Car
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Date: Mon, 21 Aug 2023 22:58:30 +0100
Message-ID: <169265511004.435850.5466517142137717153@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Wolfram Sang (2023-08-16 11:56:41)
> Not RCAR, but R-Car.
>=20
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_plane.h
> index f9893d7d6dfc..e9e59c5e70d5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> @@ -16,7 +16,7 @@ struct rcar_du_format_info;
>  struct rcar_du_group;
> =20
>  /*
> - * The RCAR DU has 8 hardware planes, shared between primary and overlay=
 planes.
> + * The R-Car DU has 8 hardware planes, shared between primary and overla=
y planes.
>   * As using overlay planes requires at least one of the CRTCs being enab=
led, no
>   * more than 7 overlay planes can be available. We thus create 1 primary=
 plane
>   * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.
> --=20
> 2.35.1
>
