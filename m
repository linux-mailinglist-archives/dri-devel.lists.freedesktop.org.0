Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBF7DE1C8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 14:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CA610E6F4;
	Wed,  1 Nov 2023 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E910E6F4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 13:54:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3220D8D;
 Wed,  1 Nov 2023 14:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698846868;
 bh=yNCpCVMpfXI7srTI32VeMvlAPheYtU2vtm2As3cwhGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EsLGcTKLxRxpRkjwtTkDsVh+TeiHlD3YKH5pNQybBr2tvQ3A5XaY/KTXqja5EWjN4
 1CGLjD3mFP93vw0qs2ZjO6Se4psS7yDrn3Zq2xqhXbNkMHE2HecAZxrvfvUWTHIk8N
 cz/bEvLdVlUz6LOeY8gxeaCixiVne+I74KfWYW3M=
Date: Wed, 1 Nov 2023 15:54:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 03/10] drm/tidss: Drop useless variable init
Message-ID: <20231101135451.GS12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-3-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-3-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 01, 2023 at 11:17:40AM +0200, Tomi Valkeinen wrote:
> No need to initialize the ret to 0 in dispc_softreset().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 9d9dee7abaef..ad7999434299 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2705,7 +2705,7 @@ static void dispc_init_errata(struct dispc_device *dispc)
>  static void dispc_softreset(struct dispc_device *dispc)
>  {
>  	u32 val;
> -	int ret = 0;
> +	int ret;
>  
>  	/* Soft reset */
>  	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
> 

-- 
Regards,

Laurent Pinchart
