Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1675690323
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731910E978;
	Thu,  9 Feb 2023 09:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988410E978
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:17:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EB13C66020BC;
 Thu,  9 Feb 2023 09:17:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675934255;
 bh=SmEEed0/w9t+DOmwxx6nn0/cBAy3WOhaxgIaTq2QUGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RjRMLHa9DQyYjgEJTdj9y2UKpNYXrDxiwe0Nsdyqun3ERbtc+aEJkgAQrPsm/oiuq
 ff+COemd4QoHbUOzOdB2T4GWEkBs5at3KockNuCnyG7qYWjJXHtvSbmJeFarwfexau
 RL1xhgtKz7si1kw1MXiX2sUkxsm8OgnDzSVvSFNwKWHUwmFhCvQWVU3rpLOqfu1rR2
 3wiN5CNeKT5UmsRGM1akdWK6Cp3FzG1pb1wo2mlzZKPQFfmDnAJ+gxW2fKpV1kUZ9g
 mktesPGKIGisx6N9AhLM6+Awhv++RLIDt66UoAi18X+mrj/tz7Olm10i1J7Pih4iMi
 IxM4FBKVFXCKg==
Message-ID: <4ca94d3d-40e3-45c7-8f75-b8c09db8e20d@collabora.com>
Date: Thu, 9 Feb 2023 10:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/02/23 09:33, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> MediaTek MT8192 (and similar) needs five power domains for the
>> Mali GPU and no sram-supply: change the binding to allow so.
>>
> 
> mt8192 compatible was already added, so this should have:
> 
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> 

Yeah, agreed.


