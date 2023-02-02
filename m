Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F3687885
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76D10E136;
	Thu,  2 Feb 2023 09:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D3710E136
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:14:45 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A1F66602EDA;
 Thu,  2 Feb 2023 09:14:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675329284;
 bh=kJVMCUJpyDJwkWtgM+hXBLW2SmGxN8YP7dAvyuM/vFY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=igEIQVhUKu6p+1rwaQMxBD5dfVZSA+M5+dFbUB9seJEIJVHngm4ZW0R5n6CmoskBx
 6l0A57/6OsGLVAVP92hBy64sP0OndboXMpy6Bk4GkH69rTh3YOb9lCA1bd227XA/vx
 TXhNSGL/O5L7YO9sIrSUI4JmjN3ijhJHXe16AOJb/8uktexyHlsLVOvQ8L21RubloB
 TafxIXdNI673qvgUllCHWEU5J9d1UJXjkeXgjrU9+MP6qUfE2jXAR6TzWqB43DvQu4
 M3tSWTXjDlszi+AjzZjzt5IDnN05d5lgMXQ0FV9WKPvx6uJWKp1CMk9rJ2YDAGe8BF
 71E6bYGMCy8qg==
Message-ID: <e2e02a7b-0e0c-e0f8-df49-ae2ea27c4440@collabora.com>
Date: Thu, 2 Feb 2023 10:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if
 bridge is attached
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230202045734.2773503-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230202045734.2773503-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/02/23 05:57, Chen-Yu Tsai ha scritto:
> The MediaTek DisplayPort interface bridge driver starts its interrupts
> as soon as its probed. However when the interrupts trigger the bridge
> might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
> does not check whether the passed in drm_device is valid or not, a NULL
> pointer passed in results in a kernel NULL pointer dereference in it.
> 
> Check whether the bridge is attached and only trigger an HPD event if
> it is.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


