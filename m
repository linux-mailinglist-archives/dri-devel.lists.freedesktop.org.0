Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B05F1B9A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 11:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768B010E2F9;
	Sat,  1 Oct 2022 09:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AD010E087
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 09:53:15 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id j5so2551852lja.4
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+fwQkzZtZvFhlS36WSaA8A0o1uHH5KL2v22rtnfJVo0=;
 b=Dcf5IwtiORX2shCUqlw1jskx3rBmc5N/0owLULlFHwKmjpPhadoA9AqvkcUY+Q0Qu5
 S2K4/RZre5oOnzDxdDogusYgL6QfykS0jkvo9haoRvzaBPNrPQUHmLOKMPxSLRGcmZ2G
 cSGbN51t/dg+bgd2BpRKbQ7P79ADb3rrZXuQkuP/rIojSjvIZG9rUfO71Q0UkzsM1M6Q
 RQugJfrXQr50BVzh0Ggxdkdzehbz9rfxWs6vYOBmaykN1wcYqZO+2fvbNt5Ikyvc5X36
 5/T4g+0rN7DlxoXUCVBUTSUykKw+iYfhRqLXWcSxuot/3JoQ60KCz2lL3xw5hQfah/wS
 f/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+fwQkzZtZvFhlS36WSaA8A0o1uHH5KL2v22rtnfJVo0=;
 b=DEuo2N9j1fwS4LN979DPrNdRzXmLwY4hcQlicChiKzMxwG6oWbT5t6fA9VXwQGHIhc
 xqpwXHPzguPlnAVwBvQ/dd/TJC6Su6xffQZ4CPQFRiC/3EKzAbaMHJ2S5/hkckKN6s7t
 cw/6JpViUjz6/q8XBxE0GLRJxXDjSbAYZJvGLwh4fako5YHc/GM+0pjfa8+L6mZxPxHV
 yNpb+pEWEzvRPY6UxtDdKQ0SXKnM/IJ6PYQUeuQxaK718L1d61GiUkjUkQZtIquKf1K6
 QO42tv8mt1jWKgL8mNevzSYIaGIFbB8Emv5bygXn14KeDh6CfcnWleHNzJ59uj2bOIn+
 hCqA==
X-Gm-Message-State: ACrzQf1trXiBUxNoxyl+GKbirdhcaZ/vDZ+o8TAOsZ77wv4wAdXjx6Oh
 Zx97dlv59OW5lfiEYtaQKkkbOQ==
X-Google-Smtp-Source: AMsMyM4q/BqTTKBc7GlqDk9EYxZQnJkVjNhRfDFBSRu8EDT0FNzEZxWm43M2tLKgCgbF1WY/zW0aKA==
X-Received: by 2002:a2e:a54c:0:b0:26c:6972:ccaf with SMTP id
 e12-20020a2ea54c000000b0026c6972ccafmr3783882ljn.11.1664617993685; 
 Sat, 01 Oct 2022 02:53:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 be25-20020a05651c171900b0026c1cbbf461sm392126ljb.80.2022.10.01.02.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 02:53:13 -0700 (PDT)
Message-ID: <a6b78a66-14ef-68bb-25df-2c2eb118a7d3@linaro.org>
Date: Sat, 1 Oct 2022 11:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org> <YzbPz8mL0Yo+vgSS@orome>
 <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
 <20220930211424.GA913368-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930211424.GA913368-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2022 23:14, Rob Herring wrote:
>>>>> +		dc@54200000 {
>>>>> +			status = "okay";
>>>>
>>>> You should override by labels, not by full path.
>>>
>>> Why exactly is that? I've always stayed away from that (and asked others
>>> not to do so, at least on Tegra) because I find it impossible to parse
>>> for my human brain. Replicating the original full hierarchy makes it
>>> much more obvious to me where the changes are happening than the
>>> spaghetti-like mess that you get from overriding by label reference.
>>
>> Sure, it's entirely up to you. I forgot your preference.
>>
>> But it is a really nice way to have duplicated nodes and mistakes (which
>> happen from time to time).
> 
> We could have a schema or dtc check for that. We already warn for 
> duplicate unit-addresses which would catch some typos. Checking for a 
> node with only 'status' would probably work when that's the only 
> addition. Maybe status without a compatible would be better? We also 
> check for nodes without a specific schema, but child nodes in schemas 
> aren't handled.

Usually these are overrides of few properties and status=okay, so
looking for nodes without a compatible would work. Except for all the
cases where we do not have schema yet...

Best regards,
Krzysztof

