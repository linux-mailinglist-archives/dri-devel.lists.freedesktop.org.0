Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071D1C9B53
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 21:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AC36EA53;
	Thu,  7 May 2020 19:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06A76EA59
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 19:45:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DD878804E0;
 Thu,  7 May 2020 21:45:10 +0200 (CEST)
Date: Thu, 7 May 2020 21:45:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] drm: panel: add MODULE_LICENSE to
 panel-visionox-rm69299.c
Message-ID: <20200507194504.GA17398@ravnborg.org>
References: <bbb7b3b3-9968-9a1f-8ef6-2e8e3be998f6@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbb7b3b3-9968-9a1f-8ef6-2e8e3be998f6@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=-hV4Oh7n94FXQxVVdNQA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy.

On Thu, May 07, 2020 at 09:23:11AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Add MODULE_LICENSE() to the panel-visionox-rm69299 driver
> to fix a build warning.
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-visionox-rm69299.o
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org

Thanks.
Added Fixes: tag and applied to drm-misc-next.

	Sam


> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20200507.orig/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ linux-next-20200507/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -300,3 +300,4 @@ static struct mipi_dsi_driver visionox_r
>  module_mipi_dsi_driver(visionox_rm69299_driver);
>  
>  MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> +MODULE_LICENSE("GPL v2");
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
