Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6DA522E27
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 10:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EB510ED9D;
	Wed, 11 May 2022 08:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D6410ED9D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 08:20:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l18so2459415ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uy8aR8kz6BQpVxur6Kjai6fQ+hpFlGiZWJG0Qp4yCOg=;
 b=Fr/vip9pejDSZqSSt8H/JK2iltHXzGX5eyeHFwgdyMnJezlK+2lTTWFI7fPT/aDXhU
 ZrqpNPb1xceNSyxiAneMZxZe9H6xKDVWciNwUtz+ziERQ843v/TQKqZASKu8vw7DREcz
 3nPSd8C2luHoFafniYeVRyOKVKHuNSnwoKsIg5jyZl5gplAmflS02dUFnFDgmOyjkZat
 c4hF0Ko5ccpUqOQco9bSDG1oqaRPHVjoZrYUjXJ71oe/n4FJoEtQqr6HpggI0IeYjnhk
 G5gpN/enDBRgL6Buxh4W2eU5sBg19B81dLFeIj6ybSczHxNadFCayl6m4CEAAwFQi5E0
 ID3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uy8aR8kz6BQpVxur6Kjai6fQ+hpFlGiZWJG0Qp4yCOg=;
 b=dETElivJNqhP7r4LV5aSh68KoB9gcHLNA1VX1YJrffOWG4j54SSVJpMbr65LF21JO8
 DCSMCcAJiWLFcuERyd77IbUV4SFBl1mzjXaO68jom/LogIBRZyYrXcHesB6vYfSuRYjs
 kSSRprl5q9SM/QbhPMi4obay3a85zWf3fFi1Bssd6n5J+L0481OnGUvzVL5PydTMq5N4
 9odAasnkGEs2KXeMtIAw9CXIahVXaMBD9EssCSsAKn495nWLadsZEcL+YQ7tIiI7YJE/
 C/jUtQ8xyQmcekMM0uYSxYSOR44FTM5e7T9NAkU1npzLal9uxrJOPCeTmh3xyZjJG0RT
 FG1A==
X-Gm-Message-State: AOAM53049xJIPT5yB5cg1V0yBVguqHtWMDuTGycbE1SNTF7agUp8VjXR
 5aQkdcuR4LLtxBH2doFz49JmAA==
X-Google-Smtp-Source: ABdhPJyp5kcKMjgrjpqm7gLFmCjmNvtcblZ57zYzau/VMyDvaHMxuHZ6/U1RNDoP2QszXU6cQEtuig==
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id
 c3-20020a17090654c300b006efd07bc8ecmr22902989ejp.687.1652257222606; 
 Wed, 11 May 2022 01:20:22 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 k18-20020a1709063e1200b006f3ef214e20sm668612eji.134.2022.05.11.01.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 01:20:22 -0700 (PDT)
Message-ID: <b3a618a6-f236-549c-0bac-4c874cd49a00@linaro.org>
Date: Wed, 11 May 2022 10:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Content-Language: en-US
To: Joel Selvaraj <jo@jsfamily.in>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, Oleksij Rempel
 <linux@rempel-privat.de>, Linus Walleij <linus.walleij@linaro.org>,
 Hao Fang <fanghao11@huawei.com>
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB700946D0A3DA7AB7BE2CBBEBD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB700946D0A3DA7AB7BE2CBBEBD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2022 07:28, Joel Selvaraj wrote:
> Add a prefix for EBBG. They manufacture displays which are used in some
> Xiaomi phones, but I could not find much details about the company.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L543

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof
