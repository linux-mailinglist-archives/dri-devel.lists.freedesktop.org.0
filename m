Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A07151D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE3810E303;
	Mon, 29 May 2023 22:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41010E304
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:22:58 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so39905561fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685398977; x=1687990977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CacyKJDs0TwccXk8Y2BpiVD4xzwKS7twTew6/d7m+ng=;
 b=IxnAYuvomhFopespf5o8lHpbTmOQRn681oXAqbcEcZeY0fQNoiol/LZWsGfWUaUQ4L
 e0q/InGqYVrptj2e610FH8w9eI2o3z9yfmeZ7n0sqVKQW5xJ3M7M3cQhqls+IgLiAv7a
 9SS5HJZGfjtZv5vVCWcBwbI2b8XsmAOAEKjullK8zwjZt7/XpwQ2NY9PKlgNlYP9UhiM
 BYUxmp6jPGYZ7IaMDe9mZvyGiJsqbuxZSKNoNFtdV591XLaGG1iTGqnJqN+sXLjQO8WF
 5OvtWtqloKmR1jzrYKv9zExRy9UoSbtNbBuWaYzrec8syooRwl6U/1HJBGg52TVqfdD2
 PcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398977; x=1687990977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CacyKJDs0TwccXk8Y2BpiVD4xzwKS7twTew6/d7m+ng=;
 b=XJGIhg5NzI8SbPb43r64BBEjzplQpj9h3Y+Ok+YoPo121QRQ9MIwYgg8SGmHSuhfT9
 gWJcK66Q0yQGBVWZqfqwSjcy+h4c9KFANUuEE77yReQJl/4wR1XcBqDB7EsW222gpPwt
 M795Xrn7OFCZf5Ls7Af6zK3eIsVBglcZ8j3rtELfryaS97mk91Shl/tB0BrwpDw4AZXR
 GJkYg4hxpf1IA+v8ihOaNQh8wWC5HZqAsfSU4FNuFxPN+dX1P1k2R2PsIyvnD/9BQN3o
 MfXr9RYZP+rf8Oi9uc+t0ifUA0ytwVQe8H3EYZMoP1b/SI4/vJTV3DL02P9ImPDkFYur
 gjsQ==
X-Gm-Message-State: AC+VfDwTHQ1CAR8D4NXsabsHGIHfyXus7sv3l/F4dkOzLZ+IKxkb9zxG
 h9yXNVaRBBANsTFR63ISosnH6g==
X-Google-Smtp-Source: ACHHUZ5W8JwDKtkVet2l/mEqOjgDKnZ3YtR6G82W2YMhFncgq/Q6dszku5kKYy240d8anXq/A0cpwg==
X-Received: by 2002:a2e:9c8c:0:b0:2af:237b:ced4 with SMTP id
 x12-20020a2e9c8c000000b002af237bced4mr5026008lji.9.1685398976791; 
 Mon, 29 May 2023 15:22:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a2e994d000000b002ada0c38963sm2539263ljj.62.2023.05.29.15.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:22:55 -0700 (PDT)
Message-ID: <3839853f-eca7-5ff2-db90-51c014baff06@linaro.org>
Date: Tue, 30 May 2023 01:22:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 08/10] drm/panel/samsung-sofef03: Add panel driver for
 Sony Xperia 5 II
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
 <4679c741-7877-ce79-4086-08ec4ee9e6bf@linaro.org>
 <cf5dea0f-5999-6ac4-4f04-9b397ca94fdb@linaro.org>
 <g2f7oeoo5dljqpl7mwguoh5c766obe7vfltc2vlhx4c2na5ymm@pr2p6l5vewq5>
 <80372e51-e72f-e70e-c205-8bd79ad57515@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <80372e51-e72f-e70e-c205-8bd79ad57515@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Caleb Connolly <caleb@connolly.tech>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 00:29, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 23:21, Marijn Suijten wrote:
>> On 2023-05-22 11:08:12, Neil Armstrong wrote:
>>> On 22/05/2023 03:23, Dmitry Baryshkov wrote:
>>>> On 22/05/2023 00:23, Marijn Suijten wrote:
>>>>> The SOFEF03-M Display-IC paired with an unknown panel in the Sony Xperia
>>>>> 5 II always uses Display Stream Compression 1.1 and features a 60hz and
>>>>> 120hz refresh-rate mode.
>>>>>
>>>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>>>
>>>> Konrad's S-o-b is also required then
>>
>> I am unsure what to include here, since Konrad originally "authored" the
>> commit but I believe it was nothing more than a completely broken and
>> unusable driver spit out by "The mdss panel generator".  This needed
>> enough rewriting that I don't feel like giving it much credit ;)
> Might have been. I won't be mad if you drop this!

I'd say, either add S-o-B, or drop C-D-B. The Co-developed-by should 
always come with the Signed-of-by, otherwise one can not be sure that 
the co-developer didn't copy-paste some super-proprietary stolen code.

> 
> Konrad
>>
>>>>
>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>


-- 
With best wishes
Dmitry

