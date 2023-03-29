Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D926CEFA8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83610EB68;
	Wed, 29 Mar 2023 16:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60B110EB68
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:43:08 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t10so65702846edd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680108187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59iGGLQv4VqlYF3KsuYafk1DDB0CiD8xCfmF5dOY3Xk=;
 b=E89EYzKbDpKbt5bqTZoHAItG+WAPawe+rHlaaDdzZq4M/A68CJ+etkeDY0X3Gtr4ez
 BT9NspRaiNwlFkxyH72c8xKhr86yJZMXsS8coS0OTOrDV3z19s0lCa74cSng0VcUW0P+
 IAIaL+EuCiQcrZmROaj9qxWmNv4cXUhP17ny2w56BmTFHksm3KXsZR5ItFnIrlOHjQEC
 XGL7uMaERcHwbAds6HWg26EyKKuWIlEopQH4e4tcRQKiiDQ89Dq66kOV17/nxgEOjt1p
 0RKqobzVIbJeKOcAWHm4P1YtlCZuA/rv/9y9Fi7d6X7r2ijcL/7AyYCyB+cr8Nsr86BX
 +lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680108187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59iGGLQv4VqlYF3KsuYafk1DDB0CiD8xCfmF5dOY3Xk=;
 b=yvgGEeGgKYk/AkTlXDw2Pat08MbNP2MGlWL0fD3+bnA91m5rpMJnHhivjF2ALw0OS5
 A+JDxKD4rCiCSPTnyIP5yshxEJCWRxrYWpL2EjEaUS+inxkRPDaoZxNrMW5LKlXQTT6u
 Qu5gXLYfsqGB/527wnvTJWREt1fXeYuNqDTyEn121LkPSN9bsPesmvplI5sAlHEjb6tU
 ayYHk6PbHIiQndaC0wF0eFBhoycc1T88gUQ6R3NQm6C8jGNe+thAA+Mi0DpuL584Wsl3
 sf8YHf+1THQhQ1ZJD7p5xZ810Ch+EjvmGWoPP0KOtYv4+bnIMjX3+66e7vXk03BbkbT/
 QokQ==
X-Gm-Message-State: AAQBX9dQTShQqImOOgIZq+DKNr0oupzaIix+YPHxV6TFq8q/6e0HEnAI
 YUYWAF67mYogDa+QFtAMaBY=
X-Google-Smtp-Source: AKy350YZR2VoTkrS9ukZuaHLUaH/ank2Gr1CFuZWB8oNsbwYgvIqdm+3cFknNMdVd6wulpFiJOmJDA==
X-Received: by 2002:a17:906:e99:b0:930:8590:95ef with SMTP id
 p25-20020a1709060e9900b00930859095efmr2917255ejf.18.1680108187262; 
 Wed, 29 Mar 2023 09:43:07 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:b3ac:3147:dd38:b72d?
 ([2a02:908:1256:79a0:b3ac:3147:dd38:b72d])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a50d683000000b004c0239e41d8sm17243431edi.81.2023.03.29.09.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:43:06 -0700 (PDT)
Message-ID: <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
Date: Wed, 29 Mar 2023 18:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
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
Cc: Pierre-eric.Pelloux-prayer@amd.com, npiggin@gmail.com,
 Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.03.23 um 17:51 schrieb Paolo Bonzini:
> On 3/29/23 17:29, Christian König wrote:
>>> First, is it a _host_ corruption or a guest corruption/crash?  A 
>>> guest crash would be KVM doing exactly what it's meant to do: it 
>>> detects the non-reserved, non-refcounted page and refuses to map it 
>>> into the guest.
>>
>> Yes I think that this is what happens.
>
> Ok I was worried all the time that this was host corruption/crash; 
> which obviously would have been much worse.
>
>> The use case and mapping is indeed valid as far as I can see, but
>> the handling that KVM does here is really problematic.
>>
>> What needs to happen instead is that when both hva_to_pfn_fast() and 
>> hva_to_pfn_slow() fails you don't try to convert the PFN into a page 
>> and so also don't get a reference to the page.
>>
>> This somehow needs to be communicated to the callers of hva_to_pfn() 
>> so that kvm_release_pfn() knows what to do.
>
> There's a bit more complication here:
>
> 1) in the guest page fault path we can avoid taking the reference 
> altogether
>
> 2) in other MMU-notifier-protected paths, we can also avoid taking the 
> reference but we also must stop using kmap() in virt/kvm/pfncache.c.
>
> 3) other uses of kmap() must switch to MMU-notifier protection.

I would rather suggest to return the page additionally to the pfn from 
hva_to_pfn() when the function was able to grab a reference to it.

When the page is then not available you can't call kmap() on that either.

>
> If the DRM people are okay with SetPageReserved() as a temporary hack, 
> we can change or remove the WARN in kvm_is_zone_device_page(), since 
> that is what you are referring to in the commit message.

Adding Daniel for additional comments on this, but essentially we have 
changed quite some infrastructure to make sure that everybody uses 
VM_PFNMAP to prevent stuff like this from happening.

I would really prefer a proper solution in KVM instead.

Christian.

>
> Paolo
>

