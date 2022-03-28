Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD04E8FF7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FB910E18B;
	Mon, 28 Mar 2022 08:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACBD10E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 099651F430ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648455639;
 bh=HQeSR6lP1YVK1RO4bOxyH8L1tAiJpL08/BP+E0788Es=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PchX6yCNagZcmv/cIZIJ4xoFUc5KY5QbCuiRR37jrEqmzRqggK6rBEy4U6IALH/Cg
 nQg75bZpIBDhgWjVhrP+dt09LT6d6Y+7F5X7tlYzN02PalZ9AFWx3lHqu4f6M5QbBT
 qClRr8DTC6Se8DsJ7eAj7SamzrDrebtzkYD+T6kHkqTosplCkMTRDkFjsKCpAdbmb8
 dinN0voPiVoekx70EL0nQMLnt8k70i3vxr1GMYoTN4yLlavuNKnyxZX8tmR8HtYVBW
 2pgMlThJOvOVn7YLTrd6X0SxA/B9wz51KXngl1+M4b8KPkM/UHAXRXPt/DMyptTYRQ
 MhQGu8sTxltIg==
Message-ID: <9aade139-2e69-a061-de69-ab60ccc666bf@collabora.com>
Date: Mon, 28 Mar 2022 10:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 12/22] drm/mediatek: dpi: move swap_shift to SoC config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-13-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-13-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
> Add flexibility by moving the swap shift value to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
