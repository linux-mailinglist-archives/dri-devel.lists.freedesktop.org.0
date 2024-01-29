Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E583FF39
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 08:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3CE10F646;
	Mon, 29 Jan 2024 07:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4EB10F643;
 Mon, 29 Jan 2024 07:49:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4E041F7D8;
 Mon, 29 Jan 2024 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706514544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9abLAJM4Iw/jrDWhyEpmtyTnKSeWvX5dzt0UzT4VXA=;
 b=ceNwZTLhDDA5+VXOOEgZEi3ne0uT/glC7vBje3t7AOZhmW36w0+a2yH+MZfoMjdKG+X4uN
 2iIOIKLD3yzl7EbSnAGr1mTvmREVx8x/iFPCJz3FdiQ0On+o1hf2xq0fNYpxVaNLxcBTzA
 Q94vIEgNp3aA16AJJLAV/FYYG95nHZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706514544;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9abLAJM4Iw/jrDWhyEpmtyTnKSeWvX5dzt0UzT4VXA=;
 b=HV98QvPV+rhKtBHjVf2JuVPC2/6ZLEcmbflfp1gbK2v/6eTdeY5DTNZwT6cT/Ftx5alZ22
 fWxr5yf1ZvMSXmAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706514544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9abLAJM4Iw/jrDWhyEpmtyTnKSeWvX5dzt0UzT4VXA=;
 b=ceNwZTLhDDA5+VXOOEgZEi3ne0uT/glC7vBje3t7AOZhmW36w0+a2yH+MZfoMjdKG+X4uN
 2iIOIKLD3yzl7EbSnAGr1mTvmREVx8x/iFPCJz3FdiQ0On+o1hf2xq0fNYpxVaNLxcBTzA
 Q94vIEgNp3aA16AJJLAV/FYYG95nHZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706514544;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9abLAJM4Iw/jrDWhyEpmtyTnKSeWvX5dzt0UzT4VXA=;
 b=HV98QvPV+rhKtBHjVf2JuVPC2/6ZLEcmbflfp1gbK2v/6eTdeY5DTNZwT6cT/Ftx5alZ22
 fWxr5yf1ZvMSXmAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7C3213647;
 Mon, 29 Jan 2024 07:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BSbtJ3BYt2X1VwAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Mon, 29 Jan 2024 07:49:04 +0000
Message-ID: <dd9ec121-b09f-4862-8a9c-14bb3605fc47@suse.cz>
Date: Mon, 29 Jan 2024 08:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
 <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.59 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 BAYES_HAM(-3.00)[100.00%]; RCPT_COUNT_SEVEN(0.00)[10];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,leemhuis.info,amd.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.59
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
Cc: ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/24 08:44, Christian König wrote:
> Am 26.01.24 um 17:29 schrieb Matthew Brost:
>> On Fri, Jan 26, 2024 at 11:32:57AM +0100, Christian König wrote:
>>> Am 25.01.24 um 18:30 schrieb Matthew Brost:
>>>> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian König wrote:
>>>>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
>>>>>> All entities must be drained in the DRM scheduler run job worker to
>>>>>> avoid the following case. An entity found that is ready, no job found
>>>>>> ready on entity, and run job worker goes idle with other entities + jobs
>>>>>> ready. Draining all ready entities (i.e. loop over all ready entities)
>>>>>> in the run job worker ensures all job that are ready will be scheduled.
>>>>> That doesn't make sense. drm_sched_select_entity() only returns entities
>>>>> which are "ready", e.g. have a job to run.
>>>>>
>>>> That is what I thought too, hence my original design but it is not
>>>> exactly true. Let me explain.
>>>>
>>>> drm_sched_select_entity() returns an entity with a non-empty spsc queue
>>>> (job in queue) and no *current* waiting dependecies [1]. Dependecies for
>>>> an entity can be added when drm_sched_entity_pop_job() is called [2][3]
>>>> returning a NULL job. Thus we can get into a scenario where 2 entities
>>>> A and B both have jobs and no current dependecies. A's job is waiting
>>>> B's job, entity A gets selected first, a dependecy gets installed in
>>>> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.
>>> And here is the real problem. run work doesn't goes idle in that moment.
>>>
>>> drm_sched_run_job_work() should restarts itself until there is either no
>>> more space in the ring buffer or it can't find a ready entity any more.
>>>
>>> At least that was the original design when that was all still driven by a
>>> kthread.
>>>
>>> It can perfectly be that we messed this up when switching from kthread to a
>>> work item.
>>>
>> Right, that what this patch does - the run worker does not go idle until
>> no ready entities are found. That was incorrect in the original patch
>> and fixed here. Do you have any issues with this fix? It has been tested
>> 3x times and clearly fixes the issue.
> 
> Ah! Yes in this case that patch here is a little bit ugly as well.
> 
> The original idea was that run_job restarts so that we are able to pause 
> the submission thread without searching for an entity to submit more.
> 
> I strongly suggest to replace the while loop with a call to 
> drm_sched_run_job_queue() so that when the entity can't provide a job we 
> just restart the queuing work.

Note it's already included in rc2, so any changes need to be a followup fix.
If these are important, then please make sure they get to rc3 :)

