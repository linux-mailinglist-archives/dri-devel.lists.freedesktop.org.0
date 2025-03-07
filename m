Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C0A56E75
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822E510E086;
	Fri,  7 Mar 2025 16:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qebuFdEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6CD10E086
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/6iN3tPVAPumPgXVA2lVaU0eIJpc/D4ikXnrRA35lo=; b=qebuFdELHLNZFDNZFX0NsoMXR3
 yksZiYfHUpqXaJeQwbI4AGLn4g/W6oPTIqTeXQ5lBGf6yWTqM5pfxyTpJAHzNlfU00rBzItcs8iOh
 61CpOZYRMwCY1ClZuPy2weJ1PuoaVw87IWAX1o7rxqlD5Hbu/ZYll+RCDROC7QvSGIf/Byzw+mHLP
 LAQNd7MPvNe1Vs5uIsViPT4cXNamX3/G4zWkK1PjdLzk6jo+NUXoxY5y9JQX2SOj7y4vy8RteYBXp
 gODO/I6KlkVdhfYUeDWKn0Ou8ehPtvJAE8x7IoDFul4P/u8Zdrp2FdvHUo5FNyZarDmRjtf/mcelv
 YdoWaNqg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tqb2S-005RR3-1G; Fri, 07 Mar 2025 17:59:13 +0100
Message-ID: <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
Date: Fri, 7 Mar 2025 16:59:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
 <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 07/03/2025 13:41, Philipp Stanner wrote:
> Hi,
> 
> You forgot to put folks in CC as recipents for the cover letter :(
> 
> 
> On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
>> Move some options out into a new debug specific kconfig file in order
>> to
>> make things a bit cleaner.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
> 
> We all have our individual work flows, so don't take this as lecturing
> or anything – I just suspect that I was forgotten in the cover letter
> because you Cc people by hand in the individual patches.
> 
> What I do is that I run get_maintainer and then put the individuals
> listed there into the --to= field. That sends the entire series to all
> of them.
> 
> Only sometimes, when there's a huge list of recipents or when the
> patches of a series are very independent, I deviate from that rule.
> 
> JFYI

Notice it was there in v3, I just omitted to paste it this time.

> Anyways, we have a bigger problem about the entire series. I now tested
> again with the same setup as yesterday and the faults are indeed gone,
> so that's good.
> 
> But to be sure I then did run kmemleak and got a list of leaks that is
> more than 2000 lines long.

There is this comment for drm_sched_fini which ends with:

"""
...
  * This stops submission of new jobs to the hardware through
  * drm_sched_backend_ops.run_job(). Consequently, 
drm_sched_backend_ops.free_job()
  * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
  * There is no solution for this currently. Thus, it is up to the 
driver to make
  * sure that:
  *
  *  a) drm_sched_fini() is only called after for all submitted jobs
  *     drm_sched_backend_ops.free_job() has been called or that
  *  b) the jobs for which drm_sched_backend_ops.free_job() has not been 
called
  *     after drm_sched_fini() ran are freed manually.
  *

  * FIXME: Take care of the above problem and prevent this function from 
leaking
  * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
"""

I got bitten by that. Keep forgetting how fragile the thing is.. :(

Regards,

Tvrtko

