Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B44E9284
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 12:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B390810E599;
	Mon, 28 Mar 2022 10:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1EB10E599
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 10:28:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z92so16307112ede.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2fnW0hKm3/LoNJLASktWawEV8gjSA8FRX1R6A2wJmoc=;
 b=AcbakU3oL6MVbrDUIllFrtKNdjGA58pmZ+0+Y+aRmRPr7qGEMAwr3+CnifI3kPcwMD
 lVFQZkUGL+hNuNfowrtyQIQl7V2AJnr/FM1UAVCnU9xaCKIF41NfF4XCcDcy4xrxREyn
 QVU0rtwTkF6CpqGBj0+urYVS9BGbbPStvFDgLXnF4sqTMC4aA0LVzXVbo732l9MoUuvP
 YW0tFpvCKngyCg6/Sv0k+Q9Z6GuvSGE3O9jxlX9n37FnL1oEI3tBJFmP9ylrn4cblPAt
 b/aA1KdvPicLOs8/a8bIF0SDH7pREkps3Hg/58ZLwwlfUzISlMrMCCtmbfGK16hIEaza
 58cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2fnW0hKm3/LoNJLASktWawEV8gjSA8FRX1R6A2wJmoc=;
 b=3BuPxMJNy4Bn3Qu1baFq4X3qIZdRBtcFfCPhIB8myJH90aDE5eYhYv8yIi/+/CmZoL
 p/fssHJs9saEZQQcdpatmkQW2xtTbz5gQkmK3WbJkwuyhaAmnM7stMN1mnPizma3kaP1
 cgST0PPowTPS4y4HEIdK9paFR3YEdwRIsFUFIuOVyAelgRYWM7CY+hjNTOQ2Yndtptuy
 y9+vm35chzB2C92JRKleFucXNwvYCNX8M77oPMTt9QmV5akyJVMEv5SBEgbqhkoW6eZN
 XSm0KNRPySr3lzK9NGuS7RRs0fofjPtZBoDlZwDbqGLZ+KMvl1ANpdPFaJZc0oD8SZ9p
 jImw==
X-Gm-Message-State: AOAM533tV739TgLlTSezUE41pcnYJuwUSPoroS9cPfFMlwubviWZCY/P
 v462zbWiolN/uiCwfHr17Yk=
X-Google-Smtp-Source: ABdhPJwCTNosh9GI+S3j5GevCu9iAaWtBDkxqy67gDMWi3yh/+yzOHoB574Ou1NqeC8q0+4VIzZU1w==
X-Received: by 2002:a05:6402:3689:b0:419:d380:ddbc with SMTP id
 ej9-20020a056402368900b00419d380ddbcmr8454741edb.230.1648463313648; 
 Mon, 28 Mar 2022 03:28:33 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:4276:c469:b15d:9dea?
 ([2a02:908:1252:fb60:4276:c469:b15d:9dea])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b006ce69ff6050sm5729145ejm.69.2022.03.28.03.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 03:28:32 -0700 (PDT)
Message-ID: <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
Date: Mon, 28 Mar 2022 12:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com> <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville & Daniel,

Am 25.03.22 um 16:28 schrieb Christian König:
> Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
>> On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
>>> Add a general purpose helper to deep dive into 
>>> dma_fence_chain/dma_fence_array
>>> structures and iterate over all the fences in them.
>>>
>>> This is useful when we need to flatten out all fences in those 
>>> structures.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> One of the dma-buf patches took down Intel CI. Looks like every
>> machine oopses in some sync_file thing now:
>> <1>[  260.470008] BUG: kernel NULL pointer dereference, address: 
>> 0000000000000010
>> <1>[  260.470020] #PF: supervisor read access in kernel mode
>> <1>[  260.470025] #PF: error_code(0x0000) - not-present page
>> <6>[  260.470030] PGD 0 P4D 0
>> <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted 
>> 5.17.0-CI-CI_DRM_11405+ #1
>> <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake Client 
>> Platform/Jasperlake DDR4 SODIMM RVP, BIOS 
>> JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
>> <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20

I've looked into this and the root cause seems to be that the new code 
doesn't handle dma_fence_arrays with zero elements.

That is rather easy to fix, but a dma_fence_array with zero number of 
elements is most likely a bug because under the wrong circumstances it 
can create a dma_fence instance which will never signal.

I've send out a patch on Frinday ([PATCH] dma-buf: WIP 
dma_fence_array_first fix) which avoids the crash and prints a warning 
if anybody tries to create a dma_fence_array with zero length.

Can you test this?

Thanks in advance,
Christian.
