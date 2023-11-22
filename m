Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959BE7F519E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258AB10E307;
	Wed, 22 Nov 2023 20:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D581010E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 20:28:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so160485e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700684899; x=1701289699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XCWCbaXqCkkqjJ8AwyXFWRYVY/K8tyc8oCsxMFcMiSs=;
 b=WCqtX5vsZMdqvjHoNnveurpM0l6wEcS1WLLwFdFlXCVai6RCHmYokgDkieSDCghPhJ
 TPerwZoeyNkg4zjI4GJQGI2hwV+CsiffZXJNOos3jLjIAHXyFZxKXkJh2QK3S7YCWtcg
 U8+DnZa9/6UOiHVDhQoJR21iDDYWj69tcXH8KLw7E3wAGwIbOCXUjmSE1Mmwyw+T3fGr
 G9kbWmLSBG8mNKCq+7E9Zl6LNcieCP7+141NFdsBom6GUONKbD9pJbmZrnGYW5iutkSL
 Be5mRCmH/yDw1jRL3LwOQz1ZyCV+UeBsBt+JAesPU+g3q5srnedNu3at/ic8cno98CxG
 raBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700684899; x=1701289699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XCWCbaXqCkkqjJ8AwyXFWRYVY/K8tyc8oCsxMFcMiSs=;
 b=ZAj7pAF64gaGlVxYQsdHKfc79E14X3QFXXeYfYSaMtrQVZYPsPAZm//mHVLSybA70x
 r7XUa6UJUndl53pS3ff3VZoZtYUP/ngywciUQWu1VZ5SIesvOVzq8/aLgkwXMdjcLfnB
 fgkg+MW9w94MLzjZt92Y8LHBFagTAurWVUyqiNSrENajaS9FH/huv+uoSqw46YpnSzRM
 yy+s1VgHt77RVpOJ9ZRO8a+ZtjgH26wlLQx9WfyLv/Koh0EJrQt1P4XNH82GkEgw/QP+
 L4fIjB6HHA1EAYjwbC0cdPqgJbGBI+gUQB2WRH1lWEMWj44o/aoiSrdKhZwAPNvHJEXF
 0o/A==
X-Gm-Message-State: AOJu0YxE549NODFgkXCc42wVW8w0Lfo4K2sngyvybqNfGpdbqqrEzYwZ
 Ai/NuNaVqoNb9vjE973vGQylUg==
X-Google-Smtp-Source: AGHT+IGbae21R7XvRQhLLldvzkRHXG+FoNK4XFelxko3lLb2Ef3rlCohoCMoEmrQDSkEeuOqkLptbg==
X-Received: by 2002:a19:654b:0:b0:50a:9f42:9ceb with SMTP id
 c11-20020a19654b000000b0050a9f429cebmr2429983lfj.34.1700684899012; 
 Wed, 22 Nov 2023 12:28:19 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 bp7-20020a056512158700b0050aa49aed34sm1683542lfb.29.2023.11.22.12.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 12:28:18 -0800 (PST)
Message-ID: <f76637f9-8242-4258-932e-b879145a5cfd@linaro.org>
Date: Wed, 22 Nov 2023 21:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, johan+linaro@kernel.org,
 andersson@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
 <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
 <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
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



On 10/16/23 16:32, Dmitry Baryshkov wrote:
> On 26/09/2023 23:03, Konrad Dybcio wrote:
>> On 26.09.2023 21:10, Danila Tikhonov wrote:
>>>
>>> I think you mean by name downstream dt - sdmmagpie-gpu.dtsi
>>>
>>> You can see the forked version of the mainline here:
>>> https://github.com/sm7150-mainline/linux/blob/next/arch/arm64/boot/dts/qcom/sm7150.dtsi
>>>
>>> All fdt that we got here, if it is useful for you:
>>> https://github.com/sm7150-mainline/downstream-fdt
>>>
>>> Best wishes, Danila
>> Taking a look at downstream, atoll.dtsi (SC7180) includes
>> sdmmagpie-gpu.dtsi.
>>
>> Bottom line is, they share the speed bins, so it should be
>> fine to just extend the existing entry.
> 
> But then atoll.dtsi rewrites speed bins and pwrlevel bins. So they are not shared.
+Akhil

could you please check internally?

Konrad
