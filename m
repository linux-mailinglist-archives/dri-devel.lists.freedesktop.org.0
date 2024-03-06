Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474B873AA4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15BE11328F;
	Wed,  6 Mar 2024 15:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fm0gZrav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514AF113294
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:25:54 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3652ab8766cso2342975ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709738753; x=1710343553;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aV64pIApxifZ5gZF6WilMYrL+2CVuzA5DFuqpWTfKAA=;
 b=Fm0gZravwlnH4GZXLr01SJQ6u1gsYIcw1cuq2SzqwPYfk3GwuG/7Gxh+LA/qzawLTr
 XMDKxWOCUZ+j9yhsRot48UF/HoT0CFnxsxHXarZ0RXc/3Qp/otyvk+aoanRqA4mS+po9
 CkQAsHsgx0p7AVfP9RwkEc6TSj65uI3/LvKvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709738753; x=1710343553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aV64pIApxifZ5gZF6WilMYrL+2CVuzA5DFuqpWTfKAA=;
 b=BEEIBOsDeY7RRkOFAUJayybB5Sq3c0uNmzcBNuHeQvsTmmGXRXqJwPUEh9q/nfymDT
 IMivLwQN9NZ7I86JtipwMhwQFTNGUay1Cm3tRURVusWbSyCNYv49z1Sa1aOOsMudv7dQ
 qZULdw7GW5mMw8VSTk9FKysRmtK2DX9F4FjsWt0GUq/TWcL3lqylVT15bF/44JPy+SR2
 QzaIdRof7WoktzJWcreOqXgvfnQQJyMD+OW44df7e8qp5YweXIVLTx8Md0OSFYzNKkU2
 xu/LY2WEiRkj8QDnhrS5a/K94dd/HC/RazNG9wYseOuEDbP6LW8CFbmPOXhE+C2z0n5K
 LyIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkx61l2s9IEYndyD4W7goutgLFQJdZ6y4GwuDmUnpp7iJcj58EpoM/ju21cC0ytVIP43yoSM2kgpJxh6kjEvMnQ7DfsHq+KV2n/t+eiAyW
X-Gm-Message-State: AOJu0YyxcRXoNaTGL42FbdG31X4l8VqDhV+EdyLnGpF7taq8wbBaaV3A
 IkqYe7BIuquc2inIW0VmSX/I0JiCU7xVcaUVI+mMqG3tJJ6T51jv0ydgfPe+kpc=
X-Google-Smtp-Source: AGHT+IGHuPURq92vbA7pPIU9ILtciWhlwIdoWOWmF/y51jq1Pi4LCcaKE7vWxQuThE6DWjsqz0iZHA==
X-Received: by 2002:a5e:da49:0:b0:7c8:7126:a44b with SMTP id
 o9-20020a5eda49000000b007c87126a44bmr3749253iop.2.1709738753241; 
 Wed, 06 Mar 2024 07:25:53 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 ce19-20020a05660242d300b007c845a3b858sm1148284iob.14.2024.03.06.07.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 07:25:52 -0800 (PST)
Message-ID: <eb5bd055-07d1-415e-92a5-27b4a6229109@linuxfoundation.org>
Date: Wed, 6 Mar 2024 08:25:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
 <20240301214358.7fdecd66@canb.auug.org.au>
 <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
 <20240302074643.6e1086ff@canb.auug.org.au>
 <b0abafb8-65c8-4e54-a410-8a5ac7dccee6@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b0abafb8-65c8-4e54-a410-8a5ac7dccee6@linuxfoundation.org>
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

Hi Stephen,

On 3/1/24 15:30, Shuah Khan wrote:
> Hi Stephen,
> 
> On 3/1/24 13:46, Stephen Rothwell wrote:
>> Hi Shuah,
>>
>> On Fri, 1 Mar 2024 09:05:57 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 3/1/24 03:43, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>>>>>
>>>>> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>>
>>>>>> I can carry the fix through kselftest kunit if it works
>>>>>> for all.
>>>>>
>>>>> I'm happy for this to go in with the KUnit changes if that's the best
>>>>> way to keep all of the printk formatting fixes together.
>>
>> Unfortunately you can't fix this in the kunit-next tree without pulling
>> in Linus' tree (or the drm-fixes tree) - which seems excessive.
>>>> I am pretty sure that the proper fix has been applied to the
>>>> drm-fixes tree today (in the merge of the drm-misc-fixes tree).
>>>

I misread your message.

>>> What's the commit id for this fix? I Would like to include the details
>>> in my pull request to Linus.
>>
>> My mistake, I misread the merge commit.  It has not been fixed in the
>> drm-misc-fixes tree or the drm-fixes tree (or Linus' tree since the
>> drm-fixes tree has been merged there) :-(
>>
>> The problem in this case is not with the format string types, but with
>> a missing argument i.e. there is another argument required by the
>> format string.  It really should be fixed in the drm-misc-fixes tree
>> and sent to Linus post haste.
>>

Agreed.

>> At least the change in the kunit-next tree will stop this happening in
>> the future.

I misread you message and asked David to send a fix.

I will send pull request with the mention of your fix up to this error
in your first message.

thanks,
-- Shuah

