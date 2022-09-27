Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A75EC565
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 16:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF3410E955;
	Tue, 27 Sep 2022 14:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CBC10E949
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 14:03:13 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 3so9522727pga.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=wh+C9NAf7fyhTRzPTh+MKYKYRuDErBnhgOgiBqVy3dc=;
 b=WFviH4EqUR6kYjQp6x+cQUhPYii3lQYYZmfJlDXU5vgrdYVW5TvMAnjzuqH4hlWZ9R
 6MSorDUp5CAGAwGkDsbgqIo6h8J+x/B5EcVeW4mUYMkolFq2i49kRDnlyUoV6JoZXkVN
 RwQJb9tLucy2NO4OeirzxMQrjG5gHDPDQMq5hVuxIgNpfPFiAcU3PdOmGpIpuYGtmgjQ
 A3hH67P+p4d6WmHJ296e8RxVT/0YRNYQv8A1oEo5ebznQjhhtJytGmT6N2OjWeJjbpGH
 E6Mf8h1B/KVp2sRO5vAlBoS1nbXwNRZ2JmuFfccGMGCFtAxJQKi+q9xgLbpu6ZXd9Koc
 KBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wh+C9NAf7fyhTRzPTh+MKYKYRuDErBnhgOgiBqVy3dc=;
 b=Z4mXgT+QUH3ztma/UgSU/jxNNeSBPuqToc6/K08v22tsWsvgpZE2zXQ1z8Ch8CO6O+
 TsuupylV+zN++Ydmm2KqujzPAtoenNr7c15Vfcg0mAio4awCiesifT1r4uK5vuItLKyU
 qbkubQkC4H+NbFourwL8lbqiG2ca57kObTAo5eoqtrf7jO0atDEYxyBfOCKqtJE8qka0
 T8a/bdA3zpzjRpQKkiAZXNDssnkIIPuLtpOVvpvuDghUF05s1nUwdzTwpymNn8MW91T7
 HTlRc9f8KIZasz64NfKZRPpELbscaZLXgZEqyk/9xgb+rL9JjSy0auaL4Gb1s3twWuY/
 nGdA==
X-Gm-Message-State: ACrzQf0+HmLOKOQC+6zt69pGNVippj3mdyOb+wdw1v2Wg3IhALiJ/wB7
 HTMvYcGJbQVBiLbcNNrlyAgcOzvdH4c47W+hnPUVcw==
X-Google-Smtp-Source: AMsMyM4AhyvViwVb+Xhe6VVlAW1UxwPvhNZlvy0VcZjmOqqSxzYURnmqx7ipZkYuEjhS4Di3Y/aYKi6FFyNoEfJMpIA=
X-Received: by 2002:a63:698a:0:b0:41c:8dfb:29cb with SMTP id
 e132-20020a63698a000000b0041c8dfb29cbmr24458682pgc.170.1664287393191; Tue, 27
 Sep 2022 07:03:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 07:03:12 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-6-4844816c9808@baylibre.com>
 <5a857097-30c2-3b37-6134-57cb942113ca@linaro.org>
In-Reply-To: <5a857097-30c2-3b37-6134-57cb942113ca@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 07:03:12 -0700
Message-ID: <CABnWg9vDhEES=hfUzs7tkHfuzN7TCm1CKz3WysgWTHvPPiY41w@mail.gmail.com>
Subject: Re: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be
 compatible with syscon
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
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

On Thu, 22 Sep 2022 09:19, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> In order to share register with a dedicated ddc driver, set the hdmi
>> compatible to syscon.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index abb231a0694b..86297b7eb7f7 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -16,12 +16,14 @@ description: |
>>
>>  properties:
>>    compatible:
>> -    enum:
>> -      - mediatek,mt2701-hdmi
>> -      - mediatek,mt7623-hdmi
>> -      - mediatek,mt8167-hdmi
>> -      - mediatek,mt8173-hdmi
>> -      - mediatek,mt8195-hdmi
>> +    items:
>> +      - enum:
>> +          - mediatek,mt2701-hdmi
>> +          - mediatek,mt7623-hdmi
>> +          - mediatek,mt8167-hdmi
>> +          - mediatek,mt8173-hdmi
>> +      - const: syscon
>
>So you just broke all DTS and I do not see patches fixing them...
>
>Best regards,
>Krzysztof
>

I'll drop this patch for V2, as suggested by Angelo I'll do things differently
in the driver to drop this requirement.

Thx,
Guillaume.
