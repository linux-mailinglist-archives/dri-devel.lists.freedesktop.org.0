Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0765B57F2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2278B10E367;
	Mon, 12 Sep 2022 10:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A176410E362
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:12:33 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F2786601FD3;
 Mon, 12 Sep 2022 11:12:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662977552;
 bh=8cFaxVFQUN8rcz0SgV1ILziN/080VIloT1ViIdRANRA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E0wZdAHv/k7SwZ5nem3qLmiY/quR2SBQTV1Y65LT7vmmNhNr5FvR99jhZMuHKbXZI
 cp2ikmumJSHaXQrksk45UMwbSmhPuE5H7uowNak/BbWlqZqmzowYUB7G94eYy9uxok
 9vNBmt0Sy5hdan/HBy0Ks9XctehwWZoyyrikllFlaj2GbPSveI0zbQUmnOpcaqOHGl
 BpeO7gI9v1fbWUfPiHCoGGdiliqUrqcuZFHdxu+awy3ZUxqTAw3zbzFPr0pmoZN/Kt
 xRsVoV1WNDkpu29qwDjlykp9UUYZitFMrUrtBrCVPWw5ggBnESGHIe/YjI5+HQe3gm
 +J6dzF6YZqG9w==
Message-ID: <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
Date: Mon, 12 Sep 2022 12:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 3/9] drm/mediatek: Adjust mtk_drm_gamma_set_common
 parameters
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-4-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Adjust the parameters in mtk_drm_gamma_set_common()
>    - add (struct device *dev) to get lut_diff from gamma's driver data
>    - remove (bool lut_diff) and use false as default value in the function
> 
> Fixes: 051524cbe62d ("FROMGIT: drm/mediatek: Add lut diff flag for new gamma hardware support")

This Fixes tag contains a commit from a downstream kernel, which is useless
fo upstream. Please fix it.

Regards,
Angelo
