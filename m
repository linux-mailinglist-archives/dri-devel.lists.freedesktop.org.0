Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C77392C53
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177136EE6E;
	Thu, 27 May 2021 11:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2AA6EE6E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7B8E61F439AF
Subject: Re: [PATCH] drm/bridge: DRM_CROS_EC_ANX7688 should depend on
 I2C_CROS_EC_TUNNEL
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
References: <d107d1840b83607baee8571cc5d88973fc32b519.1622015323.git.geert+renesas@glider.be>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d728f168-8e36-44e4-0d9a-a52572ed1c1b@collabora.com>
Date: Thu, 27 May 2021 13:07:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d107d1840b83607baee8571cc5d88973fc32b519.1622015323.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for your patch.

On 26/5/21 9:50, Geert Uytterhoeven wrote:
> The ChromeOS EC ANX7688 bridge is connected to a ChromeOS Embedded
> Controller, and is accessed using I2C tunneling through the Embedded
> Controller.  Hence add a dependency on I2C_CROS_EC_TUNNEL, to prevent
> asking the user about this driver when configuring a kernel without
> support for the ChromeOS EC tunnel I2C bus.
> 
> Fixes: 44602b10d7f2a5f7 ("drm/bridge: Add ChromeOS EC ANX7688 bridge driver support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 7e7f28eb954661e2..c96e4b38d1d34ee6 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -53,6 +53,7 @@ config DRM_CHRONTEL_CH7033
>  config DRM_CROS_EC_ANX7688
>  	tristate "ChromeOS EC ANX7688 bridge"
>  	depends on OF
> +	depends on I2C_CROS_EC_TUNNEL || COMPILE_TEST
>  	select DRM_KMS_HELPER
>  	select REGMAP_I2C
>  	help
> 
