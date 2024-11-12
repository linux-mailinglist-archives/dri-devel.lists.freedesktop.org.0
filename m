Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B188B9C5BCC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 16:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FD510E603;
	Tue, 12 Nov 2024 15:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3XY0ZVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F8810E603
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 15:26:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso72977155e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731425169; x=1732029969; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvpIPeRQJjb+YmuCvdhk0b3Ka0EkkGoRBY+eP22pJJE=;
 b=k3XY0ZVpvNIlgIdw9PiJhYjkcaxOZostBojHIG7Cq/upkU9+vQ7knmXKHnW2vhYrp4
 1n4Ckl2ioqxMcsqPX4dZDoBHgTQh+EBnb4ajBWy5fpyMdP2bNdwU7YlIRGUPjn5qWEfM
 T43NO1yJwqHePdTXgva4HdD+07qBSD+u/4dnwWNxR2+qdZUT1dHJ5DF3Q9iML9NjcS5x
 HjjjrLbHAkIipWkwIiwFuUNeosYXrTwVqG9YxY+5USzE4LqquSaCLq2OoOlb9D5vs822
 eTlR96a+KidsMMpy0tfStTjTJfZ+NbjO3rj2ZZgP7zMvqJV8ZalX+rjxRGDhvo2Sy5CY
 yoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731425169; x=1732029969;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SvpIPeRQJjb+YmuCvdhk0b3Ka0EkkGoRBY+eP22pJJE=;
 b=Opi1wqZ5owslY/1ETtII8ykAESji+OK65MQm/abI15KZC0t8AAOa3f7BiVALD0YO86
 AmaFcMY6dTebr8bfJHPxg4g1hagk0IQJfhD6F+Lcuc5TLNQ7QPsXs0F97w+3Lquh/k4q
 pgv6OG7gaikoFYBQJMmc/y8HZCCxgppA4dloEai9vVStVOr/LodSI3WNi60N9qc99zjV
 o4ZOV/cq8/dtq6/V9f7ygkR9/ZsYXLc7WAeEJN5wGLpw1StAXHbiiRrZtxKZ7Or6z8uy
 5UcMGOSUY8vTs5wmcY08W98HOtreiQ/Sze4WBHsThNpDvsVeNVk3UC1g40uuBhnAcNfm
 G2bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOpSvJ9nZyaNppGueD5z00GnBmlQ2OaZ1m/DmwCi8wO48du3JGpLPbn7vkPhplOBV/mQKMWxt8ecQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxLVEGDAAWl90662gaUFhI2BjwsI78eQaaN+VBwFwxUYHVINBo
 4ubUMmStCd9LlRRXOeEmEqeLbKRm+ww6PydSiBTAcqPlBxIe7KKr
X-Google-Smtp-Source: AGHT+IHlrVoMgvSsL3XZxnHRwLMju1bjTYNAZ1ZzObeIS8dJS9oKxMbtI0Nv2Jp27nOGeKcLqSWaMA==
X-Received: by 2002:a05:600c:468b:b0:431:b264:bad9 with SMTP id
 5b1f17b1804b1-432b7505af7mr186782215e9.14.1731425168466; 
 Tue, 12 Nov 2024 07:26:08 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053051fsm212134605e9.6.2024.11.12.07.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 07:26:07 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------9kQqm4hCOvwqZj0DDXwujqBn"
Message-ID: <2c3865cb-c7e8-4bbd-85f7-2d193cfc1266@gmail.com>
Date: Tue, 12 Nov 2024 16:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Dave Airlie <airlied@gmail.com>, Sima Vetter <sima@ffwll.ch>
Cc: dakr@kernel.org, pstanner@redhat.com, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------9kQqm4hCOvwqZj0DDXwujqBn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 08.11.24 um 05:00 schrieb Dave Airlie:
> On Wed, 18 Sept 2024 at 23:48, Christian König
> <ckoenig.leichtzumerken@gmail.com>  wrote:
>> Tearing down the scheduler with jobs still on the pending list can
>> lead to use after free issues. Add a warning if drivers try to
>> destroy a scheduler which still has work pushed to the HW.
>>
>> When there are still entities with jobs the situation is even worse
>> since the dma_fences for those jobs can never signal we can just
>> choose between potentially locking up core memory management and
>> random memory corruption. When drivers really mess it up that well
>> let them run into a BUG_ON().
> I've been talking a bit to Phillip about this offline.
>
> I'm not sure we should ever be BUG_ON here, I think it might be an
> extreme answer, considering we are saying blocking userspace to let
> things finish is bad, I think hitting this would be much worse.

Yeah, completely agree that this is the most extreme response.

The problem is that the scheduler doesn't have much of a choice in this 
moment any more. What we can do is the following:

1. Try to block for the queued up jobs in the entities to be processed 
and signaling their hardware fence.

     There is no guarantee that this won't deadlock and we are 
potentially blocking a SIGKILL here.
     We already tried it before and that turned out to be quite unstable.

2. Signal all pending fences without actually executing anything.

     Because of the dma_fence design, pipe-lining work and only keeping 
the latest fence for each context in the containers that can potentially 
lead to random memory corruptions.

3. Don't signal anything, just free up all jobs.

     That can trivially result in the core memory management waiting 
forever for things to make progress. Leading to complete system stops.

So the choice you have are all really bad for the system as a whole.

> I'd rather we WARN_ON, and consider just saying screw it and block
> userspace close.

Going to make that a WARN_ON() if you insist, but IIRC Linus or Greg 
once summarized it as "A BUG() is only justified if you prevent even 
worse things from happening". If you ask me that's exactly the case here.

> If we really want to avoid the hang on close possibility (though I'm
> mostly fine with that) then I think Sima's option to just keep a
> reference on the driver, let userspace close and try and clean things
> up on fences in the driver later.
>
> I think this should be at least good for rust lifetimes.

The problem with the rust lifetime is that it got the direction of the 
dependency wrong.

A dma_fence represents an operation on the hardware, e.g. a direct 
access to some memory. This means that the dma_fence can only signal if 
the hardware tells the driver that the operation is completed.

If a dma_fence should signals because some object is not referenced any 
more, for example because userspace closed it, than that clearly points 
to a fundamentally broken design.

> Having an explicit memory leak is bad, having a managed memory leak is
> less bad, because at least all the memory is still pointed to by
> something and managed, at a guess we'd have to keep the whole driver
> and scheduler around, to avoid having to make special free functions.
> Unless there is some concept like TTM ghost objects we could get away
> with, but I think having to signal the fence means we should keep all
> the pieces.

Well I think memory leaks are more or less harmless. What we really 
really need to prevent are random memory corruptions.

Those can run undetected under the radar for a very long time and cause 
massive damage without anybody being able to pinpoint where corruptions 
came from.

Regards,
Christian.

>
> Dave.
>
>> Signed-off-by: Christian König<christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index f093616fe53c..8a46fab5cdc8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>
>>          drm_sched_wqueue_stop(sched);
>>
>> +       /*
>> +        * Tearing down the scheduler wile there are still unprocessed jobs can
>> +        * lead to use after free issues in the scheduler fence.
>> +        */
>> +       WARN_ON(!list_empty(&sched->pending_list));
>> +
>>          for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>                  struct drm_sched_rq *rq = sched->sched_rq[i];
>>
>>                  spin_lock(&rq->lock);
>> -               list_for_each_entry(s_entity, &rq->entities, list)
>> +               list_for_each_entry(s_entity, &rq->entities, list) {
>> +                       /*
>> +                        * The justification for this BUG_ON() is that tearing
>> +                        * down the scheduler while jobs are pending leaves
>> +                        * dma_fences unsignaled. Since we have dependencies
>> +                        * from the core memory management to eventually signal
>> +                        * dma_fences this can trivially lead to a system wide
>> +                        * stop because of a locked up memory management.
>> +                        */
>> +                       BUG_ON(spsc_queue_count(&s_entity->job_queue));
>> +
>>                          /*
>>                           * Prevents reinsertion and marks job_queue as idle,
>>                           * it will removed from rq in drm_sched_entity_fini
>>                           * eventually
>>                           */
>>                          s_entity->stopped = true;
>> +               }
>>                  spin_unlock(&rq->lock);
>>                  kfree(sched->sched_rq[i]);
>>          }
>> --
>> 2.34.1
>>

--------------9kQqm4hCOvwqZj0DDXwujqBn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 08.11.24 um 05:00 schrieb Dave Airlie:<br>
    <blockquote type="cite"
cite="mid:CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 18 Sept 2024 at 23:48, Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Tearing down the scheduler with jobs still on the pending list can
lead to use after free issues. Add a warning if drivers try to
destroy a scheduler which still has work pushed to the HW.

When there are still entities with jobs the situation is even worse
since the dma_fences for those jobs can never signal we can just
choose between potentially locking up core memory management and
random memory corruption. When drivers really mess it up that well
let them run into a BUG_ON().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've been talking a bit to Phillip about this offline.

I'm not sure we should ever be BUG_ON here, I think it might be an
extreme answer, considering we are saying blocking userspace to let
things finish is bad, I think hitting this would be much worse.</pre>
    </blockquote>
    <br>
    Yeah, completely agree that this is the most extreme response.<br>
    <br>
    The problem is that the scheduler doesn't have much of a choice in
    this moment any more. What we can do is the following:<br>
    <br>
    1. Try to block for the queued up jobs in the entities to be
    processed and signaling their hardware fence.<br>
    <br>
        There is no guarantee that this won't deadlock and we are
    potentially blocking a SIGKILL here.<br>
        We already tried it before and that turned out to be quite
    unstable.<br>
    <br>
    2. Signal all pending fences without actually executing anything.<br>
    <br>
        Because of the dma_fence design, pipe-lining work and only
    keeping the latest fence for each context in the containers that can
    potentially lead to random memory corruptions.<br>
    <br>
    3. Don't signal anything, just free up all jobs.<br>
    <br>
        That can trivially result in the core memory management waiting
    forever for things to make progress. Leading to complete system
    stops.<br>
    <br>
    So the choice you have are all really bad for the system as a whole.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I'd rather we WARN_ON, and consider just saying screw it and block
userspace close.</pre>
    </blockquote>
    <br>
    Going to make that a WARN_ON() if you insist, but IIRC Linus or Greg
    once summarized it as "A BUG() is only justified if you prevent even
    worse things from happening". If you ask me that's exactly the case
    here.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">If we really want to avoid the hang on close possibility (though I'm
mostly fine with that) then I think Sima's option to just keep a
reference on the driver, let userspace close and try and clean things
up on fences in the driver later.

I think this should be at least good for rust lifetimes.</pre>
    </blockquote>
    <br>
    The problem with the rust lifetime is that it got the direction of
    the dependency wrong.<br>
    <br>
    A dma_fence represents an operation on the hardware, e.g. a direct
    access to some memory. This means that the dma_fence can only signal
    if the hardware tells the driver that the operation is completed.<br>
    <br>
    If a dma_fence should signals because some object is not referenced
    any more, for example because userspace closed it, than that clearly
    points to a fundamentally broken design.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Having an explicit memory leak is bad, having a managed memory leak is
less bad, because at least all the memory is still pointed to by
something and managed, at a guess we'd have to keep the whole driver
and scheduler around, to avoid having to make special free functions.
Unless there is some concept like TTM ghost objects we could get away
with, but I think having to signal the fence means we should keep all
the pieces.</pre>
    </blockquote>
    <br>
    Well I think memory leaks are more or less harmless. What we really
    really need to prevent are random memory corruptions.<br>
    <br>
    Those can run undetected under the radar for a very long time and
    cause massive damage without anybody being able to pinpoint where
    corruptions came from.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Dave.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f093616fe53c..8a46fab5cdc8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)

        drm_sched_wqueue_stop(sched);

+       /*
+        * Tearing down the scheduler wile there are still unprocessed jobs can
+        * lead to use after free issues in the scheduler fence.
+        */
+       WARN_ON(!list_empty(&amp;sched-&gt;pending_list));
+
        for (i = DRM_SCHED_PRIORITY_KERNEL; i &lt; sched-&gt;num_rqs; i++) {
                struct drm_sched_rq *rq = sched-&gt;sched_rq[i];

                spin_lock(&amp;rq-&gt;lock);
-               list_for_each_entry(s_entity, &amp;rq-&gt;entities, list)
+               list_for_each_entry(s_entity, &amp;rq-&gt;entities, list) {
+                       /*
+                        * The justification for this BUG_ON() is that tearing
+                        * down the scheduler while jobs are pending leaves
+                        * dma_fences unsignaled. Since we have dependencies
+                        * from the core memory management to eventually signal
+                        * dma_fences this can trivially lead to a system wide
+                        * stop because of a locked up memory management.
+                        */
+                       BUG_ON(spsc_queue_count(&amp;s_entity-&gt;job_queue));
+
                        /*
                         * Prevents reinsertion and marks job_queue as idle,
                         * it will removed from rq in drm_sched_entity_fini
                         * eventually
                         */
                        s_entity-&gt;stopped = true;
+               }
                spin_unlock(&amp;rq-&gt;lock);
                kfree(sched-&gt;sched_rq[i]);
        }
--
2.34.1

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------9kQqm4hCOvwqZj0DDXwujqBn--
