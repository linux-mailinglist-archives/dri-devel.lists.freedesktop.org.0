Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42280750156
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2348D10E06E;
	Wed, 12 Jul 2023 08:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5C10E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:23:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so8986112a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689150214; x=1691742214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+l7Eh/4LbWJYT13FkXK40Kaxv90ph3PwBtFUGakssuM=;
 b=gY1mIb5/n1pqlE1aMjQxtSn2wYBAYIFreAP6dmX1CNHRwQVQxrWeUWD9Vj9fZNow/v
 KvfPzfFlLgHxHgyGnvD5iuK+n/Zi7Ccy5EvSbKG75ZG5FBiWlEvMVCHMkgq+l30e/uP8
 7/qnoQhoyy1dd5VbbncyTVe9sHVZuD5IlBt5Oj5S3NbgWUAGXSEa+m8y5buZMD4bojeU
 Fg5rHRH562DT/q8YzBWLcgNCADZZXoihcGrDD0aWL2nNnFRVJRwNprI8Jj8diN9+ZhfE
 PW1uGlRaSsvSICCkuPYroTpXKG7FtG2yeDEj1d3epSn90Woch6gUpNYB5XBcv6w5aWhC
 H9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689150214; x=1691742214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+l7Eh/4LbWJYT13FkXK40Kaxv90ph3PwBtFUGakssuM=;
 b=Js8Zm9RTH0sJ95bw7EjNI4ZiO6wmpxLbhkjz/3mV+FlUoixa5l668myZZ6y2D0Gt7+
 XCdbm00hdnKoJtiLhaQM6W6GstquT3nGjhK8dR8CLDKD2emZnG/MV8ftmvqJTmQX+8p1
 7hnZb5iKgPQ3hC5kT002gToAVIy68p0NgQXoiqsfKL/hoT59DYmr1KwcuUxep44KSzfH
 /6CtispQ7+IyHdwAguihaIwXtRbj8WtZ4pPRs7h8Kq3hX3BygUh4s51mYZhv5VJSBhLI
 YiH5rn+4JXHwK8hKfDNPMW7HLHIvTOXxncacBaeFdW+y+7LMe6154WZDiBPLQDAqDEam
 hy0A==
X-Gm-Message-State: ABy/qLYkgeJ4ljboXsMck5WEVgLSafp9O0f7Rb87/f0zHJAab21Mzxv6
 xSnj+0dAlpH3HliUbZT1O6YrMg==
X-Google-Smtp-Source: APBJJlE0v3CXAkyC+5VJ+owfFI5aeQXSTjTk+636i1V+fangwfHic7+Ga5nX19+DcFN5Gs2F6jPv5Q==
X-Received: by 2002:aa7:c75a:0:b0:519:6a6a:7659 with SMTP id
 c26-20020aa7c75a000000b005196a6a7659mr18612920eds.18.1689150214048; 
 Wed, 12 Jul 2023 01:23:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 i9-20020aa7dd09000000b0051e249f3dc6sm2403812edv.72.2023.07.12.01.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 01:23:33 -0700 (PDT)
Message-ID: <b58b6c23-1771-6e93-eb1e-a5038cf55c30@linaro.org>
Date: Wed, 12 Jul 2023 10:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
 <20230711-startek_display-v1-1-163917bed385@baylibre.com>
 <14bed951-22ae-4aa8-5fcb-b2cd92ebdbef@linaro.org>
 <a335efdc-2ecb-c25a-7507-5ef2e19c5ca1@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a335efdc-2ecb-c25a-7507-5ef2e19c5ca1@baylibre.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 10:01, Alexandre Mergnat wrote:
> Hi Krzysztof,
> 
> Thanks for your review
> 
> On 12/07/2023 07:32, Krzysztof Kozlowski wrote:
>> On 11/07/2023 17:36, Alexandre Mergnat wrote:
>>> The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
> 
> snip
> 
>>> +
>>> +  dcdc-gpios: true
>>
>>  From where does this come? Which schema defines it?
> 
> It's a miss. I will fix it and reset-gpios too by adding a maxItems and 
> a description.

reset-gpios come from panel-common, so they are fine.

Best regards,
Krzysztof

