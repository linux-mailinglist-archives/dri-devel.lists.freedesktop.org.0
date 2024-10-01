Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE798BAD6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 13:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC3D10E30E;
	Tue,  1 Oct 2024 11:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nh8UrUvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6C10E1E1;
 Tue,  1 Oct 2024 11:18:22 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so712493066b.2; 
 Tue, 01 Oct 2024 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727781501; x=1728386301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M7Y+01ypUJsEmgwdYhnhTchynt4rwwmYzwYQjNI7xpM=;
 b=Nh8UrUvWaypuLQREz98e1RYNxWQi+xWIJLn3ONSmxrsP/Wa63J12U/d5smCBaIL8kt
 bPZmgtf08Ia9yBQB4Rb0tkNMfXKdY5GW/1EoKbU1zkxe6x/aYVnnfNYSFcbpWMrv2e/d
 n7sNCUhPPR8gw30nAxdyT7dqLSxgfjG+rLplB7jgfgjVfcbLzxSpZ9u3/rhVBRDO4eyF
 sxDswafQWiAdISwcraSzSFvqnTKGG1HbvCoX7/YEserfztMwyB8BX/UzPm2OBpQsk572
 Hn0y9nSUKt5XZ5BOwS1HU8EayIVmNYD9MF35PA7JBp8hKioOn9W8yM9ltgPV3OL8nwhz
 mJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727781501; x=1728386301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M7Y+01ypUJsEmgwdYhnhTchynt4rwwmYzwYQjNI7xpM=;
 b=eXXYxGApy4q6uV62niIObmd3NLAPSQ+ViPYsiaZNe9C2M7IpZKr4Y4efKJoVqQt6uO
 QSWDEf/cKEIB7IjtZXTxb7yg4cF8kfnSymqAV4Cb+f4Rw2P79cHRA7b0E2TnIOFYa6nQ
 6+Fn57CtrQJV6rxAJutL0oylwlsVHQiQAeLKHI7gH6qUVXgERTUDMy6kKlqqBiuMj/Fv
 5ujmR7uXVaRyfqshFJXQJNmHsayoHpVWO3cg8sG89+u5fdUW5kD5LWV1ZYHg2iRtdmO8
 5h/D8ved4LweIVj/vEq993F2l5v/HZoNTCzyg5Wu+f5+S//R7+TyXQfVX/d8mZFd+3Da
 5LIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe92ojCjiybIzv1P4zPq/6EaLpBXSeFugFMcfuj7iiRPjWhHEJybnvgMldejytIRPyIgxThjOgSSM=@lists.freedesktop.org,
 AJvYcCWjK5n1vT88uDervbBtX4TO3wIkPnUiFY30OF4BpqycUeoiPrnuMkaagAOQnD0gMh/1vqnYWBg9nTdf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz//44OoD0FPpBSkM8G1n3BuzTSaK3OhO6+tO5FD6KfOmgqAFnF
 +McSScvRw9jxexz2oDD0D7IL0aoH5nflCKyvr5dQgNg1o1eqTaUM
X-Google-Smtp-Source: AGHT+IEjf7kjW+MgxUTDGHSJNPDYgDC2pVN3zKWGsYHhpG6QGdF/JkSRWRkTQCML9v/lBAseCkcp7g==
X-Received: by 2002:a17:907:ea7:b0:a8a:8c92:1c76 with SMTP id
 a640c23a62f3a-a93c4961721mr1478843866b.36.1727781500535; 
 Tue, 01 Oct 2024 04:18:20 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27ecf90sm694400766b.97.2024.10.01.04.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 04:18:20 -0700 (PDT)
Message-ID: <0aab9845-b960-477f-b869-e8d0759c4671@gmail.com>
Date: Tue, 1 Oct 2024 13:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] Documentation: document adreno preemption
To: Bagas Sanjaya <bagasdotme@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>
 <ZvtMB14Yx5m3TzFJ@archie.me>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <ZvtMB14Yx5m3TzFJ@archie.me>
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

On 10/1/24 3:10 AM, Bagas Sanjaya wrote:
> On Thu, Sep 26, 2024 at 11:16:53PM +0200, Antonino Maniscalco wrote:
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:orphan:
> 
> Why don't this be added to toctree in Documentation/gpu/index.rst?

Yes so there is existing orphan documentation for msm so my intention 
was to add it as orphan then eventually send out a series to organize it 
properly (so creating an msm directory with an index which then points 
two files we currently have). Does that sound good to you?

> 
>> +
>> +=============
>> +MSM Preemtion
>> +=============
> s/Preemtion/Preemption/

Thanks for pointing out the typo!

> 
> 
>> +This mechanism can be used by the kernel to switch between rings. Whenever a
>> +submission occurs the kernel finds the highest priority ring which isn't empty
>> +and preempts to it if said ring is not the one being currently executed. This is
>> +also done whenever a submission completes to make sure execution resumes on a
>> +lower priority ring when a higher priority ring is done.
> 
> Do you mean that the kernel finds highest priority ring possible that is not
> empty? What if all these 4 rings are empty?
> 
> Confused...
> 

Yep, if all rings are empty we don't preempt, same as when the highest 
priority ring is the current one.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
