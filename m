Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADECCA5B0C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 00:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F5D10E9E7;
	Thu,  4 Dec 2025 23:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WRiVercW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB1F10E9EA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 23:28:36 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3f4f9ea26aaso1216857fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 15:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1764890916; x=1765495716;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TY8vn4+rw5BlELkE55Y40GYmlU2AL+AMWiRVce63tcM=;
 b=WRiVercWNDEgMa5PSRwb8OzaQjkwD+vMDuC8ORt/QVPiKJF56rxQUFqF6h/QvHvv9C
 JRZeSpdu90YFzqCGcGefURk90kjN9mLU5EUuAo9MHu6XQUsaqr9WUijpaa7EMKGtXOLN
 KFzlCJkSkMqnswLDltewxlMw9QQxcP0rC43pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764890916; x=1765495716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TY8vn4+rw5BlELkE55Y40GYmlU2AL+AMWiRVce63tcM=;
 b=JqZKIQQzgwE9/SJREElfr6hHh9q3A0CY5yXyFSQJf782gQFQ+D69la/wJYW/KwPdrd
 HrwDS++SRBmewcJuynk9C62Y3j6Mtit9Ej7kc+1wEXUiYxcdEeASSYUg1MGvG5CZgN4y
 fndtT56GSUQ9vdwx7lCDTnsqppWDCQJmzLbIFpx8zc/H4zzUNA3RKaHbWId1KIKxD3jT
 /z6WXIjGZLl3DmcGCnkYfhBnRcCEEHnXVDtGyGM9cimRcrHE335rWGtGQTj8aDthzchy
 w/fmNaWnu2Y0YB42wT0Ea6VJocw4oRA/Nu9D/A5nuy2CHNeNrLXsQytvjWKcAuox/xSl
 GFVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvtbFOOXfPdRGIhvRJ0+5Gd6g0zT7cJPeT187kWtDL0B+L6lbtKZQ7LllzXy+gDZYP0hB7SZB4wwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqXTHF+dW9VrMGDt3aL3zF7eBKu+vlDCqbOPidO8njQ7qhhdwE
 2kMPzfs3NMbyX7eTkuG48tvYWMtLWBldYx6c4OyqweNx7KnhOitzm9imvoJRTEjVLp4=
X-Gm-Gg: ASbGncsbT01stB6/nS3LVXFzF/9smwBSoT+VKtO0qJsFx8Ci9Zd6V11jcJsRAh63osx
 IUnM0DWpZEIdfzJqmJT8QtrcUryJVVIYTT9M3+a4IC+gG56aOIWoI2/njqE5+PwzH57niw8YLIc
 AtpY8lFD/cZ78ZEUTkKOBef2MCed2ZLvfpnhabSPCOMS8c4+ASxr6JTwudKVvTKUOoO/u9UaoTX
 X8LcW5NdqF72mSRnMGTa/MhSL80u+tTdE19TteLFxi8ydhn+Cb95NNUNA1xttd0pTa9/nxV1yfe
 gr7lelpn9h1FbDHEq3pa9UzKv2J6OK4et+pAFvPO/tr0CiBzzyo3bFKoZdL810il+dymqSlhjre
 VXcDd3iFGDW/Gh8MbXzt8uabkDdDFm+vL+rl59twj4EnOi36ig3vinT7sN4BBROLPpsfdks6iTS
 Xo5gFSBAuMCJCgXrAiMaEHMRU=
X-Google-Smtp-Source: AGHT+IHaMdSIvMY4kJabIh50Lp2Y7vLsnF75nwPDZ+uvTeHchqLesHf2HXJ3/okGx1/CR50Bnu4U5Q==
X-Received: by 2002:a05:6871:2941:b0:3c8:d325:b7ac with SMTP id
 586e51a60fabf-3f1691860c6mr5140679fac.4.1764890915718; 
 Thu, 04 Dec 2025 15:28:35 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f50b5123f5sm2197586fac.13.2025.12.04.15.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 15:28:35 -0800 (PST)
Message-ID: <60fe7660-f3fb-4c94-b21f-20ebc9e14f5d@linuxfoundation.org>
Date: Thu, 4 Dec 2025 16:28:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 akpm@linux-foundation.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
 <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
 <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
 <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
 <3b6d6e50-91ac-435e-adad-a67d4198a5b5@kernel.org>
 <3cd2240b-ec2c-45d0-b73b-b66c83e75b9f@linuxfoundation.org>
 <CAHk-=wiEXy+7Gd3ONQ-v0e61e6qAmrtk+WE2dpW_61p83nMgXw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAHk-=wiEXy+7Gd3ONQ-v0e61e6qAmrtk+WE2dpW_61p83nMgXw@mail.gmail.com>
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

On 12/4/25 16:23, Linus Torvalds wrote:
> On Thu, 4 Dec 2025 at 15:20, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> I didn't see any problems on 6.18.
> 
> Ahh. So it might be just that buggy commit adfb6609c680 then, and the
> fix already being in rc7 (and final).
> 

Yes - correct.

thanks,
-- Shuah

