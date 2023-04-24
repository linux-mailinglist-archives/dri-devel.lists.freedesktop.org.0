Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2B6ECB21
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 13:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCE510E49F;
	Mon, 24 Apr 2023 11:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712B10E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:16:45 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q4jJF2qC1zDqPv;
 Mon, 24 Apr 2023 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1682335005; bh=9PyrAd2emcEb7E0sv0ZfE/I+7D43xNrD7rumUp6r68I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sEBjk+C9GVjh0iQLb2yT6rnMVyR5BrF+hCsmGcq581zSExdCTgbkuoNin8Y51rvlk
 mSAgcLC1I21X/E55FP7zVmhg/Gnd7RusQMGE01PbXPU/jeYJj5pSo/4RsKvaUBIRP9
 3UFYU+Z8yvMxpzJGfdOxwh6XYDdN1hKgxEWYKdYA=
X-Riseup-User-ID: 678DA1CC7131AB175392FD4C789BE3F85A386801FA2D3B237D515B53B6153B02
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q4jJ90NrGzFrxG;
 Mon, 24 Apr 2023 11:16:40 +0000 (UTC)
Message-ID: <55b8a1bf-e41e-16f9-8377-90e4a94d6436@riseup.net>
Date: Mon, 24 Apr 2023 08:16:39 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] drm/bridge: anx7625: Drop of_gpio header
Content-Language: en-US
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-2-mairacanal@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-2-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/12/22 17:57, Maíra Canal wrote:
> This driver includes the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop the include.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 79fc7a50b497..d7d4ca1c8b30 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -17,7 +17,6 @@
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> -#include <linux/of_gpio.h>
>   #include <linux/of_graph.h>
>   #include <linux/of_platform.h>
>   
