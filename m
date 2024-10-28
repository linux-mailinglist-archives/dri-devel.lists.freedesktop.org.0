Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156369B2B08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EDA10E141;
	Mon, 28 Oct 2024 09:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FZJFkmy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6822010E141
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730106583;
 bh=qbDABT2Z+Hm3SckfMFDCYI4eg+29z9RV470Z0JIO1Ow=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FZJFkmy/CZGDMoWGPLr/Imi9VzeOfV6jRL+DNCZklfPNZiSGYd7vmJqrQLGfak9vx
 KywcSbX/zh6R4+mF4LJNWNuIFrRoa7tSSdtfEXioffKbYT65raQctoNBD50jrI6nBH
 BA6Kx3oW5YPXbbgJTEO0nTv+i1AMJozDcQtcQSxzT2jlumQuO0ZI4TQHmLm4Su0Tu+
 HziNnpKLd0OvenQqLTK3DLxyMUBBv07oDbQLsjN6a0ota0qufqzzubluruEPHWH7O2
 1UtWwLBI9rzrLbj/80MdIkrmdi7gLvqFZf/PxNokDVBQ38hauTqxlvOIA6zoCRLi9m
 BJMnYxeERYhzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 476BC17E10FC;
 Mon, 28 Oct 2024 10:09:43 +0100 (CET)
Message-ID: <edafc004-999d-4ace-8f0e-1b8c711423eb@collabora.com>
Date: Mon, 28 Oct 2024 10:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
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

Il 11/10/24 21:21, Javier Carrasco ha scritto:
> Introduce the scoped variant of the loop to automatically release the
> child node when it goes out of scope, which is more robust than the
> non-scoped variant, and accounts for new early exits that could be added
> in the future.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

