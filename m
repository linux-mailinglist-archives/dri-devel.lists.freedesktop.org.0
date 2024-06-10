Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C44901CA4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45B10E341;
	Mon, 10 Jun 2024 08:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lW0ACqbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B958510E341
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718007252;
 bh=J1o7GUOJzCSDHzhvzvHGZsnc3g+z5nolKVnnUTDks00=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lW0ACqbhxTzXDV5cwzEwamHYYJWcHpT2kKhiPxWvzG/+zG0WyPKrb81HgJ/xCJ9lc
 ZWPVNv4ULxyTfRPlBlM2BsMMPRpo2wugYVb5KNJYrhoWaqwAtUWFfYke+KQCDBrmmc
 NnflFzlyqkxw8EwQ2TF8QzoCwAbqRAM5dHXOL3+fRvHNEOTv+JLQe5y14zygZHRH7k
 UrFs+TQnKcj2SjXtT7Sg42aM55bqI52qBs9BZoRPd+D+Ffjbfcvq0E1u50oG4TW/19
 Vs3JgJluo+szSnOV4yCaYFICrJNn7IUo+4y93SoeMBuvXXCxnqZgo77pxgOr0dQdnM
 mChRDO1UKVhTQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 49BC53780575;
 Mon, 10 Jun 2024 08:14:11 +0000 (UTC)
Message-ID: <07a45bb1-4444-4ea3-a650-b42392c6fea9@collabora.com>
Date: Mon, 10 Jun 2024 10:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/16] drm/mediatek: Support more 10bit formats in OVL
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
 <20240606092635.27981-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-8-shawn.sung@mediatek.com>
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
> Support more 10bit formats in OVL.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


