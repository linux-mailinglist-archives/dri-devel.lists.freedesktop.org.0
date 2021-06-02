Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594ED3992E3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEA96EDF0;
	Wed,  2 Jun 2021 18:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD956EDF0;
 Wed,  2 Jun 2021 18:52:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b17so4211647ede.0;
 Wed, 02 Jun 2021 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dALVNZW2uDgkshKb09SIdTzcQTHQdIR5cbthTtmZW00=;
 b=EeKzSDt4zOdEVHm3gat9spDjogoO7IRzpVFuq/fUOtUeZor+v8VpSrDwYLa9fvEGKw
 25KSXY/T2FVDGvC7zQ9qLAw/nXUc7FSmq0ehBkSqp3fUsqPwQFt1g26T7hMPqKTGEdS+
 I9crgPfkK0kPNv3pVK8DTXPBnp+UXMLbsieP7eFeI2gJzvdc3l15n2MXC3o5QN7OuAoz
 VlZIN3OdVn53iD0o/wCudYF7FASwmk0nBHQINaiOrZvqc5N+kBMxKvwrQ9/9+POUeVE4
 5LAsi0pB1XzWRhQNEJ9kbxQtL2evNYC244y1AeCM+nTN9ACSG84xos6QvVp3xLkcZw7l
 wtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dALVNZW2uDgkshKb09SIdTzcQTHQdIR5cbthTtmZW00=;
 b=Eg9sZhGPP2IGP55az3CFSx5ygcGEHtZJJ9EmUMVMFRtyJvnoL6KwaAZ8vsY6ybbpCF
 TWBs5OEZttSKv3ZWcwUWVLQclILc26ymDG4qPc0+/5Fsght8n/nS9WnGvSeNTu/kFIC6
 4d6XJZF/Kyipcj8102yaGljRWkATWMvbQQou+pajnvjJN4XNN5l+phkLXfr9jUm8/2CU
 LSPvRqXpUE4qonaQJTsjg3CmMGDGKmfp5VpujE57khpyszvg7lWYd60KXVsBE4qHxecA
 3bnifEfAHLcLCo1e+IN52b58OGsBF+q7XhV2QSt+kyOr2H2cLBz0Atte9PWYqcn2F9tV
 nStg==
X-Gm-Message-State: AOAM5337i0g5gQW0IWxYXl/23l/6UeeT0oMDTuKzArva0++AIvHa4t2z
 OSjLGXwCEaoVH3+wsfSfNOd8VgPEwvQ=
X-Google-Smtp-Source: ABdhPJyutn6+eMjVOVzp3fv0Ibx0jtGCccPXsVx36zkbIB4lftt0Iui5ADrkqEw0kQEpwy5Pl831eQ==
X-Received: by 2002:a05:6402:4394:: with SMTP id
 o20mr40895258edc.357.1622659960108; 
 Wed, 02 Jun 2021 11:52:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id hz10sm400137ejc.40.2021.06.02.11.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:52:39 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
Date: Wed, 2 Jun 2021 20:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 20:48 schrieb Daniel Vetter:
> On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
>> On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
>>
>>> Yes, we can't break anything because we don't want to complicate things
>>> for us. It's pretty much all NAK'd already. We are trying to gather more
>>> knowledge and then make better decisions.
>>>
>>> The idea we are considering is that we'll expose memory-based sync objects
>>> to userspace for read only, and the kernel or hw will strictly control the
>>> memory writes to those sync objects. The hole in that idea is that
>>> userspace can decide not to signal a job, so even if userspace can't
>>> overwrite memory-based sync object states arbitrarily, it can still decide
>>> not to signal them, and then a future fence is born.
>>>
>> This would actually be treated as a GPU hang caused by that context, so it
>> should be fine.
> This is practically what I proposed already, except your not doing it with
> dma_fence. And on the memory fence side this also doesn't actually give
> what you want for that compute model.
>
> This seems like a bit a worst of both worlds approach to me? Tons of work
> in the kernel to hide these not-dma_fence-but-almost, and still pain to
> actually drive the hardware like it should be for compute or direct
> display.
>
> Also maybe I've missed it, but I didn't see any replies to my suggestion
> how to fake the entire dma_fence stuff on top of new hw. Would be
> interesting to know what doesn't work there instead of amd folks going of
> into internal again and then coming back with another rfc from out of
> nowhere :-)

Well to be honest I would just push back on our hardware/firmware guys 
that we need to keep kernel queues forever before going down that route.

That syncfile and all that Android stuff isn't working out of the box 
with the new shiny user queue submission model (which in turn is mostly 
because of Windows) already raised some eyebrows here.

Christian.

> -Daniel

