Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06153524EFA
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B076A10F287;
	Thu, 12 May 2022 13:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E810F20B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:57:40 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24CDukvd025718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 09:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652363814; bh=fK1JutfKwB9RZi7LGZBoNzqwgl48auY9kCDUP4LKjGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nzpfnyp3va4UeNMJsIUwRARvxBhDqDdf3HsaJ8eucf+Epey6lQyyZbRyGPs4LKIYI
 zXUD/hTUINDuYbnfWjRFJsujUU3jqAP9AldIHfRTfcN1fe1JS0ZEotNuRb1F1qTxAZ
 R9fIMtFXp7hWAd0/axDvHxk1rsvu0eWxchvLrSXgv/0vesv652yMZ2M4g3OKHiwgJ6
 fZLCYRBs9DGpyW5b1gmYVYp+J4TUBNPPrdB5DZXLCY0rBxk9sty2gP9f56TUH80yQg
 eTIbHMo+uceLQlZEif4OE9g5l7MQGzmHNj3egipGOK3AAGcfJQ2L2E7+1UwHHBtnU4
 MZd6AUIq1ki4Q==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id B5CC215C3F2A; Thu, 12 May 2022 09:56:46 -0400 (EDT)
Date: Thu, 12 May 2022 09:56:46 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [REPORT] syscall reboot + umh + firmware fallback
Message-ID: <Yn0SHhnhB8fyd0jq@mit.edu>
References: <YnzQHWASAxsGL9HW@slm.duckdns.org>
 <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, rodrigosiqueiramelo@gmail.com, kernel-team@lge.com,
 gregkh@linuxfoundation.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 penberg@kernel.org, minchan@kernel.org, mcgrof@kernel.org, holt@sgi.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 08:18:24PM +0900, Byungchul Park wrote:
> I have a question about this one. Yes, it would never been stuck thanks
> to timeout. However, IIUC, timeouts are not supposed to expire in normal
> cases. So I thought a timeout expiration means not a normal case so need
> to inform it in terms of dependency so as to prevent further expiraton.
> That's why I have been trying to track even timeout'ed APIs.

As I beleive I've already pointed out to you previously in ext4 and
ocfs2, the jbd2 timeout every five seconds happens **all** the time
while the file system is mounted.  Commits more frequently than five
seconds is the exception case, at least for desktops/laptop workloads.

We *don't* get to the timeout only when a userspace process calls
fsync(2), or if the journal was incorrectly sized by the system
administrator so that it's too small, and the workload has so many
file system mutations that we have to prematurely close the
transaction ahead of the 5 second timeout.

> Do you think DEPT shouldn't track timeout APIs? If I was wrong, I
> shouldn't track the timeout APIs any more.

DEPT tracking timeouts will cause false positives in at least some
cases.  At the very least, there needs to be an easy way to suppress
these false positives on a per wait/mutex/spinlock basis.

      	       	    	     	      	   	 - Ted
