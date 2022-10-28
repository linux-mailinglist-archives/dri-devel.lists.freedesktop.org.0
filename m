Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691C610776
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 03:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2580610E0A7;
	Fri, 28 Oct 2022 01:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2910E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 01:52:44 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id 11so3548426iou.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 18:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5yy8TNI0iIOeZCtVjRMbf3TjP3tDO+JbDFQL1ZgVllA=;
 b=a3FXlBy9z5wu0caeZP7ZvrhebVK+PYnk00GobO2x2JsYEYo6lDsjLMrxx3+zPvgOUr
 kIfZCU8Oc0DUut1EB/qYk+9yb5PEHjJ2bPyqM9Ma8d5wnK+27sjWztJckFuS+CavwBD8
 sNu1A3xaMBa7QzbQNK4L9vCXvbiHbB3qEDaEZspK8KcVs93O2rn1SA6rFm7gpC7eU4bG
 IJoQdtDHs0AW8FuxA0s+kua7zfawRxYfdBl+F3g+uRxiE4aJ6W3ol/kj4apeZnrD13W0
 1l7oBAFn3XhDPWdx/lUBN1LCn1k37pLQ+OOvjJzDoZmGuEqA2TUY568OPpk+UGH0WnDz
 i0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yy8TNI0iIOeZCtVjRMbf3TjP3tDO+JbDFQL1ZgVllA=;
 b=Xr3dJyOVwaMzOdStj/D0m4v67aHfdOeRr9JKP/hIT6CLazXahw58wQZHMtl8wZ0QJY
 R/U6FxYBN5ObjKiDZ1XcJ77/tSJdDP3Fk94uXhWGQG/wZ1grPWrdRDB86cEoaqvTJewd
 dwlpLRMGRCVRu8Jvj1/3m8PJC60/IuSiGPRGSj6dUo+mId+jiwhbh8poFfENdjvTtFvy
 Q9erw114SKvF943QP+r+PCWOt7taZ22g1VZs63E5SPHNbcX/eky3/seuj7PM5J7r49vK
 mP2Hy7SbVTEwUYCHt9tbB93bkONjuKenXp1R87aDefX6jd3FjAYVlzJ7hgUTBtnVFO8l
 q28g==
X-Gm-Message-State: ACrzQf3t7I1/TqQcl3WTDJdvm5loUQCEDcn93tb6D+jso55cV66p0sJ1
 f/UcKTt6yhNl16Uqsik1rSK/6v9OoCLP1A==
X-Google-Smtp-Source: AMsMyM4koLkGjhZW3oXhqu+e+0pVR0w0wzPHgyh1kHQo+WobOSK2QlzqYGnUNjTcjtRYXZ+4bz/lqw==
X-Received: by 2002:a05:622a:15c7:b0:39b:2791:cd44 with SMTP id
 d7-20020a05622a15c700b0039b2791cd44mr43752425qty.676.1666921953238; 
 Thu, 27 Oct 2022 18:52:33 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05620a298900b006b61b2cb1d2sm2102295qkp.46.2022.10.27.18.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 18:52:32 -0700 (PDT)
Message-ID: <31d129a4-50a5-dc5d-4d69-cddd7e1bca21@linaro.org>
Date: Thu, 27 Oct 2022 21:52:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>, allen <allen.chen@ite.com.tw>
References: <20221019093215.8204-1-allen.chen@ite.com.tw>
 <20221019093215.8204-2-allen.chen@ite.com.tw>
 <20221024163748.GA1874793-robh@kernel.org>
 <CAEXTbpfpmAAaXOEkirMtuSJLopv-Us6w-46oE+GSxXiMGU-ZfQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAEXTbpfpmAAaXOEkirMtuSJLopv-Us6w-46oE+GSxXiMGU-ZfQ@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 00:03, Pin-yen Lin wrote:
>>> +                  - minItems: 4
>>> +                    maxItems: 4
>>> +                    uniqueItems: true
>>> +                    items:
>>> +                      enum:
>>> +                        - 0
>>> +                        - 1
>>> +                        - 2
>>> +                        - 3
>>> +                    description: For four lanes operation.
>>
>> I would do just:
>>
>> data-lanes:
>>   minItems: 1
>>   items:
>>     - enum: [ 0, 1 ]
>>     - const: 1
>>     - const: 2
>>     - const: 3
> 
> I believe we also want a `uniqueItems: true` to prevent duplicate
> items like `<1 1>`.

... and are <1 1> passing with Rob's proposal?

Best regards,
Krzysztof

