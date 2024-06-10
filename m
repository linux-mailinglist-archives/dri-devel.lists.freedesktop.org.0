Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE92901CA9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB6F10E35C;
	Mon, 10 Jun 2024 08:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zcAW5ht/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2510E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718007275;
 bh=+iTjLS/qEuBXTSOPVFJFbWlAw9kHxOfyLrRcyOVzexM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zcAW5ht/EX2VhMVYZ37MiuPYen7/FSgG3ULfK5eQtYSUOE9l84TMjXaf7lCdj+8fU
 ZW43FCuZKKTH0jXn2MfyJGISHr4BALL6OuP/JHhBl6f6yNQBSfLL8VfESa/yzv6vJ3
 65H9OVItuOMNXD6kVgM3NSdRRU+IkZaB3n0LT4BdCLBEfcAcbMlpMn2b4DQzWENNOn
 0Rzs7B0vzJ4zn2baI4/WVpDxkDnY42kf+SEgGbt2O995TEhqidD38WuoDFn5YyoxM7
 38NoZa6gCdaCyF3QWSxpqHhnjhG1HaAXVfuFRqreE5BUQXlHxomfNoOZ/mtVeFefoX
 jz5q8j+SVMMWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 377F93780575;
 Mon, 10 Jun 2024 08:14:34 +0000 (UTC)
Message-ID: <e2dc83e5-041b-4c1b-bb0d-c8b0ee9d9c27@collabora.com>
Date: Mon, 10 Jun 2024 10:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/16] drm/mediatek: Support RGBA8888 and RGBX8888 in
 OVL on MT8195
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 Fei Shao <fshao@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-9-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-9-shawn.sung@mediatek.com>
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

Il 06/06/24 11:26, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support RGBA8888 and RGBX8888 formats in OVL on MT8195.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


