Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5DCCFE634
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B69410E1E8;
	Wed,  7 Jan 2026 14:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="XmDC6RSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E223510E1E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=l9zPldPO0gnPG9wqrGk15pRMXLG4lDUH1uQahecjpaw=; b=XmDC6RSjQjF/FBL9NZNvteRWSJ
 XfSf2hlRECEq0ebGyg5PpKJwJCMOSfzAKwNiq943mtTwN562XqVg6CXBQSWlSMPkQvBjMDvcHMIaq
 VbMaChEVW2NJrWYX+WTkUc4q69Qc5hAruLFHgmNhAYSWJ1vsrga7eXrkK796N4NMiipuPKZTZaOyY
 rFR/5UDT6V5KElXh5mZSYB1MBSII5ql1opBUYPQgnNho0fHqTuxPNBDc2lGvJn8XWN6B5G7rhA+bL
 5Nr/2YPyuCjvtoxt9xu77oRYLe5AYcNt5uU3ZpPNrjBz5lS//E3QOZJVBGISdvCI/NU5j64SAazKq
 NN8VbQ0g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vdUqx-0000000DVit-44jG;
 Wed, 07 Jan 2026 14:49:40 +0000
Date: Wed, 7 Jan 2026 14:49:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?546L5b+X?= <23009200614@stu.xidian.edu.cn>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, x86@kernel.org, paulmck@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, akpm@linux-foundation.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [BUG] rcu: stall detected in sys_mmap with PREEMPT(full)
 involving timer softirq and DRM vblank disable
Message-ID: <aV5ygyPM7J7VdmgL@casper.infradead.org>
References: <6b7e2fac.a60e.19b97034116.Coremail.23009200614@stu.xidian.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b7e2fac.a60e.19b97034116.Coremail.23009200614@stu.xidian.edu.cn>
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

On Wed, Jan 07, 2026 at 01:52:11PM +0800, 王志 wrote:
> Hello,
> 
> I am reporting an RCU stall detected during syzkaller-style fuzz testing.
> The stall is reported while executing sys_mmap(), with the
> rcu_preempt grace-period kthread starved for over 10 seconds. The
> observed stacks involve memory fault handling, timer softirq processing,
> and DRM vblank disable paths. With PREEMPT(full) enabled, the RCU grace
> period fails to complete.

Get your changes into syzkaller upstream, don't spam us with "i'm doing
syzbot's job".
