Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBC9D766D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89C010E593;
	Sun, 24 Nov 2024 17:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkZrAA6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5683010E4DA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:34:17 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2126e293192so7039595ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 05:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732455257; x=1733060057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qtitWj7mwZUOuapDYi1rlQN8mBEo2KiG1ezv0q6gsEE=;
 b=jkZrAA6iXWWrGY81LLgrg4nrd3jkNHZ+e9RG5zC9lrzw7R1+xpIx9W2ad/7NzHx+6l
 Y41ah/zcBnjOl3L78er2qck8KPkYYq17YZIOLcYl1FzuCuPEYup4IsuW0ap1WeNh6HPH
 B+Y8NikWt/tgSpVf9e3MRhziXAcQLZFkvA6AFYkwrxgVsNiiIf75/QjcsyfoCCxt2ZWh
 aIuup8HefR8Rcuz/rx9JdDMTo6F86qJfa4ul81pZ3KHTUxPu3DIlL5NfsdF/Z7V7v7ZW
 PKyf47eUNlj5HUHS5X5XvKqZBXMhDz+zw8KVzKAJXcDYWXHkGmuKZo0utVVcfus6+S8l
 K5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732455257; x=1733060057;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qtitWj7mwZUOuapDYi1rlQN8mBEo2KiG1ezv0q6gsEE=;
 b=k642PT1mcertubNKu1mpEKry58ZShYEtZXYdrtmf+9Xr4O+j7RWBbdC/J4aAvKm7d0
 vKksz8wEtHBUA/Rt70SPnrOVqe081PcAgdXEuD/2haZeJ+h6kO861y2FGlQ5cnBUYzjp
 Nu9R5P4jdcUAHIxgYzI2uoTBKSAY3/C2nVCu86EOftg5ST8A3VHFHobE7eRjwKCc+N9k
 nqlXY9AKmxzPAUIolWxkEC8pZvPvE5rsAwK1SjhY4PZgIhycm3IDRz0WgGugR+bZ8Nr2
 q8rLzqg3szkcQiZg/Rke3gxpBDoVkBPFR8pnGe/rXMyLjlHrwQmEwI0Go5zlgbwKHxsJ
 cA7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEGOhxhtTvSjhwiRrSl2I6YUmF/O0qimT1W4r8pDhxAE8dKzkFAt0r7UyCJxbzWK84UrfKiKlHxzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQA6Io/2Um/kewaXKwmdYbluwGDuHryQSxo4STrpcw2BDgDdiq
 5Gq/SPt0O35/bcCdj5PCrXXEMvArBdIXet01afhPcx0TqdPBi6ZB
X-Gm-Gg: ASbGncvt+hhHh0d96u7kD2qqsddJFxSOjfyqd2awrQvR5RXGeTjMFlkdX5lZ/b/w6+G
 jgOxM8FxNa7R7faURs8taP4G1lOrAdEGLMNgYZ98gY7q9zcPCCwnD07VZOaElX/mUK8rhnyn3sB
 sz6Q3l7h9Y3zRyFn8fIQ9KT1qRsSOl7yht5CAeTE1rlGLZ0Jk4QrCr8boZC8IkJvXq0LT4W2lwo
 93z2/yG+F5XlfDK/aIoYGyVBtRukh/tr1LjYXXdpNLX5/ZbZUpX+Bn12ddCAw==
X-Google-Smtp-Source: AGHT+IHLvekYbaPwVuQbj7uVMH6+WJbm/aay5oOW+hS7R6I1jLZXbkDtIA8gi64je3notGAilm7kDw==
X-Received: by 2002:a05:6a20:3d8d:b0:1dc:77fc:1cd1 with SMTP id
 adf61e73a8af0-1e09e4004cfmr5341156637.3.1732455256584; 
 Sun, 24 Nov 2024 05:34:16 -0800 (PST)
Received: from [192.168.50.136] ([118.32.98.101])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724ed55099asm3151173b3a.49.2024.11.24.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2024 05:34:16 -0800 (PST)
Message-ID: <489d941f-c4e8-4d1f-92ee-02074c713dd1@gmail.com>
Date: Sun, 24 Nov 2024 22:34:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/28] dept: Implement Dept(Dependency Tracker)
To: Byungchul Park <byungchul@sk.com>
References: <20240508094726.35754-3-byungchul@sk.com>
Content-Language: en-US
Cc: LKML <linux-kernel@vger.kernel.org>, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
 joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
 duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
 willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
 gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, mhocko@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org,
 jglisse@redhat.com, dennis@kernel.org, cl@linux.com, penberg@kernel.org,
 rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com, Yeoreum Yun <yeoreum.yun@arm.com>
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <20240508094726.35754-3-byungchul@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Nov 2024 17:12:55 +0000
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

Hi Byungchul,

Thank you for the great feature. Currently, DEPT has a bug in the
'dept_key_destroy()' function that must be fixed to ensure proper
operation in the upstream Linux kernel.

On 5/8/24 6:46 오후, Byungchul Park wrote:
> CURRENT STATUS
> --------------
> Lockdep tracks acquisition order of locks in order to detect deadlock,
> and IRQ and IRQ enable/disable state as well to take accident
> acquisitions into account.
> 
> Lockdep should be turned off once it detects and reports a deadlock
> since the data structure and algorithm are not reusable after detection
> because of the complex design.
> 
> PROBLEM
> -------
> *Waits* and their *events* that never reach eventually cause deadlock.
> However, Lockdep is only interested in lock acquisition order, forcing
> to emulate lock acqusition even for just waits and events that have
> nothing to do with real lock.
> 
> Even worse, no one likes Lockdep's false positive detection because that
> prevents further one that might be more valuable. That's why all the
> kernel developers are sensitive to Lockdep's false positive.
> 
> Besides those, by tracking acquisition order, it cannot correctly deal
> with read lock and cross-event e.g. wait_for_completion()/complete() for
> deadlock detection. Lockdep is no longer a good tool for that purpose.
> 
> SOLUTION
> --------
> Again, *waits* and their *events* that never reach eventually cause
> deadlock. The new solution, Dept(DEPendency Tracker), focuses on waits
> and events themselves. Dept tracks waits and events and report it if
> any event would be never reachable.
> 
> Dept does:
>    . Works with read lock in the right way.
>    . Works with any wait and event e.i. cross-event.
>    . Continue to work even after reporting multiple times.
>    . Provides simple and intuitive APIs.
>    . Does exactly what dependency checker should do.
> 
> Q & A
> -----
> Q. Is this the first try ever to address the problem?
> A. No. Cross-release feature (b09be676e0ff2 locking/lockdep: Implement
>    the 'crossrelease' feature) addressed it 2 years ago that was a
>    Lockdep extension and merged but reverted shortly because:
> 
>    Cross-release started to report valuable hidden problems but started
>    to give report false positive reports as well. For sure, no one
>    likes Lockdep's false positive reports since it makes Lockdep stop,
>    preventing reporting further real problems.
> 
> Q. Why not Dept was developed as an extension of Lockdep?
> A. Lockdep definitely includes all the efforts great developers have
>    made for a long time so as to be quite stable enough. But I had to
>    design and implement newly because of the following:
> 
>    1) Lockdep was designed to track lock acquisition order. The APIs and
>       implementation do not fit on wait-event model.
>    2) Lockdep is turned off on detection including false positive. Which
>       is terrible and prevents developing any extension for stronger
>       detection.
> 
> Q. Do you intend to totally replace Lockdep?
> A. No. Lockdep also checks if lock usage is correct. Of course, the
>    dependency check routine should be replaced but the other functions
>    should be still there.
> 
> Q. Do you mean the dependency check routine should be replaced right
>    away?
> A. No. I admit Lockdep is stable enough thanks to great efforts kernel
>    developers have made. Lockdep and Dept, both should be in the kernel
>    until Dept gets considered stable.
> 
> Q. Stronger detection capability would give more false positive report.
>    Which was a big problem when cross-release was introduced. Is it ok
>    with Dept?
> A. It's ok. Dept allows multiple reporting thanks to simple and quite
>    generalized design. Of course, false positive reports should be fixed
>    anyway but it's no longer as a critical problem as it was.
> 
> Signed-off-by: Byungchul Park <byungchul@sk.com>

If a module previously checked for dependencies by DEPT is loaded and
then would be unloaded, a kernel panic shall occur when the kernel
reuses the corresponding memory area for other purposes. This issue must
be addressed as a priority to enable the use of DEPT. Testing this patch
on the Ubuntu kernel confirms the problem.

> +void dept_key_destroy(struct dept_key *k)
> +{
> +	struct dept_task *dt = dept_task();
> +	unsigned long flags;
> +	int sub_id;
> +
> +	if (unlikely(!dept_working()))
> +		return;
> +
> +	if (dt->recursive == 1 && dt->task_exit) {
> +		/*
> +		 * Need to allow to go ahead in this case where
> +		 * ->recursive has been set to 1 by dept_off() in
> +		 * dept_task_exit() and ->task_exit has been set to
> +		 * true in dept_task_exit().
> +		 */
> +	} else if (dt->recursive) {
> +		DEPT_STOP("Key destroying fails.\n");
> +		return;
> +	}
> +
> +	flags = dept_enter();
> +
> +	/*
> +	 * dept_key_destroy() should not fail.
> +	 *
> +	 * FIXME: Should be fixed if dept_key_destroy() causes deadlock
> +	 * with dept_lock().
> +	 */
> +	while (unlikely(!dept_lock()))
> +		cpu_relax();
> +
> +	for (sub_id = 0; sub_id < DEPT_MAX_SUBCLASSES; sub_id++) {
> +		struct dept_class *c;
> +
> +		c = lookup_class((unsigned long)k->base + sub_id);
> +		if (!c)
> +			continue;
> +
> +		hash_del_class(c);
> +		disconnect_class(c);
> +		list_del(&c->all_node);
> +		invalidate_class(c);
> +
> +		/*
> +		 * Actual deletion will happen on the rcu callback
> +		 * that has been added in disconnect_class().
> +		 */
> +		del_class(c);
> +	}
> +
> +	dept_unlock();
> +	dept_exit(flags);
> +
> +	/*
> +	 * Wait until even lockless hash_lookup_class() for the class
> +	 * returns NULL.
> +	 */
> +	might_sleep();
> +	synchronize_rcu();
> +}
> +EXPORT_SYMBOL_GPL(dept_key_destroy);

Best regards,
Yunseong Kim
