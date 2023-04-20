Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAC6E9ECE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900FA10ED07;
	Thu, 20 Apr 2023 22:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6021F10ED07
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:28:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec86aeeb5cso947091e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029692; x=1684621692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wJsMjTzILrouzKr+eknMhhMXReN576hgLHcFIjcVkig=;
 b=tZ+pHzAz7K05Ml7vyAyOeFzXW7GNQ86dqUHMye2xs5c4soQgdpYTCy3P1Wyx19H4bJ
 vVqqoFFPSinMQYoFil/xU3ezXH9nUAoH3brdvs1fDql1z5kJ6kMeQuRUnj0ubrrT/GWQ
 e9fNhB9L/MhESjQ0JqLwsteMM1UrOyPbr0BjX1LQ+jyCVT9pAk1IcerIizFiBGE7d094
 rrAxXHTrmcXERk0P3o3qOrP+ZXpTIsCCo5Fu9vsg1fZBsGGkq/rwY/9AhuSzNmB8MXHU
 IwVPMKMkTzG/5PRLa9jWH9bLeEWAvaXEHSANho71reFoWIXwYYDjQnsS1aSW0jjOI0B4
 dZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029692; x=1684621692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wJsMjTzILrouzKr+eknMhhMXReN576hgLHcFIjcVkig=;
 b=R+4oXJLki5mHi8ufICOxf5M+IhocYeR9R47Ua2YRLD6xjlTTgjSYXx4U3EutqDBUwf
 xPSBvLvpThSONavQVI/NmsFBNBRXd37BMObys4gc9lgCRq4QGRdXyKH72n5//chG/LDC
 4Vb8jhevefUKo1YuJCVCm6kzrpM6Ji1I2ubM1na/CW3RO85wvixX3cHobHT0JXQSm2yj
 ztyb3Vq2XZvrrCDoCUc2/y0g9CtIU4FLm6blpeaxKaif4kXAy8V7+6smNLS0j5epqv5T
 kqz5GurgXZ8Yd3RS5Dl8vM3B6KrbKxL5Tb34PPtYy6IcZqYgaF2JE2nV42OVF3rOPpWV
 dPMw==
X-Gm-Message-State: AAQBX9eVdxRJjIjWsQxrLwaYhcYY8bEfeC0rRcrDNDWQTXUw8v44YPn3
 FDiZCz45Pu5QWMVvHPRyhvU1aw==
X-Google-Smtp-Source: AKy350bchLFLfQc9vyKcrJ9j9ObTS15sUpUmjEQY/7NEyIQ/xTevNiOWcbViiYTQ0mFWYlYb2H/R1g==
X-Received: by 2002:ac2:4c8e:0:b0:4ea:f526:5bef with SMTP id
 d14-20020ac24c8e000000b004eaf5265befmr701516lfl.28.1682029692099; 
 Thu, 20 Apr 2023 15:28:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a2e8783000000b002a8e4678da4sm397332lji.139.2023.04.20.15.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:28:11 -0700 (PDT)
Message-ID: <6335ae3a-0370-92ed-9bc8-d8448db50627@linaro.org>
Date: Fri, 21 Apr 2023 01:28:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 11/17] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-11-ef76c877eb97@somainline.org>
 <20fab838-e05b-163d-aa72-bd8235df9f2c@linaro.org>
 <38030486-f08a-33e6-f8d1-3f4de379a75b@linaro.org>
 <3d1b08f0-adf9-8815-46f7-c31b54a7140c@linaro.org>
 <fxph57xh3waxv7fpjnmgai4krpgrdxf3bmp2b3vbpgqbmkcy6u@ib3ds6idhgwz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fxph57xh3waxv7fpjnmgai4krpgrdxf3bmp2b3vbpgqbmkcy6u@ib3ds6idhgwz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 00:51, Marijn Suijten wrote:
> On 2023-04-20 04:03:31, Dmitry Baryshkov wrote:
> [..]
>>>>>     -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>>>>> +static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
>>>>>             struct dpu_vsync_source_cfg *cfg)
>>>>
>>>> In my opinion _v1 is not really descriptive here. Could you please rename it to dpu_hw_setup_vsync_source_no_vsync_sel() ?
>>> v1 refers to the CTL rev 100 a.k.a 1.0.0 a.k.a 1, but that's not
>>> yet very well formulated upstream.. if we even need it..
> 
> I think v1 just refers to "the first next variant of this function",
> similar to how for example Microsoft COM APIs start without a suffix,
> then get 1, 2, 3 etc appended as new variants "of the same" trickle in.
> 
>> Yeah, but this mdp_top, not the ctl. And for CTL I'd probably rename _v1
>> to _active to follow actual feature name.
> 
> Correct, I just got lazily inspired by downstream here.  There it
> switches on SDE_MDP_VSYNC_SEL which is based on DPU >= 5.0.0 as
> explained in the patch.
> 
>>>> Or maybe rename dpu_hw_setup_vsync_source() to dpu_hw_setup_vsync_source_vsync_sel() and drop _v1 from this function.
> 
> Maybe add _and_ in there?

Either way will work.

>>>> Up to you.
> 
> - Marijn

-- 
With best wishes
Dmitry

