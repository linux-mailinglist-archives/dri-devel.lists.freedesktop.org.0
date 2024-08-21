Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0495A001
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECF610E63C;
	Wed, 21 Aug 2024 14:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m0CV3BJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8810E638;
 Wed, 21 Aug 2024 14:34:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5bed68129a7so6284713a12.2; 
 Wed, 21 Aug 2024 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724250859; x=1724855659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UR+KwYc9lrWNXtCafAT5/wVnX1MflyYbcpT1ZdueVMM=;
 b=m0CV3BJxU5Q3O9AheFRa4Cc7ECbT3eN1/0JWSeP/I0RiMOOOeOczl65FqpCNyX+Fku
 FD4VJK/DWDmE8bVdT4KaUHVuvNKtSrYZ3IyZuEY+KVe8MUPhFNjJLOkDUX0aVVAcKElv
 HWFUly0gjAes4KVBJFvGYPfzl0bRDqdk/MIDTszJ9h+lcVXqX2wfZgcD4QvJB6rQRWWh
 ygtKVX5E7dWQAiKNx7rH/zCIybO+Mo4wsRLAokzMFsMt1NW8UjpWsxmGx0bO33ouu9SB
 ywWSD51ktObCAInJcH2tZknkDE+zvljjoOtoThGmjQ3Y+CQ2lyYOVOKYEQmtgBSoJ00+
 mXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724250859; x=1724855659;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UR+KwYc9lrWNXtCafAT5/wVnX1MflyYbcpT1ZdueVMM=;
 b=ArfEnbPvxv2o/LUJf5Y1qi29RyRcS0LK8COTt4iV6Gi7GGNhWYJBHRauOXRnmyf3fE
 M3ztMaJhIaFCAGl7/EE+MXZe7pIK22YwRfD1k8pwLc13aWoZZjisb53rpt11WiX2dhJx
 xlsVP9NCKeHJOdegNqV5cCiET9zFLhA0ie8Dk7mvt0gzkwNg1Md0IzhhsDRrOQeniTgo
 jzUI6CUeL7roDklR0lG3B8veoejxyHLkrt8uVjtFUJHbqQIu71Sbxx8LXPXWy46G1GXC
 IxjTBsgh0HCclZRuD2Cx+Pt8nsnTZu711jD1ZMDI49XKUmkd8GuzigltsIdrEibas8eo
 j4ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnyERQfZBOYoUdx+EJwK7n6y58ulbxU94SzRjyp7ThD1U6qhAgq+b5rzTU2vmoJGvXxdxu5ossGqDp@lists.freedesktop.org,
 AJvYcCWid/7ZE1AjE+u8ZEf4vGHFwibBid6y0XYHvlKsvN+Q0NckevBg4HM2RGsS3Z1FzTO1B5X0IPIFN9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcEhM4Gqo2IQpcFXmr6tyT5zQd+g2rg7kqYDDhcNmynnrnDuM0
 OBnQT7wTMxzfp8gz1Ky2fn9RsTb4FnMJJyqZEt2pYJQgAO2t11SM
X-Google-Smtp-Source: AGHT+IG00gtDcFSOH4+sQGkIehK6jaUt+gJZWvpFBFTs9mKnIYjUOIRHHw+Pbxh2Ln0y3OO1unQn0g==
X-Received: by 2002:a05:6402:320d:b0:5a3:a9f8:cf20 with SMTP id
 4fb4d7f45d1cf-5bf1f25be42mr2012925a12.34.1724250858531; 
 Wed, 21 Aug 2024 07:34:18 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it.
 [80.104.252.9]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081db4sm8112609a12.88.2024.08.21.07.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 07:34:18 -0700 (PDT)
Message-ID: <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
Date: Wed, 21 Aug 2024 16:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
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

On 8/19/24 10:08 PM, Akhil P Oommen wrote:
> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
> 
> No postamble packets which resets perfcounters? It is necessary. Also, I
> think we should disable preemption during profiling like we disable slumber.
> 
> -Akhil.
> 

You mention that we disable slumber during profiling however I wasn't 
able to find code doing that. Can you please clarify which code you are 
referring to or a mechanism through which the kernel can know when we 
are profiling?

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

