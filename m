Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA234EBF30
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8641C10E140;
	Wed, 30 Mar 2022 10:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB9210E140
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:49:57 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x34so23892009ede.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rULHLtHObj7JeUF2sHw1Ik2LvKGa8zcu2Pc9uYH4tC8=;
 b=Q6tLh6skBqDzWWS+FB7rTP4agGnRy8TMf7uAFSqyI8zIThEsy/Cgxa8kF+EXgASfDo
 ntVoSn7t9YMo+IwKDgFcqOV8EIf9LoFtg+lwWXdGcTu5C8ICTT4k5LTi6dteucGvurBw
 IvKpk3bhic4oExPwuTE7lhZWV+ork5swg7Sl/ko/9Uk2zxcis4MJv4xERMb2Cqryzzhz
 gva8TTzfZ1i63eEeJhm27rfsK+zm96uIa+/jl0g6RBX5qdRiGM6eu772Zp0YxONLtABq
 49rzddfJzEPkBBX5gcIm9/LaZe4XpmV0UOzT6wzQyqtguOhdDGruLeAtJCaL9rZ9SPMT
 MyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rULHLtHObj7JeUF2sHw1Ik2LvKGa8zcu2Pc9uYH4tC8=;
 b=I6NbzuaQMNXXSFo8x9sa/lWBA9ML96qSU69LXwzdRqfKDwcgbuqGlP1u1aZopzs9GX
 3c6J/ZilNANO38nrb6FaIhCuykpJ1Oz0J6TiTaC9/danmJILZqP+5D87RncJOwr/V6iP
 8oQnYQQBTwNwiwUdi3CjWPe18pVzULUeCF+lcFEqhFtsazXWKxTuzjAVAaT68oZPsrMO
 pxykr56ApG6QNGZAPpJQXNRJiJd+jmhiqTbgFmsB4nHpDTK82PzpYXEPXhti8aUTCG8E
 ookq4g2XkrqJjIbE0tLVnDXG3fL5LuH2ff73Qime2EeCmakQvSFpKiBbtXxMGn2946Xf
 mBeA==
X-Gm-Message-State: AOAM530nLA48l6zqN4txbU8/6ujEw6K4aqHCWzvfqVSjEPcCiGf2nvt6
 yYv0InLBAT7b842Egm6+XmPIYsMT4M8=
X-Google-Smtp-Source: ABdhPJxaMIo/HSfb4OKsblS0rFW4rPcQDShCVCgRwTxMg9w+IkC/QtQgwMIpmmYyfd16/3C09EyPlw==
X-Received: by 2002:aa7:c948:0:b0:413:2bed:e82e with SMTP id
 h8-20020aa7c948000000b004132bede82emr9733316edt.394.1648637396417; 
 Wed, 30 Mar 2022 03:49:56 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 nc13-20020a1709071c0d00b006df4e0d352csm8195200ejc.151.2022.03.30.03.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:49:55 -0700 (PDT)
Message-ID: <2a9358e8-b83f-f1ea-e3c8-272ad40d01d8@gmail.com>
Date: Wed, 30 Mar 2022 12:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Allow ttm_buffer_object without resource
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220329110243.6335-1-christian.koenig@amd.com>
 <YkMRY6faCAZRLBhF@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YkMRY6faCAZRLBhF@phenom.ffwll.local>
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
Cc: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 16:02 schrieb Daniel Vetter:
> On Tue, Mar 29, 2022 at 01:02:32PM +0200, Christian König wrote:
>> Hi guys,
>>
>> this patch set cleans up the handling of TTM buffer objects quite a bit
>> by allowing to create them without allocating a ttm_resource as well.
>>
>> That's not only cleaner in general, but also a necessary prerequisite for
>> quite a number of related work.
> Maybe there's some threads I missed, but I can't really guess what this
> could be useful for without even a hint.

Well about a week ago Bob send me a partial implementation of this and 
said he needs it for i915. What exactly i915 needs here I'm not sure 
about either.

I have this cleanup in the pipeline because amdgpu wants to improve his 
page table handling with this and independent of those driver use case 
patches #10 and #11 drop allocating dummy resources for two use cases in 
TTM.

Christian.

> -Daniel

