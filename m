Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DC6CF124
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34810EBC7;
	Wed, 29 Mar 2023 17:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAA110EBC7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:31:54 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id er13so25399176edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680111112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KcZGQ7cftmyePgp0hsmlnc7SPJXCgeA96uI+DjPfqf0=;
 b=f2bRV16RYarDsBRZUTrESSyTywsYXVoflWEFnCl6Qnkvf0XpXdreK2kZChuoHKcHt2
 6OkVsYGHREIOu7mn+PDLQdgNQqmjqBmBgl1jYUIVx+5zG0iPDT9MFGgMW0H+AJ3gpDy1
 FtRWIuKK/QPpIn8G/7Ttu+XYr0NDjXHVLij4dQh+ZIBjtjYDDFCzdFZbdxIU10QxMYsX
 Hd4quieljRW2EwhjX224iJGVvSOeMemaNkV3cfxtDO+L41s3+5H807Ny3ML0v2+KJybw
 Oc9CdNhLChs2R7siYZWRz5GyGuSPitj6T4SV+Y5gwZMYUpYuvzT50f8lqYdPT5QNMhQS
 fFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KcZGQ7cftmyePgp0hsmlnc7SPJXCgeA96uI+DjPfqf0=;
 b=ylOeAks7pX/5toYmKy62j/++EEAPENGnuQhB9nSsSiQ1FQAflyfDk2mIQBGpwJcRcY
 JQbi6MFXFAUt3m1mEzIPk8c4KSVrr7/Un2XzeU57Xr0HEVn+GR1nocFjMvBx8XR8I5Pc
 op478Dhx/THedncJgY+m1AmGPtbxL/HAN+gGWdlbJRrE29KZ7Bjx8qwYeG4PUyDVd9qh
 z6qpoQa2Fb7QVsfYIa2fQkNIhZSNbcubnVcuH0eplZFknWzhrURP0FP6xuREzlOjTgCQ
 L79vy9pHDj1hDE1sEO5MovspHjPOi5ig+2s2FUNV8ZfTvRS6/whdiTbAz0nrmx6ByEia
 /wEw==
X-Gm-Message-State: AAQBX9e436l4/ORQ4CqbTxSy2yp9Ua6MBPqBBt7cIHmXV1Rtqj2RN5jo
 y3GUmsvQ+YTqibmdOczgPQk=
X-Google-Smtp-Source: AKy350ZCri2+mesJ8Noo0gmcAB4L4M1TUnow3+rXGf3uxrWeNCegw0X/kga+ICRzVKoga4NfUcuAHg==
X-Received: by 2002:a05:6402:d1:b0:4fb:3054:232e with SMTP id
 i17-20020a05640200d100b004fb3054232emr19119272edu.26.1680111112405; 
 Wed, 29 Mar 2023 10:31:52 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:b3ac:3147:dd38:b72d?
 ([2a02:908:1256:79a0:b3ac:3147:dd38:b72d])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a50c082000000b005002daeb27asm17260213edf.37.2023.03.29.10.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 10:31:51 -0700 (PDT)
Message-ID: <980e7a13-ea49-70de-700c-597ad7a4e103@gmail.com>
Date: Wed, 29 Mar 2023 19:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
 <ZCRzzi7bmDyOra4X@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZCRzzi7bmDyOra4X@google.com>
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
 dri-devel@lists.freedesktop.org, David Stevens <stevensd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.23 um 19:22 schrieb Sean Christopherson:
> +David
>
> On Wed, Mar 29, 2023, Paolo Bonzini wrote:
>> On 3/29/23 18:43, Christian Kï¿½nig wrote:
>>>>
>>>> 3) other uses of kmap() must switch to MMU-notifier protection.
>>> I would rather suggest to return the page additionally to the pfn from
>>> hva_to_pfn() when the function was able to grab a reference to it.
>>>
>>> When the page is then not available you can't call kmap() on that either.
>>>
>>>> If the DRM people are okay with SetPageReserved() as a temporary
>>>> hack, we can change or remove the WARN in kvm_is_zone_device_page(),
>>>> since that is what you are referring to in the commit message.
>>> Adding Daniel for additional comments on this, but essentially we have
>>> changed quite some infrastructure to make sure that everybody uses
>>> VM_PFNMAP to prevent stuff like this from happening.
>>>
>>> I would really prefer a proper solution in KVM instead.
>> Hmm... Now that I think about it that would be
>>
>> https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
>>
>> Time to resurrect that work.
> Ya.  I had previously asked David to first eliminated the usage that isn't
> protected by mmu_notifiers, but after seeing the resulting complexity, I had a
> change of heart[2].  Can you weigh in on the latter thread, specifically my
> proposal of using a module param to let the admin opt-in to "unsafe" kmap usage.

I don't think that this is something an admin should be able to decide.

x86 system are rather grateful, but if you kmap() pages accessed by GPUs 
on ARM the system might just reboot spontaneously.

Robin Murphy <robin.murphy@arm.com> can fill you in on the hw details if 
needed.

Christian.

>
> [1] https://lore.kernel.org/kvm/Ydhq5aHW+JFo15UF@google.com
> [2] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

