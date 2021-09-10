Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D174068BC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74776E9A6;
	Fri, 10 Sep 2021 08:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452B6E9A6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:51:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x6so1515229wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4bYItIQD726/DFoyrtYrhxGF3N/yMu3gcU/2kBdFGd4=;
 b=WXqpv+CFZ4ckKolPA2sqzbRV4TPZ/vzXl4XSXQNWZC3KJkj/sEXx1EHy8QuNf3mEAl
 A/i5LSfDW5YXPXdz36taLvs/byM6D1BYYMHLbl2AHhz9Um2/yd5ZEPbPonopzdr3JIJE
 0iNtRFa3hDwUDr02shTpoStFBFhbSkGQmrHrswB02Jy/kAYI6cFJTOTNSDDwf8HliIH8
 L1XjbpqbB8ML/e7YzR8H7DEgHkcf3zqS3BG9mjGMgWrNFmZ2mWb+Usf+p7xzK94s346l
 /KpLRVkU1CC7Nxj+VxLg0TEwOh29W/mi9DCziPds+bryljY+DXgR4lr8PTClqMsICeYg
 ATng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4bYItIQD726/DFoyrtYrhxGF3N/yMu3gcU/2kBdFGd4=;
 b=FjN2PhgzkqjNna1npQRvLv3UMEDTainWsv9bAjiusX1tvSUMm5GM2jOS6CkfR+t0Z9
 S3K39YEKgx3SFNx5EtxyHZa2NMW4HYKFu5MjN/YQ43goKACwarhbdQqpyEbG+mrN52xQ
 vu1GwVyJLaHHrfA+4/mT5KCVgIVftJQ1aknm058UjmpA6D32Nn9YFmA6zSBW0VBxILyy
 l+j1BTmk9OeL9NFwDNoL+jWWJ+39bTcleVIhiSrx3RDuTLHX5kmHoEZNSPpayeU3ZHCQ
 djc8bAAadzX3oQnnD2q4ucJJxZRz41dOcKzV4BsbutWXwINzi15VVlYDB9WcuzRR97oq
 RUOg==
X-Gm-Message-State: AOAM533JamTPyWapSjMK3EitwY+FAqwPkazrX4mB9VRbrMdIOc/ciU9V
 9OKFGKeomIQoH3gHuleLq89g3jVLgD7Rq3YN
X-Google-Smtp-Source: ABdhPJwX6HvAnkdRKLm+nzqmZlNCa1hnV1BjM40NRJ488NiPl2d3Su4HZOvDKQyZabmROZQwbemJPA==
X-Received: by 2002:adf:d216:: with SMTP id j22mr6215309wrh.295.1631263888307; 
 Fri, 10 Sep 2021 01:51:28 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id m4sm3869862wml.28.2021.09.10.01.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 01:51:27 -0700 (PDT)
Subject: Re: i915 ttm_tt shmem backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
 <ffab32dacece7fe3bb155f1ce2873d9e603f9f09.camel@linux.intel.com>
 <8129207c-bfb6-a710-c051-0f1befa55807@gmail.com>
 <363f7eea81dbdfec69fa8586a7b04e5d383bc551.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e48f9994-f3ac-9f0c-ee4d-3f40e2c7f29c@gmail.com>
Date: Fri, 10 Sep 2021 10:51:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <363f7eea81dbdfec69fa8586a7b04e5d383bc551.camel@linux.intel.com>
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

Am 10.09.21 um 10:40 schrieb Thomas Hellström:
> On Fri, 2021-09-10 at 10:25 +0200, Christian König wrote:
>>
>> Am 10.09.21 um 10:08 schrieb Thomas Hellström:
>>> Perhaps some background and goal is worth mentioning here.
>>>
>>>
>>> On Thu, 2021-09-09 at 17:56 +0100, Matthew Auld wrote:
>>>> On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
>>>> <Christian.Koenig@amd.com> wrote:
>>>>> Hi Matthew,
>>>>>
>>>>> this doesn't work, I've already tried something similar.
>>>>>
>>>>> TTM uses the reverse lookup functionality when migrating BOs
>>>>> between system and device memory. And that doesn't seem to work
>>>>> with pages from a shmem file.
>>>> Hmm, what do you mean by reverse lookup functionality? Could you
>>>> please point out where that is in the TTM code?
>>> I think this is in unmap_mapping_range() where, if we use
>>> VM_MIXEDMAP,
>>> there is a reverse lookup on the PTEs that point to real pages. Now
>>> that we move over to VM_PFNMAP, that problem should go away since
>>> core
>>> vm never has a page to investigate. Probably this is why things
>>> works
>>> on non-TTM i915 GEM.
>> Yeah, that was really likely the root problem. I didn't kept
>> investigating after realizing that my approach wouldn't work.
>>
>>> @Christian: Some background here:
>>> First I think that there might be things like the above that will
>>> pose
>>> problems, and we may or may not be able to overcome those but more
>>> importantly is that we agree with you that *if* we make it work, it
>>> is
>>> something that you as a maintainer of TTM can accept from a design-
>>> and
>>> maintainabiltiy point of view.
>>>
>>> The approach would be similar to the buddy allocator, we adapt some
>>> driver code to TTM in a way that it may be reused with other
>>> drivers,
>>> and if other drivers are interested, we'd assist in moving to core
>>> TTM.
>>> In essence it'd be a TTM shmem page pool with full shrinking
>>> ability
>>> for cached pages only.
>>>
>>> What we're really after here is the ability to shrink that doesn't
>>> regress much w r t the elaborate shrinker that's in i915 today that
>>> is
>>> power management aware and is also able to start shmem writebacks
>>> to
>>> avoid shmem just caching the pages instead of giving them back to
>>> the
>>> system (IIRC it was partly the lack of this that blocked earlier
>>> TTM
>>> shrinking efforts).
>>>
>>> And since it doesn't really matter whether the shrinker sits in
>>> core
>>> TTM or in a driver, I think a future goal might be a set of TTM
>>> shrinker helpers that makes sure we shrink the right TTM object,
>>> and
>>> perhaps a simple implementation that is typically used by simple
>>> drivers and other drivers can build on that for a more elaborate
>>> power-
>>> management aware shrinker.
>> That's understandable, but I think not necessary what we should aim
>> for
>> in the long term.
>>
>> First of all I would really like to move more of the functionality
>> from
>> ttm_pool.c into the core memory management, especially handling of
>> uncached and write combined memory.
>>
>> That's essentially completely architecture dependent and currently
>> implemented extremely awkward. Either Daniels suggestion of having a
>> GFP_WC or Christophs approach of moving all this into the DMA API is
>> the
>> way to go here.
>>
>> As long as i915 has no interest in USWC support implementing their
>> own
>> shmemfile backend sounds fine to me, but I have strong doubt that
>> this
>> will be of use to anybody else.
> OK. Sounds fine. In situations where we use WC system memory we will
> use what's in TTM today. BTW on the shrinking approach for WC pages,
> does the Christoph's DMA API solution envision some kind of support for
> this?

Not Christoph DMA API solution, but what I have in mind for the TTM 
shrinker should work.

Essentially a shmemfile per device should help in solving most of the 
issues we ran into.

Christian.

>
> /Thomas
>
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>> ________________________________
>>>>> Von: Matthew Auld <matthew.william.auld@gmail.com>
>>>>> Gesendet: Donnerstag, 9. September 2021 16:56
>>>>> An: Christian König <ckoenig.leichtzumerken@gmail.com>; Koenig,
>>>>> Christian <Christian.Koenig@amd.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; ML
>>>>> dri-
>>>>> devel <dri-devel@lists.freedesktop.org>
>>>>> Betreff: i915 ttm_tt shmem backend
>>>>>
>>>>> Hi Christian,
>>>>>
>>>>> We are looking into using shmem as a ttm_tt backend in i915 for
>>>>> cached
>>>>> system memory objects. We would also like to make such objects
>>>>> visible
>>>>> to the i915-gem shrinker, so that they may be swapped out or
>>>>> discarded
>>>>> when under memory pressure.
>>>>>
>>>>> One idea for handling this is roughly something like:
>>>>> - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
>>>>> - Skip the ttm_pages_allocated accounting on such objects,
>>>>> similar
>>>>> to
>>>>> how FLAG_SG is already handled.
>>>>> - Skip all the page->mapping and page->index related bits, like
>>>>> in
>>>>> tt_add_mapping, since it looks like these are set and used by
>>>>> shmem.
>>>>> Not sure what functionally this might break, but looks like
>>>>> it's
>>>>> maybe
>>>>> only driver specific?
>>>>> - Skip calling into ttm_bo_swap_out/in and just have
>>>>> ttm_populate/unpopulate handle this directly for such objects.
>>>>> - Make such objects visible to the i915-gem shrinker.
>>>>>
>>>>> Does this approach look acceptable?
>

