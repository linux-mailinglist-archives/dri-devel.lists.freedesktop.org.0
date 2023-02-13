Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619D6944D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E04D10E573;
	Mon, 13 Feb 2023 11:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BFD10E573
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:48:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso11061247wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pu3bp3zhZ06tjaJugEPKcBoKeuOKXsePEE4SOmhYvEg=;
 b=vpyujYDwtV7b1wUjjoSB89QIgtocHK0d7R2iISp/NW+xQJKywWq2SyNs0ACgPfq8/o
 YZKihy7kF70Fzonplh+saC8upLb/tqcowT60MVU+f9Dfs5fKMtezr/TMyEikE7KIm/F3
 5H+wR/jbmFEUU7/g9q1VIkGmtC/pOEphI0+QSb5L/RqO03gXhNIx6+SjUwqzV3fue12j
 7upIZi8U+sD3ktyz7mSWa0AZVDtHvrQA7Sv9RPpPpqA2X6ELBlt6lbzU99Gx8IIV2GUO
 mUs0NBTALAS2rp5o0uQsePXL0Rc7c+Cbbh0TRfZkiGv1eJj7jbfvbKwNxA7ya2ZaYK+u
 fTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pu3bp3zhZ06tjaJugEPKcBoKeuOKXsePEE4SOmhYvEg=;
 b=VHsm3ZSYqxyqXx/twAdXQ/Bz50VQpYWFbtu5zGSIZSPKDPwVG+0hszLRQCIT0BACWx
 i/xcviiIWQlEAhLeTTxIaplGrjJBv3E/dIZ0uaCaPmxq9s1TK6ncXZl2sR4HtDz2iT84
 0P6thvdwGV8yfztPhhvDhZaFvOJlKRUVMPMzbGhUD8lD/ibBtukevR3EpE+kMgIiL6qe
 AqRJNM5PAvwVDJRKMTgl2spgiEkuA9IuYfYtUaZaMZkiknZ602GV1cMMiHP1Eeql4QP0
 NWKpVjo7Ol9ZPRn5hqMUogM8YUdQ8sCljYQ/0nr7cFoz++e83fwKTNgMbEJx4qQ/B2w7
 iHJg==
X-Gm-Message-State: AO0yUKVIE5eK3c+toYrQAWglqNvA5EPGJ3Lf5FNPAjX6o0jqYqcH72Tu
 YBY68IDfxAEyIn4X4TzJamNmlQ==
X-Google-Smtp-Source: AK7set/MN+9GgY4MfAr54dx3nzP6F0WirBm6MWw/C0HUyZap+4rfR6S8tBbwmDw/B73pn2WThgQLTQ==
X-Received: by 2002:a05:600c:3403:b0:3dc:572f:edb7 with SMTP id
 y3-20020a05600c340300b003dc572fedb7mr4256036wmp.1.1676288906641; 
 Mon, 13 Feb 2023 03:48:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h33-20020a05600c49a100b003dc54eef495sm12887289wmp.24.2023.02.13.03.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:48:26 -0800 (PST)
Message-ID: <daf1686f-9e6f-a2d7-f2f6-0a8467a2c858@linaro.org>
Date: Mon, 13 Feb 2023 12:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
 <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org> <Y+oZOXyE8/a+vreS@Gentoo>
 <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org> <Y+oc+kEDoiMsebWF@Gentoo>
 <4055b041-c012-3be6-0aef-085ec389aabd@linaro.org> <Y+ofLDV1nsQ/WUJs@Gentoo>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+ofLDV1nsQ/WUJs@Gentoo>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 12:29, Jianhua Lu wrote:
>>>>>>
>>>>>>> +  resolution of 1600x2560. It is a video mode DSI panel.
>>>>>>
>>>>>> The binding or hardware supports only 1600x2560? The how it can be
>>>>>> "right now"? It's defined, isn't it?
>>>>> Yes
>>>>
>>>> What yes? How it can be "right now"? It implies it will change, so how
>>>> hardware can change?
>>> sorry, my wrong. This binding only support 1600x2560.
>>
>> How binding can support only 1600x2560? How does it exactly work for
>> binding?
> the driver of this binding support 1600x2560 and panels are 1600x2560.

OK, so the driver has limited support. It's not relevant to the binding,
so drop that sentence.

Best regards,
Krzysztof

