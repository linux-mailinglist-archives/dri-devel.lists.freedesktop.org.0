Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E807A4539
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C76E10E083;
	Mon, 18 Sep 2023 08:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E4310E083
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:56:59 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 38C6D6607038;
 Mon, 18 Sep 2023 09:56:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695027417;
 bh=9BQdC/JHkHcdOqMH85ztpqyqjqMwin/967MJsdBXVpk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GjhmQ/oT89hKNZL51q4P1v5TzHe7qLIabTL366gJs7IMO6eF2+ppo1lUDnicxG6d7
 J6sQwSYRh0PCvqBkt1RogueXr5PlpLz+dLtt+HoUxat03wS5dmtM+3Ji4su8by/MTp
 POUDWq/bUCfggy4rFiCMF1pC5KAyGpaRCTS6RnnWmzA/FFQ6CJiWMW2NNs16prEHXR
 HM0f/K6PlMtgU2HEwu+AFsZZZAjsYzfc6cWGhE8z+tEKV1MrHa1y81LmAGoo2++ZkZ
 /yICq5aXagG4iGLjulIHPlbWhxfn63RxDn2g52Qs+blFm8OHvdI9ktc3s1rD+8amGB
 m7yC+84dq4/mA==
Message-ID: <6e37b93f-7806-8d50-d169-12171a2b29ae@collabora.com>
Date: Mon, 18 Sep 2023 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] drm/mediatek: Add missing plane settings when async
 update
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20230918070028.17915-1-shawn.sung@mediatek.com>
 <20230918070028.17915-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918070028.17915-2-shawn.sung@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/09/23 09:00, Hsiao Chien Sung ha scritto:
> Fix an issue that plane coordinate was not saved when
> calling async update.
> 
> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


