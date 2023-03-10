Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFC6B3A3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CBE10E996;
	Fri, 10 Mar 2023 09:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2B410E997
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:22:29 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3487B660305B;
 Fri, 10 Mar 2023 09:22:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678440147;
 bh=y3JYGM2yZUXBDvbqEx9Ff7WwuKMXGRyyYSyk1UCnius=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PaqiiyBQ9ln52ppxN0TkvEvlTEtvAeGlTZdHPKREKnEiTJd9Ag//2fZdUUXElFSLv
 mA3ZUwBqFR5TzRGCZ98F/Xtf7xI4rNVJo/UPqfVA5FjJz4YEcbyT9u87aZBPVYnC0S
 mDJty6/GP4YJDeiubGqIivJ8wYz+j+xBpWqUpJzz6zr4X/yrkM7dwUpjB9hhkDt9eo
 7vMV+hYwLJr+rNHWwJ1hbfr8wchzI/2zfTVQ1oNkNKNTzLSb6CmOCxi+gWsjdM4quC
 CBM5Q2MYQa9y+4eUliCU+iZWyao+I1QTj3zUxJOjGoz083wKrC03GuI1NFKoWYMuw8
 Q95vzMtwj1nDQ==
Message-ID: <fc28d7cf-7ef1-4505-630b-87f6bc74a77f@collabora.com>
Date: Fri, 10 Mar 2023 10:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 2/3] drm/mediatek: Add support for AR30 and BA30
 overlays
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230309210623.1167567-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210623.1167567-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/03/23 22:06, Justin Green ha scritto:
> Add the ability for the Mediatek DRM driver to control the bit depth register.
> If the DTS indicates the device supports 10-bit overlays and the current format
> has a fourcc of AR30, BA30, or RA30, we set the bit depth register to 10 bit.
> 
> The next patch in the series actually enables 10-bit overlays for MT8195
> devices, but this current patch should be a no-op. This patch was tested by
> simply running Chrome on an MT8195 and looking for regressions.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


