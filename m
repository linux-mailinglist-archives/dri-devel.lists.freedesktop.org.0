Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C16CECE4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD110EB44;
	Wed, 29 Mar 2023 15:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B464C10EB43
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:30:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r11so64944333edd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680103801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/d+vqNEhuMuYKfGl1ekINNEteRU98IKm1vUgJ7WIxb0=;
 b=gAIaWmtBuUR0yMUhuI5jZ16OnmRIrNUwcyMVDiSqTlYFEbUHa4jRqvda4DnWQ+Fm4S
 VYZe95p0xOMrMYSwTUKCQzCxmDvyjZ/UncG2jf3tIQ/fLo18L35S9XE9J2S+40UR5YiG
 +zHd42DF+KWMv1xIdUWzoMPVXv9gGTfNe4IqzXVYW4BhQA8v8ICZvD74S4xXeN3s1ESa
 vl8h8FKma53e53GbsMRAC7hv1sRDcjv5My0vbjiRe5qv/YdOUZtreillfF6nvx5rVf1p
 4d1rPSo3a5oucdLyEXcAoZXjeGRgTU4ZEgJ/RihTsMtjz7wn366x2ErcXaiqiAyuccHZ
 oVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/d+vqNEhuMuYKfGl1ekINNEteRU98IKm1vUgJ7WIxb0=;
 b=x6DQ3VkbeIlGqZO18j13blIGEirupIaP2qOagzSeBiYafVOF8ByuAfGsaHElRJHYtD
 EqcGrMxWClj3emp/x3y8CWEh6yKUvkRBegV4vguB+fk4ziUxBycGdfxOlJ4VGQvjtUDb
 w9C8j9cKgpZMc4EJQ4tEti4Z/saBf73KOzjHKUe0zSYhBJjqxm0v3/8qSGrQ28KN45zp
 Nz3T76CdCZ7qqaxXhK0tDQvyZhPHAS7+1e31iZg06525saFiQVVB5fGoyk4/MB4evhlq
 Vqtcofj8ZDoHs3Z0z2ATN6q1KCEBVFqSEGjWIjxdp2AgN/3v4Enlime8sSQL15uFx1MA
 khuA==
X-Gm-Message-State: AAQBX9dCIKOkbt50TNu0rStkMhM1bleZyLf0BoBm/95wKJ04bj28xoGb
 8NeHuH/2AV1NRH+noeK48B4=
X-Google-Smtp-Source: AKy350bke7ygNehiBmiXDcvBHTyzs0knCrOxjd1FeDooAtvPkwxGcKuMQzJKxba7XG6e/9T5cYB2wA==
X-Received: by 2002:a17:906:25d5:b0:932:40f4:5c44 with SMTP id
 n21-20020a17090625d500b0093240f45c44mr19842197ejb.36.1680103801125; 
 Wed, 29 Mar 2023 08:30:01 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:19e1:d48c:7215:c6b0?
 ([2a02:908:1256:79a0:19e1:d48c:7215:c6b0])
 by smtp.gmail.com with ESMTPSA id
 rh26-20020a17090720fa00b00930ba362216sm16913238ejb.176.2023.03.29.08.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:30:00 -0700 (PDT)
Message-ID: <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
Date: Wed, 29 Mar 2023 17:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, dri-devel@lists.freedesktop.org
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
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

Am 29.03.23 um 17:08 schrieb Paolo Bonzini:
> On 3/29/23 16:28, Paolo Bonzini wrote:
>> On 3/29/23 15:54, Christian König wrote:
>>> KVM tries to grab references to pages in VMAs marked with VM_PFNMAP.
>>> This is illegal and can cause data corruption with TTM pages because
>>> only some of them are actually reference counted.
>
> After some other offlist discussions, I also would like to understand 
> what you mean by corruption.

I think what was meant here is that only parts of the buffers where 
updated, but see below.

>
> First, is it a _host_ corruption or a guest corruption/crash?  A guest 
> crash would be KVM doing exactly what it's meant to do: it detects the 
> non-reserved, non-refcounted page and refuses to map it into the guest.

Yes I think that this is what happens. The use case and mapping is 
indeed valid as far as I can see, but the handling that KVM does here is 
really problematic.

When the PFN points to an IO address it just works because that isn't 
backed by struct pages. And when the PFN points to the first page of a 
higher order allocation it also works, only when the PFN points to a 
following page kvm_try_get_pfn() fails and causes the problems.

What needs to happen instead is that when both hva_to_pfn_fast() and 
hva_to_pfn_slow() fails you don't try to convert the PFN into a page and 
so also don't get a reference to the page.

This somehow needs to be communicated to the callers of hva_to_pfn() so 
that kvm_release_pfn() knows what to do.

Regards,
Christian.

>
> On the other hand, if it is a host crash, my understanding is that an 
> order>0 allocation leaves the tail pages with a zero reference count 
> (and without a compound_head if, as in this case, __GFP_COMP is 
> unset). If that's correct, more analysis is needed to understand why 
> get_page_unless_zero() isn't rejecting the tail pages.
>
> Paolo
>
>
>>> Mark all pages allocated by TTM as reserved, this way KVM handles the
>>> PFNs like they would point to MMIO space.
>>>
>>> This still results in a warning, but at least no other problem.
>>
>> What warning is it?
>>
>> Paolo
>>
>>> Signed-off-by: Christian König<christian.koenig@amd.com>
>>
>

