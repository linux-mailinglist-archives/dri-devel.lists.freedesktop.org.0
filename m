Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A1374366
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 19:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABB889C88;
	Wed,  5 May 2021 17:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5A89C88
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 17:19:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2679DAF3D;
 Wed,  5 May 2021 17:19:01 +0000 (UTC)
Date: Wed, 5 May 2021 19:18:58 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH] drm/bridge: fix LONTIUM_LT8912B dependencies
Message-ID: <20210505171858.GC6564@kitsune.suse.cz>
References: <20210504220207.4004511-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504220207.4004511-1-adrien.grassein@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 12:02:07AM +0200, Adrien Grassein wrote:
> LONTIUM_LT8912B uses "drm_display_mode_to_videomode" from
> DRM framework that needs VIDEOMODE_HELPERS to be enabled.
> =

> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Reported-by: Michal Such=E1nek <msuchanek@suse.de>
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 400193e38d29..70bcceaae9bf 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -68,6 +68,7 @@ config DRM_LONTIUM_LT8912B
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select REGMAP_I2C
> +	select VIDEOMODE_HELPERS
>  	help
>  	  Driver for Lontium LT8912B DSI to HDMI bridge
>  	  chip driver.

Indeed, this fixes the problem.

Thanks

Michal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
