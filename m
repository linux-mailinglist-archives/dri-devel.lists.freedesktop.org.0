Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A176667F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BBF10E687;
	Fri, 28 Jul 2023 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7804410E687
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:11:09 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF5C3660704F;
 Fri, 28 Jul 2023 09:11:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690531867;
 bh=vCwUzlqOQGnNY9fGXomLGaxMGGyn0nTi6KpRvQZbsfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K7hVcO8Oeapz0cviNUSNSl24JJFW3497w7NWQsDmgOOWg+mfCSAeRiao3ndHFmNLB
 uF0MzRhYqtapZnPT5MQDaMOg89Ul/j1VfCA4ABKVpSfJtTnmbn8s9UCjb9qVPUjPsP
 rZ1GYkthazIVXwZkicAzMeR2YlC3IfKrKO+de4igI6/bt3K+1FwBLyhSGxOYXwpWX9
 z4arbaKCBqHrhsnqRGiwcTFzmUMYaX/YO1uU6LhQ0zQ7LLSdWWo+gB+FnvYrvMbE8H
 TuOgLdfPhTzE4sBViPG1nos5UM1suh1PAhaFse0zNLM1DpRmBQzkG02DK0Puv/Ujr6
 GbXM3zzwC/DZA==
Message-ID: <fd1cb69e-f942-581a-48e8-4fd160ab1b64@collabora.com>
Date: Fri, 28 Jul 2023 10:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 1/4] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-2-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-2-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> Add missing mmsys_dev_num to mt8188 vdosys0 driver data.
> 
> Fixes: 54b48080278a ("drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


