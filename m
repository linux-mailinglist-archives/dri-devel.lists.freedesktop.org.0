Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374B5ED908
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B7E10E399;
	Wed, 28 Sep 2022 09:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E15110E398
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:32:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC0A847C;
 Wed, 28 Sep 2022 11:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664357550;
 bh=EkxQnbglOJJjbUOkcm19E7m917opHIXiaHSWo4z2CFU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cUgFmkDoQtDtLEsQ3nn+duMHA28wDR/fcwYjPXaVMlnnpL9c+t/N3n7THTkEu9f8C
 2ssm6r85AmsS525yKWpq2fx5++T6kjFuG3s9AyvBDl3rbOErFhbuGTnebVeNkHx60M
 ENv5f/gmPp8/QpLEc4BMCoBaAaZHi7pXn1KSSnmU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927233821.8007-2-laurent.pinchart@ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:32:27 +0100
Message-ID: <166435754712.56880.8201099627969135657@Monstersaurus>
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

Quoting Laurent Pinchart (2022-09-28 00:38:18)
> A couple of the register macro values are incorrectly indented. Fix
> them.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
