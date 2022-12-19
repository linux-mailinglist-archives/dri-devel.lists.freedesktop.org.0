Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9065149A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 22:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572910E0D0;
	Mon, 19 Dec 2022 21:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15410E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 21:06:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307A9825;
 Mon, 19 Dec 2022 22:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671484014;
 bh=GgWU9DQtGFgDZKlTPlKPTzTL2szkwcJhLVoJmO5jeqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FMogWR8bIOFTEYpaqVq/6QdbcxCIhQJM+iocHwhEKjzT+mPDO4L2dXjaSQ1CcT9yu
 VGP8qxCL3cVZ0lPbOGJVZEMA8ZQ+fyLnpdlQEwQJH89pm3t3KU/0yZTHNO8bC8tXTt
 ckGWbzZeqklG8BPApN+IX5wujnFAD9PG16OwXAUQ=
Date: Mon, 19 Dec 2022 23:06:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/7] media: renesas: vsp1: Add V4H SoC version
Message-ID: <Y6DSasWWdmx73hgf@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219140139.294245-5-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Dec 19, 2022 at 04:01:36PM +0200, Tomi Valkeinen wrote:
> Add VI6_IP_VERSION_SOC_V4H so that we can identify V4H SoC.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index 8c9333f76858..c61e8dafeecf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -782,6 +782,7 @@
>  #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
> +#define VI6_IP_VERSION_SOC_V4H		(0x06 << 0)
>  /* RZ/G2L SoCs have no version register, So use 0x80 for SoC Identification */
>  #define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
>  

-- 
Regards,

Laurent Pinchart
