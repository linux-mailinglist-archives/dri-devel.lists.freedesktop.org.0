Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940FE406807
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 09:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7CE6E983;
	Fri, 10 Sep 2021 07:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABBD6E981
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 07:53:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so1335236wrb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WhshFnN7hBous5s8zxHTdM1IYtM72Wgotu48vB3UyYQ=;
 b=JbjF0qYC8zqQAqTlDCBERQWYKpyp4qMMhOfJKtRRLAsDyFcwfJW7lDA4ksu1/eMyIg
 aOxW8OuJfDQomky3RerT0K33V2puZKwZawRAiruq25ejHia0OBMfbvelQI0q/XFRHpa3
 cJlevNSOcbXXVXu19RLjcruOwkimc2eONYJXpN8ocuVy0hMECebDVwihzRwZY30y1nuf
 wqLDqmbMXN6v0PXSNrTPp6axdYKiTUD6UfCZuE2O/a5IbV69+NGzFyHQAjPUGWZUw4yi
 7EF52i2JlgrdFMtGRoKPGjcE6BrePvbWzIEOA7F+7U1Gck58laVKw3haJk1K09+lygov
 ehzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WhshFnN7hBous5s8zxHTdM1IYtM72Wgotu48vB3UyYQ=;
 b=WnWCLaV0V7pEJAIpVEWsLhuRW4O6+Wz3bBTVAXlA5cHN3Z8H5ayiEu3EypgO392gwE
 +lwMB7mlMPuBMwLS6TGnxXO5d8adorjHrc8qcpbodGC4vvUL+lkbLpL4hFxP9HuuhNJ9
 dpyMn9UI8JrA04+6U2Xnnuji4ZbxuyW9F8h90EME8ejqREpj2n1HimCE6k/mFsLC02gO
 vidtbR5CTFSFYMU6qKKpIQx9Abe1JDk/KbZrZ+Nj2pESr0nntdObEgZUhi3lzrnPjj8p
 iKotoRW0KH4FYamf7hylwf3jVis2C3jx2Tqow3755KM3fjarP8iicUQymb7nGZVs7+i3
 wr0g==
X-Gm-Message-State: AOAM532z1t4qNUGfCDzCR3J+TjO0MnxxOLUnYoQAOmeel0Hv6SAjUBDI
 e5WvfgbUvZZ/P7DiZXkOYR+nYC6ki5S6AfiA
X-Google-Smtp-Source: ABdhPJyKKdPP+lg00LX5R7nPhhtJdI1qZD215Fps2zgrXI31p3vyBTDzTvxG2+BzR+OAe3/K2kPfGA==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr573872wrr.399.1631260414423;
 Fri, 10 Sep 2021 00:53:34 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id m184sm3653443wmm.3.2021.09.10.00.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 00:53:34 -0700 (PDT)
Subject: Re: i915 ttm_tt shmem backend
To: Matthew Auld <matthew.william.auld@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b364d8a3-c160-9c06-4438-5c2f488b29fe@gmail.com>
Date: Fri, 10 Sep 2021 09:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.09.21 um 18:56 schrieb Matthew Auld:
> On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
> <Christian.Koenig@amd.com> wrote:
>> Hi Matthew,
>>
>> this doesn't work, I've already tried something similar.
>>
>> TTM uses the reverse lookup functionality when migrating BOs between system and device memory. And that doesn't seem to work with pages from a shmem file.
> Hmm, what do you mean by reverse lookup functionality? Could you
> please point out where that is in the TTM code?

When TTM moves a buffer it must make sure that the buffer is not 
accessed by the CPU while moving it.

For this the standard reverse lockup functionality of the Linux kernel 
is used to figure out in which page tables a page is mapped and mark 
those as invalid. Accessing the buffer object will then cause a page 
fault which in turn waits for the buffer move to finish.

But when you back the pages in a TT object with pages from a shmemfile 
this reverse lockup functionality doesn't work for some reason. I 
couldn't figure out what exactly was going wrong here and didn't looked 
deeper, I assumed it's because of not setting up page->mapping and 
page->index correctly. Thomas or Daniel might know more.

Apart from that your approach sounds like pretty much what I tried as well.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>> ________________________________
>> Von: Matthew Auld <matthew.william.auld@gmail.com>
>> Gesendet: Donnerstag, 9. September 2021 16:56
>> An: Christian König <ckoenig.leichtzumerken@gmail.com>; Koenig, Christian <Christian.Koenig@amd.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; ML dri-devel <dri-devel@lists.freedesktop.org>
>> Betreff: i915 ttm_tt shmem backend
>>
>> Hi Christian,
>>
>> We are looking into using shmem as a ttm_tt backend in i915 for cached
>> system memory objects. We would also like to make such objects visible
>> to the i915-gem shrinker, so that they may be swapped out or discarded
>> when under memory pressure.
>>
>> One idea for handling this is roughly something like:
>> - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
>> - Skip the ttm_pages_allocated accounting on such objects, similar to
>> how FLAG_SG is already handled.
>> - Skip all the page->mapping and page->index related bits, like in
>> tt_add_mapping, since it looks like these are set and used by shmem.
>> Not sure what functionally this might break, but looks like it's maybe
>> only driver specific?
>> - Skip calling into ttm_bo_swap_out/in and just have
>> ttm_populate/unpopulate handle this directly for such objects.
>> - Make such objects visible to the i915-gem shrinker.
>>
>> Does this approach look acceptable?

