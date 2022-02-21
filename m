Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F414BDA3B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637A10E4C3;
	Mon, 21 Feb 2022 14:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6410E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:31:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 191C71F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453905;
 bh=0SdpPEauXNzY5/p2lCtGwuIBpqYbTUZXIlAfLEn2H20=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dwhAGcIrYwHLj0j0xu6MvCu30Tnyt3JYge5EP4xZoyrn6izgiia8wQrpnA+m5Jc8I
 kPg/yirq1lvyOhJkalksEhZHi3il/1BZ/nwdD15pSLRn7ZPBYAODhd5xwE31AoHyKJ
 sePObvbqtuuc/PUVfVsbUpifKz+wbaHl11CvVNfJ/rtfBU16adDpDxjSBcfHLLWRoX
 NaFMfFtPckk3WZAk6d8EncAyVvHG6Pttms1rk89qvYsTCBfEo/1gr5BHD+zvUxg7Bk
 eBoWg9Ja3Zf6W4/KN7slrYi9FGdBsmnrefigJCgWgtcdK1FykWXsWgExfQFdbKLqHM
 ++rFpHTPe4nlg==
Message-ID: <609deedf-df56-ee9e-42a8-1ccc178de074@collabora.com>
Date: Mon, 21 Feb 2022 15:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to
 board config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-13-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-13-granquet@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the csc_enable bit to board config
> 

s/board/SoC/g

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---

