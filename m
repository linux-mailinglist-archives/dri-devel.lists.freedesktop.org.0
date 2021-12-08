Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6C46DA3E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 18:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0C66F970;
	Wed,  8 Dec 2021 17:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE96F5DB;
 Wed,  8 Dec 2021 17:43:47 +0000 (UTC)
Message-ID: <011690dd-ad46-c66b-7a8e-26ad3520f14d@sfritsch.de>
Date: Wed, 8 Dec 2021 18:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
Content-Language: de-DE
To: Dan Moulding <dmoulding@me.com>
References: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
 <20211207204528.6740-1-dmoulding@me.com>
From: Stefan Fritsch <sf@sfritsch.de>
In-Reply-To: <20211207204528.6740-1-dmoulding@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info, bskeggs@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.12.21 21:45, Dan Moulding wrote:
>> There is a pretty obvious typo in there:
>>
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct
>> nouveau_channel *chan, bool e
>>                   fobj = dma_resv_shared_list(resv);
>>           }
>>
>> -       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
>> +       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>                   struct nouveau_channel *prev = NULL;
>>                   bool must_wait = true;
>>
>>
>> With that it works and I don't see the flickering in a short test. I
>> will do more testing, but maybe Dan can test, too.
>>
>> Cheers,
>> Stefan
> 
> After fixing the typo the patch is working for me, also. dmesg is also
> clean. I will continue running the patched kernel. If I see any
> issues, I will report back here.

OK, looks good: I have tested it on top of v5.15.5 for a day and no 
black flickering and no other problems. I am not qualified to review the 
patch, though.

Thanks for the quick responses to everyone.

Cheers,
Stefan
