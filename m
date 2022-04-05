Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74AC4F3D45
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 21:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9757D10EE6A;
	Tue,  5 Apr 2022 19:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B53310EE6A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=t/jIi5NMSsGNuqWW3SuqC3XVvuEfpO7XbqF5AkaA5/U=; b=LPMKtFqBIJkiHt5K/vxQqvOLCu
 mTtahlGt/q4Xpf4OXU3LL8wuiNduEjzWzNq55unSnMzDk7CYvfowt/vKjj6bjlwQgADze5JQ9Psjo
 zoI+TVMYGfEfL4P70Pe2PFL/JxdwFD2I4WP+DyRear6bSQKw2eCB5CfybzmgtTuN/LMtSQTqF2OfR
 ZPzyowE2VLduY70zxf3YLEz4HZ23/teHo3NsyN9eJJ7+txeZLiIBHgyiORbDW7nI1nMeYFRmNjw9f
 Q6GuLgBNJCpOjbQZRtb3BmZB9wR7iHknQ9vB8LaKHfyWS17w82ksHoUVL6oTdaV3zrqFlq0Ltqr83
 sN+Qa8aQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nboVq-006ykA-C2; Tue, 05 Apr 2022 19:06:46 +0000
Message-ID: <7d16caee-e605-d80b-6638-3ada4dbc4f67@infradead.org>
Date: Tue, 5 Apr 2022 12:06:40 -0700
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
 <c336dd9d-dae2-f654-4849-669c9b9b568f@infradead.org>
 <zO0fTUWc0nKMy-cwUaONpM1AHlfPoNe77IooCuHLEYiowkM165XiiuM2JGASUQrOFcvNMVSGUwETeF7JAIf40r84dwNvh_Gl1MF_ZXYOHWE=@emersion.fr>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <zO0fTUWc0nKMy-cwUaONpM1AHlfPoNe77IooCuHLEYiowkM165XiiuM2JGASUQrOFcvNMVSGUwETeF7JAIf40r84dwNvh_Gl1MF_ZXYOHWE=@emersion.fr>
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



On 4/5/22 11:47, Simon Ser wrote:
> On Tuesday, April 5th, 2022 at 19:58, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 4/5/22 08:05, Simon Ser wrote:
>>
>>> On Tuesday, April 5th, 2022 at 16:39, Randy Dunlap rdunlap@infradead.org wrote:
>>>
>>>> On 4/4/22 23:26, Javier Martinez Canillas wrote:
>>>>
>>>>> On 4/5/22 08:12, Simon Ser wrote:
>>>>>
>>>>>> On Monday, April 4th, 2022 at 23:35, Randy Dunlap rdunlap@infradead.org wrote:
>>>>>>
>>>>>>> On 4/4/22 09:04, Simon Ser wrote:
>>>>>>>
>>>>>>>> Both doc patches pushed, thanks. I had to manually edit them because they
>>>>>>>> wouldn't apply cleanly. Next time, please use git-send-email (see
>>>>>>>> https://git-send-email.io/ for setup instructions).
>>>>>>>
>>>>>>> That's odd. I did use 'git send-email' and I don't usually have any
>>>>>>> problems (AFAIK). I'll check those setup instructions.
>>>>>>
>>>>>> Hm, maybe the issue isn't git-send-email, but the way the patch was
>>>>>> generated? I had to manually edit these lines for the first patch to work:
>>>>>>
>>>>>> --- linux-next-20211217.orig/include/drm/drm_file.h
>>>>>> +++ linux-next-20211217/include/drm/drm_file.h
>>>>>>
>>>>>> I changed these to:
>>>>>>
>>>>>> --- a/include/drm/drm_file.h
>>>>>> +++ b/include/drm/drm_file.h
>>
>>
>> quilt (which I am using) can generate a/ b/ patches instead of linux.orig/ and
>> linux/ patches.
>>
>>>>>> This wasn't enough for the second patch, I had to re-do the changes by hand
>>>>>> from scratch.
>>
>>
>> I would like more information about this one if it's not too much trouble
>> for you.
> 
> IIRC it was the usual git-am error "fatal: sha1 information is lacking
> or useless". Maybe you wrote the patch for an old tree and drm-misc-next
> contained changes near the lines you changed? Maybe providing base-commit
> information in the patch would've helped? I'm not sure.

OK, thanks Simon.

-- 
~Randy
