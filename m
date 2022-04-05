Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566094F3D12
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7710E49F;
	Tue,  5 Apr 2022 17:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D9110E4FE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=IvBWmBbI9A2nfHfEQ5fw5taUfPeU2oNqR0njw9KESho=; b=gqxsxjVUFVtxRNlYtPkGeAokgL
 nBe9SjwVtkav8yJ/gOpBxNDP/tgC4zPGII+UUa/7IYiLuqyWp2Q680vzBGZZGq+UBPv3r2vg9rX0o
 TE+/Ew+4sRwH/p0pIYC453JYbWT64Q+P0px/53GQzQXLEEgwsBcp81+SEc6EP15K4Szl1gbZTb9EH
 xrPRb4q6u0KsLSvRSDnD5CPqvnN+6GvkJmMuk1e6KK0wwMDnqaQrYB4+dKA9bjsHY4Pg45R1HtRpA
 uBa6XgKeYJ8oid7QGnjylvarWXkEKnV05Fnt/bpeFuCYmcDGR5jmxReZgu8SEciJZkzhxKoAZLPJJ
 GupTbMFQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbnRv-006w06-Nn; Tue, 05 Apr 2022 17:58:40 +0000
Message-ID: <c336dd9d-dae2-f654-4849-669c9b9b568f@infradead.org>
Date: Tue, 5 Apr 2022 10:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20220403232902.1753-1-rdunlap@infradead.org>
 <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
 <b20bbd22-895c-9e74-e579-d2f3561a2fe1@infradead.org>
 <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
 <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
 <c544d79e-90ec-7bbe-77ad-de96a700d711@infradead.org>
 <qjTlHAInyuxpFWsTWPGXoVeByVdVe-NF-kg-FUeLWQbKy9SovMzCcK-eDsijpDt1roaSubDr-8kBGKQSt_7CXFa4-BxQ6SrGSNeoZrdiq-s=@emersion.fr>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <qjTlHAInyuxpFWsTWPGXoVeByVdVe-NF-kg-FUeLWQbKy9SovMzCcK-eDsijpDt1roaSubDr-8kBGKQSt_7CXFa4-BxQ6SrGSNeoZrdiq-s=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 4/5/22 08:05, Simon Ser wrote:
> On Tuesday, April 5th, 2022 at 16:39, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 4/4/22 23:26, Javier Martinez Canillas wrote:
>>
>>> On 4/5/22 08:12, Simon Ser wrote:
>>>
>>>> On Monday, April 4th, 2022 at 23:35, Randy Dunlap rdunlap@infradead.org wrote:
>>>>
>>>>> On 4/4/22 09:04, Simon Ser wrote:
>>>>>
>>>>>> Both doc patches pushed, thanks. I had to manually edit them because they
>>>>>> wouldn't apply cleanly. Next time, please use git-send-email (see
>>>>>> https://git-send-email.io/ for setup instructions).
>>>>>
>>>>> That's odd. I did use 'git send-email' and I don't usually have any
>>>>> problems (AFAIK). I'll check those setup instructions.
>>>>
>>>> Hm, maybe the issue isn't git-send-email, but the way the patch was
>>>> generated? I had to manually edit these lines for the first patch to work:
>>>>
>>>> --- linux-next-20211217.orig/include/drm/drm_file.h
>>>> +++ linux-next-20211217/include/drm/drm_file.h
>>>>
>>>> I changed these to:
>>>>
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h

quilt (which I am using) can generate a/ b/ patches instead of linux.orig/ and
linux/ patches.

>>>> This wasn't enough for the second patch, I had to re-do the changes by hand
>>>> from scratch.

I would like more information about this one if it's not too much trouble
for you.

>>> Yes, I believe the suggestion should be to use git-format-patch instead.
>>>
>>> To make sure that was is posted can be consumed by the git-am command.
>>
>>
>> Considering that I am not using git, I think it will be difficult
>> to use git-format-patch.
> 
> Ah, okay. Would you consider using Git for you next patches?

Don't know. It's quite a big hurdle to jump over IMO.

> (FYI, I'll pass next time I hit a patch which doesn't apply cleanly.
> Nothing personal, it's just that I don't have time to deal with broken
> patches.)

Yeah, I get it.

thanks.
-- 
~Randy
