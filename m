Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D18FE600
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA8210E919;
	Thu,  6 Jun 2024 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p+KP7pu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273D510E91A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:03:29 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so105058466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717675407; x=1718280207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EhzgN21teDTF/ZW3qgf+NvcxVJfop3KgFTk3I1MLoU0=;
 b=p+KP7pu7154h/AfxXa4Htsudii6CPsq1eKzJkNT4BmHMSWw6sgJw6Ufuy+yHtVVYC1
 gt1W+8Xkv2vGM2TjZTkRXCPUWKJWZ9pC6mSZFEYjQSA9C4P8vpTwOh89bv5qRbo5NE7f
 V4yn4lrMB8z6pR9Y1b+TVbun4nGp7AuCq9y45mNuwpzP8aV0lltMU7dcvsUFc98zU7vp
 KZy0a+MV7TQcBO26pKLkcC/eA6DtlvJYJqE04dy+LH/WKPcuhm1K3c66KoJkQmnxievv
 1PbnmKP7ncDPaCGkwTymchmKoNqbMsWQJ7NYjxdWf3ZZ2y5IvuPhCJCgiWO544HfOLvi
 MDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717675407; x=1718280207;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhzgN21teDTF/ZW3qgf+NvcxVJfop3KgFTk3I1MLoU0=;
 b=tcg2LmtNunV9e/CJCeKMFXWO+jn5EFTxMVoVr+iCkvsBDpC4dr/iLrr/T1j/hCuJN8
 ULNG/MCjeve2+wASO6ySzERmET6S64gidYGBc08TmyTFdGvI16d/zSO9/29LP+0rrxOY
 xY+AuQQdKahHGhg5Loa6CZT+ncxKkQL7i7HhgyDgKTxUOwL0fD6HMzy3cZHRKuPQp/YT
 TYm0utUzRCc/1f1ns15htkzUA+CbKiXvRjBReC7UYVSAYX6c7CC9V1rUIKvh+YNtC156
 tojYsGUjXKyEL3VmUQ1PkhUdCYmqR9FV0mzu65fDePslYhzRDWj/nUQre4DGAsFWsrML
 sr3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnhx8NhJM56NO6TPG05d8bkMlZt2eohTFdRIIBdFLdwjSeVAJktMpAtxsaRWUfRq8T28s32jkbtrp25dHVuG6WDBbAjFtrPFW2UuLKiRQ9
X-Gm-Message-State: AOJu0Yykc80bqrqa7hnQCpDl8wVYJhVou4Zt8nv+j3qZfy7GB6RYha7F
 kmDEs5zxqcttbBKIt0FyDaH8CgDEhYuyzxGOsb9vCuzjz9dTpfdgz9+WCB6KPThX8Os6B+vO3+6
 0A0s=
X-Google-Smtp-Source: AGHT+IFxfjWGrWlEFaeC88RJhH+tXUQS7F8xlGUVGHn8bDw/cok9mz5kkvNfMjnQ9TIj9poiaHp4OA==
X-Received: by 2002:a17:906:c44d:b0:a6b:c993:7ede with SMTP id
 a640c23a62f3a-a6bc9938015mr258898966b.11.1717675407204; 
 Thu, 06 Jun 2024 05:03:27 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c806ebd48sm88558666b.108.2024.06.06.05.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 05:03:26 -0700 (PDT)
Message-ID: <444f6a34-6636-44b0-850b-777c44fd62dd@linaro.org>
Date: Thu, 6 Jun 2024 14:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
To: Will Deacon <will@kernel.org>, Andrew Halaney <ahalaney@redhat.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
 <20240604144055.GE20384@willie-the-truck>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240604144055.GE20384@willie-the-truck>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4.06.2024 4:40 PM, Will Deacon wrote:
> On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
>> On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
>>> On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
>>>> If I understand correctly, you don't need any memory barrier.
>>>> writel()/readl()'s are ordered to the same endpoint. That goes for all
>>>> the reordering/barrier comments mentioned below too.
>>>>
>>>> device-io.rst:
>>>>
>>>>     The read and write functions are defined to be ordered. That is the
>>>>     compiler is not permitted to reorder the I/O sequence. When the ordering
>>>>     can be compiler optimised, you can use __readb() and friends to
>>>>     indicate the relaxed ordering. Use this with care.
>>>>
>>>> memory-barriers.txt:
>>>>
>>>>      (*) readX(), writeX():
>>>>
>>>> 	    The readX() and writeX() MMIO accessors take a pointer to the
>>>> 	    peripheral being accessed as an __iomem * parameter. For pointers
>>>> 	    mapped with the default I/O attributes (e.g. those returned by
>>>> 	    ioremap()), the ordering guarantees are as follows:
>>>>
>>>> 	    1. All readX() and writeX() accesses to the same peripheral are ordered
>>>> 	       with respect to each other. This ensures that MMIO register accesses
>>>> 	       by the same CPU thread to a particular device will arrive in program
>>>> 	       order.
>>>>
>>>
>>> In arm64, a writel followed by readl translates to roughly the following
>>> sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
>>> sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
>>> above? I am assuming iomem cookie is ignored during compilation.
>>
>> It seems to me that is due to some usage of volatile there in
>> __raw_writel() etc, but to be honest after reading about volatile and
>> some threads from gcc mailing lists, I don't have a confident answer :)
>>
>>>
>>> Added Will to this thread if he can throw some light on this.
>>
>> Hopefully Will can school us.
> 
> The ordering in this case is ensured by the memory attributes used for
> ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
> (as it the case for ioremap()), the "nR" part means "no reordering", so
> readX() and writeX() to that region are ordered wrt each other.
> 
> Note that guarantee _doesn't_ apply to other flavours of ioremap(), so
> e.g. ioremap_wc() won't give you the ordering.
> 
> Hope that helps,

Just to make sure I'm following, would mapping things as nGnRnE effectively
get rid of write buffering, perhaps being a way of debugging whether that
in particular is causing issues (at the cost of speed)?

Konrad
