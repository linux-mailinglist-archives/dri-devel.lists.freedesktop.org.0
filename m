Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28A19011B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40EC89CC4;
	Mon, 23 Mar 2020 22:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD089CC4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:31:38 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 1E72E5C0BDA;
 Mon, 23 Mar 2020 23:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585002697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46orGRAOTaRuyULCKdFKh9NwJI3MbwEwE2ADXeoyhQ4=;
 b=GfTsaKcVxobE51+QVO/ityFhIvELPSaEW8ZEhig+37/AhX+tgQbanA4ThP/EkWNKX/BQsw
 4ZUOugCrvXXtBhA03Tca+mZbQmWdPF1wFFYuTyEXi89g+Glic34Zz0sm/rbB/G9qARk9iu
 5IY2ENSRjSX1iERgr5qohAJQqgNE62k=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 23:31:37 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 11/21] drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
In-Reply-To: <20200309195216.31042-12-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-12-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <a3939e23b9a1c1f3b8fd38d5091518eb@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> The mxsfb_crtc.c file doesn't handle just the CRTC, but also the other
> KMS objects. Rename it accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/Makefile                      | 2 +-
>  drivers/gpu/drm/mxsfb/{mxsfb_crtc.c => mxsfb_kms.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/gpu/drm/mxsfb/{mxsfb_crtc.c => mxsfb_kms.c} (100%)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
> index 811584e54ad1..26d153896d72 100644
> --- a/drivers/gpu/drm/mxsfb/Makefile
> +++ b/drivers/gpu/drm/mxsfb/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -mxsfb-y := mxsfb_drv.o mxsfb_crtc.o
> +mxsfb-y := mxsfb_drv.o mxsfb_kms.o
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> similarity index 100%
> rename from drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> rename to drivers/gpu/drm/mxsfb/mxsfb_kms.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
