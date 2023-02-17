Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8669B504
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1CE10E469;
	Fri, 17 Feb 2023 21:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4A610E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:45:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t4so2402685lfr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aJgo6ul60Cbzprplm9cKqpN63/vkUMUzHN3LDsBeStI=;
 b=h7m7n6VTI/ugoEkovIUKo4Xh27r9HweKwzvbbhIkVk2y0G+00FjHLND3UM5NO/ryD0
 Tg9QmrFvFOyQzdokRmhbsklg7x+4XBUNEc9EWT0xTCsu9TI4fUYXbNW7W0KKhr+gHrFA
 qNxG6r6NUMYl0AEWkYo/UATM2L5SpMu1WkRKD1tlatsb9+Ad7ge8JmB4pnXIuzlA9Nv5
 x40IY/9g6ODPZz93arUAEluZN6enu8yjRParfYSK76TPfusoi5x1K7wsAXAOOJ+BgFH0
 xUWahNpRIsZrHFoJdJPCLqRQmEJX01VnfsqrZGUYvk1y4phXbABAGH0NyTCt7rHwtewW
 ex9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJgo6ul60Cbzprplm9cKqpN63/vkUMUzHN3LDsBeStI=;
 b=xDMTxoY43/a9K9zVgzyeOUMeVdNIgcOeCREgFXosaCqTl0CKos69bVRyksr/yUmY12
 FhBBtrbqHuz8MV312rCp9AOBRUgzLB4gP/7n+ppbfdI3ldAc3Yh3WhIS3z7ZzCs4tUnY
 2pRqoyw2T5qHAk+OZbaUNJUAw2pEK6QVJy07/cLWvkF1JDKGBC78nbzWfepRbKY/VlHY
 op0E0/YBbdJrUUCdOgM8xtMCcN/AAtZ4VpJbK0ltF3DnnrBvu4Y9EAeceaNZfYOO5VED
 5Gvy5zJ1WfadqFyokQ4gfXbzL6aEdISYy7ApUKGO8jbFsdmPG6VTb4kC93Zj1GweiqCn
 eDkw==
X-Gm-Message-State: AO0yUKW5QW6XnjOy0VCsJdbDjGDcV5e8xghBBgXudnetPjhXuGNO187J
 t3VFpy6HwP+iCeHOcLkvLJXxww==
X-Google-Smtp-Source: AK7set/u1kwPqjUW5A7pVAifFgobOYozdSSvCwdLULWacI3kPnDOZkk2g2Lt2ZNLXiIY+IbDIFCWNw==
X-Received: by 2002:ac2:5443:0:b0:4dc:828f:ef97 with SMTP id
 d3-20020ac25443000000b004dc828fef97mr1303357lfn.60.1676670326613; 
 Fri, 17 Feb 2023 13:45:26 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 z9-20020ac25de9000000b004d39af98af6sm783983lfq.81.2023.02.17.13.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:45:26 -0800 (PST)
Message-ID: <8547e66d-504d-3e1c-9356-3c5f1618ac91@linaro.org>
Date: Fri, 17 Feb 2023 22:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 03/14] drm/msm/a6xx: Introduce GMU wrapper support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-4-konrad.dybcio@linaro.org>
 <caae5c4b-4aa6-5219-3278-92c3bed7868d@linaro.org>
 <1c2f6e03-8b16-1ee2-bdbd-8f84219acb36@linaro.org>
 <aba38acf-d68f-27a8-eccc-f4a7b3b3535d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aba38acf-d68f-27a8-eccc-f4a7b3b3535d@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2023 22:44, Dmitry Baryshkov wrote:
> On 17/02/2023 23:41, Konrad Dybcio wrote:
>>
>>
>> On 17.02.2023 22:37, Dmitry Baryshkov wrote:
>>> On 14/02/2023 19:31, Konrad Dybcio wrote:
>>>> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
>>>> but don't implement the associated GMUs. This is due to the fact that
>>>> the GMU directly pokes at RPMh. Sadly, this means we have to take care
>>>> of enabling & scaling power rails, clocks and bandwidth ourselves.
>>>>
>>>> Reuse existing Adreno-common code and modify the deeply-GMU-infused
>>>> A6XX code to facilitate these GPUs. This involves if-ing out lots
>>>> of GMU callbacks and introducing a new type of GMU - GMU wrapper.
>>>> This is essentially a register region which is convenient to model
>>>> as a device. We'll use it for managing the GDSCs.
>>>
>>> Why do you call it a wrapper?
>> That's what Qualcomm calls it.. The GMU-less GPUs have (almost) all the
>> same GMU GX/CX registers as the real GMUs in this 'wrapper' region, so
>> that lets us reuse some code with gmu_(read/write/rmw) calls.
>>
> 
> Ack. If you can add this to the commit message, it would be great.
Sure! I spent so much time on this that I can't really tell what's obvious
and what's not anymore, heh.

Konrad
> 
