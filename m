Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83F75920C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3C10E0EA;
	Wed, 19 Jul 2023 09:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D510E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 09:50:15 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso108874811fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 02:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689760213; x=1692352213;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MMljrXevGV0neI3EVhl1dPZd5r7jt0OxAcq9g2MiCPE=;
 b=sT4+n1AWCsXdDrx7A1H8ec2CQZNYSMcMr1oEPDcLRwXJ5qZxR+7MUk9byxk6kVW346
 Z1raLQHypnVymdChADQch5HQsXkW7dDNxIlLMHaPVpHRrjn8khXtg/qxrBzKQLRDrAvM
 QnRhl7JxTonp8DS6UK0lbuZ56zHjawrIUgtrcEr3iIdNQYgjbESaHGoIJOgXPfxrRcDt
 VPMLmcvb+QG2+HbkwLE9GGpZNksP3WG26se938TsxVxy+UBj4qHpEz97tQqZnV+uq6Iw
 R93yYHMcvO32Pegs+bDVauslIV7xwCYZFQlQmTFdfWkx1wISTKQbxCvSacHEo9E8Qulj
 +8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689760213; x=1692352213;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMljrXevGV0neI3EVhl1dPZd5r7jt0OxAcq9g2MiCPE=;
 b=XI9bgS2zUSPkJbNYA5OPStMcJKu8UreEoej90xFNtNYN31Y5bCdZfRBoAf74X99opq
 jnOYeri+5byh0a7QkZIs9DJmyGbhx+eXuWUEAlXBawbWOH8gihdRG5SrTJWcX4xQJHIX
 cdk6nS9VnRsobHZuIRF67O+2GzGZFxIwOY5U0BAb7JV5fyihkH9OjHi57byU0OmbaLML
 7tRDeHCb3LeU5r7PlOuzkna/dAYOAxzRvlYQwkrSMdpEM46ExEZahxv/p9At2RfzHfCm
 cLf6vPGLnoM05xbztWKuyQYT4eOIUStGQmWpbwPvjmeUE1A5qtonKKJnfUPhRrcKcplk
 72Ww==
X-Gm-Message-State: ABy/qLaSy583npBVTAAQDoIdCLNABv3boxCAcfP8AliKCNsUYkjJMTzi
 Fdtg2mPj5nXIjLqQbkqMKrZEdg==
X-Google-Smtp-Source: APBJJlGtWKuuIjtNxvpJJqKtw231AsMKV9BOQRsDrVK6cbSdpsGv2oiErOEZNzMKjsnESx3O9xqSEA==
X-Received: by 2002:a2e:7a01:0:b0:2b7:a64:91bd with SMTP id
 v1-20020a2e7a01000000b002b70a6491bdmr16900884ljc.35.1689760213576; 
 Wed, 19 Jul 2023 02:50:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a17090633d800b009935aba3a9dsm2109938eja.48.2023.07.19.02.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 02:50:13 -0700 (PDT)
Message-ID: <7915f04f-9eb2-78a0-edb4-1db179bfd18e@linaro.org>
Date: Wed, 19 Jul 2023 11:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: add vendor-prefixes and bindings for
 pcd8544 displays
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <02704840-ce8b-4f41-f8bf-3f200ca95a10@linaro.org>
 <20230719092903.316452-1-viteosen@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719092903.316452-1-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 11:29, Viktar Simanenka wrote:
> On 2023-07-18 08:35, Krzysztof Kozlowski wrote:
>> Bindings are always separate patches.
>> Please run scripts/checkpatch.pl and fix reported warnings.
> 
> Added vendor-prefix to fix warning.
> 
>>> + inverted:
>>> +    maxItems: 1
>>> +    description: Invert display colors
>> You described the desired Linux feature or behavior, not the actual
>> hardware. The bindings are about the latter, so instead you need to
>> rephrase the property and its description to match actual hardware
>> capabilities/features/configuration etc.
> 
> revised the descriptions and added suitable types according to the
> documentation
> 
>> Please run `make dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> Maybe you need to update your dtschema and yamllint.
> 
> cleaned up unneccessary fields (leftovers) from tested binding
> 
> On 2023-07-18 9:19, Rob Herring wrote:
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date
>> Please check and re-submit after running the above command yourself.
> 
> upgraded dtschema and found all the warnings. thanks. seems to be fixed
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>

No clue what is this - is it a reply or new patch to review... does not
look like the latter, so I will just skip it. Please version your
patches, provide changelog and send proper patchsets.

Best regards,
Krzysztof

