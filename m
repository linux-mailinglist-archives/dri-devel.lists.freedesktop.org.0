Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2E78AE88
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7C10E0C5;
	Mon, 28 Aug 2023 11:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081410E0C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:13:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso44965671fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 04:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693221204; x=1693826004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CE4FJ6vozQonXv84v8YaWCO1mV/2bqcBxJ5WJOyxvYc=;
 b=Sxri8AUTYAXoQ6hR20GNftPrrCKHOAHi51S+zQ4znzDyqcLuzyNR3NeedjztgNDPMx
 8HPGjYNmoQUXqa8Wpsh0/0+PYNiTPI6Lrbl8ycM5OKT9KIrmj4jabM8dULTDhxwf1ax9
 886dnsxq6y1BUfh+jpKJnmHlgBATXHnmt/UXbYqvSHDFMRofxqm8jKx1g3JAlhKp9TLq
 hfl6+UoUJphdEmEEukOniT5LWts4upBWC6ImI2toydIiKuflA+RQzDYfa5gVWpVwplCA
 TvQvKpjVv3YRlmFsJcFArcv7bsN8w2QDtrQT/IxXgHJc9mjXaeLF/mkrL3T28rZOEGJ3
 CoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693221204; x=1693826004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CE4FJ6vozQonXv84v8YaWCO1mV/2bqcBxJ5WJOyxvYc=;
 b=BTHz5d8Paw5pcTXhjmJMwlbYWKFKwq7Kj41Sj9e37wvdi1JZ+Oy0uAsrsY55tOELB6
 YABgmE1/2eJBChqk6Pip/4ZXjiX0dn/DtaMjKkXNa38DlTGfkAOR5eqlfRCeqtYezAVX
 czyUOj6xPx0BeCnrQ9yK5mZphnrgPzDg2AVZ+RrjzUo8T4XdmYiadHqfuLmACpmwYM32
 wdzJEgcv1ufggoMYucCh+8HpUlDg+4qARSojqopiAhsiB7wZhnNVLi0i1mAPSdZkv2x/
 /RglanFWAId9KV9Q/P+zn2xxTc2PgvYsaWBduPLWJFNOXVz81fDho4h6LxLSAA+nhZJi
 iJnQ==
X-Gm-Message-State: AOJu0Yw/kLzAzrolzCprr+x0OtgBHImzqC4qvOYXkP5q5eSJNy/ut3UU
 PmtBXczFcOilXMkD3jS91FItlg==
X-Google-Smtp-Source: AGHT+IGOIAc3n6EulGGyqxa5VBJTfbSOuG9fBQNwyflcdyG9hyHoZ3zg5biteTv5RCr4HFSN3w3JTw==
X-Received: by 2002:a2e:9b14:0:b0:2bc:e2bc:81ff with SMTP id
 u20-20020a2e9b14000000b002bce2bc81ffmr8954203lji.51.1693221203750; 
 Mon, 28 Aug 2023 04:13:23 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
 by smtp.gmail.com with ESMTPSA id
 rl11-20020a170907216b00b0099bca8b9a31sm4518877ejb.100.2023.08.28.04.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 04:13:23 -0700 (PDT)
Message-ID: <6baf7e40-22dc-80c3-12e9-6f251f826bcf@linaro.org>
Date: Mon, 28 Aug 2023 13:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add AUO G156HAN04.0 LVDS
 display
Content-Language: en-US
To: Elmar Albert <eal.git@mailbox.org>, dri-devel@lists.freedesktop.org
References: <20230828094943.123676-1-eal.git@mailbox.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828094943.123676-1-eal.git@mailbox.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/08/2023 11:49, Elmar Albert wrote:
> From: Elmar Albert <ealbert@data-modul.com>
> 
> Document support for the AUO G156HAN04.0 LVDS display.
> 
> G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
> a TFT LCD panel, a driver circuit, and LED backlight system. The screen
> format is intended to supportthe 16:9 FHD, 1920(H) x 1080(V) screen
> and 16.7M colors (RGB 8-bits ) with LED backlight driving circuit.
> All input signals are LVDS interface compatible.
> 
> G156HAN04.0 is designed for a display unit of notebook style
> personal computer and industrial machine.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

