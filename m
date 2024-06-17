Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FB90ACC5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DB210E359;
	Mon, 17 Jun 2024 11:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aOzotlzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06D310E359
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718623239;
 bh=1SLWPyPglngWrx9xUgQjtGPeTxnAJOtM3yGToDlbRaw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aOzotlzYGGJseL/4cjdfS+0ABT1h8Cxk7gQa5ff3AcuOmunZlHlf1FgYfET9Q0/4i
 8xCmNOAVy6LoAFljcQtnK9NtxDWXKWycgr/VAiKGFo+1oc5PpxwXvKEfGkvOB1s7Bi
 rTiZ2TbHD7Q8aebO5HZ8K3HJh9mB9do+OJkaGvG9k3FJkeGKSKBL/J1UY7cthCn15U
 QiSCxxObuU4L/b7XbQsjLIeikbDJVhCSJ9Wafb6INqlJxxAsVdCUYxNyzibNT7S9Zf
 zn/rhQz/u6ScOKSEpbuo4g9V6NvzW4anbW9M2wrHP3yWfFy781WjlX6K0sVRMpiCFK
 xB0f1RW+QhChg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 797AA37804C8;
 Mon, 17 Jun 2024 11:20:38 +0000 (UTC)
Message-ID: <48bcaa6b-b814-41fd-b584-da664f02e3ba@collabora.com>
Date: Mon, 17 Jun 2024 13:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/mediatek: Add new color format MACROs in OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-11-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-11-7e8f9cf785d8@mediatek.com>
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

Il 16/06/24 10:29, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Define new color formats to hide the bit operation in the MACROs to make
> the switch statement more concise.
> Change the MACROs to align the naming rule in DRM.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


