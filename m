Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115636CF148
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74AA10E038;
	Wed, 29 Mar 2023 17:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A7F10E038
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:43:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eg48so66421906edb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680111800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1UEzQkHYuqw9TF6PseZYu/7/1ftB79lvirtBs9ARE3k=;
 b=JzRiCPBBytcf8PlNB1QUxCW3SZ3qRx10TjPbBbhl+PjmlJCooI2baCcOIkw4wPABTw
 r9JqfSaMUxgNFWmXn+3Yq5cX+NeodMupyAcXiN2+7IxK2/+pMe7yPfF6T0rgg3YHWOgV
 iPOpqHNCbr+s3q6uCTTx8n2vkN9OUrlOMhookcAJtjUCMwP6i3uu7Ey+850lmoqmgTge
 9FV8n8swcIFyu57nwkfrEJNCMlPq+H/d6p5ImO0YsGWfmgX6vnmtAur5qsDMLnvJgDvb
 QaTKhucgsrX3o/t+NdEzugyqhX6NOutOBohRYxhypP6Xr/vuq7iN7B+AgUAvB1bWHKSE
 QjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UEzQkHYuqw9TF6PseZYu/7/1ftB79lvirtBs9ARE3k=;
 b=hv/MdIxNcYdwQLs+oWXHFpccKnf+qsPDy/GT7sngVOH1YyccvoPVL/CCLOQHRpzQG+
 Q8dpDkZfurgLJ1K+iwWywQOwjaLcwHKsNg3jEpTa8WEGPJ3Cpvp/rwe0EHxoZXxQqoEN
 eZIUTSBsIyv4NCBAdonK+WwAAUwRaf+WR+kxXSIl8o13ul1mBiVl/xhRVTFsgg2DqkCp
 Fa1sN1eert/vlh+R6SVZ+/W1Iy5mFtjSzrR3CVDpOcc1HDEVA3hy/P3sxuczO9nk19xE
 PhKKCDiL7lr/anoWnjoZei1sOrleFNHVkhxSo6A2ccG5wCTcjPMWqCS0LQvdJw0Nc12o
 2lIA==
X-Gm-Message-State: AAQBX9cAm940y+OLskapOW1Fhbr00dEYm/mAzeXwFDE26+MY6SeNb3EL
 BhNXzekp+lySDYddrELkUQs=
X-Google-Smtp-Source: AKy350YAe7dNv8XUjqmWI5Rf2raZx8G+Kc6BdySQ1UFH9XuWpiKSrLHu/RVEkT9MS4DB4Gt8zMhRLg==
X-Received: by 2002:a17:906:1453:b0:92f:df03:551 with SMTP id
 q19-20020a170906145300b0092fdf030551mr19986509ejc.15.1680111800047; 
 Wed, 29 Mar 2023 10:43:20 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:b3ac:3147:dd38:b72d?
 ([2a02:908:1256:79a0:b3ac:3147:dd38:b72d])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a17090666c900b0092b606cb803sm16947136ejp.140.2023.03.29.10.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 10:43:19 -0700 (PDT)
Message-ID: <2f4fa309-8ea8-a68c-4f35-b527d7f17e2d@gmail.com>
Date: Wed, 29 Mar 2023 19:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
 <ZCRzzi7bmDyOra4X@google.com>
 <980e7a13-ea49-70de-700c-597ad7a4e103@gmail.com>
 <ZCR33FvKsvEmDLRQ@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZCR33FvKsvEmDLRQ@google.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Stevens <stevensd@chromium.org>,
 dri-devel@lists.freedesktop.org, npiggin@gmail.com,
 Pierre-eric.Pelloux-prayer@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.23 um 19:39 schrieb Sean Christopherson:
> On Wed, Mar 29, 2023, Christian Kï¿½nig wrote:
>> Am 29.03.23 um 19:22 schrieb Sean Christopherson:
>>> +David
>>>
>>> On Wed, Mar 29, 2023, Paolo Bonzini wrote:
>>>> On 3/29/23 18:43, Christian Kï¿½nig wrote:
>>>>>> 3) other uses of kmap() must switch to MMU-notifier protection.
>>>>> I would rather suggest to return the page additionally to the pfn from
>>>>> hva_to_pfn() when the function was able to grab a reference to it.
>>>>>
>>>>> When the page is then not available you can't call kmap() on that either.
>>>>>
>>>>>> If the DRM people are okay with SetPageReserved() as a temporary
>>>>>> hack, we can change or remove the WARN in kvm_is_zone_device_page(),
>>>>>> since that is what you are referring to in the commit message.
>>>>> Adding Daniel for additional comments on this, but essentially we have
>>>>> changed quite some infrastructure to make sure that everybody uses
>>>>> VM_PFNMAP to prevent stuff like this from happening.
>>>>>
>>>>> I would really prefer a proper solution in KVM instead.
>>>> Hmm... Now that I think about it that would be
>>>>
>>>> https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
>>>>
>>>> Time to resurrect that work.
>>> Ya.  I had previously asked David to first eliminated the usage that isn't
>>> protected by mmu_notifiers, but after seeing the resulting complexity, I had a
>>> change of heart[2].  Can you weigh in on the latter thread, specifically my
>>> proposal of using a module param to let the admin opt-in to "unsafe" kmap usage.
>> I don't think that this is something an admin should be able to decide.
> Why not?  Assuming the admin has CAP_SYS_ADMIN, they can reboot the host in a
> myriad of ways.  The idea with the KVM module param is to allow curated setups
> where the userspace VMM is trusted to a large extent, e.g. AWS' Nitro, to opt-in
> to the unsafe behavior.  I.e. by enabling the flag, the admin is acknowledging
> that bad things can happen if untrusted/compromised userspace gets ahold of
> /dev/kvm.

Well exactly that's the point, you don't need untrusted/compromised 
userspace the system could just go spontaneously into nirvana during 
normal operation.

This would result in very very hard to debug problems since the issues 
only happen rather rarely.

On the other hand why do you need the kmap() in the first place?

Regards,
Christian.

>
>> x86 system are rather grateful, but if you kmap() pages accessed by GPUs on
>> ARM the system might just reboot spontaneously.
> FWIW, the dangers of an unsafe kmap() are arguably far worse than spontaneous
> reboots, e.g. there's potential for use-after-free and possibly even write access
> to arbitrary memory.

