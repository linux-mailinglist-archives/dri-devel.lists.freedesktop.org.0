Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0354DAE5B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 11:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D2510E605;
	Wed, 16 Mar 2022 10:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0B10E605
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 10:40:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B255E1F4440A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647427222;
 bh=6HfrXX6kj8MJICTuM+ecnk15KUT574Z69o6G90jNQS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IB8kfAy1h7y3n32fNOTs9ePoDLrvI3c5Hf412n+cTcSTTassKABkYo97j2exYIvji
 x7ANB9jdE6pPVFVQ4dvsyyuEQ3IIIeBIYfAqhhZMJLxDDFMQAeZRepNJmEDzfA8DN0
 d3kbzLQimiZjwhPZaU3vWxJslT5lw6bDu+I54oiEu03PkDdHZHFutjd3eF10Nu/423
 Xv+5iofl+b+Zpir7bzh+/Ma6wRQa9/O/nAnYkEaOznIOo+WhzvLIfya+NfroIJ0yjk
 wC6dq+VgYiOHu0PFXjRGPKaeedJj3JCkcGe/ONx5hkAd8d7TDAryVuj7sVrYZaZoaf
 15yHMQP3b6+8A==
Message-ID: <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
Date: Wed, 16 Mar 2022 11:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/01/22 17:36, Chun-Kuang Hu ha scritto:
> Hi, AngeloGioacchino:
> 
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
> 2022年1月18日 週二 下午9:38寫道：
>>
>> There is no need to zero out the newly allocated memory because we are
>> duplicating all members of struct mtk_plane_state: switch to kmalloc
>> to save some overhead.
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>

Hello,

this series was sent and reviewed two months ago, but it hasn't been picked
in any maintainer tree.

This is a friendly ping to not let these two patches to be lost and forgotten.

Cheers,
Angelo
