Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291B5E99B1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433310E539;
	Mon, 26 Sep 2022 06:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305210E539
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:40:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u18so9261625lfo.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sXIGFcRCuTgNUsqejS6T5DqVxD8HCiD5K8J1uAPMJIo=;
 b=nwBM67q3EX80XM9XWIW0Ljw7hbiDYynI9pgqLJBALtpOzv4PTW24pbmP9MgP2YhYPX
 aAvR+mSqHjSq4eFnrTUXocOUzEm1E9XswjPn9Iz5Z/VZxaAIOPRGYMkTxCnVwD2g8BSo
 upplLUf5gDwx/GyK8S++6iIT4IO/Xp3cTtnYZ3X5TSqDvATpfyztCyaGHDjt/4hv+w1C
 RL3xS/39XrZ6IJU/l+nVv6VwLjM1FLUacJKQLRLxpRTUZgt5WmVVwlfrNqDibOHa76+p
 zej2WHAhqtvgwoP9zIH5peX2m83EV7zX8jebCQuVaUSgN39THB96KNwBCbvmnCoXoX3w
 gatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sXIGFcRCuTgNUsqejS6T5DqVxD8HCiD5K8J1uAPMJIo=;
 b=okQYdfnqF8xUDrCYy8LyQtyy/XTC1J3rwsEBGFZYW/51lG8n7FobcC1Ex1BWjbhxWH
 GZqELlHr+aEIVLszGncdhmgr3gU0Da58nSiDr5256et3cU4AFlfeL3ToZQL8WUIVdeEG
 TNWtdN1hXJ9JScE6wCRiDBUVutiRvhdm565ye+bjcTEP2LNh9llVjL5rNz42H/CtjSYW
 XuMul/ogj6s5Aws5fnCpHJezXm2ARRTzho9z1AC0gnFTum4EspVB9BZx8bI+0n5hxiS4
 HlLA1ItDjUS/2Lt8MuUXOzO7RVhkBtqosmwILBdGbReyx2hF38onG/Qun0XOH32rR4zR
 iaTQ==
X-Gm-Message-State: ACrzQf2ErS3+3Q019nhry6xrea/60jiLoWcXOBlcddMh7OydeipzLz0k
 IgUhc0MlBBMJFoVmMzvlnVsMmA==
X-Google-Smtp-Source: AMsMyM506Yk1gyxeS7N+5MkEJGRPPEUV9XweJfzI2MiylPEYaq5CwNqHxOALEQB5EioPL4lP54nK7g==
X-Received: by 2002:a05:6512:3b8d:b0:499:b113:865f with SMTP id
 g13-20020a0565123b8d00b00499b113865fmr7856964lfv.505.1664174403481; 
 Sun, 25 Sep 2022 23:40:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c11-20020a056512074b00b0049aa7a56715sm2445120lfs.267.2022.09.25.23.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 23:40:02 -0700 (PDT)
Message-ID: <dfec9514-e105-5083-2d72-625dc05c4a21@linaro.org>
Date: Mon, 26 Sep 2022 08:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20220924080058.20566-1-jason-jh.lin@mediatek.com>
 <20220924080058.20566-2-jason-jh.lin@mediatek.com>
 <6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org>
 <23fd466265eec1effd83de6e8ad4ff64eadf5cae.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <23fd466265eec1effd83de6e8ad4ff64eadf5cae.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/09/2022 03:19, Jason-JH Lin (林睿祥) wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Sun, 2022-09-25 at 09:52 +0200, Krzysztof Kozlowski wrote:
>> On 24/09/2022 10:00, Jason-JH.Lin wrote:
>>> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
>>> pipelines binding to 1 mmsys with the same power domain, the same
>>> clock driver and the same mediatek-drm driver.
>>>
>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>>> to
>>> 2 different power domains, different clock drivers and different
>>> mediatek-drm drivers.
>>>
>>> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
>>> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
>>> Quality)
>>> and they makes VDOSYS0 supports PQ function while they are not
>>> including in VDOSYS1.
>>>
>>> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
>>> component). It makes VDOSYS1 supports the HDR function while it's
>>> not
>>> including in VDOSYS0.
>>>
>>> To summarize0:
>>> Only VDOSYS0 can support PQ adjustment.
>>> Only VDOSYS1 can support HDR adjustment.
>>>
>>> Therefore, we need to separate these two different mmsys hardwares
>>> to
>>> 2 different compatibles for MT8195.
>>>
>>> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
>>> SoC binding")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> ---
>>>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5
>>> ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..4f90ea03c596 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -31,13 +31,16 @@ properties:
>>>                - mediatek,mt8183-mmsys
>>>                - mediatek,mt8186-mmsys
>>>                - mediatek,mt8192-mmsys
>>> -              - mediatek,mt8195-mmsys
>>
>> We keep making circles...
> 
> I didn't find the sample of "deprecated" in the example-schema.yaml,
> so I keep misunderstand what you mean.
> I'm sorry about that...
> 
>>
>> I asked "and why mediatek,mt8195-mmsys is kept as non-deprecated?"
>>
> Yes, it should be deprecated. I shouldn't remove it...
> 
>> and your response is to remove it... Eh, okay, that's fine but now
>> your
>> change causes now warnings in existing DTS. Either you keep old entry
>> as
>> deprecated (just git grep for deprecated, you will find examples how
>> to
>> do it) or fix the DTS.
>>
> Thanks for the advice.
> 
> Now I found an example in other yaml, so I just added the "deprecated"
> tag like this, right?
> 
>  - items:
>           - enum:
>               - mediatek,mt2701-mmsys
>               - mediatek,mt2712-mmsys
>               - mediatek,mt6765-mmsys
>               - mediatek,mt6779-mmsys
>               - mediatek,mt6797-mmsys
>               - mediatek,mt8167-mmsys
>               - mediatek,mt8173-mmsys
>               - mediatek,mt8183-mmsys
>               - mediatek,mt8186-mmsys
>               - mediatek,mt8192-mmsys
>               - mediatek,mt8195-mmsys
>                   deprecated: true

No, you need oneOf. You used git grep, good. Now use second command -
git log -p - to see how it was exactly added...

Best regards,
Krzysztof

