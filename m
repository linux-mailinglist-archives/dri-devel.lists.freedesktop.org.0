Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713965A6E9F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 22:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E84710E154;
	Tue, 30 Aug 2022 20:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2E010E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 20:43:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id v26so6918797lfd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=zpTPbh+6FTpWjU33//CbUrbH55r5RpLUSqoVVWTiTkg=;
 b=pQd2svsP6AiR6HSTgGGNL7C2Z41Cr+giRe+jvUNzgWqXWB5gyTRpD6hQ7QjxyBDLmk
 kEZm17wyCgjgSJ0qaTchdgwTlPDbgUUbirEHP7JMYPqEIHKII68IzTj73W/6GOsVlasC
 1kOU/omAvQMJtW0F/QBVyDRwyf1fsyVXl+Wc0wuuAzFb/XnvdmTsHkZIaAVDJVMTTNtt
 4FrxcOZbOtlYVKL96zhHt1Uow8Z175SmbPyGDcbVW6ZOM1yGpDi23R9WaRO/iSwmgT+b
 2zw4zmuFI1782Vt03Hy5crt3m1VTjSG6rUZ4FhJzjjLVKiMILaIR3Q/wrEq6+moXIHDh
 XWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zpTPbh+6FTpWjU33//CbUrbH55r5RpLUSqoVVWTiTkg=;
 b=iOR9HoG6rPWaH+HZiA/5aveWpDE24P2N6rjIx+1+tkcHjldPDpArcV2qPvLS0yZs1g
 qstp8ELBPieFiZWrq5E/tn7UVBD3W5GVbkqS5pGDAaxdnjGhLeDhjzu+lxiPBirChGtc
 LMf244UAY9dGItzF1ZxKCJdQgBjzG43bmWFU6THYAdadKoELwCcQll2Y8tAtXBtGprs0
 AT74NRjajwNRkCbDALecJPNwOcYBULhNpoabLySMmUtGuRFG4Xn5ypspkY4rR5SJp/fG
 XBS882BvrnOFVoXRFCKIxhXX4GdHAbkppEY+lh7WS/kpJ/02qFwY3HuLFrO5/GPINic0
 /Ukg==
X-Gm-Message-State: ACgBeo0vtcdJOyzVT4XyyW0LbtUv1v/0U530tpT7Yk8ENofbl0wd+Pht
 npjt0mXb7PcjFMHZRTqXxv/99g==
X-Google-Smtp-Source: AA6agR5TQdXplaX1+ZJ7P+5UuosDsU+hXEk3qfcGOu4a7qmInmeR6MkJlKrM6t5jZHhl01ECVVOaig==
X-Received: by 2002:ac2:5fb2:0:b0:492:ea4f:b73c with SMTP id
 s18-20020ac25fb2000000b00492ea4fb73cmr9008383lfe.296.1661892221227; 
 Tue, 30 Aug 2022 13:43:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f13-20020ac251ad000000b0048d1101d0d6sm1720449lfk.121.2022.08.30.13.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:43:40 -0700 (PDT)
Message-ID: <c2559d11-3169-454f-8376-e4500c4e7de9@linaro.org>
Date: Tue, 30 Aug 2022 23:43:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: build failure of next-20220830 due to 5f8cdece42ff ("drm/msm/dsi:
 switch to DRM_PANEL_BRIDGE")
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
References: <Yw3V8yJgAnPD8o6P@debian> <Yw4FQm6V7d3MuMKG@dev-arch.thelio-3990X>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yw4FQm6V7d3MuMKG@dev-arch.thelio-3990X>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30/08/2022 15:40, Nathan Chancellor wrote:
> Hi Sudip,
> 
> On Tue, Aug 30, 2022 at 10:18:43AM +0100, Sudip Mukherjee (Codethink) wrote:
>> Hi All,
>>
>> The builds of arm64 allmodconfig with clang have failed to build
>> next-20220830 with the error:
>>
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>>          of_node_put(device_node);
>>                      ^~~~~~~~~~~
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>>          struct device_node *endpoint, *device_node;
>>                                                    ^
>>                                                     = NULL
>>
>> git bisect pointed to 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
>>
>> I will be happy to test any patch or provide any extra log if needed.
> 
> Thanks for the report. I noticed this yesterday and sent a patch:
> 
> https://lore.kernel.org/20220829165450.217628-1-nathan@kernel.org/
> https://github.com/ClangBuiltLinux/linux/issues/1700

Updated and pushed the branch to unbreak the linux-next. Thank you!

> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry

