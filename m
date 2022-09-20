Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52365BDDD2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CF410E14E;
	Tue, 20 Sep 2022 07:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDCD10E29C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:09:16 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id c7so1831981ljm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Wo8uP5ffgZyZWYK9afaO+p/W/5Kwf864osF/ckvXkRg=;
 b=grzro9B7+WgfVf2xBiNjkxTYALekfROadRmRfJuBoGy5IpiijPZGNUGpa2HgNc+O52
 gtc0da8IZopEEne89hAZlYzfr9DGVMejFi1IJejkP23YUHixyjYVebTZDFQo8nQhHwvY
 U1UnDmZbIGF/4WgyGLcWn/7vwina3T/z4WzHdVWwdL1T8AaIiS3kx8NSnqq8P4nkdVp+
 KkxzpFx3UUa91XTE0ZHVaevoiZtw3FkGLvHJBr4qv9jK16plWRc0jy+tfyul0TuMMqRa
 X3jz1lCo0/Hl8QGGXedKkpK7GCjKz5VX1Cfpc4Y0jB3phALjZWKNg/ucfpHL+H6jrVkZ
 6ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Wo8uP5ffgZyZWYK9afaO+p/W/5Kwf864osF/ckvXkRg=;
 b=lQ03g9a5Fx0OjLonjSdVOkh4skQgf4dJ5mmeuyiESsr6qsRDgqkUMVs8hFAEJyjKhq
 oBeT0mU7WpPpeGYC44N/PaqPkTFuCzcXqPMwxjpIYcJkg3IS2BtZylj3/QTUx/gWUfaC
 CnK/qChvSnG+D5uMuhVZ3Toug+24oPtYhS4A0sjHaoOXrOQw55yCJ0tU3vrr/2sn3+pr
 Hg2GPX1Pef1LJHtrM8M8uYe9hhEcUsiB39pIPq1InlNaoZp7a3IrgCoIytlVjRKwGzAC
 wqCcq7GFobbO37E3zrihvhErGlvAi595YSHgvWhsMitjpZSrHrdDNbDcrhG2Ex/M29s9
 4WWw==
X-Gm-Message-State: ACrzQf0Q/J/abebu/Rjh2HFf+4PlSEWtoKWGBxU5aO/1syPHUciGTHe2
 pi8Ou3o67Hf6Qvbi4UQTpYrV9Q==
X-Google-Smtp-Source: AMsMyM5k368tciyRffIEz9KEI7TXQB6utOD+AnJuFSrX4KDaWv/fY/Ol3hSX1jO8ZUTskHXRihVDqg==
X-Received: by 2002:a05:651c:50b:b0:26c:2962:bf1e with SMTP id
 o11-20020a05651c050b00b0026c2962bf1emr6119083ljp.343.1663657754595; 
 Tue, 20 Sep 2022 00:09:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i189-20020a2e22c6000000b0026c1b85d8b3sm113960lji.34.2022.09.20.00.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 00:09:13 -0700 (PDT)
Message-ID: <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
Date: Tue, 20 Sep 2022 09:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2022 23:18, Bjorn Andersson wrote:
> On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
>> On 16/09/2022 21:00, Bjorn Andersson wrote:
>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
>>> Qualcomm SDM845 and SC8280XP platforms.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>
>> No need for quicinc SoB (unless you also take ownership).
>>
> 
> It's my understanding that both needs to be there. Bjorn @ Linaro
> authored the patch and the author must certify its origin, but as the
> submitter I must certify its origin.

It's the same person. There are no two Bjorns (unless there are :) ), so
you certify with old email. SoB chain is coming from people, not email
addresses.

And it is not only my understanding of SoB chain.
https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/

> 
> I'm not entirely sure what you mean about taking ownership, 

I meant you to be the author of the commit.

> I am going
> to pursue getting these patches landed. But it wouldn't be correct for
> new me to claim I authored them.

Yeah, that's true.


Best regards,
Krzysztof
