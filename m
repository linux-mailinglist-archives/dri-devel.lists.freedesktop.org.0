Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44F1A7764
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AACC89D86;
	Tue, 14 Apr 2020 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD6989D86
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:32:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DD4F521;
 Tue, 14 Apr 2020 11:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586856764;
 bh=AmiIyigIad3hEHv25MmhHHleJ8azfFTTznoUmVHbEyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLPDu0MUpbb2Ecb0cY5z6OUYo9xc4Pbo9DkMEyr6U/nMiKeNuJbXUiTrlw6TMfjb3
 3Fnx9UpgXzNHsB27T8yLbhcbKdfkbW1l42+FdqdTpReKfoWUHVC0+Gov/Ywk2TkiWW
 mGWvciaFQRPxQvYtvA00dxpTYzjpfGHxwjvnvb8k=
Date: Tue, 14 Apr 2020 12:32:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/4] drm/panel: add connector type to boe, hv070wsa-100
 panel
Message-ID: <20200414093233.GA19819@pendragon.ideasonboard.com>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414084727.8326-2-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Apr 14, 2020 at 10:47:24AM +0200, Sam Ravnborg wrote:
> The boe,hv070wsa-100 panel is a LVDS panel.
> Fix connector type to reflect this.
> 
> With this change users of this panel do not have to specify the
> connector type.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 44a1f5dfb571..749115c98ee2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1059,6 +1059,7 @@ static const struct panel_desc boe_hv070wsa = {
>  		.width = 154,
>  		.height = 90,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

While at it, could you set .bus_format too ? It's particularly important
for LVDS panels.

>  };
>  
>  static const struct drm_display_mode boe_nv101wxmn51_modes[] = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
