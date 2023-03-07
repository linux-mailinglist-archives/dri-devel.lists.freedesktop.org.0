Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A36ADCAD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EC110E40A;
	Tue,  7 Mar 2023 10:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613F510E40A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:58:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EDB346602081;
 Tue,  7 Mar 2023 10:58:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678186731;
 bh=Ck1cmr3V4MIdHWHjn15OPkA+GXk0Ufq03PURMw4YhVU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ev4yYdeFaLYFHUAJbWaGT+Z2UhHzNzWsXbWDGif2MYRnkCc1F+5p5xATTyov62D1Q
 eF4l8k+ZMIu6MSUP6OihpfAinKOD7BkMRAVvKhBTryn6cKxHU7nWcnTz+3YcqgbG1F
 96pA8Ogn7oh82qBRmR6w5ZKiNODdSj0+flTb1Rtvg3wwc+LMB0UE3OSrjEuZ6hVy0l
 QP0Nk0JjLqxrzgTgNHuQbMp5CmtOHCIwwlvizAQs6/jpF/O8E8B154JcwdJ9GbLXSG
 yHbWSXvNRaWEliVnorx6qoU4dw8oT/wy1hFPCKPcqUNdt59388t0+B4pvp45OEdWgW
 xfdKGeN+kvPUQ==
Message-ID: <a8116598-f4ca-5bc3-5c9c-c96d9e1c9836@collabora.com>
Date: Tue, 7 Mar 2023 11:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
 <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
 <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/03/23 11:50, Alexandre Mergnat ha scritto:
> Hi Angelo
> 
> Le mar. 7 mars 2023 à 11:17, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a écrit :
>>
>> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
>>> The item which have the mediatek,mt8192-disp-ccorr as const compatible
>>> already exist above. Merge all compatibles which have the same fallback
>>> under the same item.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
>> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)
> 
> This is managed by the B4 tools.
> Also, I know this is an unsolved topic in the community, but I agree
> with people thinking the last trailer must be the guy in charge of the
> commit.

I was told so multiple times, hence my reply.

I personally do not care much where the tags are put, as long as they are
consistently put in a specific order; if I had strong opinions, I wouldn't
have given you a R-b tag preventively... so... whatever! :-)

Angelo
