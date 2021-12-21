Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFD47BDEC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1B10F883;
	Tue, 21 Dec 2021 10:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEC410F883;
 Tue, 21 Dec 2021 10:11:19 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mzc73-0007Io-E0; Tue, 21 Dec 2021 11:11:17 +0100
Message-ID: <c0e77c90-ad42-29ed-7bc6-68f45dbbcfc2@leemhuis.info>
Date: Tue, 21 Dec 2021 11:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Nouveau] [PATCH] drm/nouveau: wait for the exclusive fence after
 the shared ones v2
Content-Language: de-DE
To: Ben Skeggs <skeggsb@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20211209102335.18321-1-christian.koenig@amd.com>
 <b6acb31c-ec63-4242-32da-a35e950e5a67@sfritsch.de>
 <8aee128c-0699-5057-2655-4f7d91ac235b@gmail.com>
 <CACAvsv7D7=Mud1YQ+GACFAqdvBGNp3rjY-eudkXy3uaefY6q+Q@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CACAvsv7D7=Mud1YQ+GACFAqdvBGNp3rjY-eudkXy3uaefY6q+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1640081480;
 0ea6afe8; 
X-HE-SMSGID: 1mzc73-0007Io-E0
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, dmoulding@me.com,
 Ben Skeggs <bskeggs@redhat.com>, Stefan Fritsch <sf@sfritsch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker speaking.

CCing Dave and Daniel.

On 15.12.21 23:32, Ben Skeggs wrote:
> On Tue, 14 Dec 2021 at 19:19, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>> Am 11.12.21 um 10:59 schrieb Stefan Fritsch:
>>> On 09.12.21 11:23, Christian König wrote:
>>>> Always waiting for the exclusive fence resulted on some performance
>>>> regressions. So try to wait for the shared fences first, then the
>>>> exclusive fence should always be signaled already.
>>>>
>>>> v2: fix incorrectly placed "(", add some comment why we do this.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>
>>> Tested-by: Stefan Fritsch <sf@sfritsch.de>
>>
>> Thanks.
>>
>>>
>>> Please also add a cc for linux-stable, so that this is fixed in 5.15.x
>>
>> Sure, but I still need some acked-by or rb from one of the Nouveau guys.
>> So gentle ping on that.
> Acked-by: Ben Skeggs <bskeggs@redhat.com>

What's the status of this patch? I checked a few git trees, but either
it's not there or it missed it.

Reminder, it's a regression already introduced in v5.15, hence all users
of the current stable kernel are affected by it, so it would be nice to
get the fix on its way now that Ben acked it and Dan tested it.

Ciao, Thorsten

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

#regzbot poke

>>>> ---
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 28 +++++++++++++------------
>>>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> index 05d0b3eb3690..0ae416aa76dc 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> @@ -353,15 +353,22 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
>>>> struct nouveau_channel *chan, bool e
>>>>             if (ret)
>>>>               return ret;
>>>> -    }
>>>>   -    fobj = dma_resv_shared_list(resv);
>>>> -    fence = dma_resv_excl_fence(resv);
>>>> +        fobj = NULL;
>>>> +    } else {
>>>> +        fobj = dma_resv_shared_list(resv);
>>>> +    }
>>>>   -    if (fence) {
>>>> +    /* Waiting for the exclusive fence first causes performance
>>>> regressions
>>>> +     * under some circumstances. So manually wait for the shared
>>>> ones first.
>>>> +     */
>>>> +    for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>>>           struct nouveau_channel *prev = NULL;
>>>>           bool must_wait = true;
>>>>   +        fence = rcu_dereference_protected(fobj->shared[i],
>>>> +                        dma_resv_held(resv));
>>>> +
>>>>           f = nouveau_local_fence(fence, chan->drm);
>>>>           if (f) {
>>>>               rcu_read_lock();
>>>> @@ -373,20 +380,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
>>>> struct nouveau_channel *chan, bool e
>>>>             if (must_wait)
>>>>               ret = dma_fence_wait(fence, intr);
>>>> -
>>>> -        return ret;
>>>>       }
>>>>   -    if (!exclusive || !fobj)
>>>> -        return ret;
>>>> -
>>>> -    for (i = 0; i < fobj->shared_count && !ret; ++i) {
>>>> +    fence = dma_resv_excl_fence(resv);
>>>> +    if (fence) {
>>>>           struct nouveau_channel *prev = NULL;
>>>>           bool must_wait = true;
>>>>   -        fence = rcu_dereference_protected(fobj->shared[i],
>>>> -                        dma_resv_held(resv));
>>>> -
>>>>           f = nouveau_local_fence(fence, chan->drm);
>>>>           if (f) {
>>>>               rcu_read_lock();
>>>> @@ -398,6 +398,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
>>>> struct nouveau_channel *chan, bool e
>>>>             if (must_wait)
>>>>               ret = dma_fence_wait(fence, intr);
>>>> +
>>>> +        return ret;
>>>>       }
>>>>         return ret;
>>

