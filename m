Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70F708AAD
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 23:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624AE10E558;
	Thu, 18 May 2023 21:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3E010E137
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 21:40:08 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af17733069so14102411fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684446004; x=1687038004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40Gyat26WkNmThn0Z4RZrSZ9NCA36CB8DB/834bSSl0=;
 b=KQl+dpi4yYFPPJ2Dklv3J6mZgwBwxHqQu8bTfWom/qlifttbvf9I/QMY5FDPFbUmgw
 PlShh3povoE+USTTHvOCFyTgZoUm+Gi01uQ4PbBEzSeMyBxNpOASgm7d2aClmqdBGzYe
 3fKDjxlPsMyNrg/9qVN9c8KbpvARfyxuHqSh0hBgkdnrjdFJP8oPJVLdMvR/T4M7Eyxb
 V8IsAAKp9L7lML+BXFEGabutSnq3jz7gbVl2QvQnKxhF0orRzAfcVMoyE2gIkzOsRz0A
 Romuc6d4kFoiwdzgs1kq07xWPsZ5v7ybSjnTCAHsoq72zg++1yGV6r41rhy/vHz+L/Xk
 G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684446004; x=1687038004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40Gyat26WkNmThn0Z4RZrSZ9NCA36CB8DB/834bSSl0=;
 b=BeJ175lKhWPVOH2NjATh5auX7rACvYnU7ldsRtN+nRCDGIqVrdOsli3yecbuG3mtCS
 edkMMgPHH4hE/qidv90FcAcHtLgXL8i7c2cuzBR+j7DCulluB8WFIDUKBEiVkLZz9dzq
 wUZjrDdzxQRC+nzriXKEiSVaVFQCpmPlC5w3EW7mmFxWNoTU2P8xRMI9RQVrSIJOCysZ
 A8zxnjAh9llPWuKAwx0Wdqqps+AOa7T8rMv9yi+Z2EN3eMxtexiREg/QaMnjes9xwfwd
 8xp1dh3ZeX8nbjToyUeIaayTMPgvjVu3Wb4X0ng7SQXpqodWWXMWf76VGhlBdjDMkyGj
 7D1g==
X-Gm-Message-State: AC+VfDy/HOR3r7TXkrIwRooZTvsw16KLj64/2+F0l7RJ/6Cvk/vMt8ku
 3pN6nomRU2OUA514GeORoo0SIA==
X-Google-Smtp-Source: ACHHUZ5hhPS7K0DwnDGSmlF1ykN8yav6TjZWFfP3drK4OfdV/QumBkZzlv1FLbSdbEgv25/REZApYQ==
X-Received: by 2002:a2e:804e:0:b0:2a7:b1de:3ff7 with SMTP id
 p14-20020a2e804e000000b002a7b1de3ff7mr11114773ljg.16.1684446004525; 
 Thu, 18 May 2023 14:40:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002acad2f2994sm484810ljj.127.2023.05.18.14.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 14:40:04 -0700 (PDT)
Message-ID: <ae1cd755-ead4-79e0-8d12-074f08e592f1@linaro.org>
Date: Fri, 19 May 2023 00:40:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
 <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
 <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 00:39, Marijn Suijten wrote:
> On 2023-05-19 00:06:15, Dmitry Baryshkov wrote:
>> On 18/05/2023 22:14, Marijn Suijten wrote:
>>> On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
>>>> The src_blk declares a lame copy of main SSPP register space. It's
>>>> offset is always 0. It's length has been fixed to 0x150, while SSPP's
>>>
>>> It's -> its, twice.
>>
>> Ack
>>
>>>
>>>
>>>
>>>> length is now correct. Drop the src_blk and access SSPP registers
>>>> without additional subblock lookup.
>>>
>>> Note that the block code still calls `dpu_debugfs_create_regset32()` on
>>> "src_blk", do we want to rename that?
>>>
>>
>> I could not come up with a better debugfs file name, so I decided to
>> leave it as is.
> 
> Just "blk" or "reg(s)"?  This already sits in a dspp/%d subfolder so no
> need to repeat "dspp" at least.  But also fine to leave it untouched for
> now.

s/dspp/sspp/ ?


-- 
With best wishes
Dmitry

