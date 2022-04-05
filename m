Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8D4F38F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42E910E20B;
	Tue,  5 Apr 2022 14:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4BC10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=yDe80dB3PcLLjC73bVCnCnNNULyXZtKg1Crra+A5bJo=; b=MKQPYpOohaUf88JeLFDJOO+/sW
 rPWNUODd1G7R/GWtLPxD35hsZzHm7lfA2fgTRY1mJ918gJo/J7wkGFjIa2wz2qoQlxOzYC53p7OAx
 WOKm2lEmAhkUtYkXsmFahxYNzl5WHpw1jT+/VU93Lv75N69qopw81Gf7e8O88HavJETlyLn63CNB4
 /+5jUfCBH6tprXYmnn6c3KdrvsUFUZmz35pEvSfhaTOeJcTkt/A47k0zJlwqfo9QL0tricRrzIcPf
 vw7gSENAliOUQALLMW/5mSYZ3lDnzVPkcW9wT71UGl1HMUaCyqGMXK8ACLdR0z6ACotd8vpEsgXJ8
 TQhbEaHQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkLJ-001sTR-9Z; Tue, 05 Apr 2022 14:39:38 +0000
Message-ID: <c544d79e-90ec-7bbe-77ad-de96a700d711@infradead.org>
Date: Tue, 5 Apr 2022 07:39:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Simon Ser <contact@emersion.fr>
References: <20220403232902.1753-1-rdunlap@infradead.org>
 <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
 <b20bbd22-895c-9e74-e579-d2f3561a2fe1@infradead.org>
 <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
 <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
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
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/22 23:26, Javier Martinez Canillas wrote:
> On 4/5/22 08:12, Simon Ser wrote:
>> On Monday, April 4th, 2022 at 23:35, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> On 4/4/22 09:04, Simon Ser wrote:
>>>
>>>> Both doc patches pushed, thanks. I had to manually edit them because they
>>>> wouldn't apply cleanly. Next time, please use git-send-email (see
>>>> https://git-send-email.io/ for setup instructions).
>>>
>>> That's odd. I did use 'git send-email' and I don't usually have any
>>> problems (AFAIK). I'll check those setup instructions.
>>
>> Hm, maybe the issue isn't git-send-email, but the way the patch was
>> generated? I had to manually edit these lines for the first patch to work:
>>
>>     --- linux-next-20211217.orig/include/drm/drm_file.h
>>     +++ linux-next-20211217/include/drm/drm_file.h
>>
>> I changed these to:
>>
>>     --- a/include/drm/drm_file.h
>>     +++ b/include/drm/drm_file.h
>>
>> This wasn't enough for the second patch, I had to re-do the changes by hand
>> from scratch.
>>
> 
> Yes, I believe the suggestion should be to use git-format-patch instead.
> 
> To make sure that was is posted can be consumed by the git-am command.

Considering that I am not using git, I think it will be difficult
to use git-format-patch.

(git-send-email is independent of git.)

Still, this is the first time in many years that I have heard
of this problem.

Thanks for the info and insights.

-- 
~Randy
