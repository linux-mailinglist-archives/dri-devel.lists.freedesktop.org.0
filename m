Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A444474EA3B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E806910E348;
	Tue, 11 Jul 2023 09:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D82810E348
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:22:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 72B56660700C;
 Tue, 11 Jul 2023 10:22:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689067358;
 bh=a9oLCnZxtGs0dkV9W5N8Cb0d/8qnym0UvYTivQ6JqIo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c1ZtDu0eFmj+ZavM8x1eGIGQfAIVIDM2FnjpiRdMrlHKaolONcttaDRpkaePIJxvq
 V2skv1yQCnlEhGPXdY0hNeDWO2kTKrPokFFpy64CruRnS9eJoJWSFE1KRS84laTKXQ
 5k84Jntf6bR5lZ9UpTc7WmJKXTcoaVAB1xk80SNW/O6XEkh1J0VhKj3tJpleU2OZuD
 WKChoYKf5Pc8WfIlJzJRQTM0RBuXZSSA+ikWsQiNg3qgl136LnWELV6hzCkvNRbKMN
 r6Gh8Gv22Uj2iZpKitLfzq/XvHAvKuwK56+VBKZOHz9oLqgnnxHjtoiO1MD7w+jss3
 E80P/8snG5xMg==
Message-ID: <5fdba6c8-d15a-126e-29d9-b6c5b33efcce@collabora.com>
Date: Tue, 11 Jul 2023 11:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-phy@lists.infradead.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/07/23 08:13, Dan Carpenter ha scritto:
> Negative -EINVAL was intended instead of positive EINVAL.
> 
> Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


