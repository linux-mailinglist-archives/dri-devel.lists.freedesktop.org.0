Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5C73EFA9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 02:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6781B10E142;
	Tue, 27 Jun 2023 00:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21C0410E142
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 00:28:58 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-51-649a2d4740c7
Date: Tue, 27 Jun 2023 09:27:20 +0900
From: Byungchul Park <byungchul@sk.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10 00/25] DEPT(Dependency Tracker)
Message-ID: <20230627002720.GA55700@system.software.com>
References: <20230626115700.13873-1-byungchul@sk.com>
 <2023062627-chooser-douche-6613@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023062627-chooser-douche-6613@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTZxTG87739r23jV3uqrJX2L50MVswKC4sHANxW7Jk98PMliybyUh0
 zXqVZi2SQossMaJUwx8lwAIdhWwFTCFYBYvzb0v4E8CrGbLBWNcAUaab1SKm2tpahrYQM7+c
 /PI8T55zPhye0dhIOm8oKpXMRTqjlqhY1eK69iwxy6HP7oupoOFENkSeVLHQ1usmMHn2NAL3
 +SMYgqOfwJ/REILErzcZsDdNImi/PcfA+bF5BL7uowSm7rwG05ElAnJTLYHKzl4Cvz1YxjDb
 3IjhtGcX3KjvwDAY/5cFe5BAq70SJ8c9DHFXDweuis2w0O3gYPn2dpDnZxTgC2yBlp9mCXh9
 MgtjlxYwTF1pIzDvfq6AG2PXWJhsOKmAMw87CDyIuhhwRZY4+H3QiaHPliy6v+zDcPzxigLG
 Tw4m6dQ5DNN/XUUwUHULg8c9Q2AkEsLQ72li4FnXKIKFukUOjp2Ic9B6pA5B7bFmFm7+N64A
 2+z7kIi1kQ/zxJHQEiPa+stEX9TJitc7qHjZMceJtoEAJzo9FrG/O1Ps9Aax2B6OKERPTzUR
 PeFGTqxZnMbi7IyXiA8nJjjx2o8J9vM3v1bl6yWjwSqZt+38RlXoGbHj4kj6wbpfqkkFcmys
 QUqeCjk07p1nXnKosyvJPM8Km2l4al9KJsI71O+Pr0Y2CO/S4GiArUEqnhHmVHToWT2XMtYL
 ubSusnk1pBaALl31r+oaYS/1D/zDrumvU7nlziozQib1rwRxahcjZNCuFT4lK5MnzD2VFSne
 KLxNBy+M47XTJpTUfdG6xpvoULefrUeC45VWxyutjv9bnYjpQRpDkdWkMxhzthaWFxkObv32
 gMmDkr/pOrRccAmFJ78YRgKPtOvUsbMteo1CZy0pNw0jyjPaDeq0mF2vUet15d9L5gN7zRaj
 VDKMMnhW+4b6vWiZXiPs15VK30lSsWR+6WJemV6BfjZl5t4aP/XB37UBd0C5pzSjPWeb7Bvy
 7rhLPtqdk1cwdOZJvq/REgy3hr7cknhUlWemhxP4uPxW725vwWdNwV0/XD/3KLQzO++PTxuM
 8tPDlvw+6+Ov4jucpmJLWukh592YQTq6UBXL/bgsbWzavomrkP2Lwxf9Xc5oK0mrztKyJYW6
 7ZmMuUT3AjQPjl2XAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTdxTG9//fV+qq1w70BrMsdsoU0Sm+7ETNsmSG3mhEsw8w/aA09m5t
 eBFbYYIxQcFFUBsggY5aXAUtBBhsF9+hFSG8dERklrCOFILo0CpKgi1QYGjLsswvJ788z3nO
 OR8OSyieUZGsLu24qE9TpyhpGSmL35G7XrXerNlY7FkLRRc2gt93jgRLQx0NvfW1COqun8bg
 bVfBn5NjCGYfPCTAVNKL4MrjQQKudwwhsFefocH1dDH0+cdpcJacpyG3soGGP17OYfCUFmOo
 lfZCd2EFhpbAMxJMXhoumXJxsDzHELDVMGDLWQ0j1WYG5h5vAudQPwVt5U4K7AProOyyh4Zm
 u5OEjtsjGFx3LTQM1b2loLuji4TeoosU/PK6goaXkzYCbP5xBh61WDH8mhec9mLOjuHHN/MU
 dF5sCdLV3zD0/dWEwHFuGINU109Dm38MQ6NUQsBMVTuCEeMrBs5eCDBw6bQRwfmzpSQ8/KeT
 gjzPVpidttBf7RTaxsYJIa/xB8E+aSWF3yt44Y55kBHyHAOMYJUyhMbqaKGy2YuFKxN+SpBq
 8mlBmihmhIJXfVjw9DfTwuueHkbo+mmW3P/xQdlOjZiiyxT1n3+ZJNNKbSac7o88YbyRT+cg
 c0QBCmN5bgs/VllFFCCWJbnV/ITru5BMc5/xbneACHE4t4b3tg+QBUjGEtygjL8/U8iEjI+4
 L3hjbulCk5wDfrzJvaAruMO82zFK/qsv5Z1lTxeY4KJ597wXh3YR3Aq+ap4NyWHBEwannFSI
 I7hP+ZabnbgQyc3vpc3vpc3/p62IqEHhurTMVLUuZesGQ7I2K013YsORo6kSCr6f7dRc0W3k
 c6laEcci5Yfy6foyjYJSZxqyUlsRzxLKcPmyaZNGIdeos7JF/dHD+owU0dCKVrCkcrl8d6KY
 pOC+Vx8Xk0UxXdT/52I2LDIH3eMdGY+2JLXHSDqHcfPfq/ZWxS3eFaieirmFE/NPxibMaHPO
 qFhMvfjAcPDJjp+zv96HPrlTv8gS1/Ct9tjoAV2Eae1AXLm+saar373Skf1mmy/eN588Vbvc
 0BOVEZ9unj70vDxzODbhmyjV2wej3UuQNWHCt+ea67Jl+9KOsPxbStKgVW+KJvQG9Tt/39ah
 egMAAA==
X-CFilter-Loop: Reflected
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 03:02:22PM +0200, Greg KH wrote:
> On Mon, Jun 26, 2023 at 08:56:35PM +0900, Byungchul Park wrote:
> > >From now on, I can work on LKML again! I'm wondering if DEPT has been
> > helping kernel debugging well even though it's a form of patches yet.
> > 
> > I'm happy to see that DEPT reports a real problem in practice. See:
> > 
> >    https://lore.kernel.org/lkml/6383cde5-cf4b-facf-6e07-1378a485657d@I-love.SAKURA.ne.jp/#t
> >    https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/
> > 
> > Nevertheless, I apologize for the lack of document. I promise to add it
> > before it gets needed to use DEPT's APIs by users. For now, you can use
> > DEPT just with CONFIG_DEPT on.
> > 
> > ---
> > 
> > Hi Linus and folks,
> > 
> > I've been developing a tool for detecting deadlock possibilities by
> > tracking wait/event rather than lock(?) acquisition order to try to
> > cover all synchonization machanisms. It's done on v6.2-rc2.
> > 
> > Benifit:
> > 
> > 	0. Works with all lock primitives.
> > 	1. Works with wait_for_completion()/complete().
> > 	2. Works with 'wait' on PG_locked.
> > 	3. Works with 'wait' on PG_writeback.
> > 	4. Works with swait/wakeup.
> > 	5. Works with waitqueue.
> > 	6. Works with wait_bit.
> > 	7. Multiple reports are allowed.
> > 	8. Deduplication control on multiple reports.
> > 	9. Withstand false positives thanks to 6.
> > 	10. Easy to tag any wait/event.
> > 
> > Future work:
> > 
> > 	0. To make it more stable.
> > 	1. To separates Dept from Lockdep.
> > 	2. To improves performance in terms of time and space.
> > 	3. To use Dept as a dependency engine for Lockdep.
> > 	4. To add any missing tags of wait/event in the kernel.
> > 	5. To deduplicate stack trace.
> 
> If you run this today, does it find any issues with any subsystems /
> drivers that the current lockdep code does not find?  Have you run your

Yes, it found some deadlocks. The following issue was about a deadlock
by PG_locked detected by DEPT which lockdep couldn't. Check it out:

   https://lore.kernel.org/lkml/6383cde5-cf4b-facf-6e07-1378a485657d@I-love.SAKURA.ne.jp/#t
   https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

> tool on patches sent to the different mailing lists for new drivers and
> code added to the tree to verify that it can find issues easily?

I had been co-working with GPU driver developers for their new drivers
adding to their CI system to verify that it can find issues easily. Now
that I've almost organized my stuff, I will re-start it.

> In other words, why do we need this at all?  What makes it 'better' than
> what we already have that works for us today?  What benifit is it?

AS IS : It can detect deadlocks by wrong lock usage e.g. acqusition order.
	Once it reports a issue, you must resolve it or work around to
	see further reports even if it's not one you are into.

TO BE : It can detect deadlocks by not only locks but also any waits e.g.
	wait_for_completion(), PG_locked, PG_writeback, dma fence and
	so on. Last but not least, DEPT can report issues multiple times
	at a single system-up so that any issues that you are not into,
	no longer prevent further reports that is valuable to you.

However, yes. DEPT needs to be more matured. I'd like to do that together.

	Byungchul

> thanks,
> 
> greg k-h
