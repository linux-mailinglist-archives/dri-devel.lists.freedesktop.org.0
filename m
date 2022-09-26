Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026535E99AC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C903D10E532;
	Mon, 26 Sep 2022 06:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686B810E531
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:38:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l12so6269102ljg.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
 b=ePexRndPURvdCW/6uFFqR/iEiqGsxFN63U0+E7Mw/SDz4ZwwNEHsmVHumFqZeMYCUP
 w8s7D75BCLIzBKqYzi2ogsSYLQfENPA4YBlkAy7xmGIaZVpzOBLJOJBVmSgV8B9AxENp
 4k9tn5vOQllbiqS/XTVubaMGN3+gj9u09UhLCVk0TYFk8T5lw7S/gkcV2EfEw/3L/JMQ
 D1Pt/0hEH58mgxQwVwA1fUt8341UKEQFrik2uQZ70jnH8wajATyMJdZbd8uzdTiFw7/8
 s4sXMk+6hYNL9CHWmFGnedd4ZzjP6bKJB+in83kJvdPYJbbwwdg5MwyBBVmi4j+WhIEb
 IqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
 b=4X94lN4djQvCGzO1k9SXMwVZzXyFZtRX/hrIWU3ZPFqSjHAke3Mtz/MpwDvRYg3bwX
 3p5+8TUqn0eMWkztuKd9PrnfpCTZMe/fiKQS+HOFJghIKPK4iV+V75sm6MGsbrSD3Jbj
 tVMRdTp4k9ss7WZlmatQvyT5t+WP+oaoyaWmB8z6eLV8cAVvqodKmfwbPvGOGkDZbeXx
 gFJML6KLrJjC3UbyLx1gtHfOo9LaQENd/qhs8qDR1gMhrEygU0WuhX2uhr9N4f8S/Crb
 YBDzvUGeX3U8GVj4MNZ1NsvUJgB42be9rZtgJESqKUZ5y4YUks9USMXxnl9KEYDAEg0p
 pmVQ==
X-Gm-Message-State: ACrzQf2OJJY5PFnIhv37zT1izYOcbrlpdrwh2KBBPr5lSz8YSkEXYqAr
 bzL0NpnvC5x2sdLBMCBEvCUo3g==
X-Google-Smtp-Source: AMsMyM7zYhJnhCTUeUDjnpPqlK+tH954E2LgxBK1i8gOU2GZVXuiyg0sE4TRiLJTrdd7ByA6IdiJnQ==
X-Received: by 2002:a05:651c:a04:b0:26c:50df:75ad with SMTP id
 k4-20020a05651c0a0400b0026c50df75admr6942132ljq.416.1664174303703; 
 Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b5-20020ac25625000000b004a050ddc4ecsm1321680lff.125.2022.09.25.23.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Message-ID: <bd99a454-8cee-edb9-bc34-ce0be280bd90@linaro.org>
Date: Mon, 26 Sep 2022 08:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-15-4844816c9808@baylibre.com>
 <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
 <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Guillaume Ranquet <granquet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/09/2022 07:24, Chen-Yu Tsai wrote:
> On Thu, Sep 22, 2022 at 3:20 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>> Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> index 5bb23e97cf33..2c7ecef54986 100644
>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>        - mediatek,mt8183-dpi
>>>        - mediatek,mt8186-dpi
>>>        - mediatek,mt8192-dpi
>>> +      - mediatek,mt8195-dpi
>>>        - mediatek,mt8195-dp-intf
>>
>> Aren't these the same?
> 
> *-dpi are MIPI DPI (as in parallel data with DDR modes) encoders.
> *-dp-intf are Display Port encoder.
> 
> Totally distinguishable. :)
> 
> The hardware blocks seem similar upon cursory comparison of the register
> tables, with the base layout being the same, and sharing registers for
> basic settings such as the display timings.
> 
> The DPI ones have some extra registers, presumably to control the signals
> or output width. The DP one has some registers of its own that only make
> sense for Display Port.

OK.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

