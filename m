Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF195C1CD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 02:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD58E10E12D;
	Fri, 23 Aug 2024 00:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtMec0uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511010E100;
 Fri, 23 Aug 2024 00:02:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f040733086so12073991fa.1; 
 Thu, 22 Aug 2024 17:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724371318; x=1724976118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FZXhseYTPdiEAsaCZyp0/eUGXOH14KUMciIsgJkUDzE=;
 b=OtMec0uvQor1SIvqrd90KpD9ks5tKx0Kh03MOn0nMag1o+wqcs/pfvFRXCcu8YRYu9
 xI7Q6t1LFDAcQQCDXFZChyvkdo5yNrWFZrgemGjmLS+91TZs8HB4jgcipi8iX4ykUrjF
 QD+bVGh8WMxf4DRGxLgOFnWHs/H7HymHR+/H1tLtDZIV1oGAymFClFn34+I0JGGl5Voz
 PjAt8IF+x9vbiLg8VVmBiUQ5xRhEO8lbLx848je6S5d5la0Ggbmj1SjLamWmWgb9N+FB
 zilwhhoAByuLxkU0oig29oXH8Ot9Y4pCNXhHCICupdtYEeUkyVFPM84fdk3Nsqyz6mpy
 sv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724371318; x=1724976118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FZXhseYTPdiEAsaCZyp0/eUGXOH14KUMciIsgJkUDzE=;
 b=sFLWgY1DGJVY+BzcI+IwBEv+1XQWUhFd3TeE2b56Qu+qGffXaZqEFNPARrvthyjZdU
 VFXHJnyBzsevUUPgqDCLCWaVomGQWEinTLtJ7IhgTJgyMWIDZhJEtaD1LgOd5HHpzfvT
 eWazJehmt/o+iylR7DcWPgoO7OU1OpjE35eHaUb0hqPygqZn98+zLJf7wRq+4+X6RnnK
 eatQ+hpodV7FigQzPbtv5DH1dgoLtgjVE6RR0gii9DljmagA9u0x08s7ocHQ1Pgq/eVY
 YWyM1k2t2dhSX7Mtrua/VpYRGhK6lAckdbO49IKABPzdBw/ZF7XS6ucg1QNvqqWvfQB4
 0GCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1EC6dwst7X+ZRUX7nop8bDy8Lyjs6iJQDsS4wBWZtaNFCL5oyScJ8keAEsiDxjTX8UcNh4bLsrCdn@lists.freedesktop.org,
 AJvYcCXThAiCoRPjuOXFjTtxyovIpH2XsJReOAay8Fq+fvq6tksBUIEXelDEnq6VVaaS9CCbdqMMR7h3pYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpAdu/dqL6NC/pn24YjMPVjQcyauGPOZWE422WuIcJE02lku0Y
 Fp/RtKKR60CSGNutk07d+/vfLJIDFAAjevM14YSrBkp+eGvmpDoX
X-Google-Smtp-Source: AGHT+IHhHWZf9vpNIAFQ0R09BUx/Ka3OjJk//K6B4lxZ33XIVlPX1Apvk/xy8KlJbFosWsKjoueAWw==
X-Received: by 2002:a2e:a595:0:b0:2f2:bbcf:1b83 with SMTP id
 38308e7fff4ca-2f4f57aa5e7mr1018501fa.45.1724371317606; 
 Thu, 22 Aug 2024 17:01:57 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it.
 [80.104.252.9]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c43a5sm1414410a12.66.2024.08.22.17.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 17:01:57 -0700 (PDT)
Message-ID: <3c0ce811-ae61-4d09-8eb4-054afeaa1969@gmail.com>
Date: Fri, 23 Aug 2024 02:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
 <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
 <20240822192144.e7u3fhlqpeyypbxp@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240822192144.e7u3fhlqpeyypbxp@hu-akhilpo-hyd.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/24 9:21 PM, Akhil P Oommen wrote:
> On Tue, Aug 20, 2024 at 11:48:33AM +0100, Connor Abbott wrote:
>> On Mon, Aug 19, 2024 at 9:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>
>>> On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
>>>> Some userspace changes are necessary so add a flag for userspace to
>>>> advertise support for preemption.
>>>
>>> So the intention is to fallback to level 0 preemption until user moves
>>> to Mesa libs with level 1 support for each new GPU? Please elaborate a bit.
>>>
>>> -Akhil.
>>
>> Yes, that's right. My Mesa series fixes L1 preemption and
>> skipsaverestore by changing some of the CP_SET_MARKER calls and
>> register programming and introducing CP_SET_AMBLE calls and then
>> enables the flag on a7xx.
> 
> And we want to control L1 preemption per submitqueue because both
> freedreno and turnip may not have support ready at the same time?
> 
> Antonino, since this is a UAPI update, it is good to have these details
> captured in the commit msg for reference.
> 
> -Akhil.
> 

Sure I will update the commit message. Anyway that could be a valid 
reason but there is also nothing preventing you from loading different 
versions of mesa in two different processes so having one globally 
enable preemption and break it for the other wouldn't be ideal. It felt 
natural to have it per submitqueue.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

