Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D24F909C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BDC10ED95;
	Fri,  8 Apr 2022 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9610ED95
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 08:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3CE601F46C62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649405942;
 bh=n3PZ5EP+atv7EGkUpF8rFTDvYYK90dAfeWT4ALjfgCk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGaSlQ5GwsYXwaRRFXeblbG7SziGG7emykikpIAfxEU0y7PwcVwq+u6+VC78eN7ac
 dvw4nM8YN/wlDXzinoeJexXRkswap/l5Ls4ByFmjq/HeK24G2a+ei3E/QPHNlU+kb0
 FACQyoSJTpUN6/Qwc7zjRsdxlPDWzX/WDlEMy/6m4XewBkGSzAmTCCLqrY3gX6T3hj
 I96FsuASNPhaQ76uG7hfT1gtyOnHu5KrRh3XnPIl3aQoVUBLlIbyAfSs8KB68bB0ZK
 EkXH2Wm3jvEvoVccIPRgGHjU+2jhsf2pcMh5mSC8js3K5Of3XDs8yFPmkJJr5iHzGr
 Z0TDgO0kfr0gA==
Message-ID: <ba1d3b7b-9bcf-9c45-c487-91da767b83f5@collabora.com>
Date: Fri, 8 Apr 2022 10:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220408013950.674477-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408013950.674477-1-nfraprado@collabora.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/04/22 03:39, Nícolas F. R. A. Prado ha scritto:
> The configuration for mt8192 was incorrectly using the output formats
> from mt8173. Since the output formats for mt8192 are instead the same
> ones as for mt8183, which require two bus samples per pixel, the
> pixelclock and DDR edge setting were misconfigured. This made external
> displays unable to show the image.
> 
> Fix the issue by correcting the output format for mt8192 to be the same
> as for mt8183, fixing the usage of external displays for mt8192.
> 
> Fixes: be63f6e8601f ("drm/mediatek: dpi: Add output bus formats to driver data")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Lovely!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
