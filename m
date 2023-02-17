Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AB69B4F8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F910E468;
	Fri, 17 Feb 2023 21:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D910E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:44:05 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y29so3024059lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9whoLgYkr95I0qmzXxoT8Zd23sf4lcMepCK7U4SK1Ys=;
 b=uuhvqZnn4VGWdAwMrVDsiJOb+OngVD49lR7BaqumkAZlmSVVZ+bO1BBC1XshQ3i/Ng
 sLkP966ekriU9WGhjdx43i41ZaKO1qzKRYu7z7LK8uqj20q3l9/hV2sWGK8zAVdQCTcj
 6MoSJ57P0YrGj56XmL/WU5Zxv6yJriy/YhQDCYnd8ljvl9s2x41tyu4LdD7Zz/xEhSzn
 /TPVgIedtB6M8THj+z1p64u7fHvHXTOtubWu9eRBt1/bYf6/5oAIuC2GftNZ+zSmwXiq
 Z55Gx2OX9yXui6OAappzqczS0ubsq2LJbe8G7fgCzTe4YUU12gu6x8dk+myZVC+MQNTW
 /RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9whoLgYkr95I0qmzXxoT8Zd23sf4lcMepCK7U4SK1Ys=;
 b=DCEzcNiiJOfYDjDSQmJXGNe2kfUTkwuZHKANfLh59b9fxDDqaCvrL2y2a53+BN2i+L
 0/InSOSfxprE9sTXfVzTF2/5ukI3ikkKNH3QoKdDLaGGsV3jiuo0+HPt+R4DrEpkXqEz
 pmgtVBs6nLTtEKHx1VDy8J1/TU3NWHpkiWNMnwBmiEGTZywW32pBgADMdNN8kugW3EDy
 qivCbbULATJUdMCiVWCCCVXF15G7sLDFYlSrwwYqR5BiEsRWmSMYrkBRiV8c7WQjSpRa
 e6Owzwtt6oM90YI3Gvb65yipvY5SpUOQShpJQfMZHeFM1T/HKb1QnSSZg0UKd9WdJMUN
 CgMw==
X-Gm-Message-State: AO0yUKWgvMGIhIdjJzaeGGFk/61tliOVcJSovrnrWx0huJZr8IgW+id6
 kpaH7fGNFs+MuWm0GKfOX3PSEg==
X-Google-Smtp-Source: AK7set9P7pckgC1TAH5/lIS/YQtMX5b7b17rnIuijGqF+/f/RFGYFN1NPluvCm3J/1jazGtHEUduuw==
X-Received: by 2002:ac2:51c7:0:b0:4d8:82d9:3c10 with SMTP id
 u7-20020ac251c7000000b004d882d93c10mr454459lfm.63.1676670243521; 
 Fri, 17 Feb 2023 13:44:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v12-20020ac2592c000000b004db4b7ad6d1sm788429lfi.31.2023.02.17.13.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:44:03 -0800 (PST)
Message-ID: <aba38acf-d68f-27a8-eccc-f4a7b3b3535d@linaro.org>
Date: Fri, 17 Feb 2023 23:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 03/14] drm/msm/a6xx: Introduce GMU wrapper support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-4-konrad.dybcio@linaro.org>
 <caae5c4b-4aa6-5219-3278-92c3bed7868d@linaro.org>
 <1c2f6e03-8b16-1ee2-bdbd-8f84219acb36@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1c2f6e03-8b16-1ee2-bdbd-8f84219acb36@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 23:41, Konrad Dybcio wrote:
> 
> 
> On 17.02.2023 22:37, Dmitry Baryshkov wrote:
>> On 14/02/2023 19:31, Konrad Dybcio wrote:
>>> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
>>> but don't implement the associated GMUs. This is due to the fact that
>>> the GMU directly pokes at RPMh. Sadly, this means we have to take care
>>> of enabling & scaling power rails, clocks and bandwidth ourselves.
>>>
>>> Reuse existing Adreno-common code and modify the deeply-GMU-infused
>>> A6XX code to facilitate these GPUs. This involves if-ing out lots
>>> of GMU callbacks and introducing a new type of GMU - GMU wrapper.
>>> This is essentially a register region which is convenient to model
>>> as a device. We'll use it for managing the GDSCs.
>>
>> Why do you call it a wrapper?
> That's what Qualcomm calls it.. The GMU-less GPUs have (almost) all the
> same GMU GX/CX registers as the real GMUs in this 'wrapper' region, so
> that lets us reuse some code with gmu_(read/write/rmw) calls.
> 

Ack. If you can add this to the commit message, it would be great.

-- 
With best wishes
Dmitry

