Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8247EE19
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 10:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7B010E3EE;
	Fri, 24 Dec 2021 09:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB610E3EE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 09:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0FB081F40AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640339705;
 bh=g/qrKxbq81374OPNyBlN5b0Uw2S7uiZ13C5P82NahIA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XD9uQAp0iU8aU0GqQ/lNnkmvJNxU383e2Yc/NoWpqgEgWtz7InHOogu4bzmkWBmeE
 Zv0AUV3njiViMoqEIJxm7Yi2TDvE5vn2s0jMlZ21Nv8iRQcjvZALBP+DljqbrEs7jc
 /BtqdCo8dWLYheyk9rw6E3xMnUh0OKATLitRDINxJnvomKWzBQa+GXfO5lPEa7Juz7
 3eahIa7UqFFd1PMGGRU5x0IHymST1gnfE+ZAhfwxk0nxZ40ZG11/hoQ45Wxn5Ck2id
 F53JT34LitY7UVJVR3z7hf1qnp54N7/adwr1LBN8WjXLLePm8iKVPaAaxR4oFqehSK
 WnU9EONoPKT9w==
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
To: Miaoqian Lin <linmq006@gmail.com>
References: <20211224082103.7658-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <badadf88-f912-9794-774f-ec344f2303c0@collabora.com>
Date: Fri, 24 Dec 2021 10:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/12/21 09:21, Miaoqian Lin ha scritto:
> The of_device_get_match_data() function may return NULL.
> Add check to prevent potential null dereference.
> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
