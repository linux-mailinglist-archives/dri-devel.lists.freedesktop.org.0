Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18873668E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679A10E29A;
	Tue, 20 Jun 2023 08:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EA410E15E;
 Tue, 20 Jun 2023 08:44:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f8467e39cfso5682366e87.3; 
 Tue, 20 Jun 2023 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687250668; x=1689842668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INCyLodh5hW0FdVgKdc0172d0ADixX31xyQseonkNWM=;
 b=lIV5AlJG5kNRdgu6SP1vR5e6nmiPYUCRVKI6T62EjHAq7zjTm0htQ2oOqSWVX6dFQ3
 mXoQKuqAhx7iGogvK+bMHerBXkvacsUYKRwOKr3kivj5xvxBaYgNJyAcZYdiO8qEIqIb
 g73YgCAjOSmEsKeqZzshVV7nGqqnywyMSptelJDmL+r5APMwbdB5I6I5xnZCwkBdFlB0
 dj4GTakud3L+YMBshol9l+JPFw5aRWnKgC6ssrg8FSqejEOP37//WQH+PpGbfkZLkSDs
 OCwKvIMWIfal/W8geINkTU7AzL+17730iHcyHMA0HG/yTK+Wnob90zEPt0ztJVLGezsb
 T3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687250668; x=1689842668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INCyLodh5hW0FdVgKdc0172d0ADixX31xyQseonkNWM=;
 b=hOAk/Z2f1CQruoNWo89dyA+k3WIdSukdqlFWczV6bwo4NJR4ej/JNgvif7rfPxCuve
 OOWn8sOLu8eCA1vsxXWzqIVjhcb1Q8HwxFD7VQ2xsHE9/XWVnXD3FRR+WIxOcBzCa5lf
 j2yD85JnFHrICQ6aLqloW1vNhEYTC3oSUCqQhZ6duCH9/4BreMYnJyJJjTzSTsDGii/m
 DxJZZYX2npPi9A9gEmdn8FNujB2yyLkTUCscNfu7DVM5fnydY7owX9ejChcYt7ZvEI6z
 61D1ERRWcywSK7KnuOjhWZxr7fy2gbNgFfzsANHwCXZH6pvl2I36ZIbZzJu0Q2fCV2Ne
 zGVw==
X-Gm-Message-State: AC+VfDw7ibCmUhP34jjp6xYebK+XBBbJMZNfiFXcpPmwEzXheKpJxw4N
 iCEfhqXcf4wsq+07qwksWf0=
X-Google-Smtp-Source: ACHHUZ6EtC2CqljlJANboxXacgjetq1UknNcI8bo+itrH9P7MjbkjEoZ+T+4UeJ5+d8WxvQflF6BVw==
X-Received: by 2002:a19:4350:0:b0:4f8:48f3:f08 with SMTP id
 m16-20020a194350000000b004f848f30f08mr5476560lfj.21.1687250668335; 
 Tue, 20 Jun 2023 01:44:28 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154d:9c00:68d9:fc9c:8543:a6?
 ([2a00:e180:154d:9c00:68d9:fc9c:8543:a6])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d56c4000000b003078354f774sm1464189wrw.36.2023.06.20.01.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 01:44:27 -0700 (PDT)
Message-ID: <ee7987a4-a9ad-e667-9ac5-c06b42cf36f1@gmail.com>
Date: Tue, 20 Jun 2023 10:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
 <20230620102817.6570f521@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230620102817.6570f521@collabora.com>
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
Cc: matthew.brost@intel.com, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 10:28 schrieb Boris Brezillon:
> On Tue, 20 Jun 2023 10:12:13 +0200
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>>> I think Boris's suggestion of having this through a common
>>> DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well.
>> No, again. The only driver which should accept duplicates is radeon, for
>> all other drivers especially new ones duplicates should probably be
>> rejected.
>>
>> We only allow this for radeon because it is already UAPI, could be that
>> we need to do this for amdgpu as well but I really hope we don't need this.
> Just want to describe the use case we have: we support submission in
> batch (several jobs passed to the submit ioctl) with a
> submit-all-or-nothing model: if any of the job description is passed
> wrong args or causes an allocation error, we fail the whole group. In
> the submission path, we want to prepare GEMs for all jobs. That means
> adding enough fence slots for the number job finished fences. Given not
> all jobs will access the same set of BOs, I thought I could use
> duplicates support to make my life easier, because otherwise I have to
> collect all BOs upfront, store them in a temporary array, and keep
> track of the number of fence slots needed for each of them. I guess
> the other option would be to over-estimate the number of slots and make
> it equal to num_jobs for all BOs.

Sounds pretty much what amdgpu is doing as well, but question is why 
don't you give just one list of BOs? Do you really want to add the 
fences that fine grained?

For radeon it turned out that we just had stupid userspace which 
sometimes mentioned a BO in the list twice.

On the other hand over estimating the number of fences needed is 
perfectly fine as well, that is rounded up to the next kvmalloc size or 
even next page size anyway.

So IIRC and you have <510 fences you either get 14, 30, 62, 126, 254 and 
above 510 you should get it rounded to the next 512.

Regards,
Christian.
