Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CF4A99D3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3D610F874;
	Fri,  4 Feb 2022 13:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287C10F874;
 Fri,  4 Feb 2022 13:20:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c192so4479872wma.4;
 Fri, 04 Feb 2022 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=cMoVa5I0AfvRr6dsMtZbMvRygV9sYtL69pEQOhNDKTI=;
 b=awD0Owg0KNW+Cod8yDI1CD7zljIwsN4H40IbHxTSPCHJv65Q4zezki+bGupgZ5w86t
 5IQjEEqn+0fF6/x40oIGmlAESfdLuuKuRaED+ILsTP5kqKh30RkCfsZ577jfoqpv4uG6
 XAlNUyQrFW0HEZRJ/a7I+MEXhXwSgTmAaLVDxAuQDBL/qbj09KUFodt7zBrFLNNZc4oF
 j5Iukl+WP7fPkcRbIUUkMS2+MtFkm2yr9PKTN0GKln6pnWwniSNcij/+91V24t1qs7bm
 Te4fL1rxfPPIa8wSFLNPOwiYU9gcDCRjvynRZMNRR2UkdV84wJvXEg3UJxZb9B+Gh6CR
 hZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cMoVa5I0AfvRr6dsMtZbMvRygV9sYtL69pEQOhNDKTI=;
 b=mKXXYH0zPKXLpxKdhBYN3xn90LiIg0r+TtQX6vYI80+9IolSY0FJLftL6Mql+jxQFF
 LJfWXHhm6gD83uzFwsng2eMrikDlvk56cKg7atcPryc/sR1E/eoACSlCmSK/jMUsA3HA
 2v9MNowxDxMB5tTgodm9ZhZGtq6cFOAUiRrqC392yjYZ7bv3PgDEa9znQiqxbR0qvpIR
 KM5raynqSG21sgqqqwuxyo/bsCthmz/klI7MC3Hn+oq1kkZupxu1M8ll67h+N6QrCt1I
 uwyPyDXJ7Htk28xInigWqqz+ghx6e3ZIUSSP8P7BMo5tM/TTJKAjbdMiGu7cKmPpaEio
 UBzw==
X-Gm-Message-State: AOAM531RXxngHUMxew+7lHqKf4uS5U7EklywthuF4j0IugFWN4VDkpCu
 8gdSnplv6Njgq/HlhH6VaeDdzeCMPDw=
X-Google-Smtp-Source: ABdhPJylKlWmIm0oi+FM5lpPgODm89FwixxBRrQzrYPTm1UwC2fmO97sjXdJ06kRVIodlYYxQI7BdQ==
X-Received: by 2002:a05:600c:1e84:: with SMTP id
 be4mr2180842wmb.147.1643980808469; 
 Fri, 04 Feb 2022 05:20:08 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:7e37:f7a5:7cd9:7eb0?
 ([2a02:908:1252:fb60:7e37:f7a5:7cd9:7eb0])
 by smtp.gmail.com with ESMTPSA id f16sm1785283wmg.28.2022.02.04.05.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 05:20:07 -0800 (PST)
Message-ID: <ddae0316-8576-f5c1-b6be-792625be37e2@gmail.com>
Date: Fri, 4 Feb 2022 14:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Add warning for nesting dma_fence containers
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 sumit.semwal@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <c722ceda1ffed0d9065f0d6ed63faa5d3f2e7a9a.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c722ceda1ffed0d9065f0d6ed63faa5d3f2e7a9a.camel@linux.intel.com>
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



Am 04.02.22 um 11:40 schrieb Thomas Hellström:
> On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
>> Hi everyone,
>>
>> Since some operations can then lead to recursive handling nesting
>> dma_fence containers into each other is only allowed under some
>> restrictions.
>>
>> dma_fence_array containers can be attached to dma_fence_chain
>> containers and dma_fence_chain containers by chaining them together.
>>
>> In all other cases the individual fences should be extracted with
>> the appropriate iterators and added to the new containers
>> individually.
>>
>> I've separated the i915 cleanup from this change since it is
>> generally a different functionality and the build bots complained
>> about some issues with those patches.
>>
>> Most patches are already reviewd, but especially the first one still
>> needs an rb tag.
>>
>> Please review and comment,
> I see you dropped the i915 patch (probably due to lack of reviews?),
> Got distracted with other things, but I'll see if I can resurrect that
> and get it reviewed and merged.

I was about to send out the i915 patch when that one here is merged.

The CI systems yielded some strange error with that one and I wanted to 
double check what's that all about.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>> Christian.
>>
>>
>

