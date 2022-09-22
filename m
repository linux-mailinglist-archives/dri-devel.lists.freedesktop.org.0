Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28395E62C8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EC810EB01;
	Thu, 22 Sep 2022 12:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F1010E35E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:51:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a14so10855754ljj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
 b=bEQc5o4c96kL003lNdFFNF/PheTKYPzGOx1XlLuWx4uUt3ZZ8u82nZSviwPUHfH2xv
 bUDvPw5aOQbeDKQmaq1CoRgZsOnIg2YGfJh8cvDV5F9+JLKSUyn50zDSIBxJOcnrj4PR
 A/jflBtwfF7dKCfnIUVH8sg+arNoqIgkz9k9j9ZFaFWktQEtF1ZrBOG6ExeV2+xa5sCd
 gIaN+jPceaw/AtbWvWGSXMYZ/VYa/BVnHTn4+MNDa2/tr3mx3BIFfKkZZCFjQpef8XiE
 zuMwWdRrzBII8cLpO+PWCCMW0r7uAoqveKC5p2LZphYcvpAG3bcSeCk7PVaftA5tgi0M
 8RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
 b=4MB6ZnatMbZ48CL6E8r0VkiUVwbcktFavXL3lBAih2O7LOeMM5u1aGyI4P0G05KNqK
 MB6OxcfKwMlAS1qV6gUS46En6vJCstIsqOlCwex1CRmai2Yn+Blg3uI+EA5dxAmRrjH/
 vVBAndSDaXNlAlScL1yc6B0yeHJebE0eYI7h4VbXIO0NPmVFFeXvavFx7jQJJ0tcCedX
 2t33azibguMUZHcoklensTmwn03gYDGiO0nn46ImWhhw+F81YUH0EZcxip3DDbQIn23j
 GCc789WsDSvFd9yZufMdz55cDY4FtIcq3U12WEkj7HTE1ZZXLwQJGIV5SkfgEltT+vkd
 9ESg==
X-Gm-Message-State: ACrzQf3Zh0WJtgy4efDmatkI2pAKeYi129Y+jMwWS33Qw4UviXTNmuZO
 7Vm0Ftrgs5JYP1cXbp4sqDUovYKw8dWoig==
X-Google-Smtp-Source: AMsMyM7SDptjdpkW7tuuttAy0kYzK4MBmIe60uRZtol4i0HW5ltX1B+Cjzu/BNFNwE3TBkr+rbuBQA==
X-Received: by 2002:a2e:1458:0:b0:26c:3b83:e039 with SMTP id
 24-20020a2e1458000000b0026c3b83e039mr1098450lju.484.1663851062438; 
 Thu, 22 Sep 2022 05:51:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v12-20020ac258ec000000b0049496608d58sm925362lfo.155.2022.09.22.05.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:51:01 -0700 (PDT)
Message-ID: <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
Date: Thu, 22 Sep 2022 14:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
 <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 14:45, Guillaume Ranquet wrote:
> On Thu, 22 Sep 2022 09:11, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 19/09/2022 18:55, Guillaume Ranquet wrote:
>>> From: Pablo Sun <pablo.sun@mediatek.com>
>>>
>>> Expand dt-bindings slot for VDOSYS1 of MT8195.
>>> This clock is required by the DPI1 hardware
>>> and is a downstream of the HDMI pixel clock.
>>>
>>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>>
>>
>> Looks like broken patch.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Bo-Chen and Krzysztof,
> I've sent the patches using the rather new b4 prep/send commands.
> 
> Though it produces valid patches, it's using `git show --format=email`
> to produce the patches, which lacks a diffstat.
> 
> My understanding is that the diffstat is considered to be comments and thus
> are not necessary to produce a valid patch.
> 
> I've reported the issue on the tools mailing list [1], I'm looking at providing
> a fix.
> 
> I'll be extra careful at the patch format for V2.

Thanks for explanation! Probably your patches are perfectly fine and
should apply, although I must admit diffstat is often useful.

Best regards,
Krzysztof

