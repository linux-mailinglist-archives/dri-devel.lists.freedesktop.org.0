Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4377D651A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF65010E608;
	Wed, 25 Oct 2023 08:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CDA10E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:30:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso85987761fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698222654; x=1698827454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SFHQb/vO+uSnfk86NSCkjoMtagDBPY4Ko8t4pWiqci0=;
 b=Q1jxWhkeEoKW7v0Qd758VfZOCMjZTjYFGLUi1w6JGnNpN8ljS8s/+0SO9C0EUrFgBg
 RvvyELJ2k2X5yU1WkuNUEWne808dCTFQZcpMdGN2dPVRYHPebijAttPfNz65Br2n/NkT
 Pipm73lLv+by8H9CxptUWUdHeP2sCFbetDqfdMtzKZL7WPCipB2slOIiN30EeUs7Q+wq
 91GTdHLuJTru+QqWnr/DwX3hYnJn2q3lyvYIO6vEAKEfKvKMR9TmECjnD/pVOvJI3NgA
 25IUfMBzFPwrRr+R/eVahDassg5f8oIBergpOm9iqFw3tgB+NM/HzhxPltrd97/glK/m
 EamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698222654; x=1698827454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFHQb/vO+uSnfk86NSCkjoMtagDBPY4Ko8t4pWiqci0=;
 b=amEO8aWF7JMnkomTKkS0L2u724AQt5uQqtvRRDNSBVXzrv8C9ky7Q77EgLE7DAJC0F
 PINKWf6geqlRe4z+DIXppJi66ncYob1P+NUQ/Eo6R7Gnt6Bg+XQg0EizdU3zkFrTzRlN
 yZRJAsKd9rM+YdSuVq294Mlx12wjldUFn7ecyLKWT+5xld/aR/eyboieInczP9THVNmV
 rO+EbR4u1y5QJyp2HvHTzajcxqGX0yvBW3oSuMk+n81676CSoCSgGKlR5urrdzPeojCi
 iscZnAxKvN7w4utdc5P6QvY+/keoPomcq+OCXdrpjoZQp+ny2khCnoMAFjAt5LeKAtNZ
 bZTA==
X-Gm-Message-State: AOJu0YxJsaprJFwDHo2nIe+Ped6/83+AqZkKodwNvc3+9zoaJoCTnX3O
 OpTnrQdkrjD3bf++lfCPhOafyQ==
X-Google-Smtp-Source: AGHT+IH4jA9MCNcOKVtzPMubXUdbJFA/DuGa9mz9xaE04M4QtDGfGSTgvirxZ5ubWqj/xiqYu4PdEQ==
X-Received: by 2002:ac2:47fc:0:b0:503:3654:37bd with SMTP id
 b28-20020ac247fc000000b00503365437bdmr9776195lfp.45.1698222654398; 
 Wed, 25 Oct 2023 01:30:54 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05651203f100b00500829f7b2bsm2450039lfq.250.2023.10.25.01.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 01:30:24 -0700 (PDT)
Message-ID: <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
Date: Mon, 16 Oct 2023 17:32:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, johan+linaro@kernel.org,
 andersson@kernel.org
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
 <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/09/2023 23:03, Konrad Dybcio wrote:
> On 26.09.2023 21:10, Danila Tikhonov wrote:
>>
>> I think you mean by name downstream dt - sdmmagpie-gpu.dtsi
>>
>> You can see the forked version of the mainline here:
>> https://github.com/sm7150-mainline/linux/blob/next/arch/arm64/boot/dts/qcom/sm7150.dtsi
>>
>> All fdt that we got here, if it is useful for you:
>> https://github.com/sm7150-mainline/downstream-fdt
>>
>> Best wishes, Danila
> Taking a look at downstream, atoll.dtsi (SC7180) includes
> sdmmagpie-gpu.dtsi.
> 
> Bottom line is, they share the speed bins, so it should be
> fine to just extend the existing entry.

But then atoll.dtsi rewrites speed bins and pwrlevel bins. So they are 
not shared.

-- 
With best wishes
Dmitry

