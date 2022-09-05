Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEA5AD485
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C63410E3AC;
	Mon,  5 Sep 2022 14:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE4610E3AC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:10:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k18so9330540lji.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FKN1JOpDZtlbeNH8OIC4d4elRGYKKYcfRFewHUVoXLQ=;
 b=nhCfu42JMTUoCYmeHuznAOkwdGoFHHmYtyOQsi0ncymt29bL0tZXsWJUKM6d96wpre
 VgluOotao0toEOAe1h3R7rChL5HrvPKvMtHLTznzsBbbLvZ0gQY6jKVLtXt1FDquRtHV
 kaSi4FGa2RH9Mz9rbtg4T02rAsO8vjxfMN4rQBAUSSLMMX3ki5DqgvO9BTnfeCv4zoOB
 ai2E5pPSDB2wvgPGRV7W6pPcqb9JchZ6vHz3MwEtJomobJ3GL++ImY+OpWL1eByTLnns
 0CNMzvPPK5JZiCwo+tpOpUNpiIohfNjeMAo7OtjbzZEEiAVlPdONjEjMAQ74qaaW2WGg
 3hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FKN1JOpDZtlbeNH8OIC4d4elRGYKKYcfRFewHUVoXLQ=;
 b=ralpykkFOFTsdC+s/HwNLqBVqGKuEYGaikrHctq1lRiB4j3VZ+XAjPV+Tcw1Ow+qHb
 2X8Y3NnO0U+Uog96gkDGd4Wn0tQ7aHGa6b9FWz10jqNH1gXb+FiQXj/OpQcddBT09Tia
 Hs4kHd8KbzXTYQFTVrIBtJPhHCFkxX7E7iqqjzhTj9gmjLJeR14h2EAHbEjU0kSR/Y5T
 txFWcCS3qeAuWtPxQW/THt8By6RZQtGJjjgG//M41cnZbYqF94pbDZZK1H0dJ682vyql
 ClyW55k8lShxbJ6FOXLdaJ6ojII6JVrfE0i0NXXQ6DO9o3jyI+CHqFDjGvaNOBvWMend
 4ZiA==
X-Gm-Message-State: ACgBeo1hf/bdCPA8fjF1FtaJClZagL5ZBekxFe4ERc2jF5T96hqg8/6/
 +R18hhhW8DdlYhvp4hHsUUqd1w==
X-Google-Smtp-Source: AA6agR4El7y4IT4lAlgQXtAOsrOIz7IkrRHCkD/A2S4p+/9tQvKZXU0lvZ2Q4JJsjuVfDdd/htYFGg==
X-Received: by 2002:a2e:b5d3:0:b0:267:4da0:ce3b with SMTP id
 g19-20020a2eb5d3000000b002674da0ce3bmr8215983ljn.420.1662387002553; 
 Mon, 05 Sep 2022 07:10:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 e27-20020a05651c039b00b00264bb2351e8sm1436823ljp.7.2022.09.05.07.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 07:10:02 -0700 (PDT)
Message-ID: <1ea02712-eb1e-ca68-b954-c7d59a74926d@linaro.org>
Date: Mon, 5 Sep 2022 16:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
 <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
 <YxYACwJmo/FlbVgk@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxYACwJmo/FlbVgk@google.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/09/2022 15:56, Lee Jones wrote:
> On Thu, 25 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
>>> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
>>> also fixes dtbs_check warnings like:
>>>
>>>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>>
>> The resent was a month ago. I assume this won't go via LEDs tree, so I
>> will resend (again) without Rob's review, so it could go via Rob's tree.
> 
> If you have not already done so, please resend this and Cc my
> kernel.org address, as per MAINTAINERS.  Thanks Krzysztof.
> 

Thanks, I resent and Rob already took it.

Best regards,
Krzysztof
