Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5B868D12
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9977210F2E4;
	Tue, 27 Feb 2024 10:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U1TWSEY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D74710F2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:12:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-512e1991237so3401573e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709028763; x=1709633563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdcTuKOvy0EUhMzr/avSzwKVXZwTIOQgOR4V6+G/+Rk=;
 b=U1TWSEY9xLq1Qq8TIPEpDXg3oT7JhL0y/DNGJiaCTobPjJmfoQJ/VVHFzrv6k+5lfK
 V1KVEJfWgcdyENCYhgddViVr3fFxvrmbFqcjflzXfbj2UVNHhcBJEoFjX1A1Uoy58wxD
 T7f65L3UAls+Z7bReqdh0RGMQWlDKJUDEHXI5n1CHGrJPDxOfrUo+nen5BFvB3ocqh0T
 7MBotphNMQcvAOAVRDuA/f5vCk92luHigV0XRtmiUdGP8hsX3rCeT2u5QhTbhGuhlrR1
 2/VNaHAHdTvZ0ksf0DqmGgpV3oCZyhyJAMQL7YbusziJmMPMt704N5CNxq7W/TtT5ePd
 Or/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709028763; x=1709633563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdcTuKOvy0EUhMzr/avSzwKVXZwTIOQgOR4V6+G/+Rk=;
 b=WCFI+X5B49ch9pJZMejDrI9QSL2d7CVzvtSi8xhMYjFHc/MIbskqlZU2ljZhMSk4bC
 bDHMgtRP9/cSulMh0TjO2ZxlDa/e4JWrGw7bw4jmlMdAaIB1NyzmsECcPDw0PqOduMRf
 GTOqhtClGUu8JOTsg4pdNXW70gl8ERtv1qypU2/QrJY1ADyrPhbllJupyYA1Tj05//k5
 rURdMICYhDMg4JY/XpFijyW2iFEYi/cB0hfbgVQOxlHtGaT2tS7ecEuc4D3DzAZVkD1a
 Nui0tC52hktEIBzUarU1cZd5IsCc6vib/GEWdTzvZ6/c03z9zbbLDsqY8zIaX+aQlNEt
 picQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrETq334JyINo5Ss3OSw1sQdp4Fqu/fMyn5HmhIjpxsn4w4wtaUkG97Su/+WQgAw0TRWpl06pm4l3IBzPzRTLeavKa26+9lXaS4mRD3kbM
X-Gm-Message-State: AOJu0Yw5Hck0RGSYD0LQyr0d3WF1Jui201ACpYeJTCOYjT2VcY9jszmJ
 rm3tOa9dI0OrabSXy5/nfZeChGPnYzXXJ2K1JFuwJISC8ELLDQsFVAaubqSd0D8=
X-Google-Smtp-Source: AGHT+IEuX+LAvgGR0dujrY6Se1xlvX+40UrwavICTj8b1/cNQL1xPoiOn1bdI5jJdrL4sEXbMeapyQ==
X-Received: by 2002:a05:6512:11cf:b0:512:f389:d6e0 with SMTP id
 h15-20020a05651211cf00b00512f389d6e0mr2702097lfr.4.1709028763072; 
 Tue, 27 Feb 2024 02:12:43 -0800 (PST)
Received: from [172.30.204.241] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x18-20020ac24892000000b005128d0e2a07sm1136919lfc.308.2024.02.27.02.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 02:12:42 -0800 (PST)
Message-ID: <f5b373cf-79fb-4d62-9d3f-9a9ffbfb5d8a@linaro.org>
Date: Tue, 27 Feb 2024 11:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] A702 support
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240227101055.GA13753@willie-the-truck>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240227101055.GA13753@willie-the-truck>
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



On 2/27/24 11:10, Will Deacon wrote:
> On Fri, Feb 23, 2024 at 10:21:36PM +0100, Konrad Dybcio wrote:
>> Bit of a megaseries, bunched together for your testing convenience..
>> Needs mesa!27665 [1] on the userland part, kmscube happily spins.
>>
>> I'm feeling quite lukewarm about the memory barriers in patch 3..
>>
>> Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom
> 
> I'm guessing you don't really expect me to take the clock bindings?!

Sorry, I didn't remove this hunk from v1 (where it was smmu changes
that you already took)!

Konrad
