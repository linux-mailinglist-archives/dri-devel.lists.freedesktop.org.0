Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F855ED941
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6C10E398;
	Wed, 28 Sep 2022 09:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843C510E398
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:36:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE87E47C;
 Wed, 28 Sep 2022 11:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664357774;
 bh=0waZZVwkeHDOEZhKjrVaePMA4bHsRz1Z1NR6ijWHx90=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YCjLMtaCQoOT9u0x2ERe7x/CuAe4OnK+mNJ0BY9XZO3yLqXMoWgsqBcr4PpiZyjX4
 5xSRcNqHY7Db5UaZbbi2AZjE3eFXQOrefX9Fe6B5qTMJqT/efWi+Syhh6Pi/PNyZmK
 /dU1IuUv1waP9CXT6F++qPWVOXPyF9UEcJQDNFG8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220928005812.21060-2-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:36:11 +0100
Message-ID: <166435777144.2677993.16181682647705982744@Monstersaurus>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-09-28 01:58:09)
> A couple of the register macro values are incorrectly indented. Fix
> them.
>=20

Argh, there was already a v2 posted. Sometimes (more often than I like)
I really hate email...


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/l=
cdif_regs.h
> index 8e8bef175bf2..013f2cace2a0 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -130,7 +130,7 @@
>  #define CTRL_FETCH_START_OPTION_BPV    BIT(9)
>  #define CTRL_FETCH_START_OPTION_RESV   GENMASK(9, 8)
>  #define CTRL_FETCH_START_OPTION_MASK   GENMASK(9, 8)
> -#define CTRL_NEG                               BIT(4)
> +#define CTRL_NEG                       BIT(4)
>  #define CTRL_INV_PXCK                  BIT(3)
>  #define CTRL_INV_DE                    BIT(2)
>  #define CTRL_INV_VS                    BIT(1)
> @@ -186,7 +186,7 @@
>  #define INT_ENABLE_D1_PLANE_PANIC_EN   BIT(0)
> =20
>  #define CTRLDESCL0_1_HEIGHT(n)         (((n) & 0xffff) << 16)
> -#define CTRLDESCL0_1_HEIGHT_MASK               GENMASK(31, 16)
> +#define CTRLDESCL0_1_HEIGHT_MASK       GENMASK(31, 16)
>  #define CTRLDESCL0_1_WIDTH(n)          ((n) & 0xffff)
>  #define CTRLDESCL0_1_WIDTH_MASK                GENMASK(15, 0)
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
