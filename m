Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C18798A0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBFB10F058;
	Tue, 12 Mar 2024 16:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zA87kdqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B38D10EC0E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 16:12:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513b1e1724bso136654e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710259942; x=1710864742; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zLG0VkRk9T+MqlwYSwMr85lswH7UeBe9EKEDGZIjNWM=;
 b=zA87kdqQgbnXsMmzRRot9NQ3lnUbCr6thnEyi/uhoQT9AH9IuFi4hS+b2btJCYevmz
 uxUAkqo2VoTjknCKMO5ORuawmvNiHcnu7ul9NFz1dFBBMKuGziCaPoDYJ4Ve7d22YYWV
 4X6Ail9PhUglaQGtyKTSndKEkbxKtcehYL0h9LgkeV+UBKdKWpuuMYUpck8E9w9P4lZx
 j1UKqgRJ/u4BVPDw7U20BIO1O15u4rBjiPI3/0dwA5R9w4ENYzjKxjfUoOvmw7eJzIYo
 RBFKnUj0u8xLnFf73jZooqpt0rwni38RaR9cI0tH/0Iil7y7BxNqLdArZH3ZxK7/5N3Q
 Ac0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710259942; x=1710864742;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLG0VkRk9T+MqlwYSwMr85lswH7UeBe9EKEDGZIjNWM=;
 b=e/irTdO9iPsJ36n32pHKxqvLiM81aFTZ3BAj++zsV4d8LqmwYtWRMU79+HyJLVSu5H
 ip/mRWbmD330fkBnZrDdtf5R1nns9bqj1PT/whx8sr0RW7oOFa2Tph7gUYO196r3Ey5K
 qOXqSbjKiuwNf3F/HvaP7ufeyl4Vd/rgPs8o9ly99wJtlDRdgFQDYUAMJ43JjHnERThI
 grIgqKAxrnJt5+AN7AEIg4uk+BOMrPV5e4cqLeuG7jDaVaf0eRYC/N/I1JjOoJfU2xGv
 wVBIK+Vg0CHKt79wjXDMsA/I4s35V1wIRPhjrENTP9O2TIBhVhiC5/FH8ZUYWVsILujb
 9R8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI6AyyWxURRbuanNFg5KzsPVk0sYW7dRU9OeeCwc/ddC+rBAMTEKuErFoHAN4IEpnb8ksrEo8LntBiE/FGPHyyOxaJH+SCuLgcSl0iF6L3
X-Gm-Message-State: AOJu0YzbBimwqjqi1qSta8sb2ZfGPN+uhJuRS2iL/leTrtyGhLiH5S/z
 ATb55GgdOtUSUxOHQUKV7MXbFdmNOXCVdQuSy4p+WMOoACQqSGJzT7a94TUrasU=
X-Google-Smtp-Source: AGHT+IHFOEHl33gs0on8qTVXiyJ+aHRxksDiQ505Q8fof/YGiXciDjx8sbsbVrPzSuDgBdzksPF1+g==
X-Received: by 2002:ac2:4d0f:0:b0:513:488a:95af with SMTP id
 r15-20020ac24d0f000000b00513488a95afmr1774lfi.15.1710259942295; 
 Tue, 12 Mar 2024 09:12:22 -0700 (PDT)
Received: from [87.246.221.205]
 (netpanel-87-246-221-205.pol.akademiki.lublin.pl. [87.246.221.205])
 by smtp.gmail.com with ESMTPSA id
 o5-20020ac24945000000b0051321db6a0dsm1634984lfi.139.2024.03.12.09.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 09:12:21 -0700 (PDT)
Message-ID: <83734790-85c5-446f-b353-f3765cb10d41@linaro.org>
Date: Tue, 12 Mar 2024 17:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Content-Language: en-US
To: Trilok Soni <quic_tsoni@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
 <605d9e50-d61b-b0ce-1664-00554ba70b41@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <605d9e50-d61b-b0ce-1664-00554ba70b41@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/23/24 23:48, Trilok Soni wrote:
> On 2/23/2024 1:21 PM, Konrad Dybcio wrote:
>> +	/* Wait 50us for PLL_LOCK_DET bit to go high */
>> +	usleep_range(50, 55);
>> +
>> +	/* Enable PLL output */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
>> +}
>> +EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
> 
> Please use EXPORT_SYMBOL_GPL.

Sure, I glanced over this!

I've also noticed that it's a very common oversight.. would you be
interested in extending scripts/checkpatch.pl to suggest the _GPL
variant?

Konrad
