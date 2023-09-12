Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB879CC27
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919E10E3D1;
	Tue, 12 Sep 2023 09:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BEE10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:43:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C9A6A66072F2;
 Tue, 12 Sep 2023 10:43:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694511816;
 bh=BjsOvrqInqVTjTyjnWshAGYuXktDNGI1mGGW3h4/K24=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I2cA2aWMBO0+HKUlBcK8gnwEFtChw4SvongF+zkCIoZ2OwYV7cUMOhixRBYE9PGil
 u73SA3sioD+5MMLlz3yTZDiaIsAcYcNYbYhF6EywkJv51esPU1Fsq6VJeFfzPa6i1Q
 4D50bM6PVfB09S+knaMI5b+cpC3U9W44uywrUoTou8Y8Z8Rm87jddEduM8ciFNqdaO
 BxjSi31T55SUAUjinc4vSbt2yo5NnwrgT5j+LrzC1BnuZrqr5OPwSCVuYtqXKOhCde
 ilSqgu4y/bf7LpgQG8DUHcR4L/0UVyymcyLBzFjhXDPzBbjlC1ovNpQziBQFKL95mm
 1Wwkp5K5QSxLg==
Message-ID: <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
Date: Tue, 12 Sep 2023 11:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
 <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/09/23 11:37, Chen-Yu Tsai ha scritto:
> On Tue, Sep 12, 2023 at 5:00 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 12/09/23 09:57, Moudy Ho ha scritto:
>>> Changes since v4:
>>> - Rebase on v6.6-rc1
>>> - Remove any unnecessary DTS settings.
>>> - Adjust the usage of MOD and clock in blending components.
>>>
>>> Changes since v3:
>>> - Depend on :
>>>     [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
>>> - Suggested by Krzysztof, integrating all newly added bindings for
>>>     the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
>>> - Revise MDP3 nodes with generic names.
>>>
>>> Changes since v2:
>>> - Depend on :
>>>     [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>>>     [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
>>> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
>>> - Add parallel paths feature.
>>> - Add blended components settings.
>>>
>>> Changes since v1:
>>> - Depend on :
>>>     [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>>>     [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
>>> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
>>>
>>> Hello,
>>>
>>> This patch is used to add support for MDP3 on the MT8195 platform that
>>> contains more picture quality components, and can arrange more pipelines
>>> through two sets of MMSYS and MUTEX respectively.
>>>
>>> Moudy Ho (14):
>>>     arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>>>     arm64: dts: mediatek: mt8195: add MDP3 nodes
>>
>> Please send the DTS patches separately, those go through a different maintainer.
> 
> I thought most people prefer the _full_ view in a patchset?
> 

Yeah but those going through a different maintainer makes it more straightforward
to pick; besides, essentially, you can also get a full view with dt-bindings
patches instead of devicetrees, as the latter are "constructed from" bindings
anyway.

Moreover, it would be definitely nice to add a link to the devicetree series
in the cover letter of this series, so that people *do* get a full overview
by checking both series :-)

Cheers!

>> P.S.: The dt-bindings patch can be sent inside of this series, please do that.
>>
>> Thanks!
>> Angelo
>>
>>

