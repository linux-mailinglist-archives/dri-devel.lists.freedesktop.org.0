Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8055531B0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714B10E565;
	Tue, 21 Jun 2022 12:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614510E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:11:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EAB166017A0;
 Tue, 21 Jun 2022 13:11:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655813511;
 bh=3DNZncrYFTRRbUO04o6Ge6N5kK8kJIUMsdhLMMKQi+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lafu2kFH4eYbRD042lfKr6WjPY9d7n5gsArkZVhHroikIBxBjeglJNt3unTNUTWDd
 ocncTNUaP7weV5RCq7rWmSBlOw9uSw7Sdz8PHpsnfgUJMSPZPNfZtoCwV7ttbCAMQv
 R3lVliXvnCZvdStXdTxpVS5cuBZYbHAFOE2GITuwOwMfWDsjIgnNC+5KQxER1vWKDm
 nn9j1+K7Qc+sG4KyKy1fu4go62OMLWEbL7kH/Eybs5ZK57J5i5UwOj/K57OlRS7Hwg
 +gIVxd7ZQPzcOx+Icd6RC9e4uEua/Z6+f7WJHG+48AtPmK96Nj6CsQ/X++ikufnylO
 OfL/AfdBi4XQA==
Message-ID: <f590a525-2ae8-ef78-6c47-dce91e4e7f7e@collabora.com>
Date: Tue, 21 Jun 2022 14:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 02/14] drm/mediatek: dpi: Add kernel document for
 struct mtk_dpi_conf
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-3-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> This driver will support dp_intf and there are many configs between dpi
> and dp_intf. Therefore, we will add many configs in "struct mtk_dpi_conf".
> To let this structure more readable, we add this kernel doc.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

