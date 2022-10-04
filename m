Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F05F426E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 13:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59D10E57E;
	Tue,  4 Oct 2022 11:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FD310E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 11:55:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g1so20745288lfu.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=AVHgfeK+0yXNwYMJqLB3RuEuq3zMmGUnN/V4RFLasQ8=;
 b=HCraqwA4dmNVerhXpmAuHLH4r2VSVcfXCEXH9CybnppQCmsY4LWHa0k0aB34ps+YJh
 D0FCBE7aw2MjUV0uur4XGgPoQ+QSzmM9HHhfdqDSG1s+xvs4O3W5qunm3BtDzZJSuY0u
 atHJpYrSENjx/q+LeBwFD/q3EUd4D6MtToFTnDGC56yykmwQKeCUxnfhgeJSRsusknmk
 5QTgbwRmJsAEpECIgtW2tn0jLsRksRyDmpr40kHA82vkMhu4WLJVFFVVO3Ek9nYL7w0v
 jv4ujvhJiLhHm6GueGGupHX7HtNZhEaqeHSwTAdwcPOlX/QIGWXNIJtMftYwAj5M+A49
 V8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=AVHgfeK+0yXNwYMJqLB3RuEuq3zMmGUnN/V4RFLasQ8=;
 b=ndO8ERNtXQeUOf9nS6bylG6lO3689zQE4NWzS6B4YMuuxOrUPDAQW35snnkZqa/nnY
 2Y5QbmApE/j7x0WmxWamG9UBKyF/ejIUWwX8ldZMCXofs4fiVE0z4HA/KK/IQJA7OyFF
 kxfIHsJUhRteBAf4LHP7PEgrqh06dUShnLHLna5HvriGJWrr9fa6lbwxasVe3rmuATIt
 MpzlZe+CJpGFLN42Td4+m1oYLyF8oHYQMLvcf3Ez+tDpw96lxxwC8B6rBfDq831z6kFb
 Ml0XQylff94YosE/umw9ndeJZoOcg1VXAtpDM6+yNV9bOcqRP4cTE/6f9M5jCz4djKvc
 IjEA==
X-Gm-Message-State: ACrzQf3VOLmZsiTC5a4L8MjooUuZu8eSuR+qJt147K02WKKJMy3tWnbl
 2VcAWlIMuH6x8+EXgPwpO+SflLUJ0M3mf8wwQB48wg==
X-Google-Smtp-Source: AMsMyM7T5HmFHtYzBToQIDw740pyxsyZD3CK3phoCdY5v6/uoVZEM5zyMYJH17SMmdaDtr3rE0uxWHutyCOz+oUYcFU=
X-Received: by 2002:ac2:44b6:0:b0:4a2:5084:6163 with SMTP id
 c22-20020ac244b6000000b004a250846163mr1242968lfm.446.1664884510269; Tue, 04
 Oct 2022 04:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Oct 2022 04:55:07 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
 <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
 <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
 <CABnWg9sJFBAXi1bu_yHDppFOmg=H=G7QTn9Bzqkr-t7qm5vUFw@mail.gmail.com>
 <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
In-Reply-To: <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
MIME-Version: 1.0
Date: Tue, 4 Oct 2022 04:55:07 -0700
Message-ID: <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 04 Oct 2022 12:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 03/10/2022 17:29, Guillaume Ranquet wrote:
>> On Tue, 27 Sep 2022 16:28, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 27/09/2022 15:04, Guillaume Ranquet wrote:
>>>> On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>>>>> Add dpi support to enable the HDMI path.
>>>>>>
>>>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> index 72049a530ae1..27f029ca760b 100644
>>>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>>>>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>>>>  	  .data = (void *)MTK_DPI },
>>>>>>  	{ .compatible = "mediatek,mt8192-dpi",
>>>>>>  	  .data = (void *)MTK_DPI },
>>>>>> +	{ .compatible = "mediatek,mt8195-dpi",
>>>>>> +	  .data = (void *)MTK_DPI },
>>>>>
>>>>> It's compatible with the others. You don't need more compatibles.
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> It's a bit confusing, because this compatible is used in both
>>>> mtk_drm_drv.c and in mtk_dpi.c
>>>>
>>>> Albeit it's entirely the same thing regarding the mtk_drm_drv module,
>>>> it's pretty different
>>>> regarding the mtk_dpi module.
>>>
>>> Sure, but this does not explain why do you need these entries here in
>>> mtk_drm_drv.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>>
>> Sorry for the late answer.
>> The mtk_drm_drv is the component master of the full mediatek drm stack.
>>
>> it "binds" all of the crtc/dpi/ovl/mutex/merge... components of the stack.
>>
>> That mtk_ddp_comp_dt_ids array is iterated over to find all of the components
>> from the device tree.
>
>No. You said what the code is doing. I think I understand this. You
>still do not need more compatibles. Your sentence did not clarify it
>because it did not answer at all to question "why". Why do you need it?
>
>Sorry, the change looks not correct.
>
>Best regards,
>Krzysztof
>

I need a new compatible to adress the specifics of mt8195 in the mtk_dpi driver,
the change is in this series with:
[PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver [1]

I then need to add that compatible to the "list" here in mtk_drm_drv.
I don't see a way around this unless I rewrite the way mtk_drm_drv works?

Maybe if I declare a new compatible that is generic to all mediatek
dpi variants?
and have all the dts specify the node with both the generic dpi and
the specific compatible?

dpi@xxx {
	compatible = "mediatek,dpi", "mediatek,mt8195-dpi";
	...
}

Then I can "collapse" all the dpi related nodes in mtk_drm_drv under
"mediatek,dpi" ?

I guess would have to do the change for all other components that are needed in
mtk_drm_drv (mmsys, aal, ccor, color, dither, dsc, gamma, mutex...).

That's the only trivial way I can think of implementing this with the
current status
of the mtk_drm stack.

Do you have any other ideas in mind?

Thx,
Guillaume.

[1] : https://lore.kernel.org/all/20220919-v1-16-4844816c9808@baylibre.com/
