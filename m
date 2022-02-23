Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207184C1D9A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 22:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82510EF77;
	Wed, 23 Feb 2022 21:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED5F10EF77
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 21:20:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220223212050euoutp02c97abda6286e2037a86a32a8748d4eca~WhxftOkZM2394123941euoutp02t
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 21:20:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220223212050euoutp02c97abda6286e2037a86a32a8748d4eca~WhxftOkZM2394123941euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1645651250;
 bh=nYkZP1aAf1MEo7wTHOIzBTMsTsmxQtexNdGR0dMr+Gs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=aOaIEW890iVNoUlT3KMLnKk1S2sECMEYYogYUdZ2gWEvJIhGbduRIK89Fv2Gl4eMm
 fQpZ4Wkp6nFOdA5XWbGy3J/73fsuwuOBMfo1WKyKss48+SUUgJmRwzt1An1qVVa4VD
 nuUi0hY7U8IKqZIVMx6cIR8rZEkBlqf0zPgzzq5o=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220223212049eucas1p290114d255d08fa78aa4eccdc1b91da3d~Whxej1va_1296512965eucas1p2O;
 Wed, 23 Feb 2022 21:20:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 04.4F.10260.135A6126; Wed, 23
 Feb 2022 21:20:49 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f~WhxdZZLj10530305303eucas1p1O;
 Wed, 23 Feb 2022 21:20:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220223212048eusmtrp216a75b5c36c9af5338e3416e89e98f87~WhxdYgKh91161911619eusmtrp2S;
 Wed, 23 Feb 2022 21:20:48 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-90-6216a5312fc8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D6.A2.09404.035A6126; Wed, 23
 Feb 2022 21:20:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220223212047eusmtip28b295d44a09043692890c7e3558c0a76~Whxcy-ShP2218522185eusmtip2t;
 Wed, 23 Feb 2022 21:20:47 +0000 (GMT)
Message-ID: <4e5fe60d-abbb-6e73-b8cc-c3e1a314fbce@samsung.com>
Date: Wed, 23 Feb 2022 22:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] workqueue: Warn flush attempt using system-wide
 workqueues
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Tejun Heo
 <tj@kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2f887679-c783-bf18-a2aa-aa9a709bfb38@I-love.SAKURA.ne.jp>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7qGS8WSDG5PEbOY9uEns8WVr+/Z
 LBZ8eMtiMXPGCUaLqWt3M1lc3jWHzWLi7Q3sFjcealvMbnnHavFr+VFGBy6Py1e8PXbOusvu
 sXPtKiaPTas62Tzudx9n8ti8pN7j49NbLB6fN8l5bP18myWAM4rLJiU1J7MstUjfLoEr435X
 ZMFCq4rTzUsZGxjf6XUxcnJICJhIfDl3nr2LkYtDSGAFo8S7l38ZIZwvjBI/pv+HynxmlNj3
 dTMTTMucY3+gqpYzSrSubWWDcD4ySkxrWMAIUsUrYCdx7/ZEZhCbRUBV4u/Bc1BxQYmTM5+w
 gNiiAkkSDw70sYPYwgIhEreuvwarZxYQl7j1ZD4TyFARgW5GieVPGplBHGaBHiaJoxtPgd3B
 JmAo0fW2C2g1BwengLvE8TfVEM3yEtvfzgGrlxDo55RYe3gB1N0uEovW9DJC2MISr45vYYew
 ZST+74TYJiHQzCjx8Nxadginh1HictMMqA5riTvnfoFtYxbQlFi/Sx8i7Cjx9MguVpCwhACf
 xI23ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xinsCoNAspXGYh+X8WkndmIexdwMiy
 ilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzCNnf53/OsOxhWvPuodYmTiYDzEKMHBrCTC
 a1ooliTEm5JYWZValB9fVJqTWnyIUZqDRUmcNzlzQ6KQQHpiSWp2ampBahFMlomDU6qBiS3G
 p4R/4Z4p2jNs2h6Y3Nv/S+O9t5Gfybv9aRkMa049zeraOi+9SavsCM/+k+0mzcfX8OQcEF1R
 teVZAet8zesyOivWT98vf/2cl+uHo4E9LftLJxutCHt384GkF5sH0/u55b61vKLxvOZXAnLf
 /Pb3mJ35beHLLUekV7YdmtMl+HSZcpGE5Mtz8erFFTlOM26yRsio8AiLLc/umHTw9kybXdIz
 KmfvuSN457TQoyf3o1m39PmpJywI8edrPjK90Njy48bi22b9XHtM9Zte+u7hbpkTn66/03x+
 vVr+BiEmnevrajvDwpT+/3e4EFamKbPqQ6vTvun5Wl9/ZV8784P308Sq60ZrvjELrfh3QYml
 OCPRUIu5qDgRAIV2fGLSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7oGS8WSDN6vY7GY9uEns8WVr+/Z
 LBZ8eMtiMXPGCUaLqWt3M1lc3jWHzWLi7Q3sFjcealvMbnnHavFr+VFGBy6Py1e8PXbOusvu
 sXPtKiaPTas62Tzudx9n8ti8pN7j49NbLB6fN8l5bP18myWAM0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv435XZMFCq4rTzUsZGxjf6XUxcnJI
 CJhIzDn2h7GLkYtDSGApo8SJo1/YIRIyEienNbBC2MISf651sUEUvWeUOPR8BhtIglfATuLe
 7YnMIDaLgKrE34PnGCHighInZz5hAbFFBZIkXm7bCDZIWCBE4tb112D1zALiEreezGcCGSoi
 0Msocf73ZmYQh1mgh0li9Z077BDrDrNIzF3wG2wdm4ChRNdbkDs4ODgF3CWOv6mGmGQm0bW1
 ixHClpfY/nYO8wRGoVlIDpmFZOEsJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJ
 ERi324793LKDceWrj3qHGJk4GA8xSnAwK4nwmhaKJQnxpiRWVqUW5ccXleakFh9iNAWGxkRm
 KdHkfGDiyCuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYGILjVdp
 ylLfdt8/R7zld8pXT4mu26uZ33eLable+L2ImcG5vcrOsP745JtzcvQOCK16KcsQqhoz/UHa
 TZMbJixBbzU4/dImOgiKuWzkEfp6lsHg6gLZqo4ArhVvPTQ2/2gWNP/ArXDuwAqe8ilq6mtF
 uJOv5shJJu9yltMK8WbWt17BqZjC5R0kq3LsiedCj+0SbreinyodqtjPqa278npE09ST/vWi
 shqXvS6xCz1n5ZpxLF7x7vt9Ow9o9B35lsshoHjiyZ32DOPHOvdVDIQ1tn8S0Xq9KfmC14mv
 K8udVSqOrPtlnus1vUTwuGG82VsRz/2HIz9rNcp+Nexb+VRHR/v8Sf6Om0bhzFVKLMUZiYZa
 zEXFiQAPdD/0ZAMAAA==
X-CMS-MailID: 20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f
References: <0000000000005975a605d7aef05e@google.com>
 <8ea57ddf-a09c-43f2-4285-4dfb908ad967@acm.org>
 <ccd04d8a-154b-543e-e1c3-84bc655508d1@I-love.SAKURA.ne.jp>
 <71d6f14e-46af-cc5a-bc70-af1cdc6de8d5@acm.org>
 <309c86b7-2a4c-1332-585f-7bcd59cfd762@I-love.SAKURA.ne.jp>
 <aa2bf24e-981a-a811-c5d8-a75f0b8f693a@acm.org>
 <2959649d-cfbc-bdf2-02ac-053b8e7af030@I-love.SAKURA.ne.jp>
 <YgnQGZWT/n3VAITX@slm.duckdns.org>
 <8ebd003c-f748-69b4-3a4f-fb80a3f39d36@I-love.SAKURA.ne.jp>
 <YgqSsuSN5C7StvKx@slm.duckdns.org>
 <2f887679-c783-bf18-a2aa-aa9a709bfb38@I-love.SAKURA.ne.jp>
 <CGME20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f@eucas1p1.samsung.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>, jgg@ziepe.ca,
 Haakon Bugge <haakon.bugge@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 17.02.2022 12:22, Tetsuo Handa wrote:
> syzbot found a circular locking dependency which is caused by flushing
> system_long_wq WQ [1]. Tejun Heo commented that it makes no sense at all
> to call flush_workqueue() on the shared workqueues as the caller has no
> idea what it's gonna end up waiting for.
>
> Although there is flush_scheduled_work() which flushes system_wq WQ with
> "Think twice before calling this function! It's very easy to get into
> trouble if you don't take great care." warning message, it will be too
> difficult to guarantee that all users safely flush system-wide WQs.
>
> Therefore, let's change the direction to that developers had better use
> their own WQs if flushing is inevitable. To give developers time to update
> their modules, for now just emit a warning message when flush_workqueue()
> or flush_work() is called on system-wide WQs. We will eventually convert
> this warning message into WARN_ON() and kill flush_scheduled_work().
>
> Link: https://syzkaller.appspot.com/bug?extid=831661966588c802aae9 [1]
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

This patch landed in linux next-20220222 as commit 4a6a0ce060e4 
("workqueue: Warn flush attempt using system-wide workqueues"). As it 
might be expected it exposed some calls to flush work. However it also 
causes boot failure of the Raspberry Pi 3 and 4 boards (kernel compiled 
from arm64/defconfig). In the log I see one call from the 
deferred_probe_initcall(), but it isn't critical for the boot process. 
The deadlock occurs when DRM registers emulated framebuffer on RPi4. 
RPi3 boots a bit further, to the shell prompt, but then the console is 
freezed. Reverting this patch on top of linux-next 'fixes' the boot.

> ---
> Changes in v2:
>    Removed #ifdef CONFIG_PROVE_LOCKING=y check.
>    Also check flush_work() attempt.
>    Shorten warning message.
>    Introduced a public WQ_ flag, which is initially meant for use by
>    only system-wide WQs, but allows private WQs used by built-in modules
>    to use this flag for detecting unexpected flush attempts if they want.
>
>   include/linux/workqueue.h | 26 +++++++++++++------------
>   kernel/workqueue.c        | 41 ++++++++++++++++++++++++++++-----------
>   2 files changed, 44 insertions(+), 23 deletions(-)
>
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index 7fee9b6cfede..4b698917b9d5 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -335,6 +335,18 @@ enum {
>   	 */
>   	WQ_POWER_EFFICIENT	= 1 << 7,
>   
> +	/*
> +	 * Since flush operation synchronously waits for completion, flushing
> +	 * system-wide workqueues (e.g. system_wq) or a work on a system-wide
> +	 * workqueue might introduce possibility of deadlock due to unexpected
> +	 * locking dependency.
> +	 *
> +	 * This flag emits warning if flush operation is attempted. Don't set
> +	 * this flag on user-defined workqueues, for destroy_workqueue() will
> +	 * involve flush operation.
> +	 */
> +	WQ_WARN_FLUSH_ATTEMPT   = 1 << 8,
> +
>   	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
>   	__WQ_ORDERED		= 1 << 17, /* internal: workqueue is ordered */
>   	__WQ_LEGACY		= 1 << 18, /* internal: create*_workqueue() */
> @@ -569,18 +581,8 @@ static inline bool schedule_work(struct work_struct *work)
>    * Forces execution of the kernel-global workqueue and blocks until its
>    * completion.
>    *
> - * Think twice before calling this function!  It's very easy to get into
> - * trouble if you don't take great care.  Either of the following situations
> - * will lead to deadlock:
> - *
> - *	One of the work items currently on the workqueue needs to acquire
> - *	a lock held by your code or its caller.
> - *
> - *	Your code is running in the context of a work routine.
> - *
> - * They will be detected by lockdep when they occur, but the first might not
> - * occur very often.  It depends on what work items are on the workqueue and
> - * what locks they need, which you have no control over.
> + * Please stop calling this function. If you need to flush, please use your
> + * own workqueue.
>    *
>    * In most situations flushing the entire workqueue is overkill; you merely
>    * need to know that a particular work item isn't queued and isn't running.
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 33f1106b4f99..8e6e64372441 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -2618,6 +2618,20 @@ static int rescuer_thread(void *__rescuer)
>   	goto repeat;
>   }
>   
> +static void warn_flush_attempt(struct workqueue_struct *wq)
> +{
> +	static DEFINE_RATELIMIT_STATE(flush_warn_rs, 600 * HZ, 1);
> +
> +
> +	/* Use ratelimit for now in order not to flood warning messages. */
> +	ratelimit_set_flags(&flush_warn_rs, RATELIMIT_MSG_ON_RELEASE);
> +	if (!__ratelimit(&flush_warn_rs))
> +		return;
> +	/* Don't use WARN_ON() for now in order not to break kernel testing. */
> +	pr_warn("Please do not flush %s WQ.\n", wq->name);
> +	dump_stack();
> +}
> +
>   /**
>    * check_flush_dependency - check for flush dependency sanity
>    * @target_wq: workqueue being flushed
> @@ -2635,6 +2649,9 @@ static void check_flush_dependency(struct workqueue_struct *target_wq,
>   	work_func_t target_func = target_work ? target_work->func : NULL;
>   	struct worker *worker;
>   
> +	if (unlikely(target_wq->flags & WQ_WARN_FLUSH_ATTEMPT))
> +		warn_flush_attempt(target_wq);
> +
>   	if (target_wq->flags & WQ_MEM_RECLAIM)
>   		return;
>   
> @@ -6054,18 +6071,20 @@ void __init workqueue_init_early(void)
>   		ordered_wq_attrs[i] = attrs;
>   	}
>   
> -	system_wq = alloc_workqueue("events", 0, 0);
> -	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
> -	system_long_wq = alloc_workqueue("events_long", 0, 0);
> -	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
> +	system_wq = alloc_workqueue("events", WQ_WARN_FLUSH_ATTEMPT, 0);
> +	system_highpri_wq = alloc_workqueue("events_highpri",
> +					    WQ_WARN_FLUSH_ATTEMPT | WQ_HIGHPRI, 0);
> +	system_long_wq = alloc_workqueue("events_long", WQ_WARN_FLUSH_ATTEMPT, 0);
> +	system_unbound_wq = alloc_workqueue("events_unbound", WQ_WARN_FLUSH_ATTEMPT | WQ_UNBOUND,
>   					    WQ_UNBOUND_MAX_ACTIVE);
> -	system_freezable_wq = alloc_workqueue("events_freezable",
> -					      WQ_FREEZABLE, 0);
> -	system_power_efficient_wq = alloc_workqueue("events_power_efficient",
> -					      WQ_POWER_EFFICIENT, 0);
> -	system_freezable_power_efficient_wq = alloc_workqueue("events_freezable_power_efficient",
> -					      WQ_FREEZABLE | WQ_POWER_EFFICIENT,
> -					      0);
> +	system_freezable_wq =
> +		alloc_workqueue("events_freezable", WQ_WARN_FLUSH_ATTEMPT | WQ_FREEZABLE, 0);
> +	system_power_efficient_wq =
> +		alloc_workqueue("events_power_efficient",
> +				WQ_WARN_FLUSH_ATTEMPT | WQ_POWER_EFFICIENT, 0);
> +	system_freezable_power_efficient_wq =
> +		alloc_workqueue("events_freezable_power_efficient",
> +				WQ_WARN_FLUSH_ATTEMPT | WQ_FREEZABLE | WQ_POWER_EFFICIENT, 0);
>   	BUG_ON(!system_wq || !system_highpri_wq || !system_long_wq ||
>   	       !system_unbound_wq || !system_freezable_wq ||
>   	       !system_power_efficient_wq ||

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

