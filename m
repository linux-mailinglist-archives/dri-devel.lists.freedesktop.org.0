Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839186427D8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 12:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7096910E06F;
	Mon,  5 Dec 2022 11:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC4110E06F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 11:52:59 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3DBF8660036C;
 Mon,  5 Dec 2022 11:52:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670241177;
 bh=S/XvQmPdf7xMwJPdBoXrFet0+92expZQ8DEbjSPs9BE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=LQX47Qe0z7znEVhDoNSSdUh7pP3jMhJr8d35xJi2Xgs2Fabwnz5f9Z96mZxbEaM6T
 hPxZ2gsDs2bFxn1rloMJ7hWJ8qwjBWHe6KPKXIaewVeLSZYBw+sPG1f8OY8joB5KcR
 WKQQyA2K5Dn5Z+/H9SB9IGQjHRjDIvZYIkZyhgBZZeq5SKRfIoa8igNYvw/knHvpnr
 rwN83h15Xh+tcMkIjfJ92lX2kFRpVBotJc5ngmVkBCeWGvqMyRB5oFRfJUeWoBrEfm
 NPTE8LjIJW/fmtedA8lZce4N03YZgpcH2mzaAvPNegkM3HQu1NTkjyfjv+oab77wQJ
 kB3cipqSoiB+A==
Message-ID: <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
Date: Mon, 5 Dec 2022 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, seanpaul@chromium.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221205095115.2905090-1-ruanjinjie@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205095115.2905090-1-ruanjinjie@huawei.com>
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

Il 05/12/22 10:51, ruanjinjie ha scritto:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> Fixes: 31c5558dae05 ("drm/mediatek: Refactor plane init")
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

