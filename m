Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC465008A0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C87610E24E;
	Thu, 14 Apr 2022 08:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877410E24E;
 Thu, 14 Apr 2022 08:44:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id t11so8636712eju.13;
 Thu, 14 Apr 2022 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=brGaBbat7Ld+7g8YTXosczIIrUA4kff+HdlpKoU9rYY=;
 b=mzieN5j2RYsWHPNCrz/E6BSm22smV5Vky18FeNUQKb/SEyUlXmR1w7AZp8p2kHk7h0
 6JJe+Je+NO3Epj3V8A1/EsoJG6FfyvF2BJCR3IKXs6roM1SRQgNbivMhSdG3aeK+K76M
 A6R2JCtUHRFWrLXJ+uTIeCTZ3sUWUHewTygzBulb/pkiw+dMbdUukIf6GnWKwxm0Fdj7
 7HCiEwfmRw+4qmNuX+0+o5FkD4QJ0saOHPD6qnwUggI28Bx2f1uYqIzQlqHZqIxouKCJ
 m093G3fJLn8lwSq8nv+kfCRqkX9U2jmU4PSvS+MIa24Ax0IkJ3mSKR7unbZPwCfHIw2A
 PWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=brGaBbat7Ld+7g8YTXosczIIrUA4kff+HdlpKoU9rYY=;
 b=VUwc2tG3emQjngr8U3AOSmM17WAJMXbJvSYBTTWD9AYs6h9Zd3i3rNvwbeW1I+K+hD
 MvEmqx2EF9kFf3QZKpTlXSpmlvLy+Fqldus39pHXB3INKfpjByKCBz/GyfEg/3YnnG1D
 Qy2vLzRdw/SnSu/1yjJYVe8ylq/PnxhT+lnXKUqSSV/4tbg3Em1klIOWooNXR6ib9mHV
 2IlE1tVYoPrbvrhb8K51dIUGCGjsZ3W/09UzlvpVk6MsKM2g0wFi5xhkcK9jpzFmzWS9
 af7mjdVAc602q3mUw2/Qz1UVRxeM+Ry/PfeYtFmWAvdlD7SZxb/jZaCzbNOsHSHKz1lL
 KANA==
X-Gm-Message-State: AOAM530UwhaAlP/x/nCz3YONX2D5kr6X1/Dtji0DPTotP8uKDBwc4x72
 uAYkvyVRiRBp/vDEL3sn0uC9TBsEklM=
X-Google-Smtp-Source: ABdhPJw/Si9Kj0oNU270PkJlaFe8ixODS5+zPgQOJopROnmJxuJotyiKg5lL8Hi4r8EZEa5++Kc9qQ==
X-Received: by 2002:a17:906:2c0d:b0:6e8:979c:be8 with SMTP id
 e13-20020a1709062c0d00b006e8979c0be8mr1504244ejh.239.1649925851020; 
 Thu, 14 Apr 2022 01:44:11 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:4249:af28:5ee2:d30b?
 ([2a02:908:1252:fb60:4249:af28:5ee2:d30b])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056402238200b0041f351a8b83sm695180eda.43.2022.04.14.01.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 01:44:10 -0700 (PDT)
Message-ID: <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
Date: Thu, 14 Apr 2022 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.04.22 um 09:37 schrieb Michel Dänzer:
> On 2022-04-14 08:24, Christian König wrote:
>> Am 13.04.22 um 18:14 schrieb Michel Dänzer:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> Fixes compile errors with out-of-tree builds, e.g.
>>>
>>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h: No such file or directory
>>>      38 | #include "r420_reg_safe.h"
>>>         |          ^~~~~~~~~~~~~~~~~
>>
>> Well stuff like that usually points to a broken build environment.
> Just a separate build directory. Specifically, I'm hitting the errors with
>
>   make -C build-amd64 M=drivers/gpu/drm
>
> Generated headers such as r420_reg_safe.h reside in the build directory, so source files in the source directory can't find them without an explicit search path.

I'm trying to swap back into my brain how all of this used to work, but 
that's a really long time ago that I tried this as well.

> Are you saying that should get added automagically somehow?

Yes, exactly that. I'm like 95% sure that used to work, but I don't know 
why exactly either.

> FWIW, this is pretty common in the kernel according to git grep.

Maybe Alex or somebody else with some more background in the kernel 
Makefiles could jump in and help here.

Christian.
