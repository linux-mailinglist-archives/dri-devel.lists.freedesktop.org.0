Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9997AAC1A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E6510E633;
	Fri, 22 Sep 2023 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527DE10E615;
 Thu, 21 Sep 2023 20:11:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9adc75f6f09so162113266b.0; 
 Thu, 21 Sep 2023 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695327086; x=1695931886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j8twwhzXuT8fsMJdJyt7UTy/Vc8bLsFvC5aGV7uuSzk=;
 b=Quicdx/OynVyoNQaopUmxzdU0I924w5Pj75MxnjNvuUibk6aTCTHWA4wTs/S4IzE2H
 8NsZH80fHsgV3Ojvz/+mGo5t1UeM8X1+ijaHeb2XP+/iOnxkPQpEFUzGZS/V5acizMcv
 xwBx93Xiw5EcJzBcDYxf10APaA8vo4dlnWD24BagPlR+vyU3GLIWRMet8sgf/FWxnBXp
 y0o5E3jK3zas6HWt7JwRkTKdWMFnD3K8e9Zygzh/7SvNwlIvFcOjCtjZHB0GyuwkpGih
 dd8aJaZBVwWXEUqPEK/HtkprztOyTe5Qlft40IN8g/IW5O9MM/Ky0asF0KL0rFV1F3c3
 SsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695327086; x=1695931886;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j8twwhzXuT8fsMJdJyt7UTy/Vc8bLsFvC5aGV7uuSzk=;
 b=IDAmtm4bOdnJBmeioKqO7ugZO1mAAqK4tXxFNzCnGjthzY6s0Q+UKQn9rJWUiU+Kqp
 M36XSj9mSFTAf/wPpFFGfKXqrgnn8DkRjLChSa9G14wMuJ8LOyuTaseWkzQ8vjTFwAZO
 q/dmHoxeRhyAmgWR1q2vGZRYGVU/+QblE8c+ujRPOyRI3bzv8HOHtoKPt+WB6T4eobHd
 eOW0vGrZPTepSROY0hD5ZdqmG3iQHx/xIECTGAeTlWIHVZi4lZja4dQBdPvT5LTmoEeQ
 SHXTdwWVDTP0pOo9MzASRdlDk5bgOeGYvLKgiu49jU1A00e1zDu3ld7hlLqpOegg1UQs
 M7zg==
X-Gm-Message-State: AOJu0YzN4VfxtoxiLan7RofAVF+m+YxC9LQs3YN141fBDfe789wVCYia
 WiEWFF33r55fPX1L69t74qHfTvRoxhY=
X-Google-Smtp-Source: AGHT+IGATpVFclhxMzsxy4o0igbGPnzDlQXbTC/56G16AFZ+1pCNksXw3HGS/Yc1noVFOgVDI91dQA==
X-Received: by 2002:a17:907:2ccb:b0:9a2:23b:db60 with SMTP id
 hg11-20020a1709072ccb00b009a2023bdb60mr5361815ejc.54.1695327085379; 
 Thu, 21 Sep 2023 13:11:25 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.googlemail.com with ESMTPSA id
 h15-20020a1709062dcf00b009adc86b75d5sm1510121eji.189.2023.09.21.13.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 13:11:25 -0700 (PDT)
Message-ID: <8bc269a0-b720-4f7b-a9df-c50d90ea41c3@gmail.com>
Date: Thu, 21 Sep 2023 22:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be
 rate limited
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Yu, Lang" <Lang.Yu@amd.com>
References: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
 <BL1PR12MB51444F28FD848B91BAEDE88AF7F8A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <BL1PR12MB51444F28FD848B91BAEDE88AF7F8A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 08:12:16 +0000
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

On 21.09.2023 21:52, Deucher, Alexander wrote:
>> backporting commit 187916e6ed9d ("drm/amdgpu: install stub fence into
>> potential unused fence pointers") to stable kernels resulted in lots of
>> WARNINGs on some devices. In my case I was getting 3 WARNINGs per
>> second (~150 lines logged every second). Commit ended up being reverted for
>> stable but it exposed a potential problem. My messages log size was reaching
>> gigabytes and was running my /tmp/ out of space.
>>
>> Could someone take a look at amdgpu_sync_keep_later / dma_fence_is_later
>> and make sure its logging is rate limited to avoid such situations in the future,
>> please?
>>
>> Revert in linux-5.15.x:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=li
>> nux-5.15.y&id=fae2d591f3cb31f722c7f065acf586830eab8c2a
>>
>> openSUSE bug report:
>> https://bugzilla.opensuse.org/show_bug.cgi?id=1215523
> 
> These patches were never intended for stable.  They were picked up by Sasha's stable autoselect tools and automatically applied to stable kernels.

Are you saying massive WARNINGs in dma_fence_is_later() can't happen
in any other case? I understand it was an incorrect backport action but
I thought we may learn from it and still add some rate limit.
