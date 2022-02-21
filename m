Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998514BDA35
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC56310E476;
	Mon, 21 Feb 2022 14:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E97810E66A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 944931F437B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453827;
 bh=91cTuA3z5y+Z5jMthJlpUAzmj/zwaz1zdpB+AZ6dNNM=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=PfKzwcTBOutMCbgTPv4LP6kwxiX1XEl07xN5aFfttfSyi1hGOcC3IcVZRs4g2nkO7
 mxCVKbjmMkaTMdvFgAM4mwWNROVRGv8khhBoyzuVQ1Yo92StwEKeD+9nYMvvK737L/
 7QaL0es5xbusioUShM13dGYyqVJqz8LZkBk1eGH5dAzp7i5fHbCQhuvuSjCNf/TaoK
 qIl1aZXSSHSl6YXYxvy4cDqXMrUhaCCzcBIGdbWMv1uqc6Of32yCUv8QmJbLtL9/Sz
 awzwtR89svK3u9DowDOdFCJFeohBzUpUpyEKvwxWPsVUSENfCGqgacP//17KRlUZ1Y
 WJ60mSufzGLjA==
Message-ID: <2518891f-7d5c-f57b-0837-10f0e55f72cb@collabora.com>
Date: Mon, 21 Feb 2022 15:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 05/19] drm/mediatek: dpi: move dpi limits to board
 config
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-6-granquet@baylibre.com>
Content-Language: en-US
In-Reply-To: <20220218145437.18563-6-granquet@baylibre.com>
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
> Add flexibility by moving the dpi limits to the board config

s/board/SoC/g

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

