Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10D7062F1
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6A110E107;
	Wed, 17 May 2023 08:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FF010E107
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:32:39 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-965ddb2093bso63926566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684312358; x=1686904358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWitSHiMOT4coKgFlzLg7KYluG3UUdq8GESJECXOiJo=;
 b=ZDjysRqZkqvYqOiAxYXP5en70O41y4PMGStzeR2KSskajjek6DPKOkN7rwYJADSunf
 bw/b0dQ8vxN88mNng1C3HRksj4InazOzddCCtYRU3momPUP+sFAnmXAoNU5kY48FiI/g
 dSKrBcu34c3eoumV7Z+tutJhpbMl2AEZfDk3tpSxoWNIjUfXYpAQnsbMxziwrIP3izXb
 6+TDNJ4af3oWy2gXIfh4jJTJuJFdLBL13vN5FDJIaQx6uq0oCa9OJHQHDJROELIAUkKv
 oSTSxmW0v2homiGBJnNHwsfCq2eK/xekmVtzWC8U9llLNAEbkWSYIaqWiBpvNAfb+TEd
 8SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684312358; x=1686904358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWitSHiMOT4coKgFlzLg7KYluG3UUdq8GESJECXOiJo=;
 b=RDY5kwDZfjzNNJdazAFJYVSD9/U1ca60WINsHewFj6U8UHOI4qwAASbvuCzNP8OwW+
 yUMTeZCHHmuDjXXW2rljAXa+i7Sm+2q9IgzjLoseECFcm6F8J33u59OsmB+Br0nF0xdM
 DBSqNY4poP3p8gh4mkfICr96PvvS7gFDappz7R6Tzmnc89qUdTmi/xX+8cqkV8dJ7Ly2
 zL+uwjXdRQ9gwFxuipKfAatrHusiH1YPPaktPgX8e+WRK4oXyJOMHwTNE4/yeNYd246A
 4018RWpbA+Kw5nqpGmmHps+caHtLMfpoYKJHCM7Coh8Db8sQOSRvb6hGCpI30L0zv0FI
 gRvw==
X-Gm-Message-State: AC+VfDyBwPimP2o8krMSXJna5nEBtAkcpRyrItku8vzFCWr6LObhRo1J
 pg36ZtRk25SrqoP4S/KwUf5TYQ==
X-Google-Smtp-Source: ACHHUZ5lTHcklO65Tbda/84467VNgoKGANYGw+A+KZDBbn31EhEdfTRKaT6JKayUE+IvTUYh+tFpxg==
X-Received: by 2002:a17:907:1c84:b0:969:f677:11b7 with SMTP id
 nb4-20020a1709071c8400b00969f67711b7mr31440550ejc.20.1684312358276; 
 Wed, 17 May 2023 01:32:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a17090655c400b009660449b9a3sm11955786ejp.25.2023.05.17.01.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 01:32:37 -0700 (PDT)
Message-ID: <250e0e95-9f34-5fb7-aa5d-61b227dc9cf1@linaro.org>
Date: Wed, 17 May 2023 10:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <97124cb1-4f45-22d5-418f-568f8a68deec@linaro.org>
 <356bfe96-75e6-1c6d-0049-d664e719a266@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <356bfe96-75e6-1c6d-0049-d664e719a266@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 10:29, Paulo Pavacic wrote:
> Hello,
> 
> If I understood you correctly you'd prefer it to be named 
> fannal,c3004.yaml?

This is what I wrote:
"Judging by compatible, this should be fannal,c3004.yaml"

>  My logic is that if more panels were to be added that 
> means that each one would have yaml files that would look exactly the 
> same with the same user.

It's not a big deal. Although anyway why would other panels have exactly
the same supplies and all other properties?

BTW, you miss there supply.

Best regards,
Krzysztof

