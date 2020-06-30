Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F06210499
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1A56E7D7;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 73861 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jun 2020 07:30:09 UTC
Received: from pmg01-out1.zxcs.nl (pmg01-out1.zxcs.nl [IPv6:2a06:2ec0:1::ffeb])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AD489C94
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 07:30:08 +0000 (UTC)
Received: from pmg01.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg01.zxcs.nl (Zxcs) with ESMTP id 8F1691034E2;
 Tue, 30 Jun 2020 09:30:07 +0200 (CEST)
Received: from web0081.zxcs.nl (web0081.zxcs.nl [IPv6:2a06:2ec0:1::81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pmg01.zxcs.nl (Zxcs) with ESMTPS;
 Tue, 30 Jun 2020 09:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID
 :References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3L+cHncs6jvE8gXQ2wTjUtx+gKN6zKFvqxbt3VO/4M=; b=xHAbD4yB+3jgJUE6NAVZJ9dJjf
 SaXmw2qfxr2ORaFh7I4yXlPetIK6w11dHrRZRtsp5AKJ5EjF/ctPEH3rQBGQIqILqe6h6T53/c+52
 gyN1bNGR/SXXrprW9d2zL2wCS0IBUwGyqv2FZ+bkkfMhsv0lIi4HiN5tQ8wcPGfjke4b/DxomhyMD
 UiKyZ6gMFaqjE1T1d8vsqR+G8sxENxcC//Z+VGqX9SlH1ZgJ4BpxOImUEgoqXSWjoXfevmLlCj3tQ
 aNPeXrt3C5e4cxCYtjiu+pZmYGRMQs393VpKmr8pfpaQTIvcgy0D2GuZAAZ4znvHEQs6oB5ftKZUW
 qpfginSQ==;
Received: from spamrelay.zxcs.nl ([185.104.28.12]:35596
 helo=mail-slave02.zxcs.nl)
 by web0081.zxcs.nl with esmtp (Exim 4.93.0.4)
 (envelope-from <dev@pascalroeleven.nl>)
 id 1jqAiU-0024ut-R4; Tue, 30 Jun 2020 09:30:06 +0200
MIME-Version: 1.0
Date: Tue, 30 Jun 2020 09:30:06 +0200
From: Pascal Roeleven <dev@pascalroeleven.nl>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: panel: simple: Correct connector type for
 Starry KR070PE2T
In-Reply-To: <20200629233320.8774-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200629233320.8774-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.6
Message-ID: <a34654b9ca8bf41701bb8e55754a12b0@pascalroeleven.nl>
X-Sender: dev@pascalroeleven.nl
X-AuthUser: 
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-30 01:33, Laurent Pinchart wrote:
> The Starry KR070PE2T panel is a DPI panel, not and LVDS panel. Fix its
> connector type.
> 
> Signed-off-by: Laurent Pinchart 
> <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index bff1cab529d2..ac6e8d55a3a2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3320,7 +3320,7 @@ static const struct panel_desc starry_kr070pe2t = 
> {
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | 
> DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> -	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
> 
>  static const struct drm_display_mode starry_kr122ea0sra_mode = {

Reviewed-by: Pascal Roeleven <dev@pascalroeleven.nl>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
