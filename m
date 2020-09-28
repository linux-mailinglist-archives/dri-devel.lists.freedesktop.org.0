Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA427ABC8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 12:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFFF6E11A;
	Mon, 28 Sep 2020 10:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F2F6E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Vc5TPB8gzwYQ4bV3QPrFgoBi6Jlg1QoC2FUYpd7zyDo=; b=tcB2Ty+lP6MFCVih7DRU4PWnRS
 Aj3y4brI3ONLGXo3KFO88/n8Xd23Dme6MEQTMnJF+wZVw1d4XFzWhSNiM4eERDWiEkKK2vbdXV/Gn
 AUkrBfUJLW+EIoiPhBVPObIzyxGdaovissYnz9d3+yufRgPfCwqCyPvOWSl4b/J7w3x3K9IkNxdw2
 UuRtIEJTNpHdYg1pIe73yAEFhIq7OLQ9YcGfOJrLT0z7cfSrkepMEznzHXUcLlF3w/gLYyXgUmpz2
 4tk/HelTC06z3gm8jpz+9WGXLTpCrhpMCCazb98TqwREF2iWG+LGbaU89/w8Y5oe7oLUIw5aapLIG
 x8+munNA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMqM5-0005Mm-GJ; Mon, 28 Sep 2020 10:26:02 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9002A300DB4;
 Mon, 28 Sep 2020 12:25:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6B41E2006F633; Mon, 28 Sep 2020 12:25:59 +0200 (CEST)
Date: Mon, 28 Sep 2020 12:25:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chengming Zhou <zhouchengming@bytedance.com>
Subject: Re: [External] Re: [PATCH 2/2] sched: mark
 PRINTK_DEFERRED_CONTEXT_MASK in __schedule()
Message-ID: <20200928102559.GF2611@hirez.programming.kicks-ass.net>
References: <20200927161130.33172-1-zhouchengming@bytedance.com>
 <20200927161130.33172-2-zhouchengming@bytedance.com>
 <20200928073202.GA2611@hirez.programming.kicks-ass.net>
 <40ab934e-5b8b-735b-da65-3043efab9fdc@bytedance.com>
 <20200928090143.GA2628@hirez.programming.kicks-ass.net>
 <688eadd7-4ca3-3e32-3520-25977ff059a6@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <688eadd7-4ca3-3e32-3520-25977ff059a6@bytedance.com>
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
Cc: juri.lelli@redhat.com, pmladek@suse.com, vincent.guittot@linaro.org,
 tzimmermann@suse.de, john.ogness@linutronix.de, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bsegall@google.com, sergey.senozhatsky@gmail.com, mingo@redhat.com,
 rostedt@goodmis.org, songmuchun@bytedance.com, dietmar.eggemann@arm.com,
 mgorman@suse.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 06:04:23PM +0800, Chengming Zhou wrote:

> Well, you are lucky. So it's a problem in our printk implementation.

Not lucky; I just kicked it in the groin really hard:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git debug/expe=
rimental

> The deadlock path is:
> =

> printk
> =A0 vprintk_emit
> =A0=A0=A0 console_unlock
> =A0 =A0 =A0 vt_console_print
> =A0 =A0 =A0 =A0 hide_cursor
> =A0 =A0 =A0 =A0 =A0 bit_cursor
> =A0 =A0 =A0 =A0 =A0 =A0 soft_cursor
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 queue_work_on
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __queue_work
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 try_to_wake_up
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _raw_spin_lock
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 native_queued_spin_lock_slowp=
ath
> =

> Looks like it's introduced by this commit:
> =

> eaa434defaca1781fb2932c685289b610aeb8b4b
> =

> "drm/fb-helper: Add fb_deferred_io support"

Oh gawd, yeah, all the !serial consoles are utter batshit.

Please look at John's last printk rewrite, IIRC it farms all that off to
a kernel thread instead of doing it from the printk() caller's context.

I'm not sure where he hides his latests patches, but I'm sure he'll be
more than happy to tell you.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
