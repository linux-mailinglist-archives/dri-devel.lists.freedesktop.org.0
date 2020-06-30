Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696720EF96
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F94789E63;
	Tue, 30 Jun 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EB6898FD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 06:46:47 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 0D80C3ACB52
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 06:40:23 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 694BC100009;
 Tue, 30 Jun 2020 06:39:59 +0000 (UTC)
Date: Tue, 30 Jun 2020 08:39:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: panel: simple: Correct bus format for Satoz
 SAT050AT40H12R2
Message-ID: <20200630083957.5a9447a3@xps13>
In-Reply-To: <20200629233320.8774-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200629233320.8774-3-laurent.pinchart+renesas@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote on
Tue, 30 Jun 2020 02:33:18 +0300:

> The Satoz SAT050AT40H12R2 panel is an LVDS panel, the
> MEDIA_BUS_FMT_RGB888_1X24 bus format is thus incorrect. Set it to the
> correct value MEDIA_BUS_FMT_RGB888_1X7X4_SPWG.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index ac6e8d55a3a2..c659d8262e5c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3118,7 +3118,7 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
>  		.width = 108,
>  		.height = 65,
>  	},
> -	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
