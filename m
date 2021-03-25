Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F286E348C26
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1186EB71;
	Thu, 25 Mar 2021 09:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377AF6EB71
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:05:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8985E8C9;
 Thu, 25 Mar 2021 10:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616663124;
 bh=/SywUhKN0TyjTDbmFwZZQmOsTEDAh0nvpn/dDHY+Nrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7IpUKonP2G+CJe0y9GlvUurm3qlQRRoNc7AkmcfWBCfMISo5Ik/lbtQ6istzeDaS
 xZmjZw3gtxKL0qrD/M+DDg84q4Up8U+Dpph2k+j5GBQI4zrazi5GVvUw0KFJztt9D1
 SLXV047N1+/VlnlDZoqEXc8KZhd4SJ8vcXPRHdts=
Date: Thu, 25 Mar 2021 11:04:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drivers: gpu: drm: Remove duplicate declaration
Message-ID: <YFxSJ/EQWilHfT51@pendragon.ideasonboard.com>
References: <20210325045022.847135-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325045022.847135-1-wanjiabing@vivo.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wan,

Thank you for the patch.

On Thu, Mar 25, 2021 at 12:50:19PM +0800, Wan Jiabing wrote:
> struct dss_device has been declared at 51st line. 
> Remove the duplicate.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index a40abeafd2e9..2658aadee09a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -52,7 +52,6 @@ struct dss_device;
>  struct omap_drm_private;
>  struct omap_dss_device;
>  struct dispc_device;
> -struct dss_device;
>  struct dss_lcd_mgr_config;
>  struct snd_aes_iec958;
>  struct snd_cea_861_aud_if;

While at it, could you sort these forward declarations alphabetically,
so that duplicates are easier to see ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
