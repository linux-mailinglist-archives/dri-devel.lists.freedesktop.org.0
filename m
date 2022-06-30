Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BBF56227A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6154212A85B;
	Thu, 30 Jun 2022 19:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3912A85B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:03:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g26so40775501ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GpKJCo0z+0F48dHPgWjsxiLcXHO5Rv5PyoIecr+e2rs=;
 b=MccCW8dY7vG3xhtvzfyIfsmly5wO9Bj3r/786LZlsTGJG1KtSTawNyUDha23FOPdbt
 in321vPuFvG5p140Q3D+gRkJQIESxX/qIta4M+mYf5Xs2RUmXsaBoclV/MK7CAbYewtc
 tgKHKVu9cpUg+dV3bSHaLQdx1Nfmzu088v5fqh/+I8Dil02llhQyd4F824GEa/1UeqZ8
 aI85iC0P+64xOSKC9i5kStuzFf6bVycus9GZo7SbUY76978kgcdxbTdxw4jXVdZprPTt
 KXBVgQi+KLoL/eCP90eaIW4rOQWYYx4hRVwq1xQkiFq6R6fgtks2QviX1VowECBbr2Xd
 q49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GpKJCo0z+0F48dHPgWjsxiLcXHO5Rv5PyoIecr+e2rs=;
 b=WmxkE/v74op4qZoRWQ/ZQhW7HcZhm9QQlhIc4agesk6KAQa4l/q5yOVoaoMG3vM99f
 O7u7caAImAgSZoPF4XLNIjPLTe65sYuuUuNE8QYICix2QYqOuoXyJs33iVVIAi6Dkocf
 7jtCDTNxLHzvaRK9NpiOu7YaVga+NmabFdF9bphAwJ6FjHUA8NkhsmZyxSKnJeOT/Wrk
 MUWkW3+/iJtJ7FRqFp8XWgLs2CGyMUlees08E5uXI4/MimYK3BNP+DrGJK/qFe+zJTSJ
 kRfdUhO+9qu1Hm57PYk4a5prDeE9Q3y3Sf0RM3JMcWU5X2HSipRrY2/Zgub4XNOjPahs
 Cm5w==
X-Gm-Message-State: AJIora9uZgrKazLRERDub+0fGogyr2BDrY0uUl50UWTGzDmix/7LfXJl
 xTjMDZ+u3i+4tWvjQe/7/x9ofA==
X-Google-Smtp-Source: AGRyM1so7aTmcV3aL5Tj0v8g4vOpq7WUBZK6Lcz/cmcmwzkaTjOH+yON1rQFOa6/2xM9DqNP+6+aiw==
X-Received: by 2002:a17:906:4f:b0:712:af2:29d9 with SMTP id
 15-20020a170906004f00b007120af229d9mr10490071ejg.751.1656615788289; 
 Thu, 30 Jun 2022 12:03:08 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d10-20020a056402400a00b004357ab9cfb1sm13692392eda.26.2022.06.30.12.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:03:07 -0700 (PDT)
Message-ID: <b0a2686f-2749-1269-4855-0f889dfd056b@linaro.org>
Date: Thu, 30 Jun 2022 21:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
 <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
 <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 19:30, Bryan O'Donoghue wrote:
> On 30/06/2022 18:16, Dmitry Baryshkov wrote:
>>
>> All three descriptions are the same. This looks like a c&p issue
> 
> Those are what the previous values were.
> 

No, original TXT had different descriptions:

-- vdd-supply: phandle to vdd regulator device node

-- vddio-supply: phandle to vdd-io regulator device node

-- vdda-supply: phandle to vdda regulator device node



Best regards,
Krzysztof
