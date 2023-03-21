Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70196C356B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A5E10E79B;
	Tue, 21 Mar 2023 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4514D10E7AC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:17:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r11so61091603edd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679411850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KRub14cDWG5bsjeqlDtuRXP1mPBZqqoGfHwZXBK5HUk=;
 b=OvgzDawIBNnP9ueDqbC65uGM7q56iUrMFqKIPmRSKSkHJpm2oPZJrsY9PVMGTN6gl5
 nJmDED42S7gxY2YLmGI5cPzsVCuv3UG5L2bqV1IcHBnPiuUuLv3+7SNkkq3BUuZMvsq0
 GWorI81yONU6xxrTD8HsVqOAPGSoqDxrdfm7h0K8JdDnElV68+TsVRN4eVxOkwsa9x41
 61lE9oS6jlra9UTznRs5YGHsrNbing2iK6/whL/7dm7bUFr+bsF6WrGrVl16ACGdqU8l
 rFiErKP/oLf7j9XfDG/6zztIermG+1zER6jItH49fV0MY0iPsDxyGvY7Ti6HJ1FhmiHX
 Q4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679411850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KRub14cDWG5bsjeqlDtuRXP1mPBZqqoGfHwZXBK5HUk=;
 b=CudQPkSPsNTRT1x9d9TL6AeuBWtz1Bh2sQ1xg4ExunX3xzgv+Qb5rKr9dy2Ce8lWyk
 FbWQZ7cj/VdOVO/hFniFld+3K+bKz21oFbvwzuOfXDU2z9beVBQoObfnR7/M0rs8vHm2
 J0DhxjMHbt/HNGVOx4iCX/Nc2aJcJ+eLkTTTJVa/8ws/ZJBBloV+WlsABUUTipPQg6oT
 HZVn889FTVcNtmW9WxQL+bFXWSVKuEQV8F82Tay2ExdVMjWnmXSsqLC1nGTWksrfu/35
 te/fSZkgU9LbGhlNsa2DyY92I/mDFtUrLnQPGHf0/Y/JakCxDUn5m/eTy7I4EdgDH2Ua
 FIOA==
X-Gm-Message-State: AO0yUKWWzfLYJDfs9Iy8RqWrn+LSKxRqbKgZnv1uWH5cxaGlBy0XZgCx
 PwDXxCiJf4b3PWplvy4f3cp/hQ==
X-Google-Smtp-Source: AK7set8JY/HRGtAap5oncPC8OXGjI+/H213uczbb25qb6iUWBoNSy7O1cmIlZg+GOkn3cuww2XIewg==
X-Received: by 2002:a17:906:720f:b0:8f2:62a9:6159 with SMTP id
 m15-20020a170906720f00b008f262a96159mr2980463ejk.2.1679411850687; 
 Tue, 21 Mar 2023 08:17:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817?
 ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a17090666c900b0092b606cb803sm6033076ejp.140.2023.03.21.08.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:17:30 -0700 (PDT)
Message-ID: <d8be08b9-3043-d517-b5b8-86ea7a602e0b@linaro.org>
Date: Tue, 21 Mar 2023 16:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
 <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
 <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
 <55cfacf6-03e0-b9bc-83f3-3e9f2d7b2d4d@linaro.org>
 <d72bf0df-28d7-6419-56a5-58e04dcb30f2@ti.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d72bf0df-28d7-6419-56a5-58e04dcb30f2@ti.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, jani.nikula@intel.com,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 a-bhatia1@ti.com, alexander.deucher@amd.com, yamonkar@cadence.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, tzimmermann@suse.de, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2023 15:28, Jayesh Choudhary wrote:
> 
> 
> On 21/03/23 18:08, Krzysztof Kozlowski wrote:
>> On 21/03/2023 13:02, Jayesh Choudhary wrote:
>>>>
>>>>> +    type: boolean
>>>>> +    description:
>>>>> +      Set if the HPD line on the bridge isn't hooked up to anything or is
>>>>> +      otherwise unusable.
>>>>
>>>> It's the property of the panel, not bridge. Unless you want to say that
>>>> bridge physically does not have HPD? Does it follow the standard in such
>>>> case?
>>>
>>> MHDP does have hpd. But the mhdp driver should handle the cases when the
>>
>> This is about bindings, not driver. Your driver can still handle this as
>> it wishes.
>>
>>> hpd pin of bridge is not connected to that of the DP-connector. This is
>>> to add support for that. (optional property)
>>
>> Which is indicated by panel no-hpd, right?
> 
> Actually no panel is involved in this. For TI SoC J721S2, the data 
> pipeline involves the bridge whose endpoint is directly the DP connector 
> with compatible 'dp-connector'. And in the binding dp-connector.yaml, 
> there isn't any 'no-hpd' property for this indication.
> 
> Does this clarifies the issue? Or did I misinterpret your comment?

Yes, then you only need to narrow which hardware does not have HPD
hooked up. Or at least clarify that it is not about driver having or not
having HPD control...


Best regards,
Krzysztof

