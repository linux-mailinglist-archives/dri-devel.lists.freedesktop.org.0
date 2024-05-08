Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE18BFDAB
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E3C1128A2;
	Wed,  8 May 2024 12:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="mS7kG3tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A011128A2;
 Wed,  8 May 2024 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=zjLlvB+WbJijsa7Xq2sGoO7LgZnL7gRVI2UA3wsYzcY=;
 t=1715172678; x=1715604678; b=mS7kG3tldp2/m8/UT5K89vDUqRnPezUCaXpAA+v6bu9JX1g
 v/lS3LmgUbKQfwL20jv93LmTX5uM6Iw9Hoo1w0a5dkUqzslP6MBRqayzYV0Hstd9qTscyT3ctJYsO
 5IveRBBDuP4x7U8+ilXtuQVn1e35fFh+Lldo68hLiRVInA3F104UgbUWjpd21gzFNXZHgY5WiV1uo
 3iAqX0udviQHQTTV5qXzlCOiP8fxVKAynw7ueUCXHXLBuAIC+xOY+dF0kx9B3Ioewk6V/tE0NK1Fj
 JaAnynokQbOjDE8TajvyIoqZmTYSJDLgzlei7pq4iJaK+bJf5LuwKGp/7pDNPz5A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s4glL-0003Db-Ck; Wed, 08 May 2024 14:51:11 +0200
Message-ID: <7e3fdac4-e0bc-42f4-9bb3-a6b16f323491@leemhuis.info>
Date: Wed, 8 May 2024 14:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
To: stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 spice-devel@lists.freedesktop.org, tzimmermann@suse.de,
 virtualization@lists.linux.dev, Anders Blomdell <anders.blomdell@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 David Wang <00107082@163.com>
References: <20240430061337.764633-1-00107082@163.com>
 <20240506143003.4855-1-00107082@163.com>
 <ac41c761-27c9-48c3-bd80-d94d4db291e8@leemhuis.info>
 <b57f8ede-5de6-4d3d-96a0-d2fdc6c31174@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <b57f8ede-5de6-4d3d-96a0-d2fdc6c31174@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1715172678;
 435e0abf; 
X-HE-SMSGID: 1s4glL-0003Db-Ck
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.05.24 14:35, Anders Blomdell wrote:
> On 2024-05-07 07:04, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 06.05.24 16:30, David Wang wrote:
>>>> On 30.04.24 08:13, David Wang wrote:
>>
>>>> And confirmed that the warning is caused by
>>>> 07ed11afb68d94eadd4ffc082b97c2331307c5ea and reverting it can fix.
>>>
>>> The kernel warning still shows up in 6.9.0-rc7.
>>> (I think 4 high load processes on a 2-Core VM could easily trigger
>>> the kernel warning.)
>>
>> Thx for the report. Linus just reverted the commit 07ed11afb68 you
>> mentioned in your initial mail (I put that quote in again, see above):
>>
>> 3628e0383dd349 ("Reapply "drm/qxl: simplify qxl_fence_wait"")
>> https://git.kernel.org/torvalds/c/3628e0383dd349f02f882e612ab6184e4bb3dc10
>>
>> So this hopefully should be history now.
>>
> Since this affects the 6.8 series (6.8.7 and onwards), I made a CC to
> stable@vger.kernel.org

Ohh, good idea, I thought Linus had added a stable tag, but that is not
the case. Adding Greg as well and making things explicit:

@Greg: you might want to add 3628e0383dd349 ("Reapply "drm/qxl: simplify
qxl_fence_wait"") to all branches that received 07ed11afb68d94 ("Revert
"drm/qxl: simplify qxl_fence_wait"") (which afaics went into v6.8.7,
v6.6.28, v6.1.87, and v5.15.156).

Ciao, Thorsten
