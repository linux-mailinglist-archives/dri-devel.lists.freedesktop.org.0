Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A83BF909
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0025E6E8A6;
	Thu,  8 Jul 2021 11:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CA6E8A6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:30:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso3791536wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PTSHTSftmxm1hbwNqdmL63X7nN2F9GBrk+rW6PwCPP8=;
 b=SloShEYtrsKo+viS242nzIMzue4me3Ro3Mzr2gmvaEyMi9AUckAtWQtUXdOL1ulBbM
 XQjVCxS75NKVJjP9uFcdoG8EGyoZz2UuYqUcN3Tsv7Bne/Li0aZaZKaRo8DHYEi+X5NY
 8SCcqtETWKvSU0Pmzo9xAHZ4q8ktTT/EGKBIgvdAUCWnKhxqfHS33bpdnrDUK2jdovr8
 HqFZJqAhtYSNY/0DTG4ezmQ96yUPZUY5wZDl3MTHZOhFalD1pd5JLQP751sAyhG9GNBS
 SPzcms21eVZZ5GoK4xKXcVh13LfL2mQpNtE+1M64dAdc+aUQG90ZFv5y4X0Kh0XDME/j
 aG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PTSHTSftmxm1hbwNqdmL63X7nN2F9GBrk+rW6PwCPP8=;
 b=WqA1ipABhfwreUjhmUcp6eaSd4pNzd4WZFRCH/shTWwJoES/aKT8bWJDb66wIJ/bKM
 DcZscrV1iKrPmye6WPji6Na1yi+VD1tgiDDL+vejno1ZKMRYZBlJWbPiNEAgFVT9wIOG
 XKUi3TK26TSjG9nm/VvwZvC+GFRzj+4V/HeCPJaGjcN8eysIW/a9b0VxgxqKnJWUEeMc
 3xsTiD9+EZ+EF8j3WV3796yzbbZa7MT7AG5hBSoNS+3s82opL0IUXB0DkYZptEF9N/XI
 5m6FSlWVONVd2eHobdBx1kCReAc6TDmmAEPygtmk6FBQLNhX8mo9XpL7efCv5laoSBAG
 oknw==
X-Gm-Message-State: AOAM531UZiOrpzUSUamNG4XrTlYMAod5giBpIJxywLImdHUM7cdYPB64
 1bpLVftmpBlDCq7BfsOYFp97uIBzizw=
X-Google-Smtp-Source: ABdhPJz7+lvN2bgLSou5OesLvBdAJ+O7zzZfjwzXHQ4KxksPW0Y31P1LDdlUWLj5Hj82FIu+vBDdMw==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr33323544wmj.4.1625743845198;
 Thu, 08 Jul 2021 04:30:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e?
 ([2a02:908:1252:fb60:bc19:c1e3:6307:7e3e])
 by smtp.gmail.com with ESMTPSA id p8sm1673788wre.76.2021.07.08.04.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:30:44 -0700 (PDT)
Subject: Re: Oops in qxl_bo_move_notify()
To: Daniel Vetter <daniel@ffwll.ch>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dave Airlie <airlied@gmail.com>
References: <3c414722f5d84875a9251b3cc120a26a@huawei.com>
 <YObQAIhvrZXlQ5HX@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <64d3beaa-bfe2-1e8d-2989-9244dd4eda16@gmail.com>
Date: Thu, 8 Jul 2021 13:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YObQAIhvrZXlQ5HX@phenom.ffwll.local>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, that's an already known issue.

When the allocation fails bo->resource might be NULL now and we need to 
add checks for that corner case as well.

Christian.

Am 08.07.21 um 12:14 schrieb Daniel Vetter:
> On Wed, Jul 07, 2021 at 04:36:49PM +0000, Roberto Sassu wrote:
>> Hi
>>
>> I'm getting this oops (on commit a180bd1d7e16):
>>
>>      [   17.711520] BUG: kernel NULL pointer dereference, address: 0000000000000010
>>      [   17.739451] RIP: 0010:qxl_bo_move_notify+0x35/0x80 [qxl]
>>      [   17.827345] RSP: 0018:ffffc90000457c08 EFLAGS: 00010286
>>      [   17.827350] RAX: 0000000000000001 RBX: 0000000000000000 RCX: dffffc0000000000
>>      [   17.827353] RDX: 0000000000000007 RSI: 0000000000000004 RDI: ffffffff85596feb
>>      [   17.827356] RBP: ffff88800e311c00 R08: 0000000000000000 R09: 0000000000000000
>>      [   17.827358] R10: ffffffff8697b243 R11: fffffbfff0d2f648 R12: 0000000000000000
>>      [   17.827361] R13: ffff88800e311e48 R14: ffff88800e311e98 R15: ffff88800e311e90
>>      [   17.827364] FS:  0000000000000000(0000) GS:ffff88805d800000(0000) knlGS:0000000000000000
>>      [   17.861699] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>      [   17.861703] CR2: 0000000000000010 CR3: 000000002642c000 CR4: 0000000000350ee0
>>      [   17.861707] Call Trace:
>>      [   17.861712]  ttm_bo_cleanup_memtype_use+0x4d/0xb0 [ttm]
>>      [   17.861730]  ttm_bo_release+0x42d/0x7c0 [ttm]
>>      [   17.861746]  ? ttm_bo_cleanup_refs+0x127/0x420 [ttm]
>>      [   17.888300]  ttm_bo_delayed_delete+0x289/0x390 [ttm]
>>      [   17.888317]  ? ttm_bo_cleanup_refs+0x420/0x420 [ttm]
>>      [   17.888332]  ? lock_release+0x9c/0x5c0
>>      [   17.901033]  ? rcu_read_lock_held_common+0x1a/0x50
>>      [   17.905183]  ttm_device_delayed_workqueue+0x18/0x50 [ttm]
>>      [   17.909371]  process_one_work+0x537/0x9f0
>>      [   17.913345]  ? pwq_dec_nr_in_flight+0x160/0x160
>>      [   17.917297]  ? lock_acquired+0xa4/0x580
>>      [   17.921168]  ? worker_thread+0x169/0x600
>>      [   17.925034]  worker_thread+0x7a/0x600
>>      [   17.928657]  ? process_one_work+0x9f0/0x9f0
>>      [   17.932360]  kthread+0x200/0x230
>>      [   17.935930]  ? set_kthread_struct+0x80/0x80
>>      [   17.939593]  ret_from_fork+0x22/0x30
>>      [   17.951737] CR2: 0000000000000010
>>      [   17.955496] ---[ end trace e30cc21c24e81ee5 ]---
>>
>> I had a look at the code, and it seems that this is caused by
>> trying to use bo->resource which is NULL.
>>
>> bo->resource is freed by ttm_bo_cleanup_refs() ->
>> ttm_bo_cleanup_memtype_use() -> ttm_resource_free().
>>
>> And then a notification is issued by ttm_bo_cleanup_refs() ->
>> ttm_bo_put() -> ttm_bo_release() ->
>> ttm_bo_cleanup_memtype_use(), this time with bo->release
>> equal to NULL.
>>
>> I was thinking a proper way to fix this. Checking that
>> bo->release is not NULL in qxl_bo_move_notify() would
>> solve the issue. But maybe there is a better way, like
>> avoiding that ttm_bo_cleanup_memtype_use() is called
>> twice. Which way would be preferable?
> Adding Christian and Dave, who've touched all this recently iirc.
> -Daniel
>
>> Thanks
>>
>> Roberto
>>
>> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
>> Managing Director: Li Peng, Li Jian, Shi Yanli

