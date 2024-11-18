Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D619D09DD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 07:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646D10E02A;
	Mon, 18 Nov 2024 06:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JB1zCxRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196F510E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731912852;
 bh=Z2davH3euLXzw7+JmOS0iNFu1RheIVz/v10S5oNSC4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JB1zCxRJ1gz78ADZYPJCeXUPq2IUttOwtcq8qjfQb5rGvUyPrtrq9zUFt6DDS+RRr
 reKB0vfBrersIUELTShL1XDxmj08OzGzQc4hctFlBYvlShoo13vy0H7u1axYVdRINo
 h99kkC36MLN2ARcdb+kRgLmvHPlioMhRtRdB7cRIhQibvtBmGX3PQJdnclABpHP2h6
 KS8MVRVFguZJQY2WZrLMluCmWAiuG5lSdFJmS+e5J0dlE0MxQ/ULqcMZPfeMuVuZW4
 awlmPNGnq3aS8mpfl90fjMCV+w/x2mFfXB/zGGqSIhbLL0hhpLj8qOcfQ49WF/eUYZ
 L/Zvr7WDM0frw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EE3E217E1245;
 Mon, 18 Nov 2024 07:54:11 +0100 (CET)
Message-ID: <f6fe51d5-eb16-45ae-b85d-c89ad874b65d@collabora.com>
Date: Mon, 18 Nov 2024 07:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/11/24 03:51, Jason-JH.Lin ha scritto:
> mediatek-drm driver reported the capability of 180-degree rotation by
> adding `DRM_MODE_ROTATE_180` to the plane property, as flip-x combined
> with flip-y equals a 180-degree rotation. However, we did not handle
> the rotation property in the driver and lead to rotation issues.
> 
> Fixes: 74608d8feefd ("drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


