Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994636A1CC5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 14:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7C210E247;
	Fri, 24 Feb 2023 13:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA2210E247
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 13:09:46 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F3AFB6602FB6;
 Fri, 24 Feb 2023 13:09:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677244184;
 bh=eNRVBTrYla/JuAHqdu3DfZ00wg57f7iLgICRaNb9Zh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QtxSPp6n7A2HoEqRKa/hKmrhjzgs7KgoDfuIwGGbuWri+axuqr+i1FYKXHNeBy2gl
 FO9/Oeb7LOyBn2GQkGfbtutzbjbuMlW3FeZ0VqzjOtrPoX2LNuT8Zuc7HQYOZKzRFo
 9rVeinBG3lZ7VLJGtFVBboXPSge2Gkr0n6l7ZeQ+rKlNDogi399JN34fAUlkM6zjNB
 OumQLNy899WgRda8wehFeyZViqMNxLVtA/36YznDKneBjvxLF6TTWwmUmukNOIwrP/
 zPbaMxHPgD76B3a7ancx1R9yhwnw72SENmz/53qEXjRcASRmozUfxW5sFleN4/B4mX
 pREtAMGa8ia/A==
Message-ID: <9e12c33a-998e-7042-27b7-320be99940ea@collabora.com>
Date: Fri, 24 Feb 2023 14:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
 <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/02/23 11:09, Chen-Yu Tsai ha scritto:
> On Fri, Feb 24, 2023 at 6:08 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> In preparation for adding new bindings for new MediaTek SoCs, split out
>>> the power-domain-names and power-domainsvariation from the `else` in
> 
>                                              ^ missing space
> 
> Once fixed,

I think you even mentioned that already, ugh. Will fix.

> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>>> the current mediatek,mt8183-mali conditional.
>>>
>>> The sram-supply part is left in place to be disallowed for anything
>>> that is not compatible with "mediatek,mt8183-mali" as this regulator
>>> is MediaTek-specific and it is, and will ever be, used only for this
>>> specific string due to the addition of the mediatek-regulator-coupler
>>> driver.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

