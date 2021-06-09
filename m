Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B113A1649
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996966E3EB;
	Wed,  9 Jun 2021 13:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D986E314;
 Wed,  9 Jun 2021 13:58:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a11so23741097wrt.13;
 Wed, 09 Jun 2021 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EfUm8vlTyp6NaXGJjKaIc3nQYaOxrHl5v0EgWxKtuJQ=;
 b=tN90Yvjl3B/X/Wz0WgjnAv5FM8MiLzr0r4Glcug4yzxjf3rjKVNvO4m8EYWlCBHXxJ
 y7n+D2tAHc7pOq2clMAPpn9Ca881rOnSsh8L7oi6+WHWMj+vhZ74+tmlT0j5UQR86iAm
 ESb35eif8FG9EWdeb4R0xzlk/ea7fyJrpC3v1nopVoTBnuFfkWqOebE3OhLL90NL2+cQ
 /NwzAGpQTtwO6xYGzQa3omgyvtWKEXOnD7K/2KGvRhBuFuyxffrXGKGCJm08BCz5Pozt
 N3Df4NnD8EHFPSuhYEaGTPiIPZff/rMb9HaMwG7PSFSj0MGVkT+a/SI/PZtHEQ99DBga
 MuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EfUm8vlTyp6NaXGJjKaIc3nQYaOxrHl5v0EgWxKtuJQ=;
 b=OizZLMKJE5sFhGXTcTpKt2ZRR7SeJwF49WIXoEqzyMjskAQJMuJoldO9vRNmuCgWqD
 mNoQ+NgU+9Rti9TqdxOOvUF8WPiAVjcZVhVTkA5PXx/VUHu8phTqPiUD5fnMeO7vRAj6
 lsqpZ69ti84SvJPuTgs9/Keq9b8GWAwrdpgdLpsHRA3EKFCLCUhN5p76skbF6XLo711O
 mw0Ht2QLBw2t4arB90Epq9jXEWQSWtuRZIlVPeOQmq+3uVlClBdhTfsyj6VAhbW2Olo8
 FknzQe7WignUarSadtimWCxn85WDkqkOkXTwdnxKrPynZZX1R7ohtD3fQV2mG68D9dI0
 kt8A==
X-Gm-Message-State: AOAM530vX6N+G+I3fdHF7VOQDaUeiqqGHtGwvAv9gwAoIVBUsUikfVXN
 F5P2RkWmCND4aECK4T9Jt+BOVBq1DZM=
X-Google-Smtp-Source: ABdhPJxLJOfu0qmjCn2x0fgjFzN2yGPBNl+ueUep+RSI5Cg2Mt2oGOtkgfj9Lp8NwB/6/oTWfuqgpQ==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr28353890wrr.358.1623247107897; 
 Wed, 09 Jun 2021 06:58:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624?
 ([2a02:908:1252:fb60:3e79:91ff:ea38:2624])
 by smtp.gmail.com with ESMTPSA id y8sm6360349wmi.45.2021.06.09.06.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:58:27 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
References: <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
 <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
 <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
 <YLnq6Vuf4amZld3n@phenom.ffwll.local>
 <586edeb3-73df-3da2-4925-1829712cba8b@gmail.com>
 <YMC/4IhCePCu57HU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
Date: Wed, 9 Jun 2021 15:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMC/4IhCePCu57HU@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> [SNIP]
>> Yeah, we call this the lightweight and the heavyweight tlb flush.
>>
>> The lighweight can be used when you are sure that you don't have any of the
>> PTEs currently in flight in the 3D/DMA engine and you just need to
>> invalidate the TLB.
>>
>> The heavyweight must be used when you need to invalidate the TLB *AND* make
>> sure that no concurrently operation moves new stuff into the TLB.
>>
>> The problem is for this use case we have to use the heavyweight one.
> Just for my own curiosity: So the lightweight flush is only for in-between
> CS when you know access is idle? Or does that also not work if userspace
> has a CS on a dma engine going at the same time because the tlb aren't
> isolated enough between engines?

More or less correct, yes.

The problem is a lightweight flush only invalidates the TLB, but doesn't 
take care of entries which have been handed out to the different engines.

In other words what can happen is the following:

1. Shader asks TLB to resolve address X.
2. TLB looks into its cache and can't find address X so it asks the 
walker to resolve.
3. Walker comes back with result for address X and TLB puts that into 
its cache and gives it to Shader.
4. Shader starts doing some operation using result for address X.
5. You send lightweight TLB invalidate and TLB throws away cached values 
for address X.
6. Shader happily still uses whatever the TLB gave to it in step 3 to 
accesses address X

See it like the shader has their own 1 entry L0 TLB cache which is not 
affected by the lightweight flush.

The heavyweight flush on the other hand sends out a broadcast signal to 
everybody and only comes back when we are sure that an address is not in 
use any more.

Christian.

> -Daniel
>

