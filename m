Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A597EE0A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84010E1BA;
	Mon, 23 Sep 2024 15:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i8B9DUq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8DE10E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:24:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso43793285e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727105057; x=1727709857; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Fz6foWbqIEFX/AWRSBX0xc19HjrMyWPuqkxVpD3m5R8=;
 b=i8B9DUq71d4u93quqQyAcvEK/s6umj0i6k8P8kO/Tud6nYBT4SfSGOQbSc9znCwTWn
 VpkAxF4XEEaIctkffATAONRODoDT3NeaXcDQf5gwb753u9bQIj9hsjHVtYbAr7Y2nGsW
 TKe5qAnueV8exzYAEr23r5NIuFziSmxeHndeO97nKCAJRPYDWNcnfCAv9hyOBxWiO56v
 vgGt/X67Rf6Iyb1wCK+3iDmx3UXUhRKeHhJoz6scVLqiSD9jxOt2/Qw+pUR4r0PDNDMH
 ryZQCcOnq0dP0U6O0EuxOzGHyLwa6fpjSVuCsZEgKgrEJcL2VH4IKXqH6P8pjRF5+1yW
 7xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727105057; x=1727709857;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fz6foWbqIEFX/AWRSBX0xc19HjrMyWPuqkxVpD3m5R8=;
 b=KwvtxU3niQlc4eC/FV0U6xdeDQDYBVVfiZQ7I5V3ChGV4HKuVYOGj6hBbK/9xznUzE
 QLVY2iTIwqF04vvZCtwD0PsV3xY0e7RRaTqDtU/6e7YW5IQlI5XpW1+B/4dGfVDjJNOI
 ZxDh3ZzyoVV+0XKTluD5BENfcZkTuBxoWFby7gaoCsf0eRk3UmIa9DSF0ZKU0XfxE02r
 ++aXXoWNMdE76SVsElEOv+y0CHl3cwaJcMiH6Kmo8pCBwrBDXaMJs23n/P7Y1ZsJSlkK
 bRFCZI7Jzgh20LNwPZFwqI/A0XVBM+95vzmIF9RQZAXDx0gT4r+/Rcoo0BrlPqV1/zE1
 Uxiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA7LDvhZD5OsRKsVDqzHB33duuwDkaBRedBzkkpdJVma2UohIp+NhBrd+i2EGYSkN2BYNDbHIu/xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqLy56UaA9+mogzK6iDW4p2/7uQeLIbPMKRQtY7lBys+ltkxAg
 dHBcVLqTSYGbEa1uAfsfB47kdpGjEZcy+Om7NYs0fXvA1A2+J3lE
X-Google-Smtp-Source: AGHT+IE4c+RzNccF9Fk9riydAggup9JWgA/yLbL82Al0WFNfZgzEPGi0D1Nt2g9HncP8ehu5FtzSCg==
X-Received: by 2002:adf:fd0f:0:b0:374:c57b:a90f with SMTP id
 ffacd0b85a97d-37a43185254mr7093752f8f.42.1727105056660; 
 Mon, 23 Sep 2024 08:24:16 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f054asm24786541f8f.10.2024.09.23.08.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:24:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------PQBAvYaEwQkQjVai04bLg29u"
Message-ID: <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
Date: Mon, 23 Sep 2024 17:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Philipp Stanner <pstanner@redhat.com>, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
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
--------------PQBAvYaEwQkQjVai04bLg29u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
>> Am 20.09.24 um 10:57 schrieb Philipp Stanner:
>>> On Wed, 2024-09-18 at 15:39 +0200, Christian König wrote:
>>>> Tearing down the scheduler with jobs still on the pending list
>>>> can
>>>> lead to use after free issues. Add a warning if drivers try to
>>>> destroy a scheduler which still has work pushed to the HW.
>>> Did you have time yet to look into my proposed waitque-solution?
>> I don't remember seeing anything. What have I missed?
> https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/

Mhm, I didn't got that in my inbox for some reason.

Interesting approach, I'm just not sure if we can or should wait in 
drm_sched_fini().

Probably better to make that a separate function, something like 
drm_sched_flush() or similar.

>>>> When there are still entities with jobs the situation is even
>>>> worse
>>>> since the dma_fences for those jobs can never signal we can just
>>>> choose between potentially locking up core memory management and
>>>> random memory corruption. When drivers really mess it up that
>>>> well
>>>> let them run into a BUG_ON().
>>>>
>>>> Signed-off-by: Christian König<christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>>>>    1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index f093616fe53c..8a46fab5cdc8 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
>>>> drm_gpu_scheduler
>>>> *sched)
>>> I agree with Sima that it should first be documented in the
>>> function's
>>> docstring what the user is expected to have done before calling the
>>> function.
>> Good point, going to update the documentation as well.
> Cool thing, thx.
> Would be great if everything (not totally trivial) necessary to be done
> before _fini() is mentioned.
>
> One could also think about providing a hint at how the driver can do
> that. AFAICS the only way for the driver to ensure that is to maintain
> its own, separate list of submitted jobs.

Even with a duplicated pending list it's actually currently impossible 
to do this fully cleanly.

The problem is that the dma_fence object gives no guarantee when 
callbacks are processed, e.g. they can be both processed from interrupt 
context as well as from a CPU which called dma_fence_is_signaled().

So when a driver (or drm_sched_fini) waits for the last submitted fence 
it actually can be that the drm_sched object still needs to do some 
processing. See the hack in amdgpu_vm_tlb_seq() for more background on 
the problem.

Regards,
Christian.

>
> P.
>
>> Thanks,
>> Christian.
>>
>>> P.
>>>
>>>>    
>>>>    	drm_sched_wqueue_stop(sched);
>>>>    
>>>> +	/*
>>>> +	 * Tearing down the scheduler wile there are still
>>>> unprocessed jobs can
>>>> +	 * lead to use after free issues in the scheduler fence.
>>>> +	 */
>>>> +	WARN_ON(!list_empty(&sched->pending_list));
>>>> +
>>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
>>>> i++)
>>>> {
>>>>    		struct drm_sched_rq *rq = sched->sched_rq[i];
>>>>    
>>>>    		spin_lock(&rq->lock);
>>>> -		list_for_each_entry(s_entity, &rq->entities,
>>>> list)
>>>> +		list_for_each_entry(s_entity, &rq->entities,
>>>> list) {
>>>> +			/*
>>>> +			 * The justification for this BUG_ON()
>>>> is
>>>> that tearing
>>>> +			 * down the scheduler while jobs are
>>>> pending
>>>> leaves
>>>> +			 * dma_fences unsignaled. Since we have
>>>> dependencies
>>>> +			 * from the core memory management to
>>>> eventually signal
>>>> +			 * dma_fences this can trivially lead to
>>>> a
>>>> system wide
>>>> +			 * stop because of a locked up memory
>>>> management.
>>>> +			 */
>>>> +			BUG_ON(spsc_queue_count(&s_entity-
>>>>> job_queue));
>>>> +
>>>>    			/*
>>>>    			 * Prevents reinsertion and marks
>>>> job_queue
>>>> as idle,
>>>>    			 * it will removed from rq in
>>>> drm_sched_entity_fini
>>>>    			 * eventually
>>>>    			 */
>>>>    			s_entity->stopped = true;
>>>> +		}
>>>>    		spin_unlock(&rq->lock);
>>>>    		kfree(sched->sched_rq[i]);
>>>>    	}

--------------PQBAvYaEwQkQjVai04bLg29u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 20.09.24 um 15:26 schrieb Philipp Stanner:<br>
    <blockquote type="cite"
cite="mid:2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 20.09.24 um 10:57 schrieb Philipp Stanner:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, 2024-09-18 at 15:39 +0200, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Tearing down the scheduler with jobs still on the pending list
can
lead to use after free issues. Add a warning if drivers try to
destroy a scheduler which still has work pushed to the HW.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Did you have time yet to look into my proposed waitque-solution?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I don't remember seeing anything. What have I missed?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/">https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/</a></pre>
    </blockquote>
    <br>
    Mhm, I didn't got that in my inbox for some reason.<br>
    <br>
    Interesting approach, I'm just not sure if we can or should wait in
    drm_sched_fini().<br>
    <br>
    Probably better to make that a separate function, something like
    drm_sched_flush() or similar.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">When there are still entities with jobs the situation is even
worse
since the dma_fences for those jobs can never signal we can just
choose between potentially locking up core memory management and
random memory corruption. When drivers really mess it up that
well
let them run into a BUG_ON().

Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
  1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index f093616fe53c..8a46fab5cdc8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
drm_gpu_scheduler
*sched)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I agree with Sima that it should first be documented in the
function's
docstring what the user is expected to have done before calling the
function.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good point, going to update the documentation as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Cool thing, thx.
Would be great if everything (not totally trivial) necessary to be done
before _fini() is mentioned.

One could also think about providing a hint at how the driver can do
that. AFAICS the only way for the driver to ensure that is to maintain
its own, separate list of submitted jobs.</pre>
    </blockquote>
    <br>
    Even with a duplicated pending list it's actually currently
    impossible to do this fully cleanly.<br>
    <br>
    The problem is that the dma_fence object gives no guarantee when
    callbacks are processed, e.g. they can be both processed from
    interrupt context as well as from a CPU which called
    dma_fence_is_signaled().<br>
    <br>
    So when a driver (or drm_sched_fini) waits for the last submitted
    fence it actually can be that the drm_sched object still needs to do
    some processing. See the hack in amdgpu_vm_tlb_seq() for more
    background on the problem.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">

P.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
P.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">  
  	drm_sched_wqueue_stop(sched);
  
+	/*
+	 * Tearing down the scheduler wile there are still
unprocessed jobs can
+	 * lead to use after free issues in the scheduler fence.
+	 */
+	WARN_ON(!list_empty(&amp;sched-&gt;pending_list));
+
  	for (i = DRM_SCHED_PRIORITY_KERNEL; i &lt; sched-&gt;num_rqs;
i++)
{
  		struct drm_sched_rq *rq = sched-&gt;sched_rq[i];
  
  		spin_lock(&amp;rq-&gt;lock);
-		list_for_each_entry(s_entity, &amp;rq-&gt;entities,
list)
+		list_for_each_entry(s_entity, &amp;rq-&gt;entities,
list) {
+			/*
+			 * The justification for this BUG_ON()
is
that tearing
+			 * down the scheduler while jobs are
pending
leaves
+			 * dma_fences unsignaled. Since we have
dependencies
+			 * from the core memory management to
eventually signal
+			 * dma_fences this can trivially lead to
a
system wide
+			 * stop because of a locked up memory
management.
+			 */
+			BUG_ON(spsc_queue_count(&amp;s_entity-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">job_queue));
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">+
  			/*
  			 * Prevents reinsertion and marks
job_queue
as idle,
  			 * it will removed from rq in
drm_sched_entity_fini
  			 * eventually
  			 */
  			s_entity-&gt;stopped = true;
+		}
  		spin_unlock(&amp;rq-&gt;lock);
  		kfree(sched-&gt;sched_rq[i]);
  	}
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------PQBAvYaEwQkQjVai04bLg29u--
