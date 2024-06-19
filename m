Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6126A90E6E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6A510E1F1;
	Wed, 19 Jun 2024 09:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qn/DeSoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1B110EBE5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:24:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C5BF89;
 Wed, 19 Jun 2024 11:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718789059;
 bh=h/iCqsrqGKzzT1b99RkG5kUY08OuMh64fA4WZzWOod0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Qn/DeSoe8PsmDvbpU16McoVFN+Hmt76a9BbHc07g1dpyThhFbWcY3vKKxlP3Nj1o+
 0OrmOGOw8IL5GcTHudXKgMFY741K3xoWjRHmxKMBnJWZQhfMW3vjxE143v7GNnQRFz
 bPJbPvOVGAGoD+4BuYU4yh6A5OhHhapjZDjsBDPg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
References: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm: Remove unused function rcar_cmm_write
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 laurent.pinchart@ideasonboard.com
Date: Wed, 19 Jun 2024 10:24:34 +0100
Message-ID: <171878907461.2248009.5135990660675548248@ping.linuxembedded.co.uk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jiapeng Chong (2024-06-19 08:54:36)
> The function are defined in the rcar_cmm.c file, but not called
> elsewhere, so delete the unused function.
>=20
> drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused functio=
n 'rcar_cmm_read'.

Indeed it's unused.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9364
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm=
/renesas/rcar-du/rcar_cmm.c
> index 26a2f5ad8ee5..883b960e9acc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,11 +32,6 @@ struct rcar_cmm {
>         } lut;
>  };
> =20
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> -{
> -       return ioread32(rcmm->base + reg);
> -}
> -
>  static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 da=
ta)
>  {
>         iowrite32(data, rcmm->base + reg);
> --=20
> 2.20.1.7.g153144c
>
