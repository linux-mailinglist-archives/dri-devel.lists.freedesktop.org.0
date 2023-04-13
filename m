Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EE6E0A38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC6D10E134;
	Thu, 13 Apr 2023 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFD910E134
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:28:55 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 461686603207;
 Thu, 13 Apr 2023 10:28:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681378133;
 bh=XjK0zXGcRUwWwMF6tZnTtwrjb64IJRzNjt7p/8KBhjs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d6UgCefhED/N6R8YjSiNAxuQU77pHTuH671k0sortzz+h8HWsWRqZ+jYQSW7fvRuT
 eyERdIo/mVGeDewj1B8XzdivfyeIBoj4BbuwUO+g6g4nueknODvGQJMPlI4yxePiu7
 NuOwzs1nxxvQLZoT6Gz6QqlumXZ/LPPtoRalL/PNZBRzWi21FDr1ERMSzf5/YdQ0ao
 SuCRTmMDLW4w6pVFA5oYs7uzGfTMJDl8OlQ+a74HPRNcFs/xWKKxq7XUUUEEK9E3RM
 B6DPGx+OyIBsldxVd+4s/2jbWuEmIGhyaXfSXOHhbMSK51XO+1b02CwJ3aQWBP1d/D
 z/bAWlEu4eshg==
Message-ID: <4a016428-be44-27e3-5bc2-dc517922fa15@collabora.com>
Date: Thu, 13 Apr 2023 11:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <168133318912.3190428.16120880490622098945.robh@kernel.org>
 <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 phone-devel@vger.kernel.org, xinlei.lee@mediatek.com, kishon@kernel.org,
 kernel@collabora.com, jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/04/23 10:52, Matthias Brugger ha scritto:
> 
> 
> On 12/04/2023 23:03, Rob Herring wrote:
>>
>> On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>> block: this is the same as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the
>> following warnings. Consider if they are expected or the schema is
>> incorrect. These may not be new warnings.
>>
> 
> These are not new warnings. I think we should address them in a different patch. In 
> my opinion it shouldn't block this patch. In the end it only add as compatible here.
> 

I agree. These warnings should not block this patch, as they're totally unrelated
to it.

Regards,
Angelo

