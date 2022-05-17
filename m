Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37139529CD0
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B2510E6A5;
	Tue, 17 May 2022 08:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE3510E6A5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:43:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ch13so33198782ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2H+kyojoKMIqacwlCH+yjlqbOTerfAkahQ6Tr2/rTHg=;
 b=RuxlII7DDT22gV3GAwwJTVmCMCV4pDM4pbh+o3BD/8obibk5uM02ZTj7eCUeBuVoXH
 SN/TOA4EpDEQgZUVUSqNFUl8r/odk0k6Zw2w6nGkGPVivm4uqhHAzIb1S0exTpPv/CVl
 UHNifheqVZ1n43+Hxneac6yJGSZh/KVMplobKOtY9icqW1fuAFoVZhSdTigz5mwd3+I9
 LFiOVvcXzA+zcGoFSQ03X+W7J0+jB3YqoA2oQUxAblos7JNxydqJNQttB2HhBmSelDIB
 s5qWALHMM6w14rAV2KzlragLqUThmueQe93Fa9sZ28DAJ+9KrhZEvToL+TyR6qecoRGK
 EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2H+kyojoKMIqacwlCH+yjlqbOTerfAkahQ6Tr2/rTHg=;
 b=SoxoLM+wbzBOELbR790iYSNqigqJfaVT1TCyMaBZrNkkcm0wj593d6ZBz1PWd5sDD5
 aWyNYWOURxIeW9FKAhmq96HS1pS2tgV/doF58l7mlhYr6RdC2G5My2cvNc0ZZ73dlajX
 a6YCxgwxVILIiq97JdxmMDiPWRBfnaTfPaSoQ6bCXamLI1vHEB7mGt2nmWCDVJROs/nN
 mR1MBLGmWennNDUTi97oG1ko5WHGx5JlkTy4ZADm57j+B7HAoaYvV2YFuUFGWfz0ae7R
 q88QElP1wYTDtFY+EeeIM/q7N15qijjS0BEf3jkrf6Ff+2HoNshKwPYJhD7XtmZsCu1E
 mHkQ==
X-Gm-Message-State: AOAM530cfjpGrOsKEPblGvZ12GS3XUfpThrRFaz6gWbI2JXJQY7EaHAh
 0wjm6+X3SZbMcydNxc/um653bhbShohFz31N
X-Google-Smtp-Source: ABdhPJxtQjXQRb10lFqBAUzMfJDMOxeVz25FrJyNKeUEWXkNqJZB5jvCADp0PGfSltuUqftQ/W2Wkg==
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr18406294ejc.101.1652776998992; 
 Tue, 17 May 2022 01:43:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c14-20020a50d64e000000b0042617ba6380sm6658474edj.10.2022.05.17.01.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:43:18 -0700 (PDT)
Message-ID: <e77d83ee-c045-26a6-15bc-df49a3b880ae@linaro.org>
Date: Tue, 17 May 2022 10:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-3-cyndis@kapsi.fi>
 <20a7087d-dddd-134b-4cef-0ebcbc5115f3@linaro.org>
 <3b1e22cf-a439-2d84-a1fc-dd352a3f1b2c@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3b1e22cf-a439-2d84-a1fc-dd352a3f1b2c@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 10:41, Mikko Perttunen wrote:
> On 5/17/22 11:02, Krzysztof Kozlowski wrote:
>> On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Add clock, memory controller, powergate and reset dt-binding headers
>>> for Host1x and VIC on Tegra234.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> All your patches are send from wrong email address and the SoB chain is
>> not correct. Please add respective SoB.
>>
>> This applies to entire patchset.
>>
>>
>> Best regards,
>> Krzysztof
> 
> I can do
> 
>    Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>    Signed-off-by: Mikko Perttunen <cyndis@kapsi.fi>
> 
> if that is better.

That's not needed, if your name was in the sender field. The trouble is
that your name was not there and I have no clue who is cyndis@kapsi.fi.


Best regards,
Krzysztof
